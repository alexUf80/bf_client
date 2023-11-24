<div>

</div>
<table align="center">
    <tr>
        <td width="100%" align="center"><strong>ИНДИВИДУАЛЬНЫЕ УСЛОВИЯ ДОГОВОРА ПОТРЕБИТЕЛЬСКОГО МИКРОЗАЙМА
                № {$contract->number}</strong></td>
    </tr>
</table>
<div>
    <br>
</div>
<table>
    <tr>
        <td width="20%"><strong>{$contract->inssuance_date|date}</strong></td>
        <td width="60%"></td>
        <td width="20%"><strong>Г. АРХАНГЕЛЬСК</strong></td>
    </tr>
</table>
<div>

</div>
<table border="1">
    <tr style="width: 100%;">
        <td style="width: 28%;">
            <img src="{$config->root_dir}/theme/site/html/pdf/i/qr-code.gif" width="250">
        </td>
        <td style="width: 36%" align="center">
            <div>ПОЛНАЯ СТОИМОСТЬ ЗАЙМА:
                {$base_percent*365}%
                ({($base_percent*365)|percent_string|upper}) ПРОЦЕНТОВ ГОДОВЫХ
            </div>
        </td>
        <td style="width: 36%;" align="center">
            <div>ПОЛНАЯ СТОИМОСТЬ ЗАЙМА:
                {$return_amount_percents} РУБЛЕЙ 00 КОПЕЕК
                {$return_amount_percents|price_string|upper}
            </div>
        </td>
    </tr>
</table>
<div>

</div>
<div align="justify">Общество с ограниченной ответственностью
    Микрокредитная компания «БАРЕНЦ ФИНАНС»,
    ОГРН 1217700350812, зарегистрированное в
    реестре микрофинансовых организаций
    02.09.2021 года за № 2103045009732, именуемое в дальнейшем Займодавец (Кредитор), в лице Генерального директора
    Кройтор Виктории
    Викторовны, действующего на основании Устава, с одной стороны, и гр.
    РФ {$lastname|upper} {$firstname|upper} {$patronymic|upper},
    паспорт {$passport_serial} выдан {$passport_issued|upper} {$passport_date|date}
    года, код подразделения {$subdivision_code}, именуемый в дальнейшем Заемщик, зарегистрированный(-ая) по
    адресу: {$regaddress_full}, с другой стороны, далее вместе именуемые Стороны, заключили настоящий Договор о
    нижеследующем:
</div>
<div align="justify">- Займодавец предоставляет Заемщику денежные средства в размере {($contract->amount + $insurance_cost)|upper}
    ({($contract->amount + $insurance_cost)|price_string|upper}), а Заемщик обязуется
    возвратить Займодавцу сумму займа и уплатить проценты на нее в срок, указанный в п. 2 настоящего Договора.
    В случае если по настоящему Договору срок возврата потребительского кредита (займа) на момент его заключения не
    превышает одного
    года:
</div>
<div align="justify">- Не допускается начисление процентов, неустойки (штрафа, пени), иных мер ответственности по
    Договору, а также платежей за услуги,
    оказываемые Кредитором Заемщику за отдельную плату по Договору, после того, как сумма начисленных процентов,
    неустойки (штрафа,
    пени), иных мер ответственности по Договору, а также платежей за услуги, оказываемые Кредитором Заемщику за
    отдельную плату по
    Договору, достигнет полуторакратного размера суммы предоставленного потребительского кредита (займа);
