<table width="530">
	<tbody>
        <tr>
            <td width="530" align="center">
                <p>
                    <strong style="font-size:9px">ДОПОЛНИТЕЛЬНОЕ СОГЛАШЕНИЕ К ДОГОВОРУ МИКРОЗАЙМА №{$contract->number} от {$contract->inssuance_date|date} г.</strong>										
                    <br />
                </p>
            </td>
        </tr>
        <tr>
            <td width="265" align="left"  style="font-size:7px">г.Самара</td>
            <td width="265" align="right"  style="font-size:7px">{$operation->created|date}</td>
        </tr>
        <tr>
            <td width="530"><br /><br /></td>
        </tr>
        <tr>
            <td width="170"></td>
            <td width="170" align="center" border="1" style="padding:10px">
                <br /><br />
                {$base_percent = $contract->base_percent*365}
                ПОЛНАЯ СТОИМОСТЬ ЗАЙМА СОСТАВЛЯЕТ:
                {$base_percent},000 ({($base_percent)|percent_string|upper}) ПРОЦЕНТОВ ГОДОВЫХ
                <br /><br />
            </td>
            <td width="20"></td>
            <td width="170" align="center" border="1" style="padding:10px">            
                <br /><br />
                {$return_amount_percents = ($contract->loan_body_summ * $contract->base_percent * $order->prolongation_period / 100)|round:2}
                ПОЛНАЯ СТОИМОСТЬ ПОТРЕБИТЕЛЬСКОГО 
                ЗАЙМА В ДЕНЕЖНОМ ВЫРАЖЕНИИ СОСТАВЛЯЕТ
                {$return_amount_percents} ({$return_amount_percents|price_string|upper})
                <br /><br />
            </td>
        </tr>
        <tr>
            <td width="530" style="font-size:8px;">
                <br /><br />
                Я, {$user->lastname} {$user->firstname} {$user->patronymic} {$user->birth} года рождения, 
                паспорт гражданина Российской Федерации; {$user->passport_serial}, выдан {$user->passport_issued} {$user->passport_date}г. , 
                зарегистрирован по адресу:  
                {$regaddress_full} («Заемщик») 
                выражаю {$organization->full_name} (зарегистрировано в реестре микрофинансовых организаций за номером {$organization->regnumber}, 
                ИНН/ОГРН {$organization->inn}/{$organization->ogrn}, юридический адрес: {$organization->yur_address}), («Кредитор») 
                решили изменить указанные ниже Индивидуальные условия договора займа № {$contract->number} от {$contract->inssuance_date|date} г.										
                <br />
            </td>
        </tr>
        <tr>
            <td width="530" align="center">
                <strong style="font-size:8px;">Измененные индивидуальные условия договора микрозайма</strong>
            </td>
        </tr>
        <tr>
            <td width="530" style="font-size:7px">
                <table border="1" cellpadding="2">
                    <tr>
                        <td width="30" align="center"><strong>№</strong></td>
                        <td width="250" align="center"><strong>Условие</strong></td>
                        <td width="250" align="center"><strong>Содержание условия</strong></td>
                    </tr>
                    <tr>
                        <td width="30" align="center" valign="top">1</td>
                        <td width="250" align="left" valign="top">Сумма займа</td>
                        <td width="250" align="left" valign="top">Сумма займа составляет: {$contract->loan_body_summ} руб.</td>
                    </tr>
                    <tr>
                        <td width="30" align="center" valign="top">2</td>
                        <td width="250" align="left" valign="top">Срок действия договора, срок возврата займа</td>
                        <td width="250" align="left" valign="top">Настоящий договор микрозайма вступает в силу с момента
                            подписания его сторонами и действует до полного исполнения
                            сторонами обязательств по нему (фактического возврата займа в полном объеме). 
                            Микрозайм подлежит возврату {$contract->return_date|date} г."				
                        </td>
                    </tr>
                    <tr>
                        <td width="30" align="center" valign="top">3</td>
                        <td width="250" align="left" valign="top">Процентная ставка (процентные ставки) в процентах годовых, 
                            а при применении переменной процентной ставки - порядок ее определения, 
                            соответствующий требованиям Федерального закона от 21 декабря 2013 года N 353-ФЗ "О потребительском кредите (займе)", 
                            ее значение на дату предоставления заемщику индивидуальных условий
                        </td>
                        <td width="250" align="left" valign="top">{$contract->base_percent*365},000 ({($contract->base_percent*365)|percent_string}) процентов годовых ({$contract->base_percent} % в день). Переменная процентная ставка не применяется.</td>
                    </tr>
                    <tr>
                        <td width="30" align="center" valign="top">4</td>
                        <td width="250" align="left" valign="top">Количество, размер и периодичность (сроки) платежей Заемщика по договору 
                            или порядок определения этих платежей
                        </td>
                        <td width="250" align="left" valign="top">Возврат суммы займа и процентов подлежат оплате единовременным платежом в срок, 
                            указанный в п.2 настоящих измененных индивидуальных условий.
                            Размер платежа (задолженности) к моменту возврата займа составит 
                            {$contract->loan_body_summ + $return_amount_percents} руб.
                        </td>
                    </tr>
                    <tr>
                        <td width="30" align="center" valign="top">5</td>
                        <td width="250" align="left" valign="top">Условие установления нового срока возврата</td>
                        <td width="250" align="left" valign="top">В день подписания измененных индивидуальных условий договора микрозайма Заемщик 
                            осуществляет погашение процентов за пользование суммой займа, начисленных на дату подписания настоящих измененных 
                            индивидуальных условий в сумме {$return_amount_percents} руб. 
                            Срок возврата займа не меняется при невыполнении указанного условия.					
                        </td>
                    </tr>
                    <tr>
                        <td width="30" align="center" valign="top">5.1</td>
                        <td width="250" align="left" valign="top">Указание на изменение суммы расходов заемщика при увеличении используемой 
                            в договоре потребительского кредита (займа) переменной процентной ставки потребительского кредита (займа) 
                            на один процентный пункт начиная со второго очередного платежа на ближайшую дату 
                            после предполагаемой даты заключения договора	
                        </td>
                        <td width="250" align="left" valign="top">Не применимо</td>
                    </tr>
                    <tr>
                        <td width="30" align="center" valign="top">6</td>
                        <td width="250" align="left" valign="top">Порядок изменения количества, размера и периодичности (сроков) 
                            платежей Заемщика при частичном досрочном возврате займа
                        </td>
                        <td width="250" align="left" valign="top">Проценты начисляются на оставшуюся непогашенную часть суммы 
                            займа со дня, следующего за днем частичного погашения. 
                            Оставшаяся задолженность в полном объеме должна быть погашена в дату, 
                            указанную в п. 2 настоящей таблицы
                        </td>
                    </tr>
                    <tr>
                        <td width="30" align="center" valign="top">7</td>
                        <td width="250" align="left" valign="top">Лицо, подписавшее настоящее измененные индивидуальные условия от имени Кредитора</td>
                        <td width="250" align="left" valign="top">{$manager->name} {*по доверенности № 101-003 от 12.01.2019*}</td>
                    </tr>
                    <tr>
                        <td width="30" align="center" valign="top">8</td>
                        <td width="250" align="left" valign="top">Дата подписания настоящих измененных индивидуальных условий </td>
                        <td width="250" align="left" valign="top">{$contract->return_date|date} г.</td>
                    </tr>
                    <tr>
                        <td width="30" align="center" valign="middle">9</td>
                        <td width="250" align="left" valign="middle">Подписи сторон</td>
                        <td width="250" align="left" valign="top">
                            <br /><br />
                            Кредитор:_________________ {$manager->name}
                            <br /><br />
                            Заемщик:__________________ {$user->lastname} {$user->firstname} {$user->patronymic}
                            <br /><br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
	</tbody>
</table>






