{if $document->created>'2023-11-01'}

<table>
    <tr>
     <td WIDTH="30%">
    <img src="{$config->root_url}/theme/site/html/pdf/i/polis_logo.png" height="50"/>
    </td>
    <td style="text-align: center">
        <h4>СТРАХОВОЙ ПОЛИС <br>№ {$insurances->number} от {$document->created|date}г.</h4>
    </td>
    <td WIDTH="30%">
        <h5>
            <b>Страховщик:</b> <br>
            Страховое акционерное общество «ВСК»; 
            ИНН 7710026574, ОГРН 1027700186062; 
            ул. Островная, 4, г. Москва 121552; 
            тел.: +7 (495) 727 4444, info@vsk.ru; 
            Лицензия Банка России СИ № 0621 от 11.09.2015
        </h5>
    </td>
    </tr>
</table>
<div>
<br>
</div>
<table>
    <tr>
        <td WIDTH="80%">
            По условиям настоящего Полиса страховая премия оплачивается Страхователем после ознакомления с условиями страхования и Ключевым информационным документом (далее – КИД).
            Заключая договор страхования, Страхователь подтверждает, что ознакомлен с КИД перед заключением договора и удостоверяет факт получения экземпляра КИД.
            КИД дополнительно размещен по ссылке, доступ к которой возможен путем сканирования QR – кода.
        </td>
        <td>
            <img src="{$config->root_url}/theme/site/html/pdf/i/qr-vsk.jpg" height="50"/>
        </td>
    </tr>
</table>
<div>

</div>
<table border="1" align="left" cellpadding="5">
    <tr>
    <td>
        Настоящий страховой полис (далее также - Полис) подтверждает заключение договора страхования между Страховым акционерным обществом «ВСК» (далее – Страховщик) и Страхователем на условиях Правил №183 страхования банковских карт в редакции, действующей на дату заключения Полиса (далее - Правила), являющихся неотъемлемой частью Полиса.
        Договор страхования заключается путем вручения Страховщиком Страхователю настоящего Полиса, подписанного Страховщиком на основании устного заявления Страхователя. Страхователь дает согласие (совершает акцепт) на заключение договора страхования оплатой страховой премии. Страхователь, перед оплатой страховой премии, обязан ознакомиться с условиями страхования, положениями Правил страхования на официальном сайте Страховщика в сети «Интернет»: https://www.vsk.ru/o-kompanii/dlya-kliyentov?t=pravila_i_tarifi_strahovaniya&case=pravila. Оплачивая страховую премию, Страхователь подтверждает, что с Правилами ознакомлен и согласен, а экземпляр Правил вручен путем размещения на сайте Страховщика. Страхователь вправе получить Правила страхования в письменном виде, обратившись в офис Страховщика. Предусмотренный Полисом порядок информирования Страхователя об условиях Правил страхования, делает их обязательными для Страхователя в случае заключения договора.
    </td>
    </tr>
</table>
<table border="1" align="left" cellpadding="5">
    <tr>
        <td WIDTH="30%"><strong>Страхователь (Выгодоприобретатель):</strong></td>
        <td WIDTH="70%">ФИО: {$lastname} {$firstname} {$patronymic}<br>
            Дата рождения: {$birth|date}<br>
            Паспорт: {$passport_serial}, Выдан {$passport_issued}<br>
            <br>Телефон: {$phone_mobile} Адрес электронной почты: {$email}
        </td>
    </tr>
    <tr>
        <td WIDTH="30%"><strong>Застрахованная карта:</strong></td>
        <td WIDTH="70%">	Застрахованными являются банковские карты (включая денежные средства, размещенные на банковском счете, для обслуживания которого выдана банковская карта, который открыт до заключения договора страхования) платежных систем Visa,Union Pay, MasterCard, МИР и иных платежных систем, выданные до начала срока страхования и держателем которых является Страхователь.
        </td>
    </tr>
