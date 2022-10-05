<table width="535px">
    <tr>
        <td height="755px">
            <table>
                <tr>
                    <td width="100%" align="center">
                        <strong style="font-size:9px;">АКТ<br />
                            об оказании услуг к Договору оказания консультационных услуг
                        </strong>
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td width="100%" align="left" style="font-size:8px;">
                        <br />
                        {$user->lastname|escape} {$user->firstname|escape} {$user->patronymic|escape}, 
                        паспорт {$user->passport_serial|escape} выдан {$user->passport_issued} от {$user->passport_date}, 
                        зарегистрированный по адресу:
                        {$user->Regindex}, 
                        {$user->Regregion} {$user->Regregion_shorttype}
                        {if $user->Regdistrict}, {$user->Regdistrict} {$user->Regdistrict_shorttype}, {/if}
                        {if $user->Regcity}, {$user->Regcity} {$user->Regcity_shorttype}{/if}
                        {if $user->Reglocality}, {$user->Reglocality} {$user->Regcity_shorttype}{/if}
                        {if $user->Regstreet}, {$user->Regstreet} {$user->Regstreet_shorttype} {/if}
                        {if $user->Regbuilding}, д. {$user->Regbuilding}{/if}
                        {if $user->Reghousing}, стр. {$user->Reghousing}{/if}
                        {if $user->Regroom}, кв. {$user->Regroom}{/if}
                        , далее именуемый Заказчик, с одной стороны, и Индивидуальный предприниматель Ежов
                        Денис Сергеевич (ОГРНИП 319631300162170), далее именуемый "Исполнитель", с другой стороны, в
                        дальнейшем совместно именуемые "Стороны", составили настоящий акт о нижеследующем:
                        Исполнитель оказал, а Заказчик принял оказанные консультационные услуги по финансовым вопросам.
                        Услуги по Договору возмезднго оказания услуг б/н от {$contract->inssuance_date|date} оказаны в полном объеме. Стороны
                        претензий друг к другу не имеют.
                    </td>
                </tr>
                <tr>
                    <td width="100%" align="center">
                        <strong style="font-size:8px;">
                            <br />
                            Адреса и банковские реквизиты сторон                    
                        </strong>
                         <br />
                    </td>
                </tr>
                <tr>
                    <td width="100%" align="left">
                        <br />
                        {$user->lastname|escape} {$user->firstname|escape} {$user->patronymic|escape}
                        <br />
                        Паспорт: {$user->passport_serial|escape} выдан {$user->passport_issued} от {$user->passport_date}, 
                        <br />
                        Адрес регистрации:
                        {$user->Regindex}, 
                        {$user->Regregion} {$user->Regregion_shorttype}
                        {if $user->Regdistrict}, {$user->Regdistrict} {$user->Regdistrict_shorttype}, {/if}
                        {if $user->Regcity}, {$user->Regcity} {$user->Regcity_shorttype}{/if}
                        {if $user->Reglocality}, {$user->Reglocality} {$user->Regcity_shorttype}{/if}
                        {if $user->Regstreet}, {$user->Regstreet} {$user->Regstreet_shorttype} {/if}
                        {if $user->Regbuilding}, д. {$user->Regbuilding}{/if}
                        {if $user->Reghousing}, стр. {$user->Reghousing}{/if}
                        {if $user->Regroom}, кв. {$user->Regroom}{/if}
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
            		<td colspan=6 height="17" align="left" valign=bottom><font color="#000000">_______________ / ________________________</font></td>
            		<td align="left" valign=bottom><font color="#000000"><br></font></td>
            		<td colspan=6 align="left" valign=bottom><font color="#000000">________________________ &#1044;.&#1057;. &#1045;&#1078;&#1086;&#1074;</font></td>
           		</tr>                
            </table>
        </td>
    </tr>
    
</table>






