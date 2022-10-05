<table style="height: 2226px;" border="0" width="555" cellspacing="0">
<tbody>
<tr>
<td style="width: 17.4px;" align="left" height="16">&nbsp;</td>
<td style="width: 87.4833px;" align="left"><span style="font-size: small;">{$document_date|date}</span></td>
<td style="width: 153.45px;" align="left">&nbsp;</td>
<td style="width: 265.733px;" colspan="7" align="left"><span style="font-size: small;">Мировому судье в {$tribunal}</span></td>
</tr>

<tr>
<td style="width: 17.4px;" align="left" height="">&nbsp;</td>
<td style="width: 87.4833px;" align="left">&nbsp;</td>
<td style="width: 153.45px;" align="right" valign="top"><strong><u><span style="font-size: small;">Взыскатель:</span></u></strong></td>
<td style="width: 265.733px;" colspan="7" align="left"><span style="font-size: small;">ООО "Премьер"
        344092, Ростовская обл., г.Ростов-На-Дону, Королева пр-кт, д. 7/19, офис 207.<br />
        Реквизиты:
        ИНН/КПП 6161090133/616101001,<br /> ОГРН 1196196052865
        Р/сч 40702810925180000771 <br />
        Филиал «ЦЕНТРАЛЬНЫЙ»  Банка ВТБ (ПАО) г. Москва <br />
        к/счет 30101810145250000411 БИК 044525411 
    </span>
</td>
</tr>

<tr>
<td style="width: 17.4px;" align="left" height="">&nbsp;</td>
<td style="width: 87.4833px;" align="left">&nbsp;</td>
<td style="width: 153.45px;" align="right" valign="top"><strong><u><span style="font-size: small;">Должник:</span></u></strong></td>
<td style="width: 265.733px;" colspan="7" align="left"><span style="font-size: small;">{$fio} {$birth} г.р. урож. {$birth_place}
        <br />
        Паспорт {$passport_series} № {$passport_number}
        Выдан {$passport_issued}
        <br />
        Дата выдачи {$passport_date} г.
        Код подразделения {$passport_code}
        <br />{$regaddress_full}
        <br />
        <br />
    </span>
</td>
</tr>

<tr>
<td style="width: 549px;" colspan="11" align="center" height="13"><span style="font-size: medium;"><strong>ЗАЯВЛЕНИЕ <br />О ВЫНЕСЕНИИ СУДЕБНОГО ПРИКАЗА </strong></span><br /></td>
</tr>

<tr>
    <td style="width: 549px;" colspan="11" align="left" height="">
        <span style="font-size: medium;"> 
            {$contract_date|date} г. ООО МКК "НА ЛИЧНОЕ+" и {$fio} {$birth} г.р. (далее - Должник) 
            заключили договор денежного займа № {$first_number}. 
        </span>
    </td>
</tr>
<tr>
    <td style="width: 549px;" colspan="11" align="left" height="">
        <span style="font-size: medium;"> 
        В соответствии с вышеуказанным договором займа Должнику было предоставлено 
        {$body_summ} ({$body_summ|price_string_short}) рублей. сроком до {$return_date|date} 
        с ежедневным начислением процентов за пользование займом в размере 1 % (365% годовых). 
        Сумма займа была передана Заемщику на банковскую карту {$card->pan}. 
        Таким образом, ООО МКК "НА ЛИЧНОЕ+" выполнила свои обязательства перед Заемщиком в полном объеме. 
        </span>
    </td>
</tr>
<tr>
<td style="width: 549px;" colspan="11" align="left" height=""><span style="font-size: medium;"> 
    Должник обязан был обеспечить возврат (погашение) предоставленного займа путем оплаты единовременного платежа
    в срок, указанный в Условиях договора микрозайма.</span></td>
</tr>
<tr>
<td style="width: 549px;" colspan="11" align="left" height=""><strong><u><span style="font-size: medium;"> 
    В то же время Должник не исполнил обязанность по возврату всей суммы задолженности по договору займа, 
    по состоянию на {$document_date|date} размер его задолженности составлял 
    {$total_summ} ({$total_summ|price_string}) рублей, из которых
</span></u></strong></td>
</tr>
<tr>
<td style="width: 549px;" colspan="11" align="left" height=""><em><span style="font-size: medium;"> 
    1. Сумма основного долга по состоянию на {$document_date|date} г. 
    в размере {$body_summ} (сумма займа по договору денежного займа № {$first_number}) рублей</span></em></td>
