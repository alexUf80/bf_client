<<<<<<< HEAD
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
                if($param_name == 'insurance'){
                    
                    // Добавляем страховую сумму
                    $query = $this->db->placehold("
                    SELECT 
                    o.id as o_id 
                    FROM `s_operations` o
                    LEFT JOIN s_transactions t
                    ON o.transaction_id=t.id
                    WHERE `order_id`=? and type='INSURANCE' and t.prolongation=1
                    ORDER BY o.created
                    ", $param_value['order_id']);
                    $this->db->query($query);
                    $prolo_operations = $this->db->results();

                    $prolo_count = 0;
                    foreach ($prolo_operations as $prolo_operation) {
                        $prolo_count++;
                        if($prolo_operation->o_id == $param_value['operation_id']){
                            break;
                        }
                    }

                    $prolo_services_cost_arrs = $this->ProloServicesCost->get($prolo_count);

                    $prolo_services_cost_arr = $prolo_services_cost_arrs->insurance_cost;

                    $prolo_services_cost_arr = str_replace('[[','',$prolo_services_cost_arr);
                    $prolo_services_cost_arr = str_replace(']]','',$prolo_services_cost_arr);
                    $prolo_services_cost_els = explode('],[', $prolo_services_cost_arr);

                    foreach ($prolo_services_cost_els as $prolo_services_cost_el) {
                        $prolo_services_cost_el = explode(',', $prolo_services_cost_el);

                        if ((int)$param_value['amount'] == (int)str_replace('"','',$prolo_services_cost_el[1])) {
                            $param_value['insuranceSum'] = (int)str_replace('"','',$prolo_services_cost_el[2]);
                            break;
                        }
                    }


                    $this->design->assign('insurances', (object)$param_value);
                }
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

            $order = $this->orders->get_order($contract->order_id);
            if ($order->insurance_params) {
                $insurance_params = unserialize($order->insurance_params);
                $insurance = $insurance_params['i_p'];
                $insuranceSum = $insurance_params['i_a'];
            }
            else if ($contract->inssuance_date < '2023-10-24') {
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
            // !!!!!!!
            else if($contract->order_id == 34287) {
                $contract->amount += 1290.00;
            }
            // !!!!!!!
            else if($contract->inssuance_date < '2024-02-13 11:30:00') {
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
            else{

                // exception_regions = 0
                // red_regions = 1
                // yellow_regions = 2
                // green_regions = 3

                $servise_cost_arr = 
                [
                    [["4000","590","30000"],["5000","690","35000"],["7000","890","40000"],["11000","1490","65000"],["100000","2190","85000"]],
                    [["4000","890","36000"],["5000","1290","44000"],["6000","1490","48000"],["7000","1790","54000"],["8000","1990","58000"],["9000","2390","66000"],["10000","2690","72000"],["11000","2990","78000"],["12000","3290","84000"],["1300","3590","90000"],["14000","3890","96000"],["15000","4190","102000"],["100000","4490","108000"]],
                    [["4000","590","30000"],["5000","690","35000"],["7000","890","40000"],["11000","1490","65000"],["100000","2190","85000"]],
                    [["4000","790","34000"],["5000","1090","40000"],["6000","1290","44000"],["7000","1590","50000"],["8000","1790","54000"],["9000","1990","58000"],["10000","2290","64000"],["11000","2490","68000"],["12000","2790","74000"],["1300","2990","78000"],["14000","3290","84000"],["15000","3490","88000"],["100000","3790","94000"]],
                ];

                $address = $this->Addresses->get_address($user->faktaddress_id);
        
                $scoring_type = $this->scorings->get_type('location');
        
                if (stripos($address->region, 'кути')) {
                    $address->region = 'Саха/Якутия';
                }

                $reg=3;
                $yellow_regions = array_map('trim', explode(',', mb_strtolower($scoring_type->params['yellow-regions'])));
                if(in_array(mb_strtolower(trim($address->region), 'utf8'), $yellow_regions)){
                    $reg = 2;
                }
                $red_regions = array_map('trim', explode(',', mb_strtolower($scoring_type->params['red-regions'])));
                if(in_array(mb_strtolower(trim($address->region), 'utf8'), $red_regions)){
                    $reg = 1;
                }
                $exception_regions = array_map('trim', explode(',', mb_strtolower($scoring_type->params['regions'])));
                if(in_array(mb_strtolower(trim($address->region), 'utf8'), $exception_regions)){
                    $reg = 0;
                }

                $arrs = $servise_cost_arr[$reg];
                foreach ($arrs as $arr) {
                    if((int)$arr[0] > $contract->amount){
                        $insurance = (int)$arr[1];
                        $insuranceSum = (int)$arr[2];
                        break;
                    }
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

=======
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

            if($document->type == 'ANKETA_PEP'){
                $strahovka_2023_12_07 = false;
                $p2p_operation = OperationsORM::where('type', 'P2P')->where('order_id', $document->order_id)->first();
                $insurance_operations = OperationsORM::where('type', 'INSURANCE')->where('order_id', $document->order_id)->get();
                foreach ($insurance_operations as $insurance_operation) {
                    if (substr($p2p_operation->created, 0, 10) < substr($insurance_operation->created, 0, 10)) {
                        if ($insurance_operation->created > '2023-12-07') {
                            $strahovka_2023_12_07 = true;
                            $this->design->assign('strahovka_2023_12_07', $strahovka_2023_12_07);
                        }
                        break;
                    }
                }
            }

            if($document->type == 'UVEDOMLENIE_OTKAZ_OT_USLUG'){
                // $dto = new DateTime($contract->inssuance_date);
                $dto = new DateTime($document->created);
                $dto->modify('+30 days');
                $limit_date = $dto->format('d.m.Y');
                $this->design->assign('limit_date', $limit_date);
            }
            
            $contract->end_date = date("d.m.Y H:i:s", strtotime("+" . $contract->period . " days", strtotime($contract->inssuance_date)));

            $this->design->assign('contract', $contract);

            foreach ($user as $key => $value)
                $this->design->assign($key, $value);

            foreach ($document->params as $param_name => $param_value)
            {
                if($param_name == 'insurance'){
                    
                    // Добавляем страховую сумму
                    $query = $this->db->placehold("
                    SELECT 
                    o.id as o_id 
                    FROM `s_operations` o
                    LEFT JOIN s_transactions t
                    ON o.transaction_id=t.id
                    WHERE `order_id`=? and type='INSURANCE' and t.prolongation=1
                    ORDER BY o.created
                    ", $param_value['order_id']);
                    $this->db->query($query);
                    $prolo_operations = $this->db->results();

                    $prolo_count = 0;
                    foreach ($prolo_operations as $prolo_operation) {
                        $prolo_count++;
                        if($prolo_operation->o_id == $param_value['operation_id']){
                            break;
                        }
                    }

                    $prolo_services_cost_arrs = $this->ProloServicesCost->get($prolo_count);

                    $prolo_services_cost_arr = $prolo_services_cost_arrs->insurance_cost;

                    $prolo_services_cost_arr = str_replace('[[','',$prolo_services_cost_arr);
                    $prolo_services_cost_arr = str_replace(']]','',$prolo_services_cost_arr);
                    $prolo_services_cost_els = explode('],[', $prolo_services_cost_arr);

                    foreach ($prolo_services_cost_els as $prolo_services_cost_el) {
                        $prolo_services_cost_el = explode(',', $prolo_services_cost_el);

                        if ((int)$param_value['amount'] == (int)str_replace('"','',$prolo_services_cost_el[1])) {
                            $param_value['insuranceSum'] = (int)str_replace('"','',$prolo_services_cost_el[2]);
                            break;
                        }
                    }


                    $this->design->assign('insurances', (object)$param_value);
                }
                if($param_name == 'contract')
                    $this->design->assign('insurances', (object)$param_value['insurance']);
                else
                    $this->design->assign($param_name, $param_value);
            }

            $this->design->assign('created', $document->created);

            $this->design->assign('document', $document);

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

            $order = $this->orders->get_order($contract->order_id);
            // if ($order->insurance_params) {
            //     $insurance_params = unserialize($order->insurance_params);
            //     $insurance = $insurance_params['i_p'];
            //     $insuranceSum = $insurance_params['i_a'];
            // }
            // else 
            if ($contract->inssuance_date < '2023-02-26') {
                $insurance = 390;
                $insuranceSum = 20000;
                $contract->amount += $insurance;
            }
            else if ($contract->inssuance_date < '2023-03-19') {
                if ($contract->amount < 4000)
                {
                    $insurance = 390;
                    $insuranceSum = 20000;
                    $contract->amount += $insurance;
                }
                elseif ($contract->amount >= 4000 && $contract->amount < 5000)
                {
                    $insurance = 490;
                    $insuranceSum = 25000;
                    $contract->amount += $insurance;
                }
                elseif ($contract->amount >= 5000 && $contract->amount < 9000)
                {
                    $insurance = 590;
                    $insuranceSum = 30000;
                    $contract->amount += $insurance;
                }
                elseif ($contract->amount >= 9000)
                {
                    $insurance = 890;
                    $insuranceSum = 40000;
                    $contract->amount += $insurance;
                }
            }
            else if ($contract->inssuance_date < '2023-10-24') {
                if ($contract->amount < 5000)
                {
                    $insurance = 590;
                    $insuranceSum = 30000;
                    $contract->amount += $insurance;
                }
                elseif ($contract->amount >= 5000 && $contract->amount < 9000)
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
            // !!!!!!!
            else if($contract->order_id == 34287 || $contract->order_id == 90739) {
                $insurance = 1290;
                $insuranceSum = 44000;
                $contract->amount += $insurance;
            }
            // !!!!!!!
            else if($contract->inssuance_date < '2024-02-13 11:30:00') {
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
            else if($contract->inssuance_date < '2024-02-27') {

                // exception_regions = 0
                // red_regions = 1
                // yellow_regions = 2
                // green_regions = 3

                if ($document->type == 'POLIS_24-01-21') {
                    $p2p_operation = OperationsORM::where('type', 'P2P')->where('order_id', $document->order_id)->first();
                    
                    $insurances = $this->insurances->get_insurances(array('user_id' => $contract->user_id));
                    $ins_sum = 0;
                    foreach ($insurances as $ins) {
                        if (date('Y-m-d', strtotime($ins->create_date)) == date('Y-m-d', strtotime($p2p_operation->created))){
                            $insurance = $ins->amount;
                        }
                    }
                    $full_amount = $p2p_operation->amount;
                }

                $servise_cost_arr = 
                [
                    [["4000","590","30000"],["5000","690","35000"],["7000","890","40000"],["11000","1490","65000"],["100000","2190","85000"]],
                    [["4000","890","36000"],["5000","1290","44000"],["6000","1490","48000"],["7000","1790","54000"],["8000","1990","58000"],["9000","2390","66000"],["10000","2690","72000"],["11000","2990","78000"],["12000","3290","84000"],["1300","3590","90000"],["14000","3890","96000"],["15000","4190","102000"],["100000","4490","108000"]],
                    [["4000","590","30000"],["5000","690","35000"],["7000","890","40000"],["11000","1490","65000"],["100000","2190","85000"]],
                    [["4000","790","34000"],["5000","1090","40000"],["6000","1290","44000"],["7000","1590","50000"],["8000","1790","54000"],["9000","1990","58000"],["10000","2290","64000"],["11000","2490","68000"],["12000","2790","74000"],["1300","2990","78000"],["14000","3290","84000"],["15000","3490","88000"],["100000","3790","94000"]],
                ];

                foreach ($servise_cost_arr as $servise_cost_ar) {
                    foreach ($servise_cost_ar as $servise_cost_a) {
                        if ($servise_cost_a[0] > $full_amount-$insurance && $servise_cost_a[1] == $insurance) {
                            $insuranceSum = (int)$servise_cost_a[2];
                        }
                    }
                }

                // $address = $this->Addresses->get_address($user->faktaddress_id);
        
                // $scoring_type = $this->scorings->get_type('location');
        
                // if (stripos($address->region, 'кути')) {
                //     $address->region = 'Саха/Якутия';
                // }

                // $reg=3;
                // $yellow_regions = array_map('trim', explode(',', mb_strtolower($scoring_type->params['yellow-regions'])));
                // if(in_array(mb_strtolower(trim($address->region), 'utf8'), $yellow_regions)){
                //     $reg = 2;
                // }
                // $red_regions = array_map('trim', explode(',', mb_strtolower($scoring_type->params['red-regions'])));
                // if(in_array(mb_strtolower(trim($address->region), 'utf8'), $red_regions)){
                //     $reg = 1;
                // }
                // $exception_regions = array_map('trim', explode(',', mb_strtolower($scoring_type->params['regions'])));
                // if(in_array(mb_strtolower(trim($address->region), 'utf8'), $exception_regions)){
                //     $reg = 0;
                // }

                // $arrs = $servise_cost_arr[$reg];
                // // var_dump($arrs);
                // // die;
                // foreach ($arrs as $arr) {
                //     if((int)$arr[0] > $contract->amount){
                //         $insurance = (int)$arr[1];
                //         $insuranceSum = (int)$arr[2];
                //         break;
                //     }
                // }
            }
            else{
                // exception_regions = 0
                // red_regions = 1
                // yellow_regions = 2
                // green_regions = 3

                if ($document->type == 'POLIS_24-01-21') {
                    $p2p_operation = OperationsORM::where('type', 'P2P')->where('order_id', $document->order_id)->first();
                    
                    $insurances = $this->insurances->get_insurances(array('user_id' => $contract->user_id));
                    $ins_sum = 0;
                    foreach ($insurances as $ins) {
                        if (date('Y-m-d', strtotime($ins->create_date)) == date('Y-m-d', strtotime($p2p_operation->created))){
                            $insurance = $ins->amount;
                        }
                    }
                    $full_amount = $p2p_operation->amount;
                }

                $servise_cost_arr = 
                [
                    [["4000","890","36000"],["5000","1290","44000"],["6000","1490","48000"],["7000","1790","54000"],["8000","1990","58000"],["10000","2690","72000"],["11000","2990","78000"],["12000","3290","84000"],["13000","3590","90000"],["14000","3890","96000"],["15000","4190","102000"],["100000","4490","108000"]],
                    [["4000","890","36000"],["5000","1290","44000"],["6000","1490","48000"],["7000","1790","54000"],["8000","1990","58000"],["9000","2390","66000"],["10000","2690","72000"],["11000","2990","78000"],["12000","3290","84000"],["13000","3590","90000"],["14000","3890","96000"],["15000","4190","102000"],["100000","4490","108000"]],
                    [["4000","890","36000"],["5000","1290","44000"],["7000","1490","48000"],["8000","1990","58000"],["9000","2390","66000"],["10000","2690","72000"],["11000","2990","78000"],["12000","3290","84000"],["13000","3590","90000"],["14000","3890","96000"],["15000","4190","102000"],["100000","4490","108000"]],
                    [["4000","890","36000"],["5000","1290","44000"],["6000","1490","48000"],["7000","1790","54000"],["9000","1990","58000"],["10000","2690","72000"],["11000","2990","78000"],["12000","3290","84000"],["13000","3590","90000"],["14000","3890","96000"],["15000","4190","102000"],["100000","4490","108000"]]
                ];

                foreach ($servise_cost_arr as $servise_cost_ar) {
                    foreach ($servise_cost_ar as $servise_cost_a) {
                        if ($servise_cost_a[0] > $full_amount-$insurance && $servise_cost_a[1] == $insurance) {
                            $insuranceSum = (int)$servise_cost_a[2];
                        }
                    }
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

>>>>>>> 056b0187bb0fa4d1028ac0cb0d7200fd87cc95e0
}