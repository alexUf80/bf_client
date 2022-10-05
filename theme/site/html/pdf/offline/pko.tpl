<table cellspacing="0" border="0" style="font-size: 75%">

{if $operation->type == 'MAKEPAY'}
    {if $pko_type == 1}
        {$naznachenie = "Оплата процентов по договору займа №{$contract->number}"}
        {$amount = $transaction->loan_percents_summ + $transaction->loan_peni_summ}
        {$number = "{$operation->id}-1"}
    {elseif $pko_type == 2}
        {$naznachenie = "Оплата долга по договору займа №{$contract->number}"}
        {$amount = $transaction->loan_body_summ}
        {$number = "{$operation->id}-2"}
    {elseif $pko_type == 3}
        {$naznachenie = "Оплата ответственности по договору займа №{$contract->number}"}
        {$amount = $transaction->loan_charge_summ}
        {$number = "{$operation->id}-3"}
    {elseif $pko_type == 50}
        {$naznachenie = "Оплата по договору возмездного оказания услуг"}    
        {$amount = $transaction->commision_summ}
        {$number = "{$operation->id}-50"}
    {else}
        {$naznachenie = "Оплата по договору {$contract->number} от {$contract->inssuance_date|date}"}
        {$amount = $operation->amount}
        {$number = "{$operation->id}"}
    {/if}
{elseif $operation->type == 'BOT_INFORM'}
        {$naznachenie = "Оплата услуги Бот-информирование"}
        {$amount = $operation->amount}
        {$number = "{$operation->id}"}
{elseif $operation->type == 'SMS_INFORM'}
        {$naznachenie = "Оплата услуги Смс-информирования"}
        {$amount = $operation->amount}
        {$number = "{$operation->id}"}
{/if}

	<tbody>
    <tr>
		<td colspan="8" align="right" valign="bottom"><font color="#000000">Унифицированная форма КО-1</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td rowspan="38" align="center" valign="middle"><font color="#000000"></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td colspan="8" align="right" valign="bottom"><font color="#000000">Утверждена постановлением Госкомстата России от 18.08.98 № 88</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" colspan="5" align="center" valign="bottom"><b><font color="#000000">{$organization->full_name}</font></b></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="5" align="center" valign="top"><font color="#000000">организация</font></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan="2" align="center" valign="middle"><font color="#000000">Коды</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="5" align="center" valign="bottom"><b><font  color="#000000">КВИТАНЦИЯ</font></b></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="right" valign="bottom"><font  color="#000000">Форма по ОКУД</font></td>
		<td style="border-top: 3px solid #000000; border-bottom: 1px solid #000000; border-left: 3px solid #000000; border-right: 3px solid #000000" colspan="2" align="center" valign="middle"><b><font  color="#000000"><br />0310001</font></b></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" colspan="5" align="right" valign="bottom"><font color="#000000">к приходному кассовому ордеру № {$number}</font></td>
	</tr>
	<tr>
		<td style="border-bottom: 1px solid #000000" colspan="5" height="17" align="left" valign="bottom"><font color="#000000">{$organization->full_name}</font></td>
		<td align="right" valign="bottom"><font  color="#000000">по ОКПО</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 3px solid #000000; border-right: 3px solid #000000" colspan="2" align="center" valign="bottom"><b><font  color="#000000"><br></font></b></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="right" valign="bottom"><font color="#000000">от</font></td>
		<td style="border-bottom: 1px solid #000000" colspan="4" align="left" valign="bottom"><b><font color="#000000">6 ноября 2021 г.</font></b></td>
	</tr>
	<tr>
		<td colspan="5" height="17" align="center" valign="top"><font color="#000000">организация</font></td>
		<td align="left" valign="bottom"><font  color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 3px solid #000000; border-left: 3px solid #000000; border-right: 3px solid #000000" colspan="2" rowspan="2" align="center" valign="middle"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td style="border-bottom: 1px solid #000000" colspan="5" height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="3" align="left" valign="bottom"><font color="#000000">Принято от</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td colspan="5" height="13" align="center" valign="top"><font color="#000000">подразделение</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="5" rowspan="3" align="left" valign="top"><font color="#000000">{$user->lastname} {$user->firstname} {$user->patronymic} {$user->birth}</font></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td colspan="4" align="right" valign="middle"><b><font  color="#000000">ПРИХОДНЫЙ КАССОВЫЙ ОРДЕР</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000" colspan="2" align="center" valign="middle"><font color="#000000">Номер документа</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan="2" align="center" valign="middle"><font color="#000000">Дата составления</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-top: 3px solid #000000; border-bottom: 3px solid #000000; border-left: 3px solid #000000; border-right: 3px solid #000000" colspan="2" align="center" valign="bottom"><font  color="#000000">{$number}</font></td>
		<td style="border-top: 3px solid #000000; border-bottom: 3px solid #000000; border-left: 3px solid #000000; border-right: 3px solid #000000" colspan="2" align="center" valign="bottom"><font  color="#000000">{$operation->created|date}</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="2" rowspan="2" align="left" valign="bottom"><font color="#000000">Основание</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan="4" height="62" align="center" valign="middle"><font color="#000000">Дебет</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan="4" align="center" valign="middle"><font color="#000000">Кредит</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan="4" align="center" valign="middle"><font color="#000000">Сумма</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan="4" align="center" valign="middle"><font color="#000000">Код целевого назначения</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan="4" align="center" valign="middle"><font color="#000000"><br></font></td>
		<td align="center" valign="middle"><font color="#000000"><br></font></td>
		<td colspan="5" rowspan="3" align="left" valign="top"><font color="#000000">
            {$naznachenie}
        </font></td>
	</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" rowspan="3" align="center" valign="middle"><font color="#000000"><br></font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000" rowspan="3" align="center" valign="middle"><font color="#000000">код структурного подразделения</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000" rowspan="3" align="center" valign="middle"><font color="#000000">корреспондирующий счет, субсчет</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000" rowspan="3" align="center" valign="middle"><font color="#000000">код аналити- ческого учета</font></td>
		<td align="center" valign="top"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td align="center" valign="top"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td align="center" valign="top"><font color="#000000"><br></font></td>
		<td align="center" valign="top"><font color="#000000"><br></font></td>
		<td align="center" valign="top"><font color="#000000"><br></font></td>
		<td align="center" valign="top"><font color="#000000"><br></font></td>
		<td align="center" valign="top"><font color="#000000"><br></font></td>
		<td align="center" valign="top"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td style="border-top: 3px solid #000000; border-bottom: 3px solid #000000; border-left: 3px solid #000000; border-right: 1px solid #000000" height="17" align="center" valign="middle"><font color="#000000">50.01</font></td>
		<td style="border-top: 3px solid #000000; border-bottom: 3px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign="middle"><font color="#000000"><br></font></td>
		<td style="border-top: 3px solid #000000; border-bottom: 3px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign="middle"><font color="#000000"><br></font></td>
		<td style="border-top: 3px solid #000000; border-bottom: 3px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign="middle"><font color="#000000"> 62.01</font></td>
		<td style="border-top: 3px solid #000000; border-bottom: 3px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign="middle"><font color="#000000"><br></font></td>
		<td style="border-top: 3px solid #000000; border-bottom: 3px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="right" valign="middle" sdval="330" sdnum="1033;0;0.00"><font color="#000000">{$amount}</font></td>
		<td style="border-top: 3px solid #000000; border-bottom: 3px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign="middle"><font color="#000000"><br></font></td>
		<td style="border-top: 3px solid #000000; border-bottom: 3px solid #000000; border-left: 1px solid #000000; border-right: 3px solid #000000" align="left" valign="middle"><font color="#000000"><br></font></td>
		<td align="center" valign="middle"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000">Сумма</font></td>
		<td style="border-bottom: 1px solid #000000" colspan="4" align="left" valign="bottom"><b><font color="#000000">{$amount} руб.</font></b></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="4" align="center" valign="top"><font color="#000000">цифрами</font></td>
	</tr>
	<tr>
		<td colspan="2" height="13" align="left" valign="bottom"><font color="#000000">Принято от:</font></td>
		<td colspan="7" align="left" valign="bottom"><font color="#000000">{$user->lastname} {$user->firstname} {$user->patronymic} {$user->birth}</font></td>
		<td colspan="5" rowspan="3" align="left" valign="top"><font color="#000000">{$amount|price_string}</font></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td colspan="3" height="17" align="left" valign="bottom"><font color="#000000">Основание:</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td colspan="8" rowspan="2" height="26" align="left" valign="top">
            {$naznachenie}
        </td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="3" align="left" valign="bottom"><font face="Calibri" color="#000000">В том числе</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="5" rowspan="3" align="left" valign="top"><font color="#000000">НДС (0%) 0-00 руб.</font></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000">Сумма:</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td colspan="8" rowspan="3" height="47" align="left" valign="top"><font color="#000000">{$amount|price_string}</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" colspan="4" align="left" valign="bottom"><b><font color="#000000">{$operation->created|date} г.</font></b></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td colspan="2" height="17" align="left" valign="top"><font color="#000000">В том числе:</font></td>
		<td colspan="2" align="left" valign="bottom"><font color="#000000">НДС (0%) 0-00 руб.</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><b><font color="#000000">М.П. (штампа)</font></b></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td colspan="3" height="17" align="left" valign="bottom"><font color="#000000">Приложение:</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="3" align="left" valign="bottom"><b><font color="#000000">Главный бухгалтер</font></b></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td colspan="2" height="17" align="left" valign="bottom"><b><font color="#000000">Главный бухгалтер</font></b></td>
		<td style="border-bottom: 1px solid #000000" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" colspan="3" align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="center" valign="top"><font color="#000000">подпись</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="3" align="center" valign="top"><font color="#000000">расшифровка подписи</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="center" valign="top"><font color="#000000">подпись</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="3" align="center" valign="top"><font color="#000000">расшифровка подписи</font></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><b><font color="#000000">Кассир</font></b></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td colspan="2" height="17" align="left" valign="bottom"><b><font color="#000000">Получил кассир</font></b></td>
		<td style="border-bottom: 1px solid #000000" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td style="border-bottom: 1px solid #000000" colspan="3" align="left" valign="bottom"><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td height="17" align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="center" valign="top"><font color="#000000">подпись</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="3" align="center" valign="top"><font color="#000000">расшифровка подписи</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td align="center" valign="top"><font color="#000000">подпись</font></td>
		<td align="left" valign="bottom"><font color="#000000"><br></font></td>
		<td colspan="3" align="center" valign="top"><font color="#000000">расшифровка подписи</font></td>
	</tr>
	</tbody>
</table>