<div>

</div>
<table align="center">
    <tr>
        <td width="25%"></td>
        <td width="60%"><strong>ДОПОЛНИТЕЛЬНОЕ СОГЛАШЕНИЕ</strong></td>
        <td width="10%"></td>
    </tr>
    <tr>
        <td width="25%"></td>
        <td width="60%"><strong>No1/0003231-1 К ДОГОВОРУ ПОТРЕБИТЕЛЬСКОГО</strong></td>
        <td width="10%"></td>
    </tr>
    <tr>
        <td width="25%"></td>
        <td width="60%"><strong>ЗАЙМА</strong></td>
        <td width="10%"></td>
    </tr>
    <tr>
        <td width="25%"></td>
        <td width="60%"><strong>No {$contract->number} от {$contract->inssuance_date|date}</strong></td>
        <td width="10%"></td>
    </tr>
</table>
<div>
    <br>
</div>
<table>
    <tr>
        <td width="20%"><strong>{$created|date}</strong></td>
        <td width="60%"></td>
        <td width="20%"><strong>Г. АРХАНГЕЛЬСК</strong></td>
    </tr>
</table>
<div>

</div>
<table border="1">
    <tr style="width: 100%;">
        <td style="width: 28%;">
            <img src="{$config->root_dir}/theme/site/html/pdf/i/contract_qr.jpg" width="250">
        </td>
        <td style="width: 36%" align="center">
            <div>ПОЛНАЯ СТОИМОСТЬ ЗАЙМА
                СОСТАВЛЯЕТ 365,000 ТРИСТА
                ШЕСТЬДЕСЯТ ПЯТЬ ЦЕЛЫХ НОЛЬ
                ТЫСЯЧНЫХ ПРОЦЕНТА ГОДОВЫХ
            </div>
        </td>
        <td style="width: 36%;" align="center">
            <div>ПОЛНАЯ СТОИМОСТЬ ЗАЙМА
                СОСТАВЛЯЕТ {$return_amount_percents} РУБЛЕЙ 00 КОПЕЕК
                ({$return_amount_percents|price_string|upper})
            </div>
        </td>
    </tr>
</table>
<div>

</div>
<div align="justify">ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ МИКРОКРЕДИТНАЯ КОМПАНИЯ "БАРЕНЦ ФИНАНС", именуемое в
    дальнейшем "Займодавец",
    в лице генерального директора Кройтор Виктории Викторовны, действующего (ей) на основании Устава, с одной стороны, и
    {$lastname|upper} {$firstname|upper} {$patronymic|upper},
    паспорт {$passport_serial} выдан {$passport_issued|upper} {$passport_date|date}
    года, код подразделения {$subdivision_code}, именуемый в дальнейшем Заемщик, зарегистрированный(-ая) по
    адресу: {$regaddress_full}, с другой стороны, заключили настоящий договор о нижеследующем:
</div>
<div align="justify">По договору потребительского кредита (займа), срок возврата потребительского кредита (займа) по
    которому на
    момент его заключения не превышает одного года, не допускается начисление процентов, неустойки (штрафа, пени), иных
    мер ответственности по договору потребительского кредита (займа), а также платежей за услуги, оказываемые кредитором
    заемщику за отдельную плату по договору потребительского кредита (займа), после того, как сумма начисленных
    процентов, неустойки (штрафа, пени), иных мер ответственности по договору потребительского кредита (займа), а также
    платежей за услуги, оказываемые кредитором заемщику за отдельную плату по договору потребительского кредита (займа)
    (далее - фиксируемая сумма платежей), достигнет полуторакратного размера суммы предоставленного потребительского
    кредита (займа)
</div>
<div align="justify">После возникновения просрочки исполнения обязательства заемщика по возврату суммы займа и (или)
    уплате
    причитающихся процентов микрофинансовой организации по договору потребительского кредита (займа), срок возврата
    потребительского кредита (займа) по которому не превышает один год, вправе начислять заемщику - физическому лицу
    неустойку (штрафы, пени) и иные меры ответственности только на не погашенную заемщиком часть суммы основного
    долга.
</div>
<div>

