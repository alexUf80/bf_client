<table>
    <tr>
        <td style="width: 25%"></td>
        <td style="width: 60%"><h3>СТРАХОВОЙ ПОЛИС № {$insurances->number}</h3></td>
        <td style="width: 15%"></td>
    </tr>
</table>
<table>
    <tr>
        <td style="width: 10%"></td>
        <td style="width: 60%"></td>
        <td style="width: 30%">дата выдачи полиса {$document->created|date}г.</td>
    </tr>
</table>
<div>

</div>
<div align="justify">Настоящим Полисом-офертой подтверждается заключение договора страхования на условиях Правил №183
    страхования
    банковских карт в действующей редакции от 29.12.2017 (далее - Правила).
    Договор страхования заключается путем вручения Страховщиком Страхователю настоящего Полиса-оферты, подписанного
    Страховщиком.
    На основании ст. 435, 438 и 940 ГК РФ согласие Страхователя заключить договор страхования на предложенных
    Страховщиком условиях подтверждается принятием от Страховщика настоящего Полиса-оферты, а акцептом (согласием на
    заключение договора страхования) считается уплата страховой премии.
</div>
<div>

</div>
<table border="1" align="left" cellpadding="5">
    <tr>
        <td><strong>Страховщик:</strong></td>
        <td>Страховое акционерное общество «ВСК» ИНН 7710026574, ОГРН 1027700186062 ул. Островная, 4, г. Москва, 121552
            тел.: +7 (495) 727 4444, info@vsk.ru
            Лицензия Банка России СИ № 0621 от 11.09.2015
        </td>
    </tr>
    <tr>
        <td><strong>Страхователь (физическое лицо):</strong></td>
        <td>Страхователь (физическое лицо):<br>ФИО: {$lastname} {$firstname} {$patronymic}<br>Дата
            рождения: {$birth|date}
            <br>Телефон: {$phone_mobile} Адрес электронной почты: {$email}
        </td>
    </tr>
    <tr>
        <td><strong>Выгодоприобретатель: </strong></td>
        <td>Держатель карты (Владелец счета):</td>
    </tr>
    <tr>
        <td><strong>Застрахованная карта:</strong></td>
        <td>Застрахованная карта: Страхование в рамках настоящего договора страхования действует в отношении любой
            Банковской карты, выпущенной Банком на имя Страхователя и действующей в течение срока страхования.
        </td>
    </tr>
    <tr>
        <td><strong>Страховая сумма (руб.)</strong></td>
        <td><strong>Страховая премия (руб.)</strong></td>
    </tr>
    <tr>
        {if $insurance_all->amount == 99}
            <td><strong>10 000 (ДЕСЯТЬ ТЫСЯЧ РУБЛЕЙ 00 коп.)</strong></td>
            <td><strong>99,00 (ДЕВЯНОСТО ДЕВЯТЬ РУБЛЕЙ 00 коп.)</strong></td>
        {else}
            <td><strong>20 000 (ДВАДЦАТЬ ТЫСЯЧ РУБЛЕЙ 00 коп.)</strong></td>
            <td><strong>199,00 (ДЕВЯНОСТО ДЕВЯТЬ РУБЛЕЙ 00 коп.)</strong></td>
        {/if}
    </tr>
    <tr>
        <td colspan="2" align="justify"><strong>Страховые риски:</strong><br>•Хищение у Держателя карты наличных
            денежных средств, полученных
            Выгодоприобретателем в Банкомате по Банковской карте, если такое хищение совершено путем разбоя или грабежа
            и имело место в течение 2 (двух) часов с момента снятия денежных средств (п. 4.3.3 Правил страхования).<br>•Несанкционированное
            списание/получение денежных средств с Карточного счета Выгодоприобретателя третьими лицами:<br>- в
            результате утраты Банковской карты Держателем карты с последующей компрометацией (п.4.3.2.4 Правил).<br>-
            используя информацию о Банковской карте, полученную мошенническим путем (в т.ч. фишинг, скимминг), при
            осуществлении расчетов за покупки, работы, услуги (п. 4.3.2.5 Правил).<br> - в Банкомате или Банке-эмитенте
            с использованием Персонального идентификационного номера (ПИН-код) Держателя карты или электронной
            Авторизации, когда держатель карты в результате насилия или под угрозой насилия в отношении себя или своих
            близких был вынужден сообщить третьим лицам ПИН-код своей Банковской карты (п. 4.3.2.6 Правил).
        </td>
    </tr>
    <tr>
        <td colspan="2" align="justify"><strong>Срок страхования:</strong> 30 (тридцать) дней с даты вступления договора
            страхования (полиса-оферты) в силу.
            Договор страхования (полис-оферта) вступает в силу по истечении 14 календарных дней с даты оплаты.
        </td>
    </tr>
    <tr>
        <td colspan="2" align="justify"><strong>Дата уплаты страховой премии:</strong> Дата уплаты страховой премии,
            указанная в документе, подтверждающем уплату страховой премии
        </td>
    </tr>
    <tr>
        <td colspan="2" align="justify"><strong>Особые условия:</strong><br><strong>•</strong> Выгодоприобретатель
            (Держатель карты) обязан в течение 48 (сорок восемь) часов с момента, как стало известно или должно было
            стать известно о событии, имеющим признаки страхового случая известить Страховщика любым доступным способом
            (почтовое письмо с уведомлением, факс, электронная поста, телефон).<br><strong>•</strong> В рамках
            настоящего договора страхования Страховщик несет ответственность в отношении только одной Банковской карты,
            выпущенной на имя Выгодоприобретателя.<br><strong>•</strong> Если произошло хищение наличных денежных
            средств, снятых из банкомата Выгодоприобретателем по нескольким картам, Страховщик выплачивает страховое
            возмещение в рамках одного убытка по сертификату в отношении Застрахованной карты, по которой произошла
            самая ранняя транзакция – снятие наличных денежных средств - не зависимо от того сколько транзакций
            произведено по одной застрахованной карте за 2 часа до момента хищения наличных денежных
            средств.<br><strong>•</strong> По договору страхования не являются страховыми случаями и не подлежат
            возмещению убытки, указанные в пп. 4.5 – 4.7 Правил. В дополнение к исключениям, изложенным в Правилах, не
            признаются страховыми случаями и не подлежат возмещению:<br><strong>•</strong> - расходы по перевыпуску
            банковской карты;<br><strong>•</strong> - убытки, вызванные утратой банковской карты вследствие утери;
            кражи, грабежа, разбоя, определяемых в соответствии с положениями уголовного или административного
            законодательства РФ (за исключением случаев утраты банковской карты с последующей компрометацией); случайных
            механических, термических повреждений, размагничивания и т.п.; неисправной работы
            Банкомата;<br><strong>•</strong> - несанкционированное списание/получение денежных средств с Карточного
            счета Выгодоприобретателя третьими лицами в отделении Банка-эмитента с использованием Банковской карты с
            копированием подписи Держателя карты на платежных документах (слипе, чеке); с использованием Поддельной
            карты с нанесенными на нее данными действительной Банковской карты в качестве расчетного средства (за
            покупки, работы, услуги); посредством получения денежных средств из Банкомата по Поддельной карте, на
            которую нанесены данные действительной Банковской карты;<br><strong>•</strong> - убытки в результате
            мошеннических действий работников торгово-сервисных или иных организаций при совершении Выгодоприобретателем
            (Держателем карты) операций по оплате товаров, работ и (или) услуг с использованием Банковской
            карты.<br><strong>•</strong> Продолжительность покрытия несанкционированного доступа к карточному счету
            Держателя банковской карты третьими лицами не может превышать 48 (сорок восемь) часов с момента блокировки
            карты.
        </td>
    </tr>
