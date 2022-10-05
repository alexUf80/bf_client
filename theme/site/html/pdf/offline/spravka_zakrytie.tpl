<table width="535px">
    <tr>
        <td height="755px">
            <table>
                <tr>
                    <td width="60%" align="center">
                        <strong style="font-size:9px">{$organization->full_name|escape}</strong>
                        <br />
                        <p style="font-size:7px">
                            ОГРН {$organization->ogrn|escape}
                            ИНН {$organization->inn|escape}
                            <br />
                            Рег. номер записи в гос. реестре МФО {$organization->reg_number|escape}
                            <br />
                            Юр. адрес: {$organization->yur_address|escape}
                            Факт. адрес: {$organization->fakt_address|escape}
                        </p>
                    </td>
                    <td width="40%" align="center">
                        <br /><br /><br />
                        <strong>Для предоставления по <br />месту требования</strong>
                    </td>
                </tr>                
                <tr>
                    <td width="100%" align="center">
                        <br /><br /><br />
                        <strong style="font-size:10px;">СПРАВКА</strong>
                    </td>
                </tr>
                
                <tr>
                    <td width="100%" align="left" style="font-size:7px;">
                        <p>
                            Настоящим сообщаем, что по состоянию на {$contract->close_date|date}
                            задолженность по договору займа от {$contract->inssuance_date|date} No {$contract->number}, заключенному
                            между {$user->lastname|escape} {$user->firstname|escape} {$user->patronymic|escape} {$user->birth|escape} г.р. 
                            и {$organization->full_name|escape} отсутствует. Договор займа закрыт.
                        </p>
                    </td>
                </tr>            
                <tr>
                    <td width="50%" align="center" style="font-size:7px;">
                        <br /><br /><br />
                        Кредитный специалист
                        <br />
                        (доверенность от No)
                    </td>
                    <td width="50%" align="center" style="font-size:7px;">
                        <br /><br /><br />
                        {$manager->name|escape}
                    </td>
                </tr>
            
            </table>
        </td>
    </tr>   
    
</table>