</table>
<table border="1" align="left" cellpadding="5">
    <tr>   	
        <td WIDTH="60%"><strong>Страховые риски</strong></td>
        <td WIDTH="20%"><strong>Страховая сумма (руб.)</strong></td>
        <td WIDTH="20%"><strong>Страховая премия (руб.)</strong></td>
    </tr>
    <tr>
        <td><strong>Страховые риски:</strong><br>
            <strong>Несанкционированное списание/получение денежных средств с карточного счета Выгодоприобретателя третьими лицами:</strong>
            <br>−	в результате утраты Банковской карты Держателем карты с последующей компрометацией (п.4.3.2.4 Правил).
            <br>−	используя информацию о Банковской карте, полученную мошенническим путем (в т.ч. фишинг, скимминг), при осуществлении расчетов за покупки, работы, услуги (п. 4.3.2.5 Правил).
            <br>−	в Банкомате или Банке-эмитенте с использованием Персонального идентификационного номера (ПИН-код) Держателя карты или электронной Авторизации, когда держатель карты в результате насилия или под угрозой насилия в отношении себя или своих близких был вынужден сообщить третьим лицам ПИН-код своей  Банковской карты (п. 4.3.2.6 Правил).
                <hr>
                <strong>Хищение у Держателя карты наличных денежных средств</strong>, полученных Выгодоприобретателем в Банкомате по Банковской карте, если такое хищение совершено путем разбоя или грабежа и имело место в течение 2 (двух) часов с момента снятия денежных средств (п. 4.3.3 Правил страхования).
        </td>
        {if $document->created < '2023-11-15'}
            {if $insurance_all->amount == 99}
                <td><strong>10 000 (ДЕСЯТЬ ТЫСЯЧ РУБЛЕЙ 00 коп.)</strong></td>
                <td><strong>99,00 (ДЕВЯНОСТО ДЕВЯТЬ РУБЛЕЙ 00 коп.)</strong></td>
            {elseif $insurance_all->amount == 99}
                <td><strong>20 000 (ДВАДЦАТЬ ТЫСЯЧ РУБЛЕЙ 00 коп.)</strong></td>
                <td><strong>199,00 (СТО ДЕВЯНОСТО ДЕВЯТЬ РУБЛЕЙ 00 коп.)</strong></td>
            {else}
                <td><strong>25 000 (ДВАДЦАТЬ ПЯТЬ ТЫСЯЧ РУБЛЕЙ 00 коп.)</strong></td>
                <td><strong>299,00 (ДВЕСТИ ДЕВЯНОСТО ДЕВЯТЬ РУБЛЕЙ 00 коп.)</strong></td>
            {/if}
        {else}
        {if $insurance_all->amount == 199}
                <td><strong>100 000 (СТО ТЫСЯЧ РУБЛЕЙ 00 коп.)</strong></td>
                <td><strong>199,00 (СТО ДЕВЯНОСТО ДЕВЯТЬ РУБЛЕЙ 00 коп.)</strong></td>
            {elseif $insurance_all->amount == 299}
                <td><strong>105 000 (СТО ПЯТЬ ТЫСЯЧ РУБЛЕЙ 00 коп.)</strong></td>
                <td><strong>299,00 (ДВЕСТИ ДЕВЯНОСТО ДЕВЯТЬ РУБЛЕЙ 00 коп.)</strong></td>
            {elseif $insurance_all->amount == 399}
                <td><strong>110 000 (СТО ДЕСЯТЬ ТЫСЯЧ РУБЛЕЙ 00 коп.)</strong></td>
                <td><strong>399,00 (ТРИСТА ДЕВЯНОСТО ДЕВЯТЬ РУБЛЕЙ 00 коп.)</strong></td>
            {else}
                <td><strong>110 000 (СТО ДЕСЯТЬ ТЫСЯЧ РУБЛЕЙ 00 коп.)</strong></td>
                <td><strong>{$insurance_all->amount} ({$insurance_all->amount|price_string|upper})</strong></td>
            {/if}
        {/if}
    </tr>
