<table style="font-size:7px" width="530" cellspacing="0" cellpadding="2" border="1">
    
        <tr>
            <td colspan="5" align="center">
                <strong>1.ПЕРСОНАЛЬНЫЕ ДАННЫЕ</strong>
            </td>
        </tr>
    
    
        <tr>
            <td width="10%">
                1.1.
            </td>
            <td width="45%">Фамилия</td>
            <td valign="middle" width="45%">{$user->lastname|escape}</td>
        </tr>
    
    
        <tr>
            <td >
                1.2.
            </td>
            <td >Имя</td>
            <td >{$user->firstname|escape}</td>
        </tr>
    
    
        <tr>
            <td >
                1.3.
            </td>
            <td >Отчество</td>
            <td >{$user->patronymic|escape}</td>
        </tr>
    
    
        <tr>
            <td >
                1.4.
            </td>
            <td colspan="2" width="45%">Пол</td>
            <td colspan="2" width="45%">{if $user->gender == 'male'}мужской{elseif $user->gender == 'female'}женский{/if}</td>
        </tr>
    
    
        <tr>
            <td >
                1.5.
            </td>
            <td colspan="2" width="45%">Гражданство</td>
            <td colspan="2" width="45%">Российская Федерация</td>
        </tr>
    
    
        <tr>
            <td >
                1.6.
            </td>
            <td colspan="2" width="45%">Место рождения</td>
            <td colspan="2" width="45%">{$user->birth_place|escape}</td>
        </tr>
    
    
        <tr>
            <td >
                1.7.
            </td>
            <td colspan="2" width="45%">Дата рождения</td>
            <td colspan="2" width="45%">{if $user->birth}{$user->birth|date}{/if}</td>
        </tr>
    
    
        <tr>
            <td >
                1.8.
            </td>
            <td colspan="2" width="45%">Девичья фамилия матери</td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                1.9.
            </td>
            <td colspan="2" width="45%">Семейный статус</td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                1.10.
            </td>
            <td colspan="2" width="45%">Количество иждевенцев</td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                1.11.
            </td>
            <td colspan="2" width="45%">Образование</td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                1.12.
            </td>
            <td colspan="2" width="45%">ИНН</td>
            <td colspan="2" width="45%">{$user->inn|escape}</td>
        </tr>
    
    
        <tr>
            <td >
                1.13.
            </td>
            <td colspan="2" width="45%">Email</td>
            <td colspan="2" width="45%">{$user->email|escape}</td>
        </tr>
    
    
        <tr>
            <td >
                1.14.
            </td>
            <td colspan="2" width="45%">Кодовое слово</td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td colspan="5" align="center">
                <strong>2. ДОКУМЕНТЫ</strong>
            </td>
        </tr>
    
        <tr>
            <td colspan="5"  align="center">
                <strong>ПАСПОРТ ГРАЖДАНИНА РОССИЙСКОЙ ФЕДЕРАЦИИ</strong>
            </td>
        </tr>
    
    
        <tr>
            <td >
                2.1.
            </td>
            <td colspan="2" width="45%">
                Серия
            </td>
            <td colspan="2" width="45%">
                {$user->passport_serial|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                2.2.
            </td>
            <td colspan="2" width="45%">
                Номер
            </td>
            <td colspan="2" width="45%">
                {$user->passport_number|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                2.3.
            </td>
            <td colspan="2" width="45%">
                Дата выдачи
            </td>
            <td colspan="2" width="45%">
                {if $user->passport_date}{$user->passport_date|date}{/if}
            </td>
        </tr>
    
    
        <tr>
            <td >
                2.4.
            </td>
            <td colspan="2" width="45%">
                Кем выдан
            </td>
            <td colspan="2" width="45%">
                {$user->passport_issued|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                2.5.
            </td>
            <td colspan="2" width="45%">
                Код подразделения
            </td>
            <td colspan="2" width="45%">
                {$user->passport_code|escape}
            </td>
        </tr>
    
    
        <tr>
            <td colspan="5" align="center">
                <strong>3. АДРЕСА И КОНТАКТНАЯ ИНФОРМАЦИЯ</strong>
            </td>
        </tr>
    
    
        <tr>
            <td colspan="5" align="center">
                <strong>АДРЕС РЕГИСТРАЦИИ</strong>
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.1.
            </td>
            <td colspan="2" width="45%">
                Страна места регистрации
            </td>
            <td colspan="2" width="45%">
                Россия
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.2.
            </td>
            <td colspan="2" width="45%">
                Индекс
            </td>
            <td colspan="2" width="45%">
                {if $user->Regindex}{$user->Regindex|escape}{/if}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.3.
            </td>
            <td colspan="2" width="45%">
                Регион/Район
            </td>
            <td colspan="2" width="45%">
                {$user->Regregion|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.4.
            </td>
            <td colspan="2" width="45%">
                Город/Нас.пункт
            </td>
            <td colspan="2" width="45%">
                {$user->Regcity|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.5.
            </td>
            <td colspan="2" width="45%">
                Улица
            </td>
            <td colspan="2" width="45%">
                {$user->Regstreet|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.6.
            </td>
            <td colspan="2" width="45%">
                Дом
            </td>
            <td colspan="2" width="45%">
                {$user->Reghousing|escape}
                {if $user->Regbuilding} стр.{$user->Regbuilding|escape}{/if}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.7.
            </td>
            <td colspan="2" width="45%">
                Квартира
            </td>
            <td colspan="2" width="45%">
                {$user->Regroom|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.8.
            </td>
            <td colspan="2" width="45%">
                Телефон
            </td>
            <td colspan="2" width="45%">
                &nbsp;
            </td>
        </tr>
    
    
        <tr>
            <td colspan="5">
                <strong>АДРЕС ФАКТИЧЕСКОГО ПРОЖИВАНИЯ</strong>
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.9.
            </td>
            <td colspan="2" width="45%">
                Совпадает с регистрацией
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                3.10.
            </td>
            <td colspan="2" width="45%">
                Страна места нахождения
            </td>
            <td colspan="2" width="45%">
                Россия
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.11.
            </td>
            <td colspan="2" width="45%">
                Индекс
            </td>
            <td colspan="2" width="45%">
                {$user->Faktindex|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.12.
            </td>
            <td colspan="2" width="45%">
                Регион/Район
            </td>
            <td colspan="2" width="45%">
                {$user->Faktregion|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.13.
            </td>
            <td colspan="2" width="45%">
                Город/Нас.пункт
            </td>
            <td colspan="2" width="45%">
                {$user->Faktcity|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.14.
            </td>
            <td colspan="2" width="45%">
                Улица
            </td>
            <td colspan="2" width="45%">
                {$user->Faktstreet|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.15.
            </td>
            <td colspan="2" width="45%">
                Дом
            </td>
            <td colspan="2" width="45%">
                {$user->Fakthousing|escape}
                {if $user->Faktbuilding}, стр.{$user->Faktbuilding|escape}{/if}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.16.
            </td>
            <td colspan="2" width="45%">
                Квартира
            </td>
            <td colspan="2" width="45%">
                {$user->Faktroom|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.17.
            </td>
            <td colspan="2" width="45%">
                Телефон
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                3.18.
            </td>
            <td colspan="2" width="45%">
                Мобильный телефон
            </td>
            <td colspan="2" width="45%">
                {$user->phone_mobile|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                3.19.
            </td>
            <td colspan="2" width="45%">
                Тип собственности
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                3.20.
            </td>
            <td colspan="2" width="45%">
                Проживание (лет)
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                3.21.
            </td>
            <td colspan="2" width="45%">
                Проживание (Месяцев)
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td colspan="5" align="center">
                <strong>КОНТАКНЫЕ ЛИЦА</strong>
                <strong>(не заявитель, можно родственники, но телефоны не должны совпадать с ранее
                        указанными)</strong>
            </td>
        </tr>
    
        <tr>
            <td colspan="5" align="center">
                <strong>4. ДОХОДЫ</strong>
            </td>
        </tr>
    
    
        <tr>
            <td colspan="5" align="center">
                <strong>ПОСТОЯННАЯ ТЕКУЩАЯ ЗАНЯТОСТЬ</strong>
            </td>
        </tr>
    
    
        <tr>
            <td >
                4.1.
            </td>
            <td colspan="2" width="45%">
                Ежемесячный доход
            </td>
            <td colspan="2" width="45%">
                {$user->income|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                4.2.
            </td>
            <td colspan="2" width="45%">
                Название организации
            </td>
            <td colspan="2" width="45%">
                {$user->workplace|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                4.3.
            </td>
            <td colspan="2" width="45%">
                Адрес организации
            </td>
            <td colspan="2" width="45%">
                {$user->workaddress|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                4.4.
            </td>
            <td colspan="2" width="45%">
                График занятости
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                4.5.
            </td>
            <td colspan="2" width="45%">
                Должность
            </td>
            <td colspan="2" width="45%">
                {$user->profession|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                4.6.
            </td>
            <td colspan="2" width="45%">
                Стаж работы (лет)
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                4.7.
            </td>
            <td colspan="2" width="45%">
                Стаж работы (месяцев)
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                4.8.
            </td>
            <td colspan="2" width="45%">
                Сфера деятельности
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                4.9.
            </td>
            <td colspan="2" width="45%">
                Штат
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                4.10.
            </td>
            <td colspan="2" width="45%">
                ФИО руководителя
            </td>
            <td colspan="2" width="45%">
                {$user->chief_name|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                4.11.
            </td>
            <td colspan="2" width="45%">
                Телефон руководителя
            </td>
            <td colspan="2" width="45%">
                {$user->chief_phone|escape}
            </td>
        </tr>
    
    
        <tr>
            <td >
                4.12.
            </td>
            <td colspan="2" width="45%">
                Телефон организации
            </td>
            <td colspan="2" width="45%">
                {$user->workphone|escape}
            </td>
        </tr>
    
    
        <tr>
            <td colspan="5" align="center">
                <strong>ЛИЧНЫЕ РАСХОДЫ</strong>
                <strong>(ежемесячные обязательные выплаты по кредитам, алименты, коммунальные платежи</strong>
            </td>
        </tr>
    
    
        <tr>
            <td >
                4.13.
            </td>
            <td colspan="2" width="45%">
                Наличие просроченных задолженностей
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                4.14.
            </td>
            <td colspan="2" width="45%">
                Уточнение
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                4.15.
            </td>
            <td colspan="2" width="45%">
                Сумма расходов
            </td>
            <td colspan="2" width="45%">
                {$user->expenses|escape}
            </td>
        </tr>
    
    
        <tr>
            <td colspan="5" align="center">
                <strong>ДОПОЛНИТЕЛЬНЫЙ ДОХОД</strong>
            </td>
        </tr>
    
    
        <tr>
            <td >
                4.16.
            </td>
            <td colspan="2" width="45%">
                Тип дополнительного дохода
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                4.17.
            </td>
            <td colspan="2" width="45%">
                Сумма дополнительного дохода
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td colspan="5"  align="center">
                <strong>СОБСТВЕННОСТЬ (если есть)</strong>
            </td>
        </tr>
    
    
        <tr>
            <td >
                4.18.
            </td>
            <td colspan="2" width="45%">
                Марка автомобиля
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                4.19.
            </td>
            <td colspan="2" width="45%">
                Номер автомобиля
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                4.20.
            </td>
            <td colspan="2" width="45%">
                Адрес
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td >
                
            </td>
            <td colspan="2" width="45%">
                Желаемая сумма займа
            </td>
            <td colspan="2" width="45%">{$order->amount}</td>
        </tr>
    
        <tr>
            <td >
                4.21.
            </td>
            <td colspan="2" width="45%">
                Цели получения займа
            </td>
            <td colspan="2" width="45%">&nbsp;</td>
        </tr>
    
    
        <tr>
            <td colspan="3" width="55%">
   Относитесь ли Вы к должностным лицам публичных международных организаций, к лицам замещающим (занимающим) государственные должности Российской Федерации, должности членов Совета директоров Центрального банка Российской Федерации, должности федеральной государственной службы, назначение на которые и освобождение от которых осуществляются Президентом Российской Федерации или Правительством Российской Федерации, должности в Центральном банке Российской Федерации, государственных корпорациях и иных организациях, созданных российской Федерацией на основании федеральных законов, включенные в перечни должностей, определяемые Президентом Российской Федерации?		            </td>
            <td colspan="2" width="45%">
                &nbsp;
                <table cellpadding="0" style="border-collapse: collapse; width: 90%; height: 54px;" border="0">
                    
                        <tr style="">
                            <td style="width: 60%; ">&nbsp;</td>
                            <td style="">&nbsp;</td>
                        </tr>
                        <tr style="">
                            <td style="width: 60%; ">Да</td>
                            <td style=""> 
                                <table border="1" width="10" align="center"><tr><td>&nbsp;</td></tr></table>
                            </td>
                        </tr>
                        <tr style="">
                            <td style="width: 60%; ">&nbsp;</td>
                            <td style="">&nbsp;</td>
                        </tr>
                        <tr style="">
                            <td style="width: 60%; ">Нет</td>
                            <td style="">
                                <table border="1" width="10" align="center"><tr><td>X</td></tr></table>
                            </td>
                        </tr>
                    
                </table>
            </td>
        </tr>
    
    
        <tr>
            <td colspan="3" width="55%">
               Является ли Вы супругом/супругой, либо состоите ли Вы в родстве с лицом, являющимся иностранным публичным должностным лицом или занимающим вышеуказанные должности?		
            </td>
            <td colspan="2" width="45%">
                <table style="border-collapse: collapse; width: 90%; height: 54px;" border="0">
                    
                        <tr style="">
                            <td style="width: 60%; ">&nbsp;</td>
                            <td style="">&nbsp;</td>
                        </tr>
                        <tr style="">
                            <td style="width: 60%; ">Да</td>
                            <td style=""> 
                                <table border="1" width="10" align="center"><tr><td>&nbsp;</td></tr></table>
                            </td>
                        </tr>
                        <tr style="">
                            <td style="width: 60%; ">&nbsp;</td>
                            <td style="">&nbsp;</td>
                        </tr>
                        <tr style="">
                            <td style="width: 60%; ">Нет</td>
                            <td style="">
                                <table border="1" width="10" align="center"><tr><td>X</td></tr></table>
                            </td>
                        </tr>
                    
                </table>
            </td>
        </tr>
    
        <tr>
            <td colspan="5">
                <br />
                Подписав, настоящее заявление я:
                1. Подтверждаю, что сведения, содержащиеся в настоящей анкете-заявлении, являются  верными и точными.
                2.Даю согласие ООО ""МКК ""НА ЛИЧНОЕ"", расположенное по адресу: 443093, Самарская обл, Самара г, Мориса Тореза ул, дом № 1А, оф.10 (Далее по тексту - Общество) на обработку моих персональных данных Ф.И.О; пол; дата рождения; место рождения; реквизиты документа, удостоверяющего личность (паспорт/иной документ), адрес постоянное регистрации и фактического проживания, идентификационной номер налогоплательщика (ИНН); СНИЛС; информация о семейном, социальном, имущественном отношении; контактная информация; данные о профессии, образовании и доходах, фотография, предоставленные Обществу,  включая сбор, запись, систематизацию, накопление, хранение, уточнение (обновление, изменение), извлечение, использование, блокирование, удаление, уничтожение передачу (предоставление, доступ) с целью продвижения своих услуг (реклама), информирования меня о необходимости предоставить документы, о действующих договорах займа, заключения и исполнения договора потребительского займа. Обработка персональных данных производиться Обществом с использованием средств автоматизации (автоматизированная обработка) и без использования таковых (неавтоматизированная обработка).
                Настоящее согласие предоставлено на 5 лет и может быть отозвано  мной путем направления мною соответствующего уведомления. Я  уведомлен о том, что Обществ вправе продолжить обработку моих персональных данных без моего согласия в случаях, предусмотренных действующим законодательством.
                3. Даю согласие на запрос и получение Обществом из любого бюро кредитных историй кредитного отчета, содержащего в том числе основную часть кредитной истории, определенную в ст. 4 Федерального закона от 30.12.2004 г. № 218-ФЗ ""О кредитных  историях"", в целях заключения и исполнения Договора потребительского займа, в том числе оценки кредитоспособности, расчета показателя долговой нагрузки.
                4. Понимаю, что Общество имеет права не информировать меня о причинах отказа в предоставлении займа.
            </td>
        </tr>    
        
        <tr>
            <td colspan="5">
                <br />
                <br />
                Заявитель {$user->lastname|escape} {$user->firstname|escape} {$user->patronymic|escape}
                <br />
                <br />
                {$order->date|date} г.		            
                <br />
                <br />
            </td>
        </tr>
</table>