</tr>
<tr>
<td style="width: 549px;" colspan="11" align="left" height="">
    <em><span style="font-size: medium;">2. Сумма процентов в размере {$body_summ + ($body_summ*$loan_real_period * 0.01)} = {$body_summ} 
    (сумма долга по договору цессии) * 1 %( процентная ставка)* {$loan_real_period} дней ( за период с {$contract_date|date} г. по {$document_date|date} г.), 
            а, в соответствии с договором, максимальный размер процентов, неустойки (штрафы, пени), 
            иных мер ответственности по договору не может превышать полуторакратного размера суммы займа, 
            т.е. {$body_summ*2.5} рублей. <br />Таким образом, {$body_summ} (сумма займа по договору денежного займа № {$first_number}) рублей 
            + {$body_summ*1.5} рублей (сумма процентов) 
            &ndash; 0,00 рублей (сумма внесенных Заемщиком денежных средств за период с {$contract_date|date} г. по {$document_date|date} г.) 
            = {$body_summ*2.5} рублей.
        </span>
    </em>
</td>
</tr>
{if $cession_info}
{foreach $cession_info as $cession}
<tr>
    <td style="width: 549px;" colspan="11" align="left" height="">
        <span style="font-size: medium;"> 
            В связи с неисполнением обязательств по оплате, задолженность была уступлена по договору цессии 
            {$cession->number} от {$cession->date} г. в {$cession->buyer}
        </span>
    </td>
</tr>
{/foreach}
{/if}
<tr>
<td style="width: 549px;" colspan="11" align="left" height=""><span style="font-size: medium;"> Согласно со статьей 32 ГПК РФ ( Договорная подсудность), стороны могут по соглашению между собой изменить территориальную подсудность для данного дела до принятия его судом к своему производству (согласно п. 20 договора займа).</span></td>
</tr>
<tr>
<td style="width: 549px;" colspan="11" align="left" height=""><span style="font-size: medium;"> 
    Кроме того, ООО &laquo;Премьер&raquo; оплатило за обращение в суд 
    государственную пошлину в размере {$poshlina} рублей. </span></td>
</tr>
<tr>
<td style="width: 549px;" colspan="11" align="left" height=""><span style="font-size: medium;"> 
    На основании вышеизложенного и руководствуясь ст. ст. 809, 810, ГК РФ, ст. ст. 32, 121, 122, 123, 124 ГПК РФ, 
    </span></td>
</tr>

<tr>
<td style="width: 549px;" colspan="11" align="center" height=""><strong><span style="font-size: medium;">
    ПРОШУ</span></strong></td>
</tr>
<tr>
<td style="width: 549px;" colspan="11" align="left" height=""><span style="font-size: medium;"> 
    Взыскать с {$fio} в пользу ООО &laquo;Премьер&raquo; сумму задолженности 
    по договору денежного займа № {$first_number} от {$contract_date|date} г. за период с {$contract_date|date} г по {$document_date|date} 
    в размере {$total_summ} ({$total_summ|price_string_short}) рублей, 
    а также расходы по оплате госпошлины в размере {$poshlina} руб. </span></td>
</tr>
<tr>
<td style="width: 549px;" colspan="11" align="left" height="">
    <span style="font-size: medium;"> 
        Вступивший в законную силу судебный приказ прошу выслать по адресу 
        344092, Ростовская обл., г.Ростов-На-Дону, Королева пр-кт, д. 7/19, офис 207.
    </span>
</td>
</tr>

<tr>
<td style="width: 549px;" colspan="11" align="center" height="">
    <strong><span style="font-size: medium;">Приложение:</span></strong></td>
</tr>
<tr>
<td style="width: 17.4px;" align="left" height="36">&nbsp;</td>
<td style="width: 527.6px;" colspan="10" align="left">
<span style="font-size: small;">1. Платежное поручение об оплате госпошлины за рассмотрение заявления;<br />
2. Бухгалтерская справка;<br />
3. Копия договора займа;<br />
4. Платежное поручение на перечисление денежных средств по договору займа
5. Копия договора уступки прав;<br />
6. Учредительные документы ООО &laquo;Премьер&raquo;;<br />
7. Доверенность представителя.
    </span></td>
</tr>

<tr>
<td style="width: 17.4px;" align="left" height="31">&nbsp;</td>
<td style="width: 230.417px;" colspan="4" align="left"><strong><span style="font-size: medium;">Представитель по доверенности <br />тел: {$exactor_phone}</span></strong></td>
<td style="width: 293.183px;" colspan="6" align="right"><strong><span style="font-size: medium;">{$exactor_name}</span></strong></td>
</tr>
</tbody>
</table>