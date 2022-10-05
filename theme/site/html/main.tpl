{capture name='page_scripts'}

<script src="theme/site/js/calc.app.js"></script>
<script src="theme/site/js/main.app.js?v=1.13"></script>

{/capture}

{capture name='page_styles'}

{/capture}

<main class="main">
  <div class="section section_itop">
    <div class="container">
      <div class="section_row row">

        <div class="col-lg-5 order-lg-2">
          <div class="itop_calc">
            <form class="calculator js-loan-start-form js-calc" method="POST" data-percent="{$loan_percent}">

              <input type="hidden" name="local_time" />

              <div class="form-group form-group-one">
                <div class="form_row">
                  <label class="form-group-title -fs-18 -com-m" for="amount-one">
                    Выберите сумму:
                  </label>
                  <span class="range_res -fs-26 -com-m js-info-summ" id="demo"></span>
                </div>
                <div class="amount">
                  <input type="range" name="amount" min="{$min_summ}" max="{$max_summ}" value="{$current_summ}"
                    class="slider js-input-summ" id="amount-one">
                </div>
              </div>
              <div class="form-group form-group-two">
                <div class="form_row">
                  <label class="form-group-title -fs-18 -com-m" for="amount-two">
                    Выберите срок:
                  </label>
                  <span class="range_res -fs-26 -com-m js-info-period" id="demo2"></span>
                </div>
                <div class="amount">
                  <input type="range" name="period" min="{$min_period}" max="{$max_period}" value="{$current_period}"
                    class="slider js-input-period" id="amount-two">
                </div>
              </div>
              <div class="form-group form-group-res">
                <div class="form_row">
                  <div class="res_title -fs-18 ">Срок до:</div>
                  <div class="res_info_data  -fs-20 -com-sb"><span class="js-total-period"></span> г.</div>
                </div>
                <div class="form_row">
                  <div class="res_title -fs-18 ">Итого к возврату:</div>
                  <div class="res_info_sum -fs-20 -com-sb"><span class="js-total-summ"></span> ₽</div>
                </div>
              </div>
              <div class="form-group form-phone ">
                <span class="phone_info -fs-14">Ваш номер телефона</span>
                <input type="text" name="phone" id="phone"
                  class="form-control -fs-18 -gil-m js-mask-phone js-loan-phone" value="">
                <input type="hidden" name="code" id="" class="js-mask-sms js-loan-code" value="">
                <div class="error_text js-loan-phone-error" style="display:none">Укажите номер телефона</div>
              </div>
              <div class="form-group">
                <div class="form_row">
                  <div class="check mb-0 js-loan-agreement-block">
                    <input type="checkbox" class="custom-checkbox js-loan-agreement" id="check_agreement"
                      name="agreement" value="1"/>
                    <label for="check_agreement" class="check_box -gil-m">
                      <span>Я ознакомлен со <a href="#agreement_list"
                          class="green-link js-toggle-agreement-list">следующим</a></span>
                    </label>
                  </div>
                </div>
              </div>
              {include file='main_agreement_list.tpl'}

              <div class="form-group form-btn">
                <a href="#" class="btn btn-secondary -fs-20 -fullwidth js-loan-start">Получить займ</a>
                {*}
                <span class="bottom_text -fs-14 -center">нажимая на кнопку, вы соглашаетесь с
                  <a href="#agreement_list" data-fancybox>договором оферты</a>
                </span>
                {*}
              </div>


            </form>
          </div>
        </div>


        <div class="col-lg-7">
          <div class="itop_info">
            <div class="section_title itop_info_title">
              <div class="header-info__button">до 30 000 рублей, до 30 дней</div>
              <div class="header-info__title">Займы на карту онлайн</div>
              <div class="header-info__text">Отправляем деньги на карту без лишней суеты</div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
  <section class="s1" id="about">
    <div class="container">
      <div class="head_3">Наши преимущества</div>
      <p class="light_text text-center">Мы стараемся быть быстрее, проще и удобнее для вас</p>
      <div class="plus_wrap">
        <div class="row">
          <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="i_block">
              <img src="theme/site/new/i1.svg">
              <div>Низкая ставка</div>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="i_block">
              <img src="theme/site/new/i2.png">
              <div>Быстрое одобрение: 15 минут</div>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="i_block">
              <img src="theme/site/new/i3.svg">
              <div>Срок кредитования: до 30 дней</div>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="i_block">
              <img src="theme/site/new/i4.svg">
              <div>На сумму: до 30 000 рублей</div>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="i_block">
              <img src="theme/site/new/i5.svg">
              <div>Безопасность ваших персональных данных</div>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="i_block">
              <img src="theme/site/new/i6.svg">
              <div>Переводим сразу на карту, не надо никуда ехать</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="s2" id="get">
    <div class="container">
      <div class="tabs_wrapper">
        <div class="row">
          <div class="col-lg-5 d-sm-none d-md-block d-none">
            <img src="https://ecozaym24.ru/wp-content/themes/micro_zaem/img/tel.jpg" alt="" class="tel_img">
          </div>
          <div class="col-lg-7">
            <div class="tabs">
              <input id="tab1" type="radio" name="tabs" checked="">
              <label for="tab1" title="Как получить" class="first_tab">Как получить</label>
              <input id="tab2" type="radio" name="tabs">
              <label for="tab2" title="Как погасить">Как погасить</label>
              <div id="content-tab1" class="tab">
                <ul class="get_list">
                  <li>
                    <div class="num">1</div>
                    <div>
                      <div class="head_4">Заполните заявку</div>
                      <p>Укажите нужную вам сумму и срок с помощью кредитного калькулятора. Затем нажмите кнопку
                        «Получить заём»</p>
                    </div>
                  </li>
                  <li>
                    <div class="num">2</div>
                    <div>
                      <div class="head_4">Получите решение</div>
                      <p>Принимаем решение до 15 минут</p>
                    </div>
                  </li>
                  <li>
                    <div class="num">3</div>
                    <div>
                      <div class="head_4">Получите деньги</div>
                      <p>Подтвердите договор с помощью SMS кода, и сразу же получите деньги на карту.</p>
                    </div>
                  </li>
                </ul>
                <a href="lk/login" class="button">Получить заём</a>
              </div>
              <div id="content-tab2" class="tab">
                <ul class="get_list">
                  <li>
                    <span class="img_wrap"><img src="theme/site/new/p1.svg" alt=""></span>
                    <div>
                      <div class="head_4">В кассах банков</div>
                      <p>Оплатить займ можно в любом банке России </p>
                    </div>
                  </li>
                  <li>
                    <span class="img_wrap"><img src="theme/site/new/p2.svg" alt=""></span>
                    <div>
                      <div class="head_4">Через почтовое отделение</div>
                      <p>В любом почтовом отделении вашего города без комиссии. Назовите оператору ЕСПП 20498</p>
                    </div>
                  </li>
                  <li>
                    <span class="img_wrap"><img src="theme/site/new/p3.svg" alt=""></span>
                    <div>
                      <div class="head_4">В личном кабинете</div>
                      <p>Просто перейдите в личный кабинет и оплатите заём банковской картой.</p>
                    </div>
                  </li>
                </ul>
                <a href="lk/login" class="button">Погасить заём</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="s3">
    <div class="container">
      <div class="head_3">Отзывы о нас</div>
      <p class="light_text text-center">У нас более 1000 довольных клиентов</p>
      <div class="slick-reviews__list" id="reviews">
        <div class="item">
          <div class="r_top">
            <img src="https://ecozaym24.ru/wp-content/uploads/2020/11/2753353956.jpg" alt="">
            <div>
              <div class="head_4">Сергей</div>
              <div class="r_place"></div>
            </div>
          </div>
          <div class="stars"><img src="https://ecozaym24.ru/wp-content/themes/micro_zaem/img/stars.png" alt=""></div>
          <div class="light_text">
            Долгое время находился на больничном, зарплату получил гораздо меньше. Денег не хватало, а семью кормить
            надо. В первый раз в жизни обратился в компанию за займом, не ожидал, что при минимуме документов так быстро
            одобрят. Оформление заняло 5 минут, анкета очень простая, никаких скрытых комиссий и платежей, вся
            информация доступна в личном кабинете, в том числе и документы. Доволен сервисом, спасибо, что выручили!
            <div class="rev_hidden">
            </div>
          </div>
        </div>
        <div class="item">
          <div class="r_top">
            <img src="https://ecozaym24.ru/wp-content/uploads/2020/11/58586291469641bfad7355171e9637ee.jpg" alt="">
            <div>
              <div class="head_4">Юрий</div>
              <div class="r_place"></div>
            </div>
          </div>
          <div class="stars"><img src="https://ecozaym24.ru/wp-content/themes/micro_zaem/img/stars.png" alt=""></div>
          <div class="light_text">
            При заполнении анкеты не смог прикрепить документы, попросил связаться со мной. Сотрудники компании
            связались оперативно и помогли решить проблему. Займ оформил, получил в течение 5 минут. Спасибо за отличный
            сервис и возможность получить нужную сумму не выходя из дома! <div class="rev_hidden">
            </div>
          </div>
        </div>
        <div class="item">
          <div class="r_top">
            <img src="https://ecozaym24.ru/wp-content/uploads/2020/10/photo.jpg" alt="">
            <div>
              <div class="head_4">Татьяна</div>
              <div class="r_place"></div>
            </div>
          </div>
          <div class="stars"><img src="https://ecozaym24.ru/wp-content/themes/micro_zaem/img/stars.png" alt=""></div>
          <div class="light_text">
            Первый раз брала займ в компании, когда срочно понадобились деньги. Одобрили быстро, деньги были на карте
            через 10 минут. С тех пор являюсь постоянным клиентом, и теперь получаю необходимую сумму еще быстрее. Это
            очень удобно, в текущей ситуации взять деньги до зарплаты просто не у кого. <div class="rev_hidden">
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="s4" id="quest">
    <div class="container">
      <div class="head_3">Вопросы и ответы</div>


      <ul class="questions">
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Проблемы в регистрации карты:</div>
          <div class="answer" style="display: none;">
            <p>• Не разрешено проведение операций в сети Интернет по карточке.<br>
              • Ошибка при вводе данных карты.<br>
              • Недостаточно средств на карте (При добавлении карты, чтобы проверить корректность введенных данных, 1₽
              холдируется (замораживается) у вас на счету, а затем автоматически возвращается (без СМС оповещений).</p>
            <p>Если возникли вопросы, напишите нам в чат, на электронную почту doc@eco-zaim.ru или оставьте заявку на
              обратный звонок. Мы ответим Вам в самое ближайшее время.</p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Документы, которые нужны для получения денег:</div>
          <div class="answer">
            <p>Документы, которые нужны для получения денег:<br>
              • Паспорт гражданина РФ<br>
              • СНИЛС<br>
              • Личная банковская карта</p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Как взять займ?</div>
          <div class="answer">
            <p>Чтобы получить заём на банковскую карту, придерживайтесь такой последовательности действий:</p>
            <ul>
              <li>На кредитном калькуляторе выберите нужную сумму и срок. Доступная сумма займа от 1000 до 30 000 рублей
                (шаг в 1000 рублей).</li>
              <li>Зарегистрируйтесь на сайте и заполните заявку для получения займа с указанием банковской карты и
                добавлением фото селфи и паспорта.</li>
              <li>Подпишите договор с помощью SMS-кода. После одобрения заявки деньги автоматически поступят на вашу
                карту.</li>
            </ul>
            <p>Зарегистрированным клиентам, которые ранее пользовались нашим сервисом, будет достаточно в личном
              кабинете выбрать необходимую сумму и срок займа. Весь процесс получения денег займет не более 2 минут.<br>
              Время оформления первого кредита составляет не более 15 минут.</p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Сколько по времени рассматривается заявка?</div>
          <div class="answer">
            <p>Решение принимается в течение 30 минут после отправки заявки, если не требуется дополнительная проверка.
            </p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Как погасить займ?</div>
          <div class="answer">
            <p>Способы для погашения займа, оплаты процентов и штрафов:</p>
            <ol>
              <li>В личном кабинете с помощью банковской карты. Денежные средства зачисляются моментально.</li>
              <li>Банковский перевод по реквизитам, указанными в договоре займа. Срок поступления на счет, до 3 рабочих
                дней.</li>
            </ol>
            <ol start="3">
              <li>Почтовым переводом во всех отделениях Почты России. Срок поступления на счет, до 5 рабочих дней.</li>
            </ol>
            <p>&nbsp;</p>
            <p>ВНИМАНИЕ! Платеж через кассу банка идет до 3-х банковских дней. За это время начисляется комиссия, а при
              просрочке платежа — штраф. Дата платежа по кредиту — дата зачисления денег на счёт компании.</p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Кто может оформить?</div>
          <div class="answer">
            <p>Гражданин РФ возрастом от 21 до 65 лет, которые имеют банковскую карту и постоянную регистрацию на
              территории РФ.</p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">На какой срок можно оформить займ?</div>
          <div class="answer">
            <p>Вы можете получить займ сроком до 30 дней с возможностью продления.</p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Как узнать решение по заявке?</div>
          <div class="answer">
            <p>Решение по займу автоматически принимает система в течение нескольких минут. Ознакомиться с результатом
              проверки вашей заявки вы можете в вашем личном кабинете.</p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Как повысить шансы на получение онлайн-займа?</div>
          <div class="answer">
            <ul>
              <li>Внимательно заполните все поля заявки на займ. Если у вас возникают вопросы, обратитесь к службе
                поддержки в онлайн-чате на нашем сайте.</li>
              <li>Указывайте исключительно правдивую информацию при заполнении анкеты. Неполные или ложные данные могут
                негативно повлиять на принятие решения по вашей заявке.</li>
              <li>Старайтесь не использовать технологии или программное обеспечение, которые изменяют или скрывают ваши
                данные в интернете (например, IP-адрес).</li>
              <li>Убедитесь, что у вас есть банковская карта, на которую вы можете получить деньги (активна, не
                просрочена, выдана на ваше имя).</li>
              <li>Чтобы получить займ на большую сумму и на более выгодных условиях, формируйте положительную кредитную
                историю.</li>
            </ul>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Можно ли погасить займ досрочно?</div>
          <div class="answer">
            <p>Да, погасить займ можно досрочно в любой день. Чем раньше вы вернете займ, тем меньше заплатите за время
              пользования кредитными средствами. Проценты будут начислены только за те дни, когда вы фактически
              пользовались займом.<br>
              Узнать сумму, которую необходимо оплатить в данный момент, вы можете в личном кабинете или в службе
              написав нам в чат или оставив заявку на обратный звонок.</p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Как погасить часть займа?</div>
          <div class="answer">
            <p>Наши клиенты могут погасить займ полностью или частично.<br>
              Обратите внимание: частичная оплата без продления займа доступна, если у вас нет просроченной
              задолженности. Чтобы погасить часть займа, авторизуйтесь в личном кабинете и воспользуйтесь разделом
              «Частичное погашения займа».</p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Какие условия частичного погашения займа?</div>
          <div class="answer">
            <p>Частичная оплата без продления займа доступна, если у вас нет просроченной задолженности. При частичном
              погашении в первую очередь погашаются проценты. Оставшаяся сумма будет направлена на погашение тела займа.
            </p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">На какую сумму будут начисляться проценты после частичного погашения?</div>
          <div class="answer">
            <p>После частичного погашения проценты будут начисляться исключительно на остаток по кредиту.</p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Каковы последствия неуплаты займа?</div>
          <div class="answer">
            <p>Мы советуем соблюдать условия договора, которые вы принимаете при оформлении займа. Нарушение его
              требований может привести к негативным финансовым последствиям и ухудшить вашу кредитную историю.<br>
              Компания передает информацию о кредитах клиентов в Бюро кредитных историй (НБКИ). Данные о просроченной
              задолженности ухудшают ваш кредитный рейтинг и исключают доступ к кредитованию в банках и других
              финансовых компаниях.</p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Где взять справку о погашении займа?</div>
          <div class="answer">
            <p>Запросить справку о погашении займа вы можете написав нам на электронную почту <a
                href="mailto:doc@eco-zaim.ru">doc@eco-zaim.ru</a>. Срок предоставления справки до 5 рабочих дней.</p>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Как продлить онлайн займ?</div>
          <div class="answer">
            <p>Для продления займа достаточно оплатить сумму начисленных процентов за период, на протяжении которого вы
              пользуетесь заемными средствами. Если вы оплачиваете сумму, которая превышает начисленные проценты на
              текущий период, часть излишне уплаченных денежных средств будет находится в вашем личном кабинете,
              которыми вы сможете воспользоваться при следующем продлении или погашении займа.</p>
            <p><strong>Обратите внимание</strong></p>
            <ul>
              <li>Срок продления 30 дней. Новый срок начнется со следующего дня после
                &ZeroWidthSpace;&ZeroWidthSpace;оплаты фактически начисленных процентов, штрафов и пени. Когда у вас
                будет сумма для полной оплаты, вы самостоятельно сможете выбрать дату погашения и закрыть кредит
                досрочно.</li>
              <li>С нового периода пользования кредитом действует стандартная процентная ставка, предусмотренная
                договором.</li>
              <li>Оплатить необходимую для продления сумму можно в личном кабинете или другим способом, указанным в
                разделе «как погасить».</li>
            </ul>
          </div>
        </li>
        <li class="q_item">
          <a href="#" class="q_open"></a>
          <div class="quest">Как войти в личный кабинет?</div>
          <div class="answer">
            <p>Логин — это ваш номер телефона, указанный при регистрации. Пароль вы должны придумать самостоятельно.</p>
          </div>
        </li>
      </ul>
    </div>
  </section>
<section class="s5">
				<div class="container">
					<div class="row q_form_wrap">
						<div class="col-lg-6">
							<div class="q_form">
											<div class="textwidget"><div role="form" class="wpcf7" id="wpcf7-f77-o2" lang="ru-RU" dir="ltr">
    <div class="screen-reader-response"><p role="status" aria-live="polite" aria-atomic="true"></p> <ul></ul></div>
    <form action="/#wpcf7-f77-o2" method="post" class="wpcf7-form init" novalidate="novalidate" data-status="init">
    <div style="display: none;">
    <input type="hidden" name="_wpcf7" value="77">
    <input type="hidden" name="_wpcf7_version" value="5.3">
    <input type="hidden" name="_wpcf7_locale" value="ru_RU">
    <input type="hidden" name="_wpcf7_unit_tag" value="wpcf7-f77-o2">
    <input type="hidden" name="_wpcf7_container_post" value="0">
    <input type="hidden" name="_wpcf7_posted_data_hash" value="">
    </div>
    <div class="head_3">Остались вопросы?</div>
    <p class="light_text">Оставь заявку на обратный звонок или пиши нам в чат</p>
    <div class="q_fields">
    <div class="row">
    <div class="col-lg-6 col-md-6 col-sm-6">
    <span class="wpcf7-form-control-wrap tel-206"><input type="tel" name="tel-206" value="" size="40" class="wpcf7-form-control wpcf7-text wpcf7-tel wpcf7-validates-as-required wpcf7-validates-as-tel" aria-required="true" aria-invalid="false" placeholder="+ 7(____)-___-__-__" maxlength="18"></span>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6">
    <input type="submit" value="Оставить заявку" class="wpcf7-form-control wpcf7-submit"><span class="ajax-loader"></span>
    </div>
    </div>
    </div>
    <div class="wpcf7-response-output" aria-hidden="true"></div></form></div>
    </div>
                      </div>
                </div>
                <div class="col-lg-6">
                  <img src="https://ecozaym24.ru/wp-content/themes/micro_zaem/img/footer.jpg" alt="" class="form_img">
                </div>
              </div>
            </div>
			</section>
<div class="hide">

    <div  class="info-modal" id="user_exists_modal">
        <span class="error-icon"></span>
        <span class="error-message">
            Пользователь с номером телефона <strong class="js-error-phone-number"></strong> уже зарегистрирован.
        </span>
        <p>
            Войдите в личный кабинет через <a href="lk/login">форму входа</a>
        </p>
    </div>

    <div  class="info-modal" id="user_error_modal">
        <span class="error-icon"></span>
        <span class="error-message"></span>
    </div>

  </div>
</main>