</div>
<div align="justify">- После возникновения просрочки исполнения обязательства Заемщика по возврату суммы займа и (или)
    уплате причитающихся
    процентов Кредитор вправе начислять Заемщику неустойку (штрафы, пени) и иные меры ответственности только на не
    погашенную
    Заемщиком часть суммы основного долга
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
        <td width="50%">Сумма займа составляет {($contract->amount + $insurance_cost)|upper} ({($contract->amount + $insurance_cost)|price_string|upper}). Лимит
            кредитования
            - не применимо.
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">2.</td>
        <td width="40%">Срок действия договора, срок возврата кредита
            (займа)
        </td>
        <td width="50%">с {$contract->inssuance_date|date} г. по {$contract->end_date|date} г.
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
        <td width="50%">{$base_percent*365}%
            ({($base_percent*365)|percent_string} процентов) годовых ({$base_percent}% ({$base_percent|percent_string}) в день)</td>
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
        <td width="50%">Единовременно в конце срока предоставления займа — {$contract->return_date|date} заемщик
            осуществляет платеж в размере {$return_amount_percents + $contract->amount + $insurance_cost} рублей , включающий в себя погашение
            суммы займа в размере {$contract->amount + $insurance_cost} рублей, и погашение процентов в размере {$return_amount_percents}
            рублей,
            начисленных со дня, следующего за днем предоставления займа.
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
        <td width="40%">Погашение задолженности по займу осуществляется следующими способами:
        </td>
        <td width="50%">1.Путем перевода денежных средств платежными картами VISA, MasterCard, МИР на сайте Займодавца
            www.
            barents-finans.ru.<br>
            2.Путем перечисления денежных средств на расчетный счет Кредитора по реквизитам: р/с 40701810702500001111,
             наименование банка ООО «Банк Точка» , к/с 30101810745374525104,
            ИНН 9723120835, БИК 044525104. Получатель: ООО МКК «Баренц Финанс»
            Назначение платежа: оплата по договору займа № {$contract->number}
            от {$contract->inssuance_date|date} {$lastname|upper} {$firstname|upper} {$patronymic|upper}<br>
            3.Путем совершения платежа с использованием интернет-банка Сбербанка Онлайн, мобильного приложения Сбербанк
            Онлайн или внесения наличных денежных средств с помощью устройства самообслуживания Сбербанка.<br>
            4. Путем совершения почтовых переводов денежных средств физических лиц в адрес Займодавца с применением
            технологии электронной пересылки переводов в Единой системе почтовых переводов АО «Почта России». Перевод в
            адрес Федерального клиента № 37332.<br>
            Я предоставляю Кредитору акцепт (заранее данный акцепт) на списание денежных средств с моей банковской
            карты, которая использована мною при получении займа, без дополнительного распоряжения в счет погашения
            задолженности по Договору займа, а также в случае ошибочного зачисления Кредитором денежных средств на мою
            банковскую карту, данные операции не могут быть мною оспорены.
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">8.1</td>
        <td width="40%">Бесплатный способ исполнения заемщиком
            обязательств по договору
        </td>
        <td width="50%">Почтовый перевод денежных средств физическим лицом в адрес Займодавца с применением технологии
            электронной пересылки переводов в Единой системе почтовых переводов АО «Почта России». Перевод в адрес
            Федерального клиента ООО МКК «Баренц Финанс» № 37332.
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
        <td width="50%">Заемщик согласен на возможность уступки Кредитором третьим лицам прав
            (требований) по договору: <br><br>X Да <br> Нет
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">14.</td>
        <td width="40%">Согласие заемщика с общими условиями
            договора
        </td>
        <td width="50%">X Согласен <br> Не согласен
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">15.</td>
        <td width="40%">Услуги, оказываемые кредитором заемщику за
            отдельную плату и необходимые для
            заключения договора, их цена или порядок ее
            определения, а так же согласие заемщика на
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
        <td width="50%"><strong>А. Способы обмена информацией с Кредитором:</strong><br>почтовые отправления по адресу:
            163045, г. Архангельск, ул. Бадигина, д.19,
            офис 107; электронные сообщения по адресу: info@mkkbf.ru
            <strong>Б. Способы обмена информацией с Заемщиком:</strong><br>в соответствии со сведениями, указанными
            Заемщиком лично в Заявлении на
            предоставление микрозайма - телефонные переговоры; почтовые
            отправления; электронные сообщения по адресу; SMS – сообщения (короткие
            текстовые сообщения); голосовое информирование (сообщения)
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">17.</td>
        <td width="40%">Территориальная подсудность
        </td>
        <td width="50%">Подсудность дела по исковым заявлениям и заявлениям о выдаче судебного приказа определяется в
            соответствии с требованиями действующего законодательства РФ. Споры, связанные с защитой прав потребителей
            разрешаются в порядке, установленном статьей 17 Закона РФ от 07.02.1992 №2300-1 " О защите прав потребителей
            "и иными нормативно правовыми актами"
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">18.</td>
        <td width="40%">Способ и сроки исполнения обязательств
            Кредитором
        </td>
        <td width="50%">Обязательство Кредитора по выдаче суммы кредита (займа) осуществляется
            посредством перечисления Кредитором суммы кредита (займа) на счет
            банковской карты Заемщика по следующим реквизитам: {$active_card}.
            Момент зачисления суммы кредита (займа) на счет банковской карты
            Заемщика зависит от банка-эмитента банковской карты и не может
            превышать 5 рабочих дней с момента перечисления суммы кредита (займа)
            Кредитором.
        </td>
    </tr>
    <tr>
        <td align="center" width="10%">19.</td>
        <td width="40%">Прочие условия
        </td>
        <td width="50%">Договор заключен в 2 (двух) экземплярах, имеющих равную юридическую силу, по одному для каждой
            сторон. Стороны пришли к соглашению об использовании Кредитором факсимильного воспроизведения подписи с
            помощью средств механического или иного копирования, электронно-цифровой подписи либо аналога
            собственноручной подписи.
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
        <td width="50%">Юр. адрес 163045, г. Архангельск, пр. К.С. Бадигина д.19, оф.107
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
        <td width="50%">ООО «Банк Точка»</td>
        <td width="50%">Место рождения: {$birth_place}</td>
    </tr>
    <tr>
        <td width="50%">БИК: 044 525 104</td>
        <td width="50%">Адрес регистрации: {$regaddress_full}
        </td>
    </tr>
    <tr>
        <td width="50%">Расчётный счёт: 4070 1810 7025 0000 1111</td>
        <td width="50%">СНИЛС: {$snils}</td>
    </tr>
    <tr>
        <td width="50%">Корсчёт: 3010 1810 7453 7452 5104</td>
        <td width="50%">Банковская карта: 
            {if $pan}
                {$pan}
            {else}
                {$active_card}
            {/if}
        </td>
    </tr>
