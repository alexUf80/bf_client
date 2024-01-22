<?php

error_reporting(-1);
ini_set('display_errors', 'off');
ini_set('max_execution_time', 120);

class DocumentController extends Controller
{
    public function fetch()
    {
        if ($this->request->get('action') == 'preview') {
            $this->action_preview();
            exit;
        }

        
        $id = $this->request->get('id');
        $id = str_replace('.pdf', '', $id);
        if (empty($id))
            return false;

        if (!($user_id = $this->request->get('user_id', 'integer')))
            return false;

        if (!($document = $this->documents->get_document($id)))
            return false;

        if ($user_id != $document->user_id)
            return false;

        if (!($user = $this->users->get_user($document->user_id)))
            return false;

        if (!empty($document->params)) {

            $this->design->assign('pan', json_decode(unserialize($document->params))->pan);

            $params = json_decode($document->params, true);
            
            if (is_null($params)){
                $document->params = json_decode(unserialize($document->params), true);
                $this->design->assign('params', $document->params);
            }
            else{
                $document->params = json_decode($document->params, true);
                $this->design->assign('params', '2');
            }

            if(in_array($document->type, ['DOP_RESTRUCT', 'GRAPH_RESTRUCT']))
            {
                $document->params['schedules']['payment_schedules'] = json_decode($document->params['schedules']['payment_schedules'], true);

                foreach ($document->params['schedules']['payment_schedules'] as $key => $pay)
                {
                    if($pay['date'] == 'Итого')
                        $allSum = $pay['payment'];

                    $this->design->assign('allSum', $allSum);
                }
            }

            $contract = ContractsORM::where('order_id', $document->order_id)->first();
            
            if($document->type == 'DOP_SOGLASHENIE'){

                $query = $this->db->placehold("
                    SELECT * 
                    FROM __operations
                    WHERE contract_id =  $contract->id
                    AND (type = 'P2P' OR type = 'PAY' OR type = 'PERCENTS')
                    ORDER BY created, id
                ");
                $this->db->query($query);
                $operations = $this->db->results();

                $document_date = date("Y-m-d", strtotime("+1 days", strtotime($document->created)));
                
                $P2P = 0;
                $PAY = 0;
                $PERCENTS = 0;
                
                $percents_one_day = 0;
                $prolongations_count = 0;

                foreach ($operations as $operation) {
                    $operation_date = date('Y-m-d', strtotime($operation->created));
                    if($operation_date < $document_date){
                        switch ($operation->type):
                            case 'P2P':
                                $P2P += $operation->amount;
                                break;
                            case 'PAY':
                                $PAY += $operation->amount;
                                $transaction = $this->transactions->get_transaction($operation->transaction_id);
                                if($transaction && $transaction->prolongation){
                                    $prolongations_count++;
                                }
                                break;
                            case 'PERCENTS':
                                $PERCENTS += $operation->amount;
                                $percents_one_day = $operation->amount;
                                break;
                        endswitch;
                    }
                }

                // $prolongations_days = $prolongations_count * 30;

                $contract_end_date = date("d.m.Y H:i:s", strtotime("+" . $contract->period . " days", strtotime($contract->inssuance_date)));
                
                // $prolongation_start_date = date("Y-m-d", strtotime("+".($prolongations_days - 30)." days", strtotime($contract_end_date)));
                // $prolongation_end_date = date("Y-m-d", strtotime("+".$prolongations_days." days", strtotime($contract_end_date)));
                
                $prolongation_start_date = date("Y-m-d", strtotime($document->created));
                $prolongation_end_date = date("Y-m-d", strtotime("+30 days", strtotime($document->created)));

                $date1 = new DateTime(date('Y-m-d', strtotime($document->created)));
                $date2 = new DateTime(date('Y-m-d', strtotime($prolongation_end_date)));


                $diff = $date2->diff($date1)->days;

                $sum_back = $P2P + ($percents_one_day * $diff);
                // if($percents_one_day * $diff > $P2P * 2.5){
                //     $sum_back = $P2P * 2.5 - $PAY;
                //     $sas = 1;
                // }
                // else{
                //     $sum_back = $P2P + ($percents_one_day * $diff) - $PAY;
                //     $sas = 2;
                // }
                $this->design->assign('P2P', $P2P);
                $this->design->assign('percents_one_day', $percents_one_day);
                $this->design->assign('diff', $diff);
                $this->design->assign('PAY', $PAY);
                $this->design->assign('sas', $sas);
                $this->design->assign('sas', $percents_one_day * $diff - $P2P * 2.5);

                $prolo = new StdClass();
    
                $prolo->start_date = $document->created;
                $prolo->return_date = $prolongation_end_date;
                $prolo->return_amount = $sum_back;
                $prolo->amount = $P2P;
                $prolo->return_amount_percents = $sum_back - $P2P;

                $this->design->assign('prolo', $prolo);

            }

            if($document->type == 'UVEDOMLENIE_OTKAZ_OT_USLUG'){
                $dto = new DateTime($contract->inssuance_date);
                $dto->modify('+30 days');
                $limit_date = $dto->format('d.m.Y');
                $this->design->assign('limit_date', $limit_date);
            }
            
            $contract->end_date = date("d.m.Y H:i:s", strtotime("+" . $contract->period . " days", strtotime($contract->inssuance_date)));

            $this->design->assign('contract', $contract);


            foreach ($document->params as $param_name => $param_value)
            {
                if($param_name == 'insurance')
                    $this->design->assign('insurances', (object)$param_value);
                if($param_name == 'contract')
                    $this->design->assign('insurances', (object)$param_value['insurance']);
                else
                    $this->design->assign($param_name, $param_value);
            }

            $this->design->assign('document', $document);

            foreach ($user as $key => $value)
                $this->design->assign($key, $value);

            $regaddress = $this->Addresses->get_address($user->regaddress_id);
            $regaddress_full = $regaddress->adressfull;

            $this->design->assign('regaddress_full', $regaddress_full);

            $faktaddress = $this->Addresses->get_address($user->faktaddress_id);
            $faktaddress_full = $faktaddress->adressfull;

            $this->design->assign('faktaddress_full', $faktaddress_full);

            $cards = $this->cards->get_cards(['user_id' => $contract->user_id]);
            $active_card = '';

            if (!empty($cards)) {
                foreach ($cards as $card) {
                    $active_card = $card->pan;
                    break;
                }
                foreach ($cards as $card) {
                    if($card->base_card == 1)
                        $active_card = $card->pan;
                }
                $this->design->assign('active_card', $active_card);
            }
        }

        $insurance = $this->request->get('insurance');

        $operations = $this->operations->get_operations(['type' => 'INSURANCE_BC', 'contract_id' => $contract->id]);
        $insurance_all = '';
        foreach ($operations as $operation) {
            if(mb_substr($operation->created, 0, 16) == mb_substr($document->created, 0, 16)){
                $insurance_all = $operation;
            }
        }
        $this->design->assign('insurance_all', $insurance_all);

        if (!empty($insurance) || isset($contract) && !empty($contract->service_insurance)) {
            if ($contract->inssuance_date < '2023-10-24') {
                if ($contract->amount <= 4999)
                {
                    $insurance = 590;
                    $insuranceSum = 30000;
                    $contract->amount += $insurance;
                }
                elseif ($contract->amount >= 5000 && $contract->amount <= 8999)
                {
                    $insurance = 890;
                    $insuranceSum = 40000;
                    $contract->amount += $insurance;
                }
                elseif ($contract->amount >= 9000)
                {
                    $insurance = 990;
                    $insuranceSum = 50000;
                    $contract->amount += $insurance;
                }
            }
            else{
                if ($contract->amount <= 3999)
                {
                    $insurance = 590;
                    $insuranceSum = 30000;
                    $contract->amount += $insurance;
                }
                elseif ($contract->amount >= 4000 && $contract->amount <= 4999)
                {
                    $insurance = 690;
                    $insuranceSum = 35000;
                    $contract->amount += $insurance;
                }
                elseif ($contract->amount >= 5000 && $contract->amount <= 6999)
                {
                    $insurance = 890;
                    $insuranceSum = 40000;
                    $contract->amount += $insurance;
                }
                elseif ($contract->amount >= 7000 && $contract->amount <= 10999)
                {
                    $insurance = 1490;
                    $insuranceSum = 65000;
                    $contract->amount += $insurance;
                }
                elseif ($contract->amount >= 11000)
                {
                    $insurance = 2190;
                    $insuranceSum = 85000;
                    $contract->amount += $insurance;
                }
            }

            $this->design->assign('insurance', $insurance);
            $this->design->assign('insuranceSum', $insuranceSum);


        }

        $tpl = $this->design->fetch('pdf/' . $document->template);

        $this->pdf->create($tpl, $document->name, $document->template);

    }

    private function format_document($content, $document_name)
    {

//return $content;
        require_once $this->config->root_dir . 'phpquery-onefile.php';

        $dom = phpQuery::newDocument($content);

        $spans = $dom->find('*')->attr('style', '');

        if ($document_name == 'Условия договора микрозайма' || $document_name == 'Соглашение о продлении займа') {
            $div = $dom->find('div:first');

            $new_div = '<div><img width="140" src="' . $div->find('img:first')->attr('src') . '"/></div><br /><br />';
            $new_div .= '<table width="540" border="1" cellpading="2">';
            $new_div .= '<tr>';
            $new_div .= '<td width="180" align="center"><div> </div><img width="120" src="' . $div->find('.qr-code')->attr('src') . '"/></td>';
            $new_div .= '<td style="font-size:90%;" width="180" align="center"><br /><br />' . $div->find('div>.psk-info:last')->html() . '<br /></td>';
            $new_div .= '<td style="font-size:90%;" width="180" align="center"><br /><br />' . $div->find('div>.psk-info:first')->html() . '<br /></td>';
            $new_div .= '</tr>';
            $new_div .= '</table><br /><br />';

            $div->replaceWith($new_div);
            //echo __FILE__.' '.__LINE__.'<br /><pre>';echo(htmlspecialchars($div));echo '</pre><hr />';
        }

        $content = $dom->html();

        phpQuery::unloadDocuments();

        $replace = array(
            'https://storage.yandexcloud.net/creditapi/sandbox/4f355b1ae27aeec676ea6ca5bca10042_logoza-ru-hd.png'
            => '/theme/site/html/pdf/i/doc_logo.png',
            'https://sbapi.creditapi.ru/api/files/CREDITAPIDEV/c6707cbdf913f86dba213f614cb9a76a_logoza-ru-hd.png'
            => '/theme/site/html/pdf/i/doc_logo.png',
            'https://clients.oss.nodechef.com/checkbox_on.png'
            => '/theme/site/html/pdf/i/checkbox_on.png',
            'https://clients.oss.nodechef.com/checkbox_off.png'
            => '/theme/site/html/pdf/i/checkbox_off.png',
            'https://storage.yandexcloud.net/creditapi/clients/checkbox_off.png'
            => '/theme/site/html/pdf/i/checkbox_off.png',
            'https://storage.yandexcloud.net/creditapi/clients/checkbox_on.png'
            => '/theme/site/html/pdf/i/checkbox_on.png',
            'https://storage.yandexcloud.net/creditapi/clients/VSK_stamp1.png'
            => '/theme/site/html/pdf/i/polis_stamp.png',
            'https://storage.yandexcloud.net/creditapi/clients/Page_QR.png'
            => '/theme/site/html/pdf/i/contract_qr.png',
            'https://clients.oss.nodechef.com/Page_QR.png'
            => '/theme/site/html/pdf/i/contract_qr.png',
        );

        $content = str_replace(array_keys($replace), array_values($replace), $content);

        return $content;
    }

    private function action_preview()
    {
        $type = $this->request->get('type');
        $type = strtoupper(str_replace('.pdf', '', $type));
        if (empty($type))
            return false;

        if (!($template = $this->documents->get_template($type)))
            return false;

        if (!($template_name = $this->documents->get_template_name($type)))
            return false;

        if (!($contract_id = $this->request->get('contract_id', 'integer')))
            return false;

        if (!($contract = $this->contracts->get_contract($contract_id)))
            return false;

        $rd = $contract->return_date;

        $contract->return_date = date('Y-m-d H:i:s', strtotime($rd . ' +30 days'));
        $bd = date('Y-m-d H:i:s');
        $contract->end_date = date('Y-m-d H:i:s', strtotime($bd . ' +'.$contract->period.' days'));

        $this->design->assign('contract', $contract);

        $ob_date = new DateTime();
        $ob_date->add(DateInterval::createFromDateString($contract->period . ' days'));
        $return_date = $ob_date->format('Y-m-d H:i:s');

        $return_amount = round($contract->amount + $contract->amount * $contract->base_percent * $contract->period / 100, 2);
        $return_amount_rouble = (int)$return_amount;
        $return_amount_kop = ($return_amount - $return_amount_rouble) * 100;

        $contract_order = $this->orders->get_order((int)$contract->order_id);

        $user = $this->users->get_user($contract->user_id);
        $address = $this->Addresses->get_address($user->regaddress_id);
        $insurance_cost = $this->insurances->get_insurance_cost($contract->amount,$address->id);
        // $insurance_cost = $this->insurances->get_insurance_cost($contract->amount);
        $this->design->assign('insurance_cost', $insurance_cost);

        $params = array(
            'lastname' => $contract_order->lastname,
            'firstname' => $contract_order->firstname,
            'patronymic' => $contract_order->patronymic,
            'phone' => $contract_order->phone_mobile,
            'birth' => $contract_order->birth,
            'number' => $contract->number,
            'contract_date' => date('Y-m-d H:i:s'),
            'created' => date('Y-m-d H:i:s'),
            'return_date' => $return_date,
            'end_date' => $end_date,
            'return_date_day' => date('d', strtotime($return_date)),
            'return_date_month' => date('m', strtotime($return_date)),
            'return_date_year' => date('Y', strtotime($return_date)),
            'return_amount' => $return_amount,
            'return_amount_rouble' => $return_amount_rouble,
            'return_amount_kop' => $return_amount_kop,
            'base_percent' => $contract->base_percent,
            'amount' => $contract->amount,
            'period' => $contract->period,
            'return_amount_percents' => round(($contract->amount + $insurance_cost) * $contract->base_percent * $contract->period / 100, 2),
            'passport_serial' => $contract_order->passport_serial,
            'passport_date' => $contract_order->passport_date,
            'subdivision_code' => $contract_order->subdivision_code,
            'passport_issued' => $contract_order->passport_issued,
            'passport_series' => substr(str_replace(array(' ', '-'), '', $contract_order->passport_serial), 0, 4),
            'passport_number' => substr(str_replace(array(' ', '-'), '', $contract_order->passport_serial), 4, 6),
        );

        $user = $this->users->get_user($contract_order->user_id);

        $regaddress = $this->Addresses->get_address($user->regaddress_id);
        $regaddress_full = $regaddress->adressfull;

        $params['regaddress_full'] = $regaddress_full;


        if ($type == 'POLIS') {
            $insurance = new StdClass();

            $insurance->create_date = date('Y-m-d H:i:s');
            $insurance->amount = round($insurance_cost, 2);
            $insurance->start_date = date('Y-m-d 00:00:00', time() + (1 * 86400));
            $insurance->end_date = date('Y-m-d 23:59:59', time() + (31 * 86400));

            $params['insurance'] = $insurance;
        }

        $this->design->assign('params', $params);

        foreach ($params as $param_name => $param_value)
            $this->design->assign($param_name, $param_value);

        $tpl = $this->design->fetch('pdf/' . $template);

        $this->pdf->create($tpl, $template_name, $template);

    }

}