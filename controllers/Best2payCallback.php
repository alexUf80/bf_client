<?php

error_reporting(-1);
ini_set('display_errors', 'on');

class Best2PayCallback extends Controller
{
    public function fetch()
    {
        $str = '';
        try {
            $this->logging();
        } catch (Throwable $e) {
            $str .=PHP_EOL.'==================================================================='.PHP_EOL;
            $str .= date('d.m.Y H:i:s').PHP_EOL;
            $str .= 'ОШИБКА ЛОГИРОВАНИЯ'.PHP_EOL;
            $str .= 'END'.PHP_EOL;
            file_put_contents('logs/Best2PayCallback.txt', $str, FILE_APPEND);
        }

        switch ($this->request->get('action', 'string')):

            case 'add_card':
                $this->add_card_action();
                break;

            case 'payment':
                $this->payment_action();
                break;

            case 'recurrent':
                $this->recurrent();
                break;

            case 'paymentRestruct':
                $this->paymentRestruct();
                break;


            default:
                $meta_title = 'Ошибка';
                $this->design->assign('error', 'Ошибка');

        endswitch;

        return $this->design->fetch('best2pay_callback.tpl');
    }

    public function payment_action()
    {
        $register_id = $this->request->get('id', 'integer');
        $operation = $this->request->get('operation', 'integer');
        $error = $this->request->get('error', 'integer');
        $code = $this->request->get('code', 'integer');

        if (!empty($register_id)) {
            if ($transaction = $this->transactions->get_register_id_transaction($register_id)) {
                if ($transaction_operation = $this->operations->get_transaction_operation($transaction->id)) {
                    $this->design->assign('error', 'Оплата уже принята.');
                } else {

                    if (empty($operation)) {
                        $register_info = $this->BestPay->get_register_info($transaction->sector, $register_id);
                        $xml = simplexml_load_string($register_info);

                        foreach ($xml->operations as $xml_operation)
                            if ($xml_operation->operation->state == 'APPROVED')
                                $operation = (string)$xml_operation->operation->id;
                    }


                    if (!empty($operation)) {
                        $operation_info = $this->BestPay->get_operation_info($transaction->sector, $register_id, $operation);
                        $xml = simplexml_load_string($operation_info);
                        $reason_code = (string)$xml->reason_code;
                        $payment_amount = strval($xml->amount) / 100;
                        $operation_date = date('Y-m-d H:i:s', strtotime(str_replace('.', '-', (string)$xml->date)));

                        if ($reason_code == 1) {


                            if (!($contract = $this->contracts->get_contract($transaction->reference)))
                                $contract = $this->contracts->get_number_contract($transaction->reference);

                            $rest_amount = $payment_amount;


                            $contract_order = $this->orders->get_order((int)$contract->order_id);

                            $user = $this->users->get_user($contract_order->user_id);

                            $regaddress = $this->Addresses->get_address($user->regaddress_id);
                            $regaddress_full = $regaddress->adressfull;

                            $passport_series = substr(str_replace(array(' ', '-'), '', $contract_order->passport_serial), 0, 4);
                            $passport_number = substr(str_replace(array(' ', '-'), '', $contract_order->passport_serial), 4, 6);
                            $subdivision_code = $contract_order->subdivision_code;
                            $passport_issued = $contract_order->passport_issued;
                            $passport_date = $contract_order->passport_date;

                            $document_params = array(
                                'lastname' => $contract_order->lastname,
                                'firstname' => $contract_order->firstname,
                                'patronymic' => $contract_order->patronymic,
                                'birth' => $contract_order->birth,
                                'phone' => $contract_order->phone_mobile,
                                'regaddress_full' => $regaddress_full,
                                'passport_series' => $passport_series,
                                'passport_number' => $passport_number,
                                'passport_serial' => $contract_order->passport_serial,
                                'subdivision_code' => $subdivision_code,
                                'passport_issued' => $passport_issued,
                                'passport_date' => $passport_date,
                                'asp' => $transaction->sms,
                                'created' => date('Y-m-d H:i:s'),
                                'base_percent' => $contract->base_percent,
                                'amount' => $contract->amount,
                                'number' => $contract->number,
                                'order_created' => $contract_order->date,

                            );

                            $ins_amount = 0;
                            $ins_coverage = 0;
                            if (!empty($transaction->prolongation) && $payment_amount >= $contract->loan_percents_summ) {

                                $new_return_date = date('Y-m-d H:i:s', time() + 86400 * $this->settings->prolongation_period);

                                $document_params['return_date'] = $new_return_date;
                                $document_params['return_date_day'] = date('d', strtotime($new_return_date));
                                $document_params['return_date_month'] = date('m', strtotime($new_return_date));
                                $document_params['return_date_year'] = date('Y', strtotime($new_return_date));
                                $document_params['period'] = $this->settings->prolongation_period;

                                $docs = 1;

                                $ins_amount = 0;
                                $ins_coverage = 0;

                                $operations = OperationsORM::query()
                                ->where('contract_id', '=', $contract->id)
                                ->where('type', '=', 'PAY')->get();
                                $count_prolongation = 0;
                                foreach ($operations as $operation1) {
                                    if ($operation1->transaction_id) {
                                        $transaction1 = $this->transactions->get_transaction($operation1->transaction_id);
                                        // $transaction1 = TransactionsORM::query()->where('id', '=', $operation1->transaction_id)->first();
                                        if ($transaction1 && $transaction1->prolongation) {
                                            $count_prolongation++;
                                        }
                                    }
                                }
                                $contract_operations = $this->ProloServicesCost->gets(array('id' => ($count_prolongation + 1)));
                                if (isset($contract_operations[0]->insurance_cost)) {
                                    $insurance_cost_limits = json_decode($contract_operations[0]->insurance_cost);

                                    $array_name = [];
                                    foreach ($insurance_cost_limits as $key => $val) {
                                        $array_name[$key] = $val[0];
                                    }
                                    array_multisort($array_name, SORT_ASC, $insurance_cost_limits);

                                    foreach ($insurance_cost_limits as $insurance_cost_limit) {
                                        if ($contract->loan_body_summ < $insurance_cost_limit[0] ) {
                                            $insurance_cost_amount = $insurance_cost_limit[1];
                                            $insurance_coverage_cost = $insurance_cost_limit[2];
                                            break;
                                        }
                                    }
                        
                                    $ins_amount = (float)$insurance_cost_amount;
                                    $ins_coverage = (float)$insurance_coverage_cost;
                                }

                                // if ($ins_amount == 0) {
                                //     $ins_amount = 400;
                                // }

                                // if ($payment_amount >= $contract->loan_percents_summ + $ins_amount) {
                                //     $operation_id = $this->operations->add_operation(array(
                                //         'contract_id' => $contract->id,
                                //         'user_id' => $contract->user_id,
                                //         'order_id' => $contract->order_id,
                                //         'transaction_id' => $transaction->id,
                                //         // 'type' => 'INSURANCE_BC',
                                //         'type' => 'INSURANCE',
                                //         'amount' => $ins_amount,
                                //         'created' => date('Y-m-d H:i:s'),
                                //         'sent_status' => 0,
                                //     ));

                                //     $insurance_id = $this->insurances->add_insurance(array(
                                //         'number' => '',
                                //         'amount' => $ins_amount,
                                //         'user_id' => $contract->user_id,
                                //         'order_id' => $contract->order_id,
                                //         'create_date' => date('Y-m-d H:i:s'),
                                //         'start_date' => date('Y-m-d 00:00:00', time() + (1 * 86400)),
                                //         'end_date' => date('Y-m-d 23:59:59', time() + (31 * 86400)),
                                //         'operation_id' => $operation_id,
                                //         'protection' => 0,
                                //     ), $transaction->id);
                                //     $this->transactions->update_transaction($transaction->id, array('insurance_id' => $insurance_id));

                                //     $docs = 2;
                                    
                                //     $rest_amount = $rest_amount - $ins_amount;
                                //     $payment_amount -= $ins_amount;

                                //     //Отправляем чек по страховке
                                //     $this->Cloudkassir->send_insurance($operation_id);

                                // }

                                // продлеваем контракт
                                $this->contracts->update_contract($contract->id, array(
                                    'return_date' => $new_return_date,
                                    'prolongation' => $contract->prolongation + 1,
                                    'status' => 2
                                ));

                                //Создаем пролонгацию и записываем в нее айди страховки
                                $this->prolongations->add_prolongation(array(
                                    'contract_id' => $contract->id,
                                    'user_id' => $contract->user_id,
                                    'insurance_id' => empty($insurance_id) ? '' : $insurance_id,
                                    'created' => date('Y-m-d H:i:s'),
                                    'accept_code' => $transaction->sms,
                                    'transaction_id' => $transaction->id,
                                ));

                            }

                            // списываем проценты
                            $contract_loan_percents_summ = (float)$contract->loan_percents_summ;
                            if ($contract->loan_percents_summ > 0) {
                                if ($rest_amount >= $contract->loan_percents_summ) {
                                    $contract_loan_percents_summ = 0;
                                    $rest_amount = $rest_amount - $contract->loan_percents_summ;
                                    $transaction_loan_percents_summ = $contract->loan_percents_summ;
                                } else {
                                    $contract_loan_percents_summ = $contract->loan_percents_summ - $rest_amount;
                                    $transaction_loan_percents_summ = $rest_amount;
                                    $rest_amount = 0;
                                }
                            }

                            // списываем основной долг
                            $contract_loan_body_summ = (float)$contract->loan_body_summ;
                            if ($contract->loan_body_summ > 0) {
                                if ($rest_amount >= $contract->loan_body_summ) {
                                    $contract_loan_body_summ = 0;
                                    $rest_amount = $rest_amount - $contract->loan_body_summ;
                                    $transaction_loan_body_summ = $contract->loan_body_summ;
                                } else {
                                    $contract_loan_body_summ = $contract->loan_body_summ - $rest_amount;
                                    $transaction_loan_body_summ = $rest_amount;
                                    $rest_amount = 0;
                                }
                            }

                            
                            $date1 = new DateTime(date('Y-m-d', strtotime($contract->return_date)));
                            $date2 = new DateTime(date('Y-m-d'));

                            $diff = $date2->diff($date1);
                            if ($date2 > $date1) {
                                $contract->expired_days = $diff->days;
                            }
                            else{
                                $contract->expired_days = 0;
                            }

                            $prolo = 'no';
                            if($transaction->prolongation == 1){
                                $contract->expired_days = 0;
                                $prolo = 'yes';
                            }

                            $epl = date('Y-m-d') . ' - ' . date('Y-m-d', strtotime($contract->return_date)) . ' - ' . $diff->days . ' - ' . $prolo;

                            if (!empty($contract->collection_status)) {

                                $collection_order = array(
                                    'transaction_id' => $transaction->id,
                                    'manager_id' => $contract->collection_manager_id,
                                    'contract_id' => $contract->id,
                                    'created' => date('Y-m-d H:i:s'),
                                    'body_summ' => empty($transaction_loan_body_summ) ? 0 : $transaction_loan_body_summ,
                                    'percents_summ' => empty($transaction_loan_percents_summ) ? 0 : $transaction_loan_percents_summ,
                                    'charge_summ' => empty($transaction_loan_charge_summ) ? 0 : $transaction_loan_charge_summ,
                                    'peni_summ' => empty($transaction_loan_peni_summ) ? 0 : $transaction_loan_peni_summ,
                                    'commision_summ' => $transaction->commision_summ,
                                    'closed' => 0,
                                    'prolongation' => $transaction->prolongation,
                                    'collection_status' => $contract->collection_status,
                                    'expired_days' => $contract->expired_days,
                                );
                            }

                            if (empty($transaction->prolongation) && $rest_amount != 0 && $contract_loan_body_summ == 0 && $contract_loan_percents_summ == 0) {
                                // списываем пени
                                $contract_loan_peni_summ = (float)$contract->loan_peni_summ;

                                if ($contract->loan_peni_summ > 0) {
                                    if ($rest_amount >= $contract->loan_peni_summ) {
                                        $contract_loan_peni_summ = 0;
                                        $rest_amount = $rest_amount - $contract->loan_peni_summ;
                                        $transaction_loan_peni_summ = $contract->loan_peni_summ;
                                    } else {
                                        $contract_loan_peni_summ = $contract->loan_peni_summ - $rest_amount;
                                        $transaction_loan_peni_summ = $rest_amount;
                                        $rest_amount = 0;
                                    }
                                }
                            }

                            $this->contracts->update_contract($contract->id, array(
                                'loan_percents_summ' => $contract_loan_percents_summ,
                                'loan_peni_summ' => isset($contract_loan_peni_summ) ? $contract_loan_peni_summ : $contract->loan_peni_summ,
                                'loan_body_summ' => $contract_loan_body_summ,
                            ));

                            $this->transactions->update_transaction($transaction->id, array(
                                'loan_percents_summ' => empty($transaction_loan_percents_summ) ? 0 : $transaction_loan_percents_summ,
                                'loan_peni_summ' => empty($transaction_loan_peni_summ) ? 0 : $transaction_loan_peni_summ,
                                'loan_body_summ' => empty($transaction_loan_body_summ) ? 0 : $transaction_loan_body_summ,
                            ));


                            $epl = $transaction->prolongation.' - '.$payment_amount.' - '.$contract->loan_percents_summ . ' - ' . (!empty($transaction->prolongation) && $payment_amount >= $contract->loan_percents_summ);
                            // $epl = 0;
                            if (!empty($transaction->prolongation) && round($payment_amount,2) >= round($contract->loan_percents_summ,2)) {
                                $epl = 1;
                                if (!empty($collection_order))
                                    $collection_order['prolongation'] = 1;

                                $this->contracts->update_contract($contract->id, ['collection_status' => 0, 'collection_manager_id' => 0]);

                                $return_amount = round($contract_loan_body_summ + $contract_loan_body_summ * $contract->base_percent * $this->settings->prolongation_period / 100, 2);
                                $return_amount_percents = round($contract_loan_body_summ * $contract->base_percent * $this->settings->prolongation_period / 100, 2);

                                $document_params['return_amount'] = $return_amount;
                                $document_params['return_amount_percents'] = $return_amount_percents;

                                $document_params['amount'] = $contract_loan_body_summ;

                                // дополнительное соглашение
                                $this->documents->create_document(array(
                                    'user_id' => $contract->user_id,
                                    'order_id' => $contract->order_id,
                                    'contract_id' => $contract->id,
                                    'type' => 'DOP_SOGLASHENIE',
                                    'params' => json_encode($document_params)
                                ));

                                if ($docs == 2) {
                                    $epl = '2 -- ' . $transaction->prolongation.' - '.$payment_amount.' - '.$contract->loan_percents_summ . ' - ' . (!empty($transaction->prolongation) && $payment_amount >= $contract->loan_percents_summ);
                                    $document_params['insurance'] = $this->insurances->get_insurance($insurance_id);
                                    $document_params['insurance_amount'] = $ins_amount;
                                    $document_params['insurance_coverage'] = $ins_coverage;

                                    if ( date('Y-m-d H:i:s') < '2024-01-21' ) {
                                        $this->documents->create_document(array(
                                            'user_id' => $contract->user_id,
                                            'order_id' => $contract->order_id,
                                            'contract_id' => $contract->id,
                                            // 'type' => 'POLIS_PROLONGATION',
                                            'type' => 'POLIS_PROLONGATION_POROG',
                                            'params' => json_encode($document_params)
                                        ));
                                        $this->documents->create_document(array(
                                            'user_id' => $contract->user_id,
                                            'order_id' => $contract->order_id,
                                            'contract_id' => $contract->id,
                                            // 'type' => 'KID_PROLONGATION',
                                            'type' => 'KID_PROLONGATION_POROG',
                                            'params' => json_encode($document_params)
                                        ));
                                        $this->documents->create_document(array(
                                            'user_id' => $contract->user_id,
                                            'order_id' => $contract->order_id,
                                            'contract_id' => $contract->id,
                                            // 'type' => 'KID_PROLONGATION',
                                            'type' => 'UVEDOMLENIE_OTKAZ_OT_USLUG',
                                            'params' => json_encode($document_params)
                                        ));
                                    }
                                    else{
                                        $this->documents->create_document(array(
                                            'user_id' => $contract->user_id,
                                            'order_id' => $contract->order_id,
                                            'contract_id' => $contract->id,
                                            // 'type' => 'POLIS_PROLONGATION',
                                            'type' => 'POLIS_PROLONGATION_POROG_24-01-21',
                                            'params' => json_encode($document_params)
                                        ));
                                        $this->documents->create_document(array(
                                            'user_id' => $contract->user_id,
                                            'order_id' => $contract->order_id,
                                            'contract_id' => $contract->id,
                                            // 'type' => 'KID_PROLONGATION',
                                            'type' => 'KID_PROLONGATION_POROG_24-01-21',
                                            'params' => json_encode($document_params)
                                        ));
                                        $this->documents->create_document(array(
                                            'user_id' => $contract->user_id,
                                            'order_id' => $contract->order_id,
                                            'contract_id' => $contract->id,
                                            // 'type' => 'KID_PROLONGATION',
                                            'type' => 'UVEDOMLENIE_OTKAZ_OT_USLUG',
                                            'params' => json_encode($document_params)
                                        ));
                                    }
                                }
                            }

                            // закрываем кредит
                            $contract_loan_percents_summ = round($contract_loan_percents_summ, 2);
                            $contract_loan_body_summ = round($contract_loan_body_summ, 2);

                            $contract_loan_peni_summ = isset($contract_loan_peni_summ) ? $contract_loan_peni_summ : $contract->loan_peni_summ;
                            $contract_loan_peni_summ = round($contract_loan_peni_summ, 2);

                            if ($contract_loan_body_summ <= 0 && $contract_loan_percents_summ <= 0 && $contract_loan_peni_summ == 0) {
                                $this->contracts->update_contract($contract->id, array(
                                    'status' => 3,
                                    'collection_status' => 0,
                                    'close_date' => date('Y-m-d H:i:s'),
                                ));

                                $this->orders->update_order($contract->order_id, array(
                                    'status' => 7
                                ));

                                if (!empty($collection_order))
                                    $collection_order['closed'] = 1;

                                CardsORM::where('user_id', $contract->user_id)->delete();
                            }

                            if (!empty($collection_order))
                                $this->collections->add_collection($collection_order);

                            $this->operations->add_operation(array(
                                'contract_id' => $contract->id,
                                'user_id' => $contract->user_id,
                                'order_id' => $contract->order_id,
                                'type' => 'PAY',
                                'amount' => $payment_amount,
                                'created' => $operation_date,
                                'transaction_id' => $transaction->id,
                                'loan_body_summ' => $contract_loan_body_summ,
                                'loan_percents_summ' => $contract_loan_percents_summ,
                                'loan_charge_summ' => 0,
                                'loan_peni_summ' => 0,
                                'expired_period' => $contract->expired_days,
                                'expired_period_log' => $epl
                            ));
                            $this->design->assign('success', 'Оплата прошла успешно.');

                        } else {
                            $this->design->assign('error', 'При оплате произошла ошибка: Недостаточно средств');
                            // логирование не достаточно средств
                            $str .=PHP_EOL.'==================================================================='.PHP_EOL;
                            $str .= date('d.m.Y H:i:s').PHP_EOL;
                            $str .= 'НЕДОСТАТОЧНО СДЕРСТВ ДЛЯ register_id = ' . $register_id .PHP_EOL;
                            $str .= 'END'.PHP_EOL;
                            file_put_contents('logs/Best2PayCallback.txt', $str, FILE_APPEND);
                        }
                    } else {
                        $reason_code_description = $this->BestPay->get_reason_code_description($code);
                        $this->design->assign('reason_code_description', $reason_code_description);

                        $this->design->assign('error', 'При оплате произошла ошибка.');
                        
                        // логирование не найденной операции
                        $str .=PHP_EOL.'==================================================================='.PHP_EOL;
                        $str .= date('d.m.Y H:i:s').PHP_EOL;
                        $str .= 'НЕ НАЙДЕНА ОПЕРАЦИЯ ДЛЯ register_id = ' . $register_id .PHP_EOL;
                        $str .= 'END'.PHP_EOL;
                        file_put_contents('logs/Best2PayCallback.txt', $str, FILE_APPEND);
                    }
                    $this->transactions->update_transaction($transaction->id, array(
                        'operation' => $operation,
                        'callback_response' => $register_info,
                        'reason_code' => $reason_code
                    ));


                }
            } else {
                $this->design->assign('error', 'Ошибка: Транзакция не найдена');
                // логирование не найденной транзакции
                $str .=PHP_EOL.'==================================================================='.PHP_EOL;
                $str .= date('d.m.Y H:i:s').PHP_EOL;
                $str .= 'НЕ НАЙДЕНА ТРАНЗАКЦИЯ ДЛЯ register_id = ' . $register_id .PHP_EOL;
                $str .= 'END'.PHP_EOL;
                file_put_contents('logs/Best2PayCallback.txt', $str, FILE_APPEND);
            }
        } else {
            $this->design->assign('error', 'Ошибка: ID заказа не найден');
            // логирование не найденного ID заказа
            $str .=PHP_EOL.'==================================================================='.PHP_EOL;
            $str .= date('d.m.Y H:i:s').PHP_EOL;
            $str .= 'НЕ НАЙДЕН ID ЗАКАЗА ДЛЯ register_id = ' . $register_id .PHP_EOL;
            $str .= 'END'.PHP_EOL;
            file_put_contents('logs/Best2PayCallback.txt', $str, FILE_APPEND);
        }


    }