</table>
<div>

</div>
<table style="width: 50%">
    <tr>
        <td><strong>Кредитор</strong></td>
        <td>Кройтор В.В</td>
    </tr>
    <tr>
        <td><img src="{$config->root_dir}/theme/site/html/pdf/i/bfSigna.png"></td>
        <td><img src="{$config->root_dir}/theme/site/html/pdf/i/bfStamp.png"></td>
    </tr>
</table>
<table style="page-break-after: always">
    <tr>
        <td></td>
        <td>
            <table border="1" cellpadding="4">
                <tr>
                    <td>Подписано Аналогом собственноручной подписи (АСП)<br>Идентификатор клиента: {$contract->user_id}
                        <br>Дата: {$contract->inssuance_date|date}
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td style="width: 40%"></td>
        <td style="width: 40%"></td>
        <td><i>Приложение №1</i></td>
    </tr>
</table>
<div>

</div>
<div align="center">
    <i>к индивидуальным условиям договора потребительского микрозайма № {$contract->number}
        от {$contract->inssuance_date|date}</i>
</div>
<div align="center">
    <strong><h3>ГРАФИК ПЛАТЕЖЕЙ</h3></strong>
</div>
<div>

</div>
<table>
    <tr>
        <td width="20%"><strong>{$contract->inssuance_date|date}</strong></td>
        <td width="60%"></td>
        <td width="20%"><strong>Г. АРХАНГЕЛЬСК</strong></td>
    </tr>
</table>
<div>

</div>
<div align="justify">Общество с ограниченной ответственностью Микрокредитная компания «Баренц Финанс» ОГРН
    1217700350812,
    зарегистрированное в реестре микрофинансовых организаций 02.09.2021 года за № 2103045009732, именуемое в дальнейшем
    Займодавец (Кредитор), в лице Генерального директора Кройтор Виктории Викторовны, действующего на основании Устава,
    с одной стороны, и гр.РФ {$lastname|upper} {$firstname|upper} {$patronymic|upper},
    паспорт {$passport_serial} выдан {$passport_issued|upper} {$passport_date|date}
    года, код подразделения {$subdivision_code}, именуемый в дальнейшем Заемщик, зарегистрированный(-ая) по
    адресу: {$regaddress_full}, aс другой стороны, далее вместе именуемые Стороны, согласовали График платежей по
    Договору потребительского кредита
    (займа) № {$contract->number} от {$contract->inssuance_date|date} в следующий редакции:
</div>
<div>

</div>
<table border="1" cellpadding="4" align="center">
    <tbody>
    <tr>
        <td rowspan="2">Дата платежа</td>
        <td rowspan="2">Сумма платежа (руб)</td>
        <td colspan="2">В том числе</td>
        <td rowspan="2">Остаток задолженности</td>
    </tr>
    <tr>
        <td>Сумма основного долга (руб.)</td>
        <td>Сумма процентов (руб.)</td>
    </tr>
    <tr>
        <td>{$contract->return_date|date}</td>
        <td>{$return_amount_percents + $contract->amount + $insurance_cost}</td>
        <td>{$contract->amount + $insurance_cost}</td>
        <td>{$return_amount_percents}</td>
        <td>0</td>
    </tr>
    <tr>
        <td>Общая сумма выплат:</td>
        <td>{$return_amount_percents + $contract->amount + $insurance_cost}</td>
        <td>{$contract->amount + $insurance_cost}</td>
        <td>{$return_amount_percents}</td>
        <td></td>
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
        <td width="50%">Юр. адрес 163045, г. Архангельск, пр. К.С. Бадигина д.19, оф.107
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
        <td width="50%">ООО «Банк Точка»</td>
        <td width="50%">Место рождения: {$birth_place}</td>
    </tr>
    <tr>
        <td width="50%">БИК: 044 525 104</td>
        <td width="50%">Адрес регистрации: {$regaddress_full}
        </td>
    </tr>
    <tr>
        <td width="50%">Расчётный счёт: 4070 1810 7025 0000 1111</td>
        <td width="50%">СНИЛС: {$snils}</td>
    </tr>
    <tr>
        <td width="50%">Корсчёт: 3010 1810 7453 7452 5104</td>
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
    <tr>
        <td><img src="{$config->root_dir}/theme/site/html/pdf/i/bfSigna.png"></td>
        <td><img src="{$config->root_dir}/theme/site/html/pdf/i/bfStamp.png"></td>
    </tr>
</table>
<table>
    <tr>
        <td></td>
        <td>
            <table border="1" cellpadding="4">
                <tr>
                    <td>Подписано Аналогом собственноручной подписи (АСП)<br>Идентификатор клиента: {$contract->user_id}
                        <br>Дата: {$contract->inssuance_date|date}
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>