</div>
<table border="1" cellpadding="5">
    <thead>
    <tr align="center">
        <th width="100%"><strong>Индивидуальные условия договора потребительского кредита (займа)</strong></th>
    </tr>
    <tr align="center">
        <th width="10%">No П/П</th>
        <th width="40%">Условие</th>
        <th width="50%">Содержание условия</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td align="center" width="10%">1.</td>
        <td width="40%">Сумма кредита (займа) или лимит кредитования
            и порядок его изменения
        </td>
        <td width="50%">Сумма займа составляет {$amount|upper} ({$amount|price_string|upper}). Лимит кредитования
            - не применимо.
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">2.</td>
        <td width="40%">Срок действия договора, срок возврата кредита
            (займа)
        </td>
        <td width="50%">с {$contract->issuance_date|date} г. по {$contract->return_date|date} г.
            Договор действует со дня предоставления заемщику суммы займа и до полного
            исполнения заемщиком своих обязательств по договору
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">3.</td>
        <td width="40%">Валюта, в которой предоставляется кредит
            (заем)
        </td>
        <td width="50%">Рубль</td>
    </tr>
    <tr>
        <td align="center" width="10%">4.</td>
        <td width="40%">Процентная ставка (процентные ставки) в
            процентах годовых, а при применении
            переменной процентной ставки - порядок ее
            определения, соответствующий требованиям
            Федерального закона от 21 декабря 2013 года N
            353-ФЗ "О потребительском кредите (займе)",
            ее значение на дату предоставления заемщику
            индивидуальных условий
        </td>
        <td width="50%">365% (Триста шестьдесят пять процентов) годовых (1% (Один процент) в день)</td>
    </tr>
    <tr>
        <td align="center" width="10%">5.</td>
        <td width="40%">Порядок определения курса иностранной
            валюты при переводе денежных средств
            кредитором третьему лицу, указанному
            заемщиком
        </td>
        <td width="50%">Не применимо</td>
    </tr>
    <tr>
        <td align="center" width="10%">5.1</td>
        <td width="40%">Указание на изменение суммы
            расходов заемщика при увеличении
            используемой в договоре переменной
            процентной ставки потребительского
            кредита (займа) на один процентный
            пункт начиная со второго очередного
            платежа на ближайшую дату после
            предполагаемой даты заключения
            договора
        </td>
        <td width="50%">Отсутствует</td>
    </tr>
    <tr>
        <td align="center" width="10%">6.</td>
        <td width="40%">Количество, размер и периодичность (сроки)
            платежей заемщика по договору или порядок
            определения этих платежей
        </td>
        <td width="50%">Единовременно в конце срока предоставления займа — {$contract->insurance->end_date|date} заемщик
            осуществляет платеж в размере {$return_amount} рублей , включающий в себя погашение
            суммы займа в размере {$amount} рублей, и погашение процентов в размере {$return_amount_percents}
            рублей, начисленных со дня, следующего за днем предоставления займа.
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">7.</td>
        <td width="40%">Порядок изменения количества, размера и
            периодичности (сроков) платежей заемщика при
            частичном досрочном возврате кредита (займа)
        </td>
        <td width="50%">Заемщик вправе осуществить досрочное полное исполнение обязательств по
            возврату суммы в любой день до наступления даты, указанной в пункте 2
            индивидуальных условий, уплатив при этом проценты за пользование займом в
            размере, предусмотренном в пункте 4 индивидуальных условий, начисленные
            Займодавцем до дня фактического возврата займа (включительно).
            При частичном досрочном возврате займа количество и периодичность (сроков)
            платежей по договору займа не меняется.Размер платежа уменьшается
            (пропорционально) на сумму уплаченных процентов и (или) уплаченную сумму
            основного долга
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">8.</td>
        <td width="40%">Способы исполнения заемщиком обязательств
            по договору по месту нахождения заемщика
        </td>
        <td width="50%">- Путем перевода денежных средств платежными картами VISA, MasterCard, МИР на
            сайте Займодавца www. barents-finans.ru<br>- Путем перечисления денежных средств на расчетный счет Кредитора
            по реквизитам: ООО МКК "БАРЕНЦ ФИНАНС"
            Юр. адрес 163045, г. Архангельск,
            пр. К.С. Бадигина д.19, оф.107
            ИНН 9723120835
            КПП 290101001
            ОГРН 1217700350812
            Банк: ТОЧКА ПАО БАНКА "ФК ОТКРЫТИЕ"
            р\с 40701810702500001111
            к\с 30101810845250000999
            БИК 044525999
            Назначение платежа: оплата по договору займа № от {$contract->inssuance_date|date} {$lastname|upper} {$firstname|upper} {$patronymic|upper}<br>- Путем совершения платежа с
            использованием интернет-банка Сбербанка Онлайн,
            мобильного приложения Сбербанк Онлайн или внесения наличных денежных
            средств с помощью устройства самообслуживания Сбербанка.
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">8.1</td>
        <td width="40%">Бесплатный способ исполнения заемщиком
            обязательств по договору
        </td>
        <td width="50%">- перевод денежных средств платежными картами VISA, MasterCard, МИР на сайте
            Кредитора www. barents-finans
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">9.</td>
        <td width="40%">Обязанность заемщика заключать иные
            договоры
        </td>
        <td width="50%">Не применимо</td>
    </tr>
    <tr>
        <td align="center" width="10%">10.</td>
        <td width="40%">Обязанность заемщика по предоставлению
            обеспечения исполнения обязательств по
            договору и требования к такому обеспечению
        </td>
        <td width="50%">Не применимо</td>
    </tr>
    <tr>
        <td align="center" width="10%">11.</td>
        <td width="40%">Цели использования заемщиком
            потребительского кредита (займа)
        </td>
        <td width="50%">Не применимо</td>
    </tr>
    <tr>
        <td align="center" width="10%">12.</td>
        <td width="40%">Ответственность заемщика за ненадлежащее
            исполнение условий договора, размер
            неустойки (штрафа, пени) или порядок их
            определения
        </td>
        <td width="50%">За неисполнение или ненадлежащее исполнение заемщиком обязательств по
            возврату займа и уплате процентов,
            на непогашенную часть суммы просроченной задолженности начисляется
            неустойка в размере 0,05 (Ноль целых пять сотых)% за каждый день нарушения
            обязательств с учетом существующих ограничений максимальной суммы
            начислений.
            Уплата неустойки (штрафа, пени) не освобождает Заемщика от выплаты
            процентов.
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">13.</td>
        <td width="40%">Условие об уступке кредитором третьим лицам
            прав (требований) по договору
        </td>
        <td width="50%">Кредитор вправе осуществлять уступку прав (требований) по договору
            потребительского кредита (займа) только юридическому лицу, осуществляющему
            профессиональную деятельность по предоставлению потребительских займов,
            юридическому лицу, осуществляющему деятельность по возврату просроченной
            задолженности физических лиц в качестве основного вида деятельности,
            специализированному финансовому обществу или физическому лицу, указанному в
            письменном согласии заемщика, полученном кредитором после возникновения у
            заемщика просроченной задолженности по договору потребительского кредита
            (займа), если запрет на осуществление уступки не предусмотрен федеральным
            законом или договором, содержащим условие о запрете уступки, согласованное
            при его заключении в порядке, установленном Федеральным законом от
            27.12.2018 N 554-ФЗ.<br><br>&#x2611; Да <br>&#x2611; Нет
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">14.</td>
        <td width="40%">Согласие заемщика с общими условиями
            договора
        </td>
        <td width="50%">Общие условия договора займа являются неотъемлемой частью договора.<br>С общими условиями
            договора займа ознакомлен и согласен<br><br>Подписано Аналогом собственноручной подписи (АСП):<br><br>Идентификатор
            клиента:<br><br>Дата :<br><br>Время :
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">15.</td>
        <td width="40%">Услуги, оказываемые кредитором заемщику за
            отдельную плату и необходимые для
            заключения договора, их цена или порядок ее
            определения, а также согласие заемщика на
            оказание таких услуг
        </td>
        <td width="50%">Не применимо
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">16.</td>
        <td width="40%">Способ обмена информацией между кредитором
            и заемщиком
        </td>
        <td width="50%">Информационное взаимодействие между займодавцем и заемщиком организуется
            посредством:<br>Со стороны Заемщика:<br>-направления писем на адрес: 163045, г. Архангельск, ул. Бадигина,
            д. 19, оф.
            107.<br>-голосовых звонков на номер: 88001018283<br>-сообщений по e-mail на электронный ящик:
            info@mkkbf.ru<br>
            Со стороны Займодавца:<br>-направления писем на адрес: {$regaddress_full}<br>-голосовых звонков и SMS сообщений на номер: {$phone_mobile}
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">17.</td>
        <td width="40%">Порядок извещения об изменении контактной
            информации Заемщика.
        </td>
        <td width="50%">Заемщик обязан в письменной форме уведомить займодавца об изменении
            контактной информации, используемой для связи с ним, в течении 2-х дней с
            момента изменения указанных данных.
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">18.</td>
        <td width="40%">Прочие условия
        </td>
        <td width="50%">Договор заключен в 2 (двух) экземплярах, имеющих равную юридическую силу, по
            одному для каждой сторон. Стороны пришли к соглашению об использовании
            Кредитором факсимильного воспроизведения подписи с помощью средств
            механического или иного копирования, электронно-цифровой подписи либо
            аналога собственноручной подписи.
        </td>
    </tr>
    </tbody>