    public function add_card_action()
    {
        $register_id = $this->request->get('id', 'integer');
        $operation = $this->request->get('operation', 'integer');
        $error = $this->request->get('error', 'integer');
        $code = $this->request->get('code', 'integer');

        if (!empty($register_id)) {
            if ($transaction = $this->transactions->get_register_id_transaction($register_id)) {
                if (!empty($operation)) {
                    $operation_info = $this->BestPay->get_operation_info($transaction->sector, $register_id, $operation);
                    $xml = simplexml_load_string($operation_info);
                    $reason_code = (string)$xml->reason_code;

                    if ($reason_code == 1) {

                        $card = array(
                            'user_id' => (string)$xml->reference,
                            'name' => (string)$xml->name,
                            'pan' => (string)$xml->pan,
                            'sector' => $transaction->sector,
                            'expdate' => (string)$xml->expdate,
                            'approval_code' => (string)$xml->approval_code,
                            'token' => (string)$xml->token,
                            'operation_date' => str_replace('.', '-', (string)$xml->date),
                            'created' => date('Y-m-d H:i:s'),
                            'operation' => $xml->order_id,
                            'register_id' => $transaction->register_id,
                            'transaction_id' => $transaction->id,
                            'bin_issuer' => (string)$xml->bin_issuer,
                        );

                        $cardId = $this->cards->add_card($card);

                        $countUserCards = $this->cards->count_cards(array('user_id' => $xml->reference));
                        if ($countUserCards > 1) {
                            $this->design->assign('cardId', $cardId);
                            $this->session->set('otherCardAdded', 1);
                        }

                        $this->BestPay->reverseCardEnroll($register_id, $xml->reference);

                        $this->design->assign('success', 'Карта успешно привязана.');

                    } else {
                        $reason_code_description = $this->BestPay->get_reason_code_description($code);
                        $this->design->assign('reason_code_description', $reason_code_description);
                        $this->design->assign('error', 'При привязке карты произошла ошибка.');
                        // логирование ошибки при привязке карты
                        $str .=PHP_EOL.'==================================================================='.PHP_EOL;
                        $str .= date('d.m.Y H:i:s').PHP_EOL;
                        $str .= 'ОШИБКА ПРИ ПРИВЯЗКЕ КАРТЫ register_id = ' . $register_id . ' --- ' . $reason_code . ' --- ' . $reason_code_description . PHP_EOL;
                        $str .= 'END'.PHP_EOL;
                        file_put_contents('logs/Best2PayCallback.txt', $str, FILE_APPEND);
                    }
                    $this->transactions->update_transaction($transaction->id, array(
                        'operation' => $operation,
                        'callback_response' => $operation_info,
                        'reason_code' => $reason_code
                    ));


                } else {
                    $callback_response = $this->BestPay->get_register_info($transaction->sector, $register_id, $operation, 1);
                    $this->transactions->update_transaction($transaction->id, array(
                        'operation' => 0,
                        'callback_response' => $callback_response
                    ));
                    $this->design->assign('error', 'При привязке карты произошла ошибка. Код ошибки: ' . $error);

                    // логирование ошибки при привязке карты с кодом
                    $str .=PHP_EOL.'==================================================================='.PHP_EOL;
                    $str .= date('d.m.Y H:i:s').PHP_EOL;
                    $str .= 'ОШИБКА ПРИ ПРИВЯЗКЕ КАРТЫ С КОДОМ '.$error.' register_id = ' . $register_id .PHP_EOL;
                    $str .= 'END'.PHP_EOL;
                    file_put_contents('logs/Best2PayCallback.txt', $str, FILE_APPEND);
                }
            } else {
                $this->design->assign('error', 'Ошибка: Транзакция не найдена');
                // логирование не найденной транзакции
                $str .=PHP_EOL.'==================================================================='.PHP_EOL;
                $str .= date('d.m.Y H:i:s').PHP_EOL;
                $str .= 'НЕ НАЙДЕНА ТРАНЗАКЦИЯ ДЛЯ ПРИВЯЗКИ КАРТЫ ДЛЯ register_id = ' . $register_id .PHP_EOL;
                $str .= 'END'.PHP_EOL;
                file_put_contents('logs/Best2PayCallback.txt', $str, FILE_APPEND);
            }


        } else {
            $this->design->assign('error', 'Ошибка запроса');
            // логирование ошибки запроса
            $str .=PHP_EOL.'==================================================================='.PHP_EOL;
            $str .= date('d.m.Y H:i:s').PHP_EOL;
            $str .= 'ОШИБКА ЗАПРОСА ДЛЯ ПРИВЯЗКИ КАРТЫ ДЛЯ register_id = ' . $register_id .PHP_EOL;
            $str .= 'END'.PHP_EOL;
            file_put_contents('logs/Best2PayCallback.txt', $str, FILE_APPEND);
        }
    }

