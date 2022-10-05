<?php

class Best2payCallback extends Controller
{
    public function fetch()
    {
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
        $reference = $this->request->get('reference', 'integer');
        $error = $this->request->get('error', 'integer');
        $code = $this->request->get('code', 'integer');

        $sector = $this->best2pay->get_sector('PAYMENT');


        if (!empty($register_id)) {
            if ($transaction = $this->transactions->get_register_id_transaction($register_id)) {
                if ($transaction_operation = $this->operations->get_transaction_operation($transaction->id)) {
                    $meta_title = 'Оплата уже принята';
                    $this->design->assign('error', 'Оплата уже принята.');
                } else {
// TODO: сделать запрос в бест2пей и получить успешную операцию
                    if (empty($operation)) {
                        $register_info = $this->best2pay->get_register_info($transaction->sector, $register_id);
                        $xml = simplexml_load_string($register_info);

                        foreach ($xml->operations as $xml_operation)
                            if ($xml_operation->operation->state == 'APPROVED')
                                $operation = (string)$xml_operation->operation->id;
                    }


                    if (!empty($operation)) {
                        $operation_info = $this->best2pay->get_operation_info($transaction->sector, $register_id, $operation);
                        $xml = simplexml_load_string($operation_info);
                        $operation_reference = (string)$xml->reference;
                        $reason_code = (string)$xml->reason_code;
                        $payment_amount = strval($xml->amount) / 100;
                        $operation_date = date('Y-m-d H:i:s', strtotime(str_replace('.', '-', (string)$xml->date)));
                        //echo __FILE__.' '.__LINE__.'<br /><pre>';echo(htmlspecialchars($operation_info));echo '</pre><hr />';

                        if ($reason_code == 1) {


                            if (!($contract = $this->contracts->get_contract($transaction->reference)))
                                $contract = $this->contracts->get_number_contract($transaction->reference);

                            $rest_amount = $payment_amount;


                            $contract_order = $this->orders->get_order((int)$contract->order_id);

                            $regaddress_full = empty($contract_order->Regindex) ? '' : $contract_order->Regindex . ', ';
                            $regaddress_full .= trim($contract_order->Regregion . ' ' . $contract_order->Regregion_shorttype);
                            $regaddress_full .= empty($contract_order->Regcity) ? '' : trim(', ' . $contract_order->Regcity . ' ' . $contract_order->Regcity_shorttype);
                            $regaddress_full .= empty($contract_order->Regdistrict) ? '' : trim(', ' . $contract_order->Regdistrict . ' ' . $contract_order->Regdistrict_shorttype);
                            $regaddress_full .= empty($contract_order->Reglocality) ? '' : trim(', ' . $contract_order->Reglocality . ' ' . $contract_order->Reglocality_shorttype);
                            $regaddress_full .= empty($contract_order->Reghousing) ? '' : ', д.' . $contract_order->Reghousing;
                            $regaddress_full .= empty($contract_order->Regbuilding) ? '' : ', стр.' . $contract_order->Regbuilding;
                            $regaddress_full .= empty($contract_order->Regroom) ? '' : ', к.' . $contract_order->Regroom;

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

                            $now_date = new DateTime(date('Y-m-d'));
                            $issuance_date = new DateTime(date('Y-m-d', strtotime($contract->inssuance_date)));
                            $return_date = new DateTime(date('Y-m-d', strtotime($contract->return_date)));
                            $date_diff = date_diff($now_date, $issuance_date)->days;
                            $prolongation = 0;
                            $docs = 0;

                            if ($date_diff < 150
                                && $contract->loan_percents_summ <= $payment_amount
                                && $return_date >= $now_date
                                && date_diff($return_date, $now_date)->days <= 3
                                && $contract->loan_percents_summ + $contract->loan_body_summ + 400 > $payment_amount
                                || $now_date > $return_date
                                && $date_diff < 150
                                && $contract->loan_percents_summ <= $payment_amount
                                && $contract->loan_percents_summ + $contract->loan_body_summ + 400 > $payment_amount)
                            {
                                $prolongation = 1;

                                if ($date_diff >= 131 && $date_diff < 150) {
                                    $days_to_prolongation = 150 - $date_diff;
                                } else {
                                    $days_to_prolongation = $this->settings->prolongation_period;
                                }

                                if ($contract->status == 2) {
                                    $new_return_date = date('Y-m-d H:i:s', strtotime($contract->return_date . "+{$days_to_prolongation} days"));
                                } else {
                                    $new_return_date = date('Y-m-d H:i:s', strtotime("now +{$days_to_prolongation} days"));
                                }

                                $max_return_date = date('Y-m-d H:i:s', strtotime($contract->inssuance_date . '+151 days'));

                                $return_date = new DateTime(date('Y-m-d', strtotime($new_return_date)));

                                $period = date_diff($now_date, $return_date)->days;

                                $document_params['return_date'] = $new_return_date;
                                $document_params['return_date_day'] = date('d', strtotime($new_return_date));
                                $document_params['return_date_month'] = date('m', strtotime($new_return_date));
                                $document_params['return_date_year'] = date('Y', strtotime($new_return_date));
                                $document_params['period'] = $period;

                                if (empty($contract->sold) && $contract->type == 'base' && $contract->loan_percents_summ + $this->settings->prolongation_amount <= $payment_amount) {
                                    $docs = 1;

                                    $operation_id = $this->operations->add_operation(array(
                                        'contract_id' => $contract->id,
                                        'user_id' => $contract->user_id,
                                        'order_id' => $contract->order_id,
                                        'transaction_id' => $transaction->id,
                                        'type' => 'INSURANCE',
                                        'amount' => $this->settings->prolongation_amount,
                                        'created' => date('Y-m-d H:i:s'),
                                        'sent_status' => 0,
                                    ));

                                    $close_contracts = $this->contracts->get_contracts(array('user_id' => $contract->user_id, 'status' => 3));
//                                    $protection = empty($close_contracts) ? 0 : 1;
                                    $protection = 0;

                                    $insurance_id = $this->insurances->add_insurance(array(
                                        'number' => '',
                                        'amount' => $this->settings->prolongation_amount,
                                        'user_id' => $contract->user_id,
                                        'order_id' => $contract->order_id,
                                        'create_date' => date('Y-m-d H:i:s'),
                                        'start_date' => date('Y-m-d 00:00:00', time() + (1 * 86400)),
                                        'end_date' => date('Y-m-d 23:59:59', time() + (31 * 86400)),
                                        'operation_id' => (int)$operation_id,
                                        'protection' => $protection,
                                    ));
                                    $this->transactions->update_transaction($transaction->id, array('insurance_id' => $insurance_id));

                                    $rest_amount = $rest_amount - $this->settings->prolongation_amount;

                                    //Отправляем чек по страховке
                                    $this->ekam->send_insurance($operation_id);
                                    $payment_amount -= $this->settings->prolongation_amount;

                                }

                                // продлеваем контракт
                                $this->contracts->update_contract($contract->id, array(
                                    'return_date' => ($new_return_date < $max_return_date) ? $new_return_date : $max_return_date,
                                    'prolongation' => $contract->prolongation + 1,
                                    'collection_status' => 0,
                                    'collection_handchange' => 0,
                                    'collection_manager_id' => 0,
                                    'status' => 2,
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

                            } else {
                                $this->transactions->update_transaction($transaction->id, array('prolongation' => 0));
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

                            if (!empty($contract->collection_status)) {
                                $date1 = new DateTime(date('Y-m-d', strtotime($contract->return_date)));
                                $date2 = new DateTime(date('Y-m-d'));

                                $diff = $date2->diff($date1);
                                $contract->expired_days = $diff->days;

                                $collection_order = array(
                                    'transaction_id' => $transaction->id,
                                    'manager_id' => $contract->collection_manager_id,
                                    'contract_id' => $contract->id,
                                    'created' => date('Y-m-d H:i:s'),
                                    'body_summ' => $transaction_loan_body_summ,
                                    'percents_summ' => empty($transaction_loan_percents_summ) ? 0 : $transaction_loan_percents_summ,
                                    'charge_summ' => empty($transaction_loan_charge_summ) ? 0 : $transaction_loan_charge_summ,
                                    'peni_summ' => empty($transaction_loan_peni_summ) ? 0 : $transaction_loan_peni_summ,
                                    'commision_summ' => $transaction->commision_summ,
                                    'closed' => 0,
                                    'prolongation' => 0,
                                    'collection_status' => $contract->collection_status,
                                    'expired_days' => $contract->expired_days,
                                );
                            }

                            $this->contracts->update_contract($contract->id, array(
                                'loan_percents_summ' => $contract_loan_percents_summ,
                                'loan_charge_summ' => 0,
                                'loan_peni_summ' => 0,
                                'loan_body_summ' => $contract_loan_body_summ,
                            ));

                            $this->transactions->update_transaction($transaction->id, array(
                                'loan_percents_summ' => empty($transaction_loan_percents_summ) ? 0 : $transaction_loan_percents_summ,
                                'loan_charge_summ' => empty($transaction_loan_charge_summ) ? 0 : $transaction_loan_charge_summ,
                                'loan_peni_summ' => empty($transaction_loan_peni_summ) ? 0 : $transaction_loan_peni_summ,
                                'loan_body_summ' => empty($transaction_loan_body_summ) ? 0 : $transaction_loan_body_summ,
                            ));

                            if ($prolongation == 1) {
                                if (!empty($collection_order))
                                    $collection_order['prolongation'] = 1;

                                if($docs == 1){
                                    $return_amount = round($contract_loan_body_summ + $contract_loan_body_summ * $contract->base_percent * $days_to_prolongation / 100, 2);
                                    $return_amount_percents = round($contract_loan_body_summ * $contract->base_percent * $days_to_prolongation / 100, 2);

                                    $document_params['return_amount'] = $return_amount;
                                    $document_params['return_amount_percents'] = $return_amount_percents;

                                    $document_params['amount'] = $contract_loan_body_summ;

                                    // дополнительное соглашение
                                    $this->documents->create_document(array(
                                        'user_id' => $contract->user_id,
                                        'order_id' => $contract->order_id,
                                        'contract_id' => $contract->id,
                                        'type' => 'DOP_SOGLASHENIE_PROLONGATSIYA',
                                        'params' => $document_params
                                    ));

                                    //TODO: Сделать страховку
                                    if (!empty($insurance_id)) {
                                        //удаляем старый документ (без подписи)
                                        $oldDoc = $this->documents->get_document_by_template($contract->user_id, 'POLIS_STRAHOVANIYA');
                                        $this->documents->delete_document($oldDoc->id);

                                        $document_params['insurance'] = $this->insurances->get_insurance($insurance_id);
                                        $this->documents->create_document(array(
                                            'user_id' => $contract->user_id,
                                            'order_id' => $contract->order_id,
                                            'contract_id' => $contract->id,
                                            'type' => 'POLIS_STRAHOVANIYA',
                                            'params' => $document_params
                                        ));

                                    }
                                }
                            }

                            // закрываем кредит
                            $contract_loan_percents_summ = round($contract_loan_percents_summ, 2);
                            $contract_loan_body_summ = round($contract_loan_body_summ, 2);
                            $closed = 0;
                            if ($contract_loan_body_summ <= 0 && $contract_loan_percents_summ <= 0) {
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

                                $operation_id = $this->operations->add_operation(array(
                                    'contract_id' => $contract->id,
                                    'user_id' => $contract->user_id,
                                    'order_id' => $contract->order_id,
                                    'transaction_id' => $transaction->id,
                                    'type' => 'INSURANCE',
                                    'amount' => 400,
                                    'created' => date('Y-m-d H:i:s'),
                                    'sent_status' => 0,
                                    'contract_is_closed' => 1
                                ));

                                //Отправляем чек по страховке
                                $this->ekam->send_insurance($operation_id);

                                $insurance_id = $this->insurances->add_insurance(array(
                                    'number' => '',
                                    'amount' => 400,
                                    'user_id' => $contract->user_id,
                                    'order_id' => $contract->order_id,
                                    'create_date' => date('Y-m-d H:i:s'),
                                    'start_date' => date('Y-m-d 00:00:00', time() + (1 * 86400)),
                                    'end_date' => date('Y-m-d 23:59:59', time() + (31 * 86400)),
                                    'operation_id' => (int)$operation_id,
                                    'protection' => 0,
                                ));

                                $insurances = new stdClass();
                                $insurances->operation_id = $operation_id;

                                $params = array(
                                    'now_date' => date('Y-m-d'),
                                    'lastname' => $contract_order->lastname,
                                    'firstname' => $contract_order->firstname,
                                    'patronymic' => $contract_order->patronymic,
                                    'birth' => $contract_order->birth,
                                    'phone_mobile' => $contract_order->phone_mobile,
                                    'email' => $contract_order->email,
                                    'amount' => $contract->amount,
                                    'operation_id' => $insurances
                                );

                                $this->documents->create_document(array(
                                    'user_id' => $contract->user_id,
                                    'order_id' => $contract->order_id,
                                    'contract_id' => $contract->id,
                                    'type' => 'POLIS_ZAKRITIE',
                                    'params' => $params
                                ));

                                $closed = 1;

                            }

                            if (!empty($collection_order)) {
                                $this->collections->add_collection($collection_order);
                            }

                            $this->operations->add_operation(array(
                                'contract_id' => $contract->id,
                                'user_id' => $contract->user_id,
                                'order_id' => $contract->order_id,
                                'type' => 'PAY',
                                'amount' => ($closed || $closed == 1) ? $payment_amount - 400 : $payment_amount,
                                'created' => $operation_date,
                                'transaction_id' => $transaction->id,
                                'loan_body_summ' => $contract_loan_body_summ,
                                'loan_percents_summ' => $contract_loan_percents_summ,
                                'loan_charge_summ' => 0,
                                'loan_peni_summ' => 0,
                                'contract_is_closed' => $closed,
                            ));

                            $meta_title = 'Оплата прошла успешно';
                            $this->design->assign('success', 'Оплата прошла успешно.');

                            if ($closed == 1) {
                                $this->session->setFlash('closedContract', 1);
                            }

                        } else {
                            $reason_code_description = $this->best2pay->get_reason_code_description($code);
                            $this->design->assign('reason_code_description', $reason_code_description);

                            $meta_title = 'Не удалось оплатить';
                            $this->design->assign('error', 'При оплате произошла ошибка.');
                        }
                        $this->transactions->update_transaction($transaction->id, array(
                            'operation' => $operation,
                            'callback_response' => $operation_info,
                            'reason_code' => $reason_code
                        ));


                    } else {
                        $callback_response = $this->best2pay->get_register_info($transaction->sector, $register_id, $operation);
                        $this->transactions->update_transaction($transaction->id, array(
                            'operation' => 0,
                            'callback_response' => $callback_response
                        ));
                        //echo __FILE__.' '.__LINE__.'<br /><pre>';echo(htmlspecialchars($callback_response));echo '</pre><hr />';
                        $meta_title = 'Не удалось оплатить';
                        $this->design->assign('error', 'При оплате произошла ошибка. Код ошибки: ' . $error);

                    }
                }
            } else {
                $meta_title = 'Ошибка: Транзакция не найдена';
                $this->design->assign('error', 'Ошибка: Транзакция не найдена');
            }


        } else {
            $meta_title = 'Ошибка запроса';
            $this->design->assign('error', 'Ошибка запроса');
        }


//echo __FILE__.' '.__LINE__.'<br /><pre>';var_dump($_GET);echo '</pre><hr />';

    }


    public function recurrent()
    {

    }


    public function add_card_action()
    {
        $register_id = $this->request->get('id', 'integer');
        $operation = $this->request->get('operation', 'integer');
        $reference = $this->request->get('reference', 'integer');
        $error = $this->request->get('error', 'integer');
        $code = $this->request->get('code', 'integer');

        if (!empty($register_id)) {
            if ($transaction = $this->transactions->get_register_id_transaction($register_id)) {
                if (!empty($operation)) {
                    $operation_info = $this->best2pay->get_operation_info($transaction->sector, $register_id, $operation);
                    $xml = simplexml_load_string($operation_info);
                    $operation_reference = (string)$xml->reference;
                    $reason_code = (string)$xml->reason_code;


//echo __FILE__.' '.__LINE__.'<br /><pre>';echo(htmlspecialchars($operation_info));echo '</pre><hr />';

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

                        $countUserCards = $this->cards->count_cards(['user_id' => $xml->reference]);
                        if ($countUserCards > 1) {
                            $this->design->assign('cardId', $cardId);
                            $this->session->set('otherCardAdded', 1);
                        }

                        $meta_title = 'Карта успешно привязана';
                        $this->design->assign('success', 'Карта успешно привязана.');

                        $receipt = array(
                            'title' => 'Услуга "Привязка карты"',
                            'operation_id' => $transaction->id,
                            'amount' => 1);

                        $res = $this->Ekam->send_receipt($receipt);
                        $res = json_decode($res);

                        $data = array(
                            'user_id' => $card['user_id'],
                            'name' => $receipt['title'],
                            'receipt_url' => $res->online_cashier_url,
                            'response' => json_encode($res),
                            'created' => date('Y-m-d H:i:s')
                        );

                        $this->Receipts->add_receipt($data);

                    } else {
                        $reason_code_description = $this->best2pay->get_reason_code_description($code);
                        $this->design->assign('reason_code_description', $reason_code_description);

                        $meta_title = 'Не удалось привязать карту';
                        $this->design->assign('error', 'При привязке карты произошла ошибка.');
                    }
                    $this->transactions->update_transaction($transaction->id, array(
                        'operation' => $operation,
                        'callback_response' => $operation_info,
                        'reason_code' => $reason_code
                    ));


                } else {
                    $callback_response = $this->best2pay->get_register_info($transaction->sector, $register_id, $operation, 1);
                    $this->transactions->update_transaction($transaction->id, array(
                        'operation' => 0,
                        'callback_response' => $callback_response
                    ));
//echo __FILE__.' '.__LINE__.'<br /><pre>';echo(htmlspecialchars($callback_response));echo '</pre><hr />';
                    $meta_title = 'Не удалось привязать карту';
                    $this->design->assign('error', 'При привязке карты произошла ошибка. Код ошибки: ' . $error);

                }
            } else {
                $meta_title = 'Ошибка: Транзакция не найдена';
                $this->design->assign('error', 'Ошибка: Транзакция не найдена');
            }


        } else {
            $meta_title = 'Ошибка запроса';
            $this->design->assign('error', 'Ошибка запроса');
        }

//echo __FILE__.' '.__LINE__.'<br /><pre>';var_dump($_GET);echo '</pre><hr />';

    }
}