<?php


class AccountController extends Controller
{


    public function fetch()
    {
        if (empty($this->user)) {
            header('Location: /lk/login');
            exit;
        }

        if (empty($this->user->stage_personal)) {
            header('Location: /stage/personal');
            exit;
        }

        if (empty($this->user->stage_passport)) {
            header('Location: /stage/passport');
            exit;
        }

        if (empty($this->user->stage_address)) {
            header('Location: /stage/address');
            exit;
        }

        if (empty($this->user->stage_work)) {
            header('Location: /stage/work');
            exit;
        }

        if (empty($this->user->stage_files)) {
            header('Location: /stage/files');
            exit;
        }

        if (empty($this->user->stage_card)) {
            header('Location: /stage/card');
            exit;
        }

        if (!$this->is_developer && empty($this->user->password)) {
            header('Location: /account/password');
            exit;
        }

        // подача повторной заявки
        if ($this->request->method('post')) {
            if (!empty($_SESSION['looker_mode']))
                return false;

            $user_orders = $this->orders->get_orders(array('user_id' => $this->user->id));
            $user_order = reset($user_orders);
            if (!empty($user_order) && in_array($user_order->status, array(0, 1, 2, 4, 5))) {
                $this->design->assign('error', 'У Вас уже есть активная заявка');
            } else {

                $last_contract = $this->contracts->get_last_contract($this->user->id);

                if (!empty($last_contract)) {
                    $issuance_date_from = date('Y-m-d', strtotime($last_contract->close_date . '-1 year'));
                    $count_closed_contracts = $this->contracts->count_contracts([
                        'user_id' => $this->user->id,
                        'status' => 7,
                        'issuance_date_from' => $issuance_date_from
                    ]);

                    if ($count_closed_contracts >= 9) {
                        $this->design->assign('error', 'Ограничение на количество контрактов (не более 9 за один календарный год)');
                        exit;
                    }

                }

                $amount = $this->request->post('amount', 'integer');
                $period = $this->request->post('period', 'integer');
                $card_id = $this->request->post('card_id', 'integer');

                $service_insurance = $this->request->post('service_insurance', 'integer');
                $service_reason = $this->request->post('service_reason', 'integer');
                $service_sms = $this->request->post('service_sms', 'integer');

                $juicescore_session_id = $this->request->post('juicescore_session_id');
                $local_time = $this->request->post('local_time');

                setcookie('loan_amount', null);
                setcookie('loan_period', null);

                $client_status = $this->users->check_client_status($this->user);

                $this->users->update_user($this->user->id, array(
                    'service_insurance' => $service_insurance,
                    // 'service_reason' => $service_reason,
                    'service_reason' => 0,
                    'service_sms' => 1,
                    'client_status' => $client_status
                ));

                $order = array(
                    'amount' => $amount,
                    'period' => $period,
                    'card_id' => $card_id,
                    'date' => date('Y-m-d H:i:s'),
                    'user_id' => $this->user->id,
                    'status' => 0,
                    'ip' => $_SERVER['REMOTE_ADDR'],
                    'first_loan' => 0,
                    'juicescore_session_id' => $juicescore_session_id,
                    'local_time' => $local_time,
                    'client_status' => $client_status,
                );

                if (isset($_COOKIE['promo_code'])) {
                    $promocode = $this->PromoCodes->get_code_by_code($_COOKIE['promo_code']);

                    if (!empty($promocode))
                        $order['promocode_id'] = $promocode->id;
                }

                // $order['utm_source'] = $_COOKIE['utm_source'];
                // $order['webmaster_id'] = $_COOKIE["wm_id"];
                // $order['click_hash'] = $_COOKIE["clickid"];
                if (isset($_COOKIE['url'])) {
                    $order['url'] = $_COOKIE['url'];
                }
                
                if (!empty($order['click_hash'])) {
                    $hasClickHash = OrdersORM::where('click_hash', $order['click_hash'])->first();
    
                    if (!empty($hasClickHash)) {
                        unset($order['utm_source']);
                        unset($order['webmaster_id']);
                        unset($order['click_hash']);
                    }
                }

                // проверяем возможность автоповтора
                $order['autoretry'] = 1;

                if (isset($_COOKIE['promo_code'])) {
                    $promocode = $this->PromoCodes->get_code_by_code($_COOKIE['promo_code']);

                    if (!empty($promocode))
                        $order['promocode_id'] = $promocode->id;
                }

                $order_id = $this->orders->add_order($order);

                // добавляем задание для проведения активных скорингов
                $scoring_types = $this->scorings->get_types();

                $exist_nbki = $this->scorings->get_scorings([
                    'type' => 'nbki',
                    'user_id' => $this->user->id,
                    'limit' => 1,
                ]);

                foreach ($scoring_types as $scoring_type) {
                    if ($scoring_type->active && empty($scoring_type->is_paid)) {
                        $add_scoring = array(
                            'user_id' => $this->user->id,
                            'order_id' => $order_id,
                            'type' => $scoring_type->name,
                            'status' => 'new',
                            'created' => date('Y-m-d H:i:s')
                        );
                        if ($scoring_type->name == 'nbki') {
                            if (count($exist_nbki) <= 0) {
                                $this->scorings->add_scoring($add_scoring);
                            }
                        } else {
                            $this->scorings->add_scoring($add_scoring);
                        }
                    }
                }

                if (!empty($order['utm_source']) && $order['utm_source'] == 'leadstech')
                    $this->PostBackCron->add(['order_id' => $order_id, 'status' => 0, 'goal_id' => 3]);

                $passport = str_replace([' ','-'], '', $this->user->passport_serial);
                $passport_serial = substr($passport, 0, 4);
                $passport_number = substr($passport, 4, 6);
                $params = array(
                    'lastname' => $this->user->lastname,
                    'firstname' => $this->user->firstname,
                    'patronymic' => $this->user->patronymic,
                    'gender' => $this->user->gender,
                    'phone' => $this->user->phone_mobile,
                    'birth' => $this->user->birth,
                    'birth_place' => $this->user->birth_place,
                    'inn' => $this->user->inn,
                    'snils' => $this->user->snils,
                    'email' => $this->user->email,
                    'created' => $this->user->created,

                    'passport_serial' => $passport_serial,
                    'passport_number' => $passport_number,
                    'passport_date' => $this->user->passport_date,
                    'passport_code' => $this->user->subdivision_code,
                    'passport_issued' => $this->user->passport_issued,

                    'regindex' => $this->user->Regindex,
                    'regregion' => $this->user->Regregion,
                    'regcity' => $this->user->Regcity,
                    'regstreet' => $this->user->Regstreet,
                    'reghousing' => $this->user->Reghousing,
                    'regbuilding' => $this->user->Regbuilding,
                    'regroom' => $this->user->Regroom,
                    'faktindex' => $this->user->Faktindex,
                    'faktregion' => $this->user->Faktregion,
                    'faktcity' => $this->user->Faktcity,
                    'faktstreet' => $this->user->Faktstreet,
                    'fakthousing' => $this->user->Fakthousing,
                    'faktbuilding' => $this->user->Faktbuilding,
                    'faktroom' => $this->user->Faktroom,

                    'profession' => $this->user->profession,
                    'workplace' => $this->user->workplace,
                    'workphone' => $this->user->workphone,
                    'chief_name' => $this->user->chief_name,
                    'chief_position' => $this->user->chief_position,
                    'chief_phone' => $this->user->chief_phone,
                    'income' => $this->user->income,
                    'expenses' => $this->user->expenses,

                    'first_loan_amount' => $this->user->first_loan_amount,
                    'first_loan_period' => $this->user->first_loan_period,

                    'number' => $order_id,
                    'create_date' => date('Y-m-d'),
                    'asp' => $this->user->sms,
                );
                if (!empty($this->user->contact_person_name))
                {
                    $params['contactperson_phone'] = $this->user->contact_person_phone;

                    $contact_person_name = explode(' ', $this->user->contact_person_name);
                    $params['contactperson_name'] = $this->user->contact_person_name;
                    $params['contactperson_lastname'] = isset($contact_person_name[0]) ? $contact_person_name[0] : '';
                    $params['contactperson_firstname'] = isset($contact_person_name[1]) ? $contact_person_name[1] : '';
                    $params['contactperson_patronymic'] = isset($contact_person_name[2]) ? $contact_person_name[2] : '';
                }
                if (!empty($this->user->contact_person2_name))
                {
                    $params['contactperson2_phone'] = $this->user->contact_person_phone;

                    $contact_person2_name = explode(' ', $this->user->contact_person2_name);
                    $params['contactperson2_name'] = $this->user->contact_person2_name;
                    $params['contactperson2_lastname'] = isset($contact_person2_name[0]) ? $contact_person2_name[0] : '';
                    $params['contactperson2_firstname'] = isset($contact_person2_name[1]) ? $contact_person2_name[1] : '';
                    $params['contactperson2_patronymic'] = isset($contact_person2_name[2]) ? $contact_person2_name[2] : '';
                }

                // Заявление на получение займа
                if ( date('Y-m-d H:i:s') < '2024-01-21' ) {
                    $this->documents->create_document(array(
                        'user_id' => $this->user->id,
                        'order_id' => $order_id,
                        'type' => 'ANKETA_PEP',
                        'params' => json_encode($params),
                    ));
                }
                else{
                    $this->documents->create_document(array(
                        'user_id' => $this->user->id,
                        'order_id' => $order_id,
                        'type' => 'ANKETA_PEP_24-01-21',
                        'params' => json_encode($params),
                    ));
                }


                header('Location: /account');
                exit;
            }

        }
        $documents = $this->documents->get_documents(array('user_id' => $this->user->id, 'client_visible' => 1));
        $this->design->assign('documents', $documents);

        if ($active_contract = $this->contracts->find_active_contracts($this->user->id)) {
            $order = $this->orders->get_order((int)$active_contract->order_id);

        } else {
            $orders = $this->orders->get_orders(array('user_id' => $this->user->id, 'sort' => 'date_desc'));

            $order = reset($orders);

        }

        if (!empty($order)) {

            $order = $this->orders->get_order($order->order_id);

            if (!empty($order->promocode_id)) {
                $stdPercent = $this->PromoCodes->get_code($order->promocode_id);
                $stdPercent = $stdPercent->discount / 10000;
            } else {
                $stdPercent = 0.008;
            }

            $user = $this->users->get_user($order->user_id);
            $address = $this->Addresses->get_address($user->regaddress_id);
            $insurance_cost = $this->insurances->get_insurance_cost($order->amount,$address->id);
            // $insurance_cost = $this->insurances->get_insurance_cost($order->amount);
            $this->design->assign('insurance_cost', $insurance_cost);

            $order->return_amount = (($order->amount + $insurance_cost) * $stdPercent * $order->period) + $order->amount + $insurance_cost;
            $return_period = date_create();
            date_add($return_period, date_interval_create_from_date_string($order->period . ' days'));
            $order->return_period = date_format($return_period, 'Y-m-d H:i:s');
        }

        // мараторий
        if (!empty($order) && ($order->status == 3 || $order->status == 8)) {
            $reason = $this->reasons->get_reason($order->reason_id);
            if (!empty($reason) && $reason->maratory > 0) {
                if ((strtotime($order->reject_date) + $reason->maratory * 86400) > time()) {
                    $reject_block = date('Y-m-d H:i:s', strtotime($order->reject_date) + $reason->maratory * 86400 + 64800);
                    $this->design->assign('reject_block', $reject_block);
                }
            }
        }

        $contract = $this->contracts->get_contract($order->contract_id);
        $last_contract_active_cessia = 0;
        if ($contract->active_cessia) {
            $last_contract_active_cessia = 1;
        }
        $this->design->assign('last_contract_active_cessia', $last_contract_active_cessia);

        $show_prolongation = false;
        if (!empty($order))
            $order->prolongation_date = null;


        if ($order->contract_id) {
            $order->contract = $this->contracts->get_contract($order->contract_id);

            $now = new DateTime(date('Y-m-d'));
            $returnDate = new DateTime(date('Y-m-d', strtotime($order->contract->return_date)));
            $start_date = new DateTime(date('Y-m-d', strtotime($order->contract->inssuance_date)));
            /*if ($now <= $returnDate && date_diff($now, $returnDate)->days <= 3 || $now > $returnDate && date_diff($now, $returnDate)->days <= 35)
                $show_prolongation = 1;*/

            $operations = OperationsORM::query()
                ->where('contract_id', '=', $order->contract->id)
                ->where('type', '=', 'PAY')->get();

            $count_prolongation = 0;
            foreach ($operations as $operation) {
                if ($operation->transaction_id) {
                    $transaction = $this->transactions->get_transaction($operation->transaction_id);
                    // $transaction = TransactionsORM::query()->where('id', '=', $operation->transaction_id)->first();
                    if ($transaction && $transaction->prolongation) {
                        $count_prolongation++;
                    }
                }
            }

            if ($order->contract->active_cessia == 0 &&
            date_diff($now, $start_date)->days >= 7 && $count_prolongation < 4
            && date_diff($now, $start_date)->days < 130
            && (($order->contract->loan_body_summ * 1.5) > $order->contract->loan_percents_summ)
            ) {
                $show_prolongation = 1;
            }
            $pro_date = new DateTime(date('Y-m-d', strtotime($order->contract->return_date)));

            $date_diff = date_diff(
                new DateTime(date('Y-m-d', strtotime($order->contract->return_date))),
                new DateTime(date('Y-m-d'))
            );
            if (isset($date_diff->days) && $date_diff->days > 40) {
                $show_prolongation = false;
            }

            // !!!
            if ($order->order_id == 46787){
                $show_prolongation = 1;
            }
            if ($order->order_id == 45541 && $count_prolongation < 5){
                $show_prolongation = 1;
            }

            if ($show_prolongation) {

                $date_interval = new DateInterval("P30D");
                $order->prolongation_date = $pro_date->add($date_interval)->format('Y-m-d');
            }

            $diff = date_diff($now, $returnDate);
            $order->contract->delay = $diff->days;


            $prolongation_amount = 0;
            if ($order->contract->type == 'base' && ($order->contract->status == 2 || $order->contract->status == 4)) // выдан
            {
                if ($order->contract->prolongation < 5 || ($order->contract->prolongation >= 5 && $order->contract->sold)) {
                    if ($order->contract->loan_percents_summ > 0) {
                        $prolongation_amount = $order->contract->loan_percents_summ;
                    }
                }
            }

            if ($now <= $returnDate && date_diff($now, $returnDate) <= 3 || $now > $returnDate)
                $this->design->assign('prolongation_amount', $prolongation_amount);


            $ins_amount = 0;
            $contract_operations = $this->ProloServicesCost->gets(array('id' => ($count_prolongation + 1)));
            if (isset($contract_operations[0]->insurance_cost)) {
                $insurance_cost_limits = json_decode($contract_operations[0]->insurance_cost);

                $array_name = [];
                foreach ($insurance_cost_limits as $key => $val) {
                    $array_name[$key] = $val[0];
                }
                array_multisort($array_name, SORT_ASC, $insurance_cost_limits);

                foreach ($insurance_cost_limits as $insurance_cost_limit) {
                    if ($order->contract->loan_body_summ < $insurance_cost_limit[0] ) {
                        $insurance_cost_amount = $insurance_cost_limit[1];
                        break;
                    }
                }
    
                $ins_amount = (float)$insurance_cost_amount;
            }

            $user = $this->users->get_user($order->user_id);
            if ($user->utm_source == 'kpk' || $user->utm_source == 'part1') {
                $ins_amount = 0;
            }


            $this->design->assign('prolongation_insurance_amount', $ins_amount);
            $this->design->assign('count_prolongation', $count_prolongation);

            /*
            $inssuance_date = new DateTime();
            $finish_date = new DateTime();
            $finish_date->add(DateInterval::createFromDateString($order->contract->period.' days'));

            $inssuance_date = date_create($order->contract->inssuance_date);
            date_add($inssuance_date, date_interval_create_from_date_string($order->contract->period.' days'));
            $diff_period = date_diff($inssuance_date, );
            $order->contract->return_amount = ($order->contract->loan_body_summ * $order->contract->base_percent * $diff_period) + $order->contract->loan_body_summ + $order->contract->loan_percents_summ;
            */

//            $return_period = date_create($order->contract->inssuance_date);
//            date_add($return_period, date_interval_create_from_date_string($order->contract->period.' days'));
//            $order->contract->return_date = date_format($return_period, 'Y-m-d H:i:s');
        }

        if (!empty($order))
            $this->design->assign('order', $order);

        $need_fields = $this->users->check_fields($this->user);
        $this->design->assign('need_fields', $need_fields);

        $statuses = $this->orders->get_statuses();
        $this->design->assign('statuses', $statuses);

        $min_summ = $this->settings->loan_min_summ;
        $max_summ = $this->settings->loan_max_summ;
        $min_period = $this->settings->loan_min_period;
        $max_period = $this->settings->loan_max_period;
        $current_summ = empty($_COOKIE['loan_summ']) ? $this->settings->loan_default_summ : $_COOKIE['loan_summ'];
        $current_period = empty($_COOKIE['loan_period']) ? $this->settings->loan_default_period : $_COOKIE['loan_period'];
        $loan_percent = $this->settings->loan_default_percent;


        $this->design->assign('min_summ', $min_summ);
        $this->design->assign('max_summ', $max_summ);
        $this->design->assign('min_period', $min_period);
        $this->design->assign('max_period', $max_period);
        $this->design->assign('current_summ', $current_summ);
        $this->design->assign('current_period', $current_period);
        $this->design->assign('loan_percent', $loan_percent);
        $this->design->assign('show_prolongation', $show_prolongation);

        if ($closedContract = $this->session->getFlash('closedContract')) {
            $this->design->assign('closedContract', $closedContract);
        }

        // TODO: Сделать проверку на показ формы для нового кредита
        $this->design->assign('form_repeat_order', 1);

        $cards = $this->cards->get_cards(array('user_id' => $this->user->id));
        $this->design->assign('cards', $cards);
//echo __FILE__.' '.__LINE__.'<br /><pre>';var_dump($order);echo '</pre><hr />';

        if (isset($this->user->contract) && $this->user->contract->status != 3 && $this->user->contract->sold) {
            if (empty($this->user->contract->premier))
                return $this->design->fetch('account/cession.tpl');
            else
                return $this->design->fetch('account/premier.tpl');
        } else {
            $warning_card = '';

            foreach ($cards as $card) {
                list($month, $year) = explode('/', $card->expdate);
                $card_exp = date('Y-m-t', strtotime($year . '-' . $month));
                $now_date = date('Y-m-d');

                if ($card->expdate != '') {
                    if ($now_date > $card_exp) {
                        $last_four_digits = substr($card->pan, -4);
                        $warning_card .= "Пожалуйста, замените карту *$last_four_digits. Она не активна, мы не сможем зачислить займ<br>";
                    }
                }

            }

            $this->design->assign('warning_card', $warning_card);
            return $this->design->fetch('account/home.tpl');
        }
    }
    
}