</table>
<br><br>
<table border="1" align="left" cellpadding="5">
    <tr>
        <td colspan="2" align="justify">
            <strong>Срок страхования:</strong> 30 (тридцать) дней с даты вступления Договора страхования в силу. Договор страхования вступает в силу по истечении 14 календарных дней с даты оплаты.
        </td>
    </tr>
    <tr>
        <td colspan="2" align="justify">
            <strong>Особые условия:</strong>
            <br>1. Выгодоприобретатель (Держатель карты) обязан в течение 48 (сорок восемь) часов с момента, как стало известно или должно было стать известно о событии, имеющим признаки страхового случая известить Страховщика любым доступным способом (почтовое письмо с уведомлением, факс, электронная поста, телефон). 
            <br>2. Если произошло хищение денежных средств по нескольким картам, Страховщик первым делом выплачивает страховое возмещение в отношении Застрахованной карты по которой произошла самая ранняя транзакция.
            <br>3. События, не являющиеся страховыми случаями (исключение из страхового покрытия), являются события, при наступлении которых оператор по переводу денежных средств обязан в соответствии с частями 12, 13 и 15 статьи 9 Федерального закона от 27 июня 2011 года N 161-ФЗ «О национальной платежной системе» возместить своему клиенту сумму операции. События, не являющиеся страховыми случаями (исключения из страхового покрытия), предусмотренные Правилами № 183, не применяются.
            <br>4. Страховая выплата не производится по основаниям, перечисленным в статьях 961 – 965 Гражданского кодекса Российской Федерации.
            <br>5. Страховая премия возвращается Страховщиком в полном объеме при отказе Страхователя от Договора страхования в течение 14 календарных дней со дня его заключения. При отказе от Полиса в случае непредоставления, предоставления неполной или недостоверной информации о Договоре страхования, Страховщик осуществляет возврат страховой премии, за вычетом части, рассчитанной пропорционально сроку действия Договора страхования. При наличии оснований для возврата страховой премии, возврат производится в течение 7 рабочих дней, с даты получения Страховщиком соответствующего заявления. В иных случаях отказа от Договора возврат страховой премии не производится, если иное не предусмотрено действующим законодательством. Условия Правил № 183, противоречащие вышеуказанному порядку, не применяются.

            <br><br>Оплачивая страховую премию и принимая Полис Страхователь, подтверждает заключение договора добровольного страхования на предложенных Страховщиком условиях и в соответствии с п. 8 ч. 2 ст. 10 Федерального закона от 27.07.2006 №152-ФЗ «О персональных данных» предоставляет собственное согласие на обработку Страховым акционерным обществом «ВСК», местонахождение: 121551, г. Москва, ул. Островная, д. 4, номер в Реестре операторов персональных данных № 09-0060538, своих персональных данных в целях заключения и исполнения договоров страхования (перестрахования), урегулирования убытков, проверки качества оказания услуг, в статистических и исследовательских целях, в целях проведения мониторинга и выполнения актуарных расчетов, получения СМС-сообщений, иных сообщений по электронным каналам связи (в том числе мессенджеров), содержащих информацию о статусе урегулирования убытка по договору страхования, уведомлений об окончании срока действия договора страхования (возможной пролонгации), напоминания о необходимости внесения очередного страхового взноса по договору страхования, уведомлений о регистрации заявлений на заключение договоров страхования, в целях осуществления страховой и сопутствующей страхованию деятельности.
            Согласие дается на обработку следующих предоставленных персональных данных: фамилия, имя, отчество, дата рождения, номер телефона, адрес проживания, адрес регистрации, данные документа, удостоверяющего личность и водительского удостоверения, включая сбор, систематизацию, накопление, хранение, уточнение (обновление, изменение), использование, обезличивание, блокирование, уничтожение, внесение в информационную систему, автоматическую обработку, обработку с использованием средств автоматизации или без использования таких средств.
            Согласие действует в течение срока действия договора и в течение 5 (пяти) лет с даты окончания срока действия. Согласие может быть в любое время отозвано субъектом персональных данных путём подачи письменного заявления в адрес САО «ВСК» по адресу его местонахождения с предъявлением документа, удостоверяющего личность. Обработка отдельных категорий персональных данных и их материальных носителей может быть продолжена оператором после отзыва согласия субъектом персональных данных, при условии, если это прямо предусмотрено обязательными требованиями страхового законодательства или законодательства об архивном деле.

        </td>
    </tr>
    
</table>
<div>

</div>
<table align="justify">
    <tr>
    <td>
        Сторонами договора страхования, руководствуясь ч.2 ст.160 Гражданского кодекса Российской Федерации, достигнуто соглашение сторон о допустимости использования факсимильного воспроизведения подписей и оттисков печатей с помощью средств копирования в настоящем Полисе. Использование подобного или любого другого аналога подписи, а также печати в документах, изменяющих или прекращающих Договор не допускается – такие документы рассматриваются сторонами как не имеющие юридической силы.

    </td>
    </tr>
</table>
<div>

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


{else}


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
        {elseif $insurance_all->amount == 99}
            <td><strong>20 000 (ДВАДЦАТЬ ТЫСЯЧ РУБЛЕЙ 00 коп.)</strong></td>
            <td><strong>199,00 (СТО ДЕВЯНОСТО ДЕВЯТЬ РУБЛЕЙ 00 коп.)</strong></td>
        {else}
            <td><strong>25 000 (ДВАДЦАТЬ ПЯТЬ ТЫСЯЧ РУБЛЕЙ 00 коп.)</strong></td>
            <td><strong>299,00 (ДВЕСТИ ДЕВЯНОСТО ДЕВЯТЬ РУБЛЕЙ 00 коп.)</strong></td>
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

{/if}