</table>
<div>

</div>
<table align="center">
    <tr>
        <td width="20%"></td>
        <td width="60%"><strong>АДРЕСА И РЕКВИЗИТЫ СТОРОН</strong></td>
        <td width="10%"></td>
    </tr>
</table>
<div>

</div>
<table>
    <tr>
        <td width="50%"><u>ЗАЙМОДАВЕЦ</u></td>
        <td width="50%"><u>ЗАЕМЩИК</u></td>
    </tr>
    <tr>
        <td width="50%"></td>
        <td width="50%"></td>
    </tr>
    <tr>
        <td width="50%">ООО МКК "БАРЕНЦ ФИНАНС"</td>
        <td width="50%">{$lastname|upper} {$firstname|upper} {$patronymic|upper}</td>
    </tr>
    <tr>
        <td width="50%">Юр. адрес: 163045, Архангельская обл., г. Архангельск,
            пр-д. К.С. Бадигина, д.19, оф. 107.
        </td>
        <td width="50%">Паспорт гражданина РФ: {$passport_serial}</td>
    </tr>
    <tr>
        <td width="50%">ИНН 9723120835</td>
        <td width="50%">Кем выдан: {$passport_issued|upper}
        </td>
    </tr>
    <tr>
        <td width="50%">КПП 290101001</td>
        <td width="50%">Дата выдачи: {$passport_date|date} код подр.: {$subdivision_code}</td>
    </tr>
    <tr>
        <td width="50%">ОГРН 1217700350812
        </td>
        <td width="50%">Дата рождения: {$birth|date}</td>
    </tr>
    <tr>
        <td width="50%">Банк: ПАО "ФК ОТКРЫТИЕ"</td>
        <td width="50%">Место рождения: {$birth_place}</td>
    </tr>
    <tr>
        <td width="50%">р\с 40701810607200000018</td>
        <td width="50%">Адрес регистрации: {$regaddress_full}
        </td>
    </tr>
    <tr>
        <td width="50%">к\с 30101810540300000795</td>
        <td width="50%">СНИЛС: {$snils}</td>
    </tr>
    <tr>
        <td width="50%">БИК 044030795</td>
        <td width="50%">Банковская карта: {$active_card}</td>
    </tr>
</table>
<div>

</div>
<table style="width: 50%">
    <tr>
        <td><strong>Кредитор</strong></td>
        <td>Кройтор В.В</td>
    </tr>
</table>
<table>
    <tr>
        <td></td>
        <td>
            <table border="1" cellpadding="4">
                <tr>
                    <td>Подписано Аналогом собственноручной подписи (АСП)<br>Идентификатор клиента: {$contract->user_id}
                        <br>Дата: {$created|date}
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>