</table>
<div>

</div>
<div align="jusitfy">Обстоятельства, оговоренные в настоящем полисе-оферте, имеют существенное значение для определения
    вероятности наступления страхового случая и размера возможных убытков от его наступления (страхового риска).
    Принятие и акцепт Страхователем настоящего полиса-оферты, является для Страховщика подтверждением, полученным от
    Страхователя, о соответствии оговоренных в нем обстоятельств действительности.
    Страхователь, акцептуя настоящий полис-оферту, подтверждает, что ознакомлен и согласен с содержанием Правил,
    размещенных на официальном сайте Страховщика в информационно-телекоммуникационной сети «Интернет» по ссылке:
    https://www.vsk.ru/upload/cache/default/tree/12/1109/tabs/Pravila-183-A4.pdf. Текст Правил выдается Страхователю
    Страховщиком по письменному требованию в течение 3-х рабочих дней с момента получения требования.
    Не признаются страховыми случаями события не предусмотренные в качестве страховых случаев полисом-офертой (исключены
    из страхового покрытия по настоящему договору).<br><br>При наличии противоречий между условиями настоящего Договора
    страхования (полиса-оферты), изложенными на его лицевой и оборотной стороне, и нормами Правил приоритетную силу
    имеют условия Договора страхования (полиса-оферты). Положения Правил, действие которых не отменено и не изменено
    условиями, содержащимися в настоящем Договоре страхования (полисе-оферте), обязательны для Страхователя
    (Выгодоприобретателя) и Страховщика.<br><br>Принятием и акцептом настоящего полиса-оферты, Страхователь дает
    согласие
    САО «ВСК», находящемуся по адресу 121552, г. Москва, ул. Островная, д. 4, на направление юридически значимых
    сообщений по номеру телефона или адресу эл. почты (если они указаны в полисе), на обработку, включая сбор,
    систематизацию, накопление, хранение, уточнение (обновление, изменение), использование, распространение (в том числе
    передачу), обезличивание, блокирование, уничтожение персональных данных, указанных в договоре страхования
    (полисе-оферте), в соответствие с Федеральным законом от 27.07.2006 г. №152-ФЗ «О персональных данных», на доступ к
    кредитной и страховой истории. Указанные данные предоставляются в целях заключения и исполнения договора
    страхования, а так же разработки новых продуктов и услуг. Согласие предоставляется с момента подписания (акцепта)
    настоящего договора страхования (полиса-оферты) и действует в течение пяти лет после исполнения обязательств.
    Согласие может быть отозвано путём письменного заявления в САО «ВСК».<br><br>Сторонами Договора страхования,
    руководствуясь ч.2 ст.160 Гражданского кодекса Российской Федерации, достигнуто соглашение сторон о допустимости
    использования факсимильного воспроизведения подписей и оттисков печатей с помощью средств копирования.
</div>
<table>
    <tr>
        <td style="width: 70%"></td>
        <td><strong>Страховщик: САО «ВСК»</strong></td>
    </tr>
    <tr>
        <td style="width: 70%"></td>
        <td><strong>Тарновский А.Я.</strong></td>
    </tr>
    <tr>
        <td style="width: 70%"></td>
        <td><img src="{$config->root_url}/theme/site/html/pdf/i/polis_stamp.png" width="100"/></td>
    </tr>
</table>