<table width="530">
    <tbody>
        <tr>
            <td>
                <p align="center"><strong>Заявление</strong></p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>Я, {$lastname|escape} {$firstname|escape} {$patronymic|escape}, дата рождения {$birth|date}
                паспорт серия {$passport_series|escape}, номер {$passport_number|escape}, 
                выдан {$passport_issued|escape} {$passport_code|escape}, дата выдачи {$passport_date|date},                 
                настоящим прошу ИП Тихомирову Галину Петровну (ОГРНИП 322631200091504) и ООО МКК «Финансовый аспект» (ОГРН 1203800012294, регистрационный номер записи в государственном реестре микрофинансовых организаций 2004125009640), 
                    оказать содействие в получении услуги по страхованию, стоимостью {$insurance_summ} руб.,
                    предоставляемой САО "ВСК" (далее по тексту - Страховая компания). </p>
                <p>Настоящим я подтверждаю, что:</p>
                <p>- ознакомлен с условиями услуги, Правилами страхования; </p>
                <p>- мне известно, что выдача займа (заключение договора потребительского займа) не поставлена в
                    зависимость от приобретения услуги (заключения договора страхования) и я имею право обратиться в
                    Страховую компанию и отказаться от услуги в течение четырнадцати календарных дней с возвратом части
                    оплаты пропорционально стоимости части услуги, оказанной до уведомления об отказе.</p>
                <p>  Контактный e-mail для предоставления уведомления об отказе от услуги: doc@eco-zaim.ru </p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <table style="width: 266px;">
                    <tbody>
                        <tr>
                            <td style="width: 229.9px;">Согласен на оказание услуги</td>
                            <td style="">X</td>
                        </tr>
                        <tr>
                            <td style="width: 229.9px;">&nbsp;</td>
                            <td style="width: 20.1px;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 229.9px;">Не согласен на оказание услуги</td>
                            <td style="width: 20.1px; border-style: solid;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 229.9px;">&nbsp;</td>
                            <td style="width: 20.1px;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 229.9px;">&nbsp;</td>
                            <td style="width: 20.1px;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 229.9px;">&nbsp;</td>
                            <td style="width: 20.1px;">&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="397" cellspacing="0" cellpadding="7">
                    <tbody>
                        <tr>
                            <td width="383" height="122">
                                <table width="397" cellspacing="0" cellpadding="7" border=1"">
                                    <tbody>
                                        <tr>
                                            <td width="100%" height="98">
                                                <p>Подписано с использованием ПЭП</p>
                                                <p><strong>{$lastname|escape} {$firstname|escape} {$patronymic|escape}</strong></p>
                                                <p>Дата: <strong>{$insurance->create_date|date}</strong></p>
                                                <p>Телефон: <strong>{$phone|escape}</strong></p>
                                                <p>СМС-код: <strong>{$asp|escape}</strong></p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>