    private function paymentRestruct()
    {
        $register_id = $this->request->get('id', 'integer');
        $operation = $this->request->get('operation', 'integer');
        $code = $this->request->get('code', 'integer');

        if (!empty($register_id)) {
            if ($transaction = $this->transactions->get_register_id_transaction($register_id)) {
                if ($transaction_operation = $this->operations->get_transaction_operation($transaction->id)) {
                    $this->design->assign('error', 'Оплата уже принята.');
                } else {

                    if (empty($operation)) {
                        $register_info = $this->BestPay->get_register_info($transaction->sector, $register_id);
                        $xml = simplexml_load_string($register_info);

                        foreach ($xml->operations as $xml_operation)
                            if ($xml_operation->operation->state == 'APPROVED')
                                $operation = (string)$xml_operation->operation->id;
                    }


                    if (!empty($operation)) {
                        $operation_info = $this->BestPay->get_operation_info($transaction->sector, $register_id, $operation);
                        $xml = simplexml_load_string($operation_info);
                        $reason_code = (string)$xml->reason_code;
                        $payment_amount = strval($xml->amount) / 100;

                        if ($reason_code == 1) {
                            if (!($contract = $this->contracts->get_contract($transaction->reference)))
                                $contract = $this->contracts->get_number_contract($transaction->reference);
                        }

                        var_dump($this->processingPay($contract->id, $payment_amount, $transaction->id));
                        exit;

                        $this->design->assign('success', 'Оплата прошла успешно.');
                    } else {
                        $reason_code_description = $this->BestPay->get_reason_code_description($code);
                        $this->design->assign('reason_code_description', $reason_code_description);

                        $this->design->assign('error', 'При оплате произошла ошибка.');
                    }
                    $this->transactions->update_transaction($transaction->id, array(
                        'operation' => $operation,
                        'callback_response' => $register_info,
                        'reason_code' => $reason_code
                    ));


                }
            }
        } else {
            $this->design->assign('error', 'Ошибка: Транзакция не найдена');
        }
    }

