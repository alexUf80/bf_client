<table width="535px">
    <tr>
        <td width="100%" align="center"><strong style="font-size:8px">Заявление
            <br />на предоставление услуги SMS-информирования				
            <br />
            </strong>
        </td>
    </tr>
    <tr>
        <td width="100%" align="left" style="font-size:8px">1. Я, 
            {$user->lastname|escape} {$user->firstname|escape} {$user->patronymic|escape} {$user->birth}г. , 
            паспорт {$user->passport_serial}, выдан {$user->passport_issued} от {$user->passport_date} , 
            зарегистрирован по адресу: 
            {$user->Regindex}, 
            {$user->Regregion} {$user->Regregion_shorttype}
            {if $user->Regdistrict}, {$user->Regdistrict} {$user->Regdistrict_shorttype}, {/if}
            {if $user->Regcity}, {$user->Regcity} {$user->Regcity_shorttype}{/if}
            {if $user->Reglocality}, {$user->Reglocality} {$user->Regcity_shorttype}{/if}
            {if $user->Regstreet}, {$user->Regstreet} {$user->Regstreet_shorttype} {/if}
            {if $user->Regbuilding}, д. {$user->Regbuilding}{/if}
            {if $user->Reghousing}, стр. {$user->Reghousing}{/if}
            {if $user->Regroom}, кв. {$user->Regroom}{/if}            
            настоящим прошу ООО "МКК "НА ЛИЧНОЕ" (Далее по тексту - Общество) на основании настоящего заявления, 
            предоставить мне услугу SMS-информирования (Далее по тексту - Услуга) на следующих условиях:
        </td>
    </tr>
    <tr>
        <td width="100%" align="left" style="font-size:8px">1.1. 
            Услуга действует с даты подписания настоящего Заявления по дату полного исполнения обязательств 
            по Договору потребительского займа № {$contract->number} от {$contract->inssuance_date}  
            (Далее по тексту - Договор) или по дату получения отказа от заключения Договора.
        </td>
    </tr>
    <tr>
        <td width="100%" align="left" style="font-size:8px">1.2. 
            Стоимость услуги -  99 руб.										
        </td>
    </tr>
    <tr>
        <td width="100%" align="left" style="font-size:8px">1.3. 
            Номер телефона для направления  SMS-сообщения 
            {$user->phone_mobile|escape}.										
            <br />
        </td>
    </tr>
    <tr>
        <td width="100%" align="left" style="font-size:8px">2. 
            Настоящим я сообщаю, что ознакомлен(а), понимаю и полностью согласен(а) 
            с условиями предоставления Услуги, которая заключается в направлении мне 
            Обществом коротких текстовых сообщений на номер телефона, указанный в п. 1.3. с информацией:										
        </td>
    </tr>
    <tr>
        <td width="100%" align="left" style="font-size:8px">2.1. 
            О платеже в день исполнения обязательств.
        </td>
    </tr>
    <tr>
        <td width="100%" align="left" style="font-size:8px">2.2. 
            О наличии просроченной задолженности на 7 день наступления просрочки исполнения обязательств по Договору.
            <br />
        </td>
    </tr>
    <tr>
        <td width="100%" align="left" style="font-size:8px">3.
            Оплата Услуги производиться:
        </td>
    </tr>
    <tr>
        <td width="15px" align="" >
            <img src="{$config->root_url}/theme/site/html/pdf/i/checkbox_off.png" height="12px" />
        </td>
        <td width="" align="left" style="font-size:8px;vertical-align:bottom">
            Безналичным путем за счет денежных средств, полученных в заем в соответствии с Договором.							
        </td>
    </tr>
    <tr>
        <td width="15px" align="" >
            <img src="{$config->root_url}/theme/site/html/pdf/i/checkbox_on.png" height="12px" />
        </td>
        <td width="" align="left" style="font-size:8px;vertical-align:bottom">
            За счет собственных средств путем внесения наличных денежных средств в кассу Общества или безналичным путем на реквизиты Общества, указанные в п. 8 Индивидуальных условий.							
            <br />
        </td>
    </tr>
    <tr>
        <td width="100%" align="left" style="font-size:8px">4. 
        Настоящим я подтверждаю, что мне известно, что Услуга является добровольной и отказ от Услуги не влияет на решение о заключении Договора.										
        </td>
    </tr>
    <tr>
        <td width="15px" align="" >
            <img src="{$config->root_url}/theme/site/html/pdf/i/checkbox_on.png" height="12px" />
        </td>
        <td width="" align="left" style="font-size:8px;vertical-align:bottom">
            Согласен на оказание услуги 							
        </td>
    </tr>
    <tr>
        <td width="15px" align="" >
            <img src="{$config->root_url}/theme/site/html/pdf/i/checkbox_off.png" height="12px" />
        </td>
        <td width="" align="left" style="font-size:8px;vertical-align:bottom">
            Не согласен на оказание услуги 							
            <br />
        </td>
    </tr>
    <tr>
        <td width="100%" align="left" style="font-size:8px">Внимание!										
            <br />Общество не несет ответственности за:										
            <br />- не доставку SMS-сообщения по причине отключения мобильного телефона, нахождения вне зоны действия сети;										
            <br />- действия Оператора связи (технические проблемы в доставке SMS-сообщения). 										
        </td>
    </tr>
    <tr>
        <td width="100%" align="left" style="font-size:8px">
            <br /><br />
            ____________________ / {$user->lastname|escape} {$user->firstname|escape} {$user->patronymic|escape}  {$user->birth|escape}
        </td>
    </tr>
</table>