    private function processingPay($contractId, $rest_amount, $transactionId)
    {
        $contract = $this->contracts->get_contract($contractId);
        $planOperation = $this->PaymentsToSchedules->get_next($contractId);

        $faktOd = 0;
        $faktPrc = 0;
        $faktPeni = 0;

        // списываем основной долг
        if ($planOperation->plan_od > 0) {
            if ($rest_amount >= $planOperation->plan_od) {
                $faktOd = $planOperation->plan_od;
                $rest_amount -= $planOperation->plan_od;
            } else {
                $faktOd = $planOperation->plan_od - $rest_amount;
                $rest_amount = 0;
            }
        }

        // списываем проценты
        if ($planOperation->plan_prc > 0) {
            if ($rest_amount >= $planOperation->plan_prc) {
                $faktPrc = $planOperation->plan_prc;
                $rest_amount -= $planOperation->plan_prc;
            } else {
                $faktPrc = $planOperation->plan_prc - $rest_amount;
                $rest_amount = 0;
            }
        }

        // списываем пени
        if ($planOperation->plan_peni > 0) {
            if ($rest_amount >= $planOperation->plan_peni) {
                $faktPeni = $planOperation->plan_peni;
                $rest_amount -= $planOperation->plan_peni;
            } else {
                $faktPeni = $planOperation->plan_peni - $rest_amount;
                $rest_amount = 0;
            }
        }

        $paySum = $faktOd + $faktPeni + $faktPrc;

        $this->operations->add_operation(array(
            'contract_id' => $contractId,
            'user_id' => $contract->user_id,
            'order_id' => $contract->order_id,
            'type' => 'PAY',
            'amount' => $paySum,
            'created' => date('Y-m-d H:i:s'),
            'transaction_id' => $transactionId,
            'loan_body_summ' => $faktOd,
            'loan_percents_summ' => $faktPrc,
            'loan_peni_summ' => $faktPeni,
            'loan_charge_summ' => 0
        ));

        $status = 1;

        if($paySum >= $planOperation->plan_payment)
            $status = 2;

        $faktOperation =
            [
                'operation_id' => $planOperation->id,
                'fakt_payment' => $paySum,
                'fakt_od' => $faktOd,
                'fakt_prc' => $faktPeni,
                'fakt_peni' => $faktPrc,
                'fakt_date' => date('Y-m-d H:i:s'),
                'status' => $status
            ];

        $this->PaymentsToSchedules->update($planOperation->id, $faktOperation);

        $countRemaining = $this->PaymentsToSchedules->get_count_remaining($contract->id);

        if ($countRemaining == 0) {
            $this->closeContract($contractId, $contract->order_id);
            exit;
        }

        if($rest_amount > 0)
            $this->processingPay($contractId, $rest_amount, $transactionId);
        else
        {
            $nextPay = $this->PaymentsToSchedules->get_next($contractId);

            if($status == 1)
            {
                $nextPay->plan_od -= $faktOd;
                $nextPay->plan_prc -= $faktPrc;
                $nextPay->plan_peni -= $faktPeni;
                $nextPay->id = $planOperation->id;
                $nextPay->plan_date = $planOperation->plan_date;
            }

            $this->contracts->update_contract($contract->id, array(
                'loan_body_summ' => $nextPay->plan_od,
                'loan_percents_summ' => $nextPay->plan_prc,
                'loan_peni_summ' => $nextPay->plan_peni,
                'next_pay' => date('Y-m-d', strtotime($nextPay->plan_date)),
                'payment_id' => $nextPay->id
            ));
        }
    }

    private function closeContract($contractId, $orderId)
    {
        $this->contracts->update_contract($contractId, array(
            'status' => 3,
            'collection_status' => 0,
            'close_date' => date('Y-m-d H:i:s'),
        ));

        $this->orders->update_order($orderId, array(
            'status' => 7
        ));
    }

    private function logging($filename = 'Best2PayCallback.txt')
    {
        $log_dir = 'logs/';
        $log_filename = $log_dir.$filename;
        
        if (date('d', filemtime($log_filename)) != date('d'))
        {
            $archive_filename = $log_dir.'archive/'.date('ymd', filemtime($log_filename)).'.'.$filename;
            rename($log_filename, $archive_filename);
            file_put_contents($log_filename, "\xEF\xBB\xBF");            
        }


        $str = PHP_EOL.'==================================================================='.PHP_EOL;
        $str .= date('d.m.Y H:i:s').PHP_EOL;
        $str .= $_SERVER['REQUEST_URI'].PHP_EOL;
        $str .= 'END'.PHP_EOL;

        file_put_contents($log_dir.$filename, $str, FILE_APPEND);
    }

}