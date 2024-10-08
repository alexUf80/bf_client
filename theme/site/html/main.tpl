{capture name='page_scripts'}

  <script src="theme/site/js/calc.app.js?v=1.05"></script>
  <script src="theme/site/js/main.app.js?v=1.26"></script>
  <script src="https://www.google.com/recaptcha/api.js"></script>

{/capture}

{capture name='page_styles'}

{/capture}
{if $bankiru}

{/if}
  <div class="section section_itop mb-5">
    <div class="wrapper">
      <div class="section_row row">

        <div class="col-lg-5 order-lg-2">
          <div class="itop_calc">
            <form class="calculator js-loan-start-form js-calc" method="POST" data-percent="{$loan_percent}">
              <input type="hidden" name="local_time" />
              <div class="form-group form-group-one">
                <div class="form_row">
                  <label class="form-group-title -fs-18 -com-m" for="amount-one">
                    Какая сумма вам нужна?
                  </label>
                </div>
                
                <div class="ddd">
                  <div class="amount">
                    <input type="range" name="amount" min="{$min_summ}" max="{$max_summ}" value="{$current_summ}" class="slider js-input-summ" id="amount-one">                
                  </div>
                  <span class="range_res -fs-26 -com-m js-info-summ" id="demo"></span>
                </div>

              </div>
              <div class="form-group form-group-two">
                <div class="form_row">
                  <label class="form-group-title -fs-18 -com-m" for="amount-two">
                    На какой срок?
                  </label>
                </div>
                <div class="ddd">
                <div class="amount">
                  <input type="range" name="period" min="{$min_period}" max="{$max_period}" value="{$current_period}" class="slider js-input-period" id="amount-two">
                </div>
                  <span class="range_res -fs-26 -com-m js-info-period" id="demo2"></span>

                </div>
              </div>
              <div class="form-group form-group-res">
              <div class="form_row">
                  <div class="res_title -fs-18 ">Сумма кредита:</div>
                  <div class="res_info_sum -fs-20 -com-sb"><span class="js-info-summ"></span> ₽</div>
                </div>
                <div class="form_row">
                  <div class="res_title -fs-18 ">Дата погашения:</div>
                  <div class="res_info_data  -fs-20 -com-sb"><span class="js-total-period"></span> г.</div>
                </div>
                <div class="form_row">
                  <div class="res_title -fs-18 ">К возврату:</div>
                  <div class="res_info_sum -fs-20 -com-sb"><span class="js-total-summ"></span> ₽</div>
                </div>
              </div>
              <div class="form-group form-phone ">
                <span class="phone_info -fs-14">Ваш номер телефона</span>
                <input type="text" name="phone" id="phone" class="form-control -fs-18 -gil-m js-mask-phone js-loan-phone" value="">
                <input type="hidden" name="code" id="" class="js-mask-sms js-loan-code" value="">
                <div class="error_text js-loan-phone-error" style="display:none">Укажите номер телефона</div>
              </div>
              <div class="form-group">
                <div class="form_row">
                    <div class="check mb-0 js-loan-agreement-block">
                      <input type="checkbox" class="custom-checkbox js-loan-agreement" id="check_agreement" name="agreement" value="1"/>
                      <label for="check_agreement" class="check_box -gil-m">
                         <span>Я ознакомлен со <a href="#agreement_list" style="color: #4A2982" class="js-toggle-agreement-list" >следующим</a></span>
                      </label>
                    </div>
                  </div>
              </div>
                {include file='agreement_list.tpl'}

              <div class="form-group">
                <div style="margin-left: 11px;" class="g-recaptcha" data-sitekey={$captcha_site_key}></div>
              </div>

              <div class="form-group form-btn">
                <a href="javascript:void(0);" class="btn btn-secondary -fs-20 -fullwidth js-loan-start">Получить займ</a>
                <!--<span class="bottom_text -fs-14 -center">нажимая на кнопку, вы соглашаетесь с
                <a href="#agreement_list" data-fancybox>договором оферты</a>
                </span>-->
              </div>

                <div class="form-group">
                  <div class="form_row">
                      <div class="check mb-0 check_box justify-content-center">
                          <span><a href="#promo_code" class="js-toggle-promo-code" style="color: #4A2982">У меня есть промокод</a></span>
                      </div>
                  </div>
                </div>
                   <div id="promo_code" style="display:none" class="pr-3 pl-3">
                  <div style="color: #4A2982" class="text-center js-success-promo" style="display:none">
                      <p>Промокод активирован            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="8" viewBox="0 0 10 8" fill="none">
                              <path d="M9.88442 1.8301L4.15429 7.55898C4.00072 7.71194 3.75208 7.71194 3.59912 7.55898L0.114476 4.05205C-0.0384842 3.89847 -0.0384842 3.6489 0.114476 3.49625L0.947087 2.66426C1.10067 2.51099 1.3493 2.51099 1.50226 2.66426L3.87965 5.05744L8.4957 0.441075C8.64866 0.288115 8.8973 0.288115 9.0515 0.441075L9.88411 1.2743C10.0386 1.42757 10.0386 1.67714 9.88442 1.8301Z" fill="#33CC66"></path>
                          </svg>
                      </p>
                  </div>
                  <div class="text-center text-danger js-error-promo" style="display:none">
                      <p>Промокод не применен</p>
                  </div>
                  <div id="promo_input" class="form-group form-phone">
                      <input id="promoCode" type="text" class="form-control -fs-18 -gil-m">
                      <span class="phone_info -fs-14">Промокод</span>
                  </div>
                  <div class="form-group form-btn">
                    <a id="check_promo_code" href="javascript:void(0);" class="btn btn-secondary  -fs-20 -fullwidth  js-promo-code-ckeck">Применить</a>
                  </div>
                </div>


            </form>
        <div class="form-group">
          <textarea class="g-response" style="position: relative;width: 250px;height: 40px;border: 1px solid rgb(193, 193, 193);margin: 10px 25px;padding: 0px;resize: none; display: none; "></textarea>
        </div>
          </div>
        </div>



        <div class="col-lg-7">
             
        </div>
      </div>

    </div>
  </div>
<div class="wrapper">
    <div class="new-advantages">
        <div class="new-advantages__title title">ВСЁ МАКСИМАЛЬНО ПРОСТО, БЫСТРО И БЕЗОПАСНО</div>
        <div class="new-advantages__list">
            <div class="new-advantages__item">
                <div class="new-advantages__item-icon">
                    <img src="/theme/site/i/icon-1.svg" alt="">
                </div>
                <div class="new-advantages__item-title">От 5 000 до 30 000 <br>рублей</div>
            </div>
            <div class="new-advantages__item">
                <div class="new-advantages__item-icon">
                    <img src="/theme/site/i/icon-2.svg" alt="">
                </div>
                <div class="new-advantages__item-title">От 5 до 30 дней <br>Возможность продления</div>
            </div>
            <div class="new-advantages__item">
                <div class="new-advantages__item-icon">
                    <img src="/theme/site/i/icon-3.svg" alt="">
                </div>
                <div class="new-advantages__item-title">Обработка заявки <br>за 10 минут</div>
            </div>
            <div class="new-advantages__item">
                <div class="new-advantages__item-icon">
                    <img src="/theme/site/i/icon-4.svg" alt="">
                </div>
                <div class="new-advantages__item-title">Минимум <br>документов</div>
            </div>
            <div class="new-advantages__item">
                <div class="new-advantages__item-icon">
                    <img src="/theme/site/i/icon-5.svg" alt="">
                </div>
                <div class="new-advantages__item-title">Зачисление денег <br>на карту любого банка</div>
            </div>
        </div>
    </div>

    <div class="new-why-we">
      <div class="new-why-we__list">
          <div class="new-why-we__item new-why-we__item-special">
              Почему так удобно брать кредит у нас?
          </div>
          <div class="new-why-we__item">
              <div class="new-why-we__item-icon">
                  <img src="/theme/site/i/ppphone.png" alt="">
              </div>
              <div class="new-why-we__item-content">
                  <div class="new-why-we__item-title">Безопасно и надежно</div>
                  <div class="new-why-we__item-text">Все персональные данные клиентов надежно защищены новейшим программным обеспечением. Мы соответствуем международным стандартам безопасности данных платежных карт.</div>
              </div>
          </div>
          <div class="new-why-we__item">
              <div class="new-why-we__item-icon">
                  <img src="/theme/site/i/why-2.svg" alt="">
              </div>
              <div class="new-why-we__item-content">
                  <div class="new-why-we__item-title">Честно! Без скрытых платежей</div>
                  <div class="new-why-we__item-text">Ставка по займу в заявке неизменна. У нас нет скрытых платежей и дополнительных комиссий.</div>
              </div>
          </div>
          <div class="new-why-we__item">
              <div class="new-why-we__item-icon">
                  <img src="/theme/site/i/why-3.svg" alt="">
              </div>
              <div class="new-why-we__item-content">
                  <div class="new-why-we__item-title">Одобряем 9 из 10 заявок</div>
                  <div class="new-why-we__item-text">Наша миссия - доступная финансовая помощь для каждого! Одобрение заемщикам без официальной работы, студентам, пенсионерам и даже клиентам с неидеальной кредитной историей.</div>
              </div>
          </div>
          <div class="new-why-we__item">
              <div class="new-why-we__item-icon">
                  <img src="/theme/site/i/why-4.svg" alt="">
              </div>
              <div class="new-why-we__item-content">
                  <div class="new-why-we__item-title">Автопродление кредита при оплате процентов</div>
                  <div class="new-why-we__item-text">Мы на вашей стороне. Поможем вам избежать просрочки по кредиту и ухудшения кредитной истории.</div>
              </div>
          </div>
          <div class="new-why-we__item">
              <div class="new-why-we__item-icon">
                  <img src="/theme/site/i/why-5.svg" alt="">
              </div>
              <div class="new-why-we__item-content">
                  <div class="new-why-we__item-title">Быстро и круглосуточно</div>
                  <div class="new-why-we__item-text">Мы работаем 24/7. Вы в любой момент сможете оформить кредит. Деньги поступают на карту через несколько секун после оформления заявки.</div>
              </div>
          </div>
      </div>
  </div>

</div>
<div class="new-banner">
    <img src="/theme/site/i/banner.jpg" alt="">
</div>
<div class="wrapper">
  <div class="new-questions">
      <div class="new-questions__title title">Частые вопросы</div>
      <div class="new-questions__list">
          <div class="new-questions__item">
              <div class="new-questions__item-image">
                  <img src="/theme/site/i/questions-1.jpg" alt="">
              </div>
              <div class="new-questions__item-content">
                  <div class="new-questions__item-title">Получить деньги</div>
                  <div class="new-questions__item-text">
                      <p>Готовы зачислить деньги на вашу банковскую карту прямо сейчас.</p>
                      <p>Заполните анкету с данными, получите индивидуальное предложение!</p>
                  </div>
              </div>
              <div class="new-questions__item-btn">Подробнее</div>
          </div>
          <div class="new-questions__item">
              <div class="new-questions__item-image">
                  <img src="/theme/site/i/questions-2.jpg" alt="">
              </div>
              <div class="new-questions__item-content">
                  <div class="new-questions__item-title">Погасить кредит</div>
                  <div class="new-questions__item-text">
                      <p>Погасите ваш кредит онлайн, не выходя из дома. Просто перейдите в личный кабинет и оплатите займ банковской картой. В срок, частями, досрочно. Выбирайте как вам удобно.</p>
                  </div>
              </div>
              <div class="new-questions__item-btn">Подробнее</div>
          </div>
          <div class="new-questions__item">
              <div class="new-questions__item-image">
                  <img src="/theme/site/i/questions-3.jpg" alt="">
              </div>
              <div class="new-questions__item-content">
                  <div class="new-questions__item-title">Продлить кредит</div>
                  <div class="new-questions__item-text">
                      <p>Пролонгация займа – отличная возможность исправить текущее финансовое положение без вреда для кредитной истории.</p>
                  </div>
              </div>
              <div class="new-questions__item-btn">Подробнее</div>
          </div>
      </div>
  </div>
    {*
  <div class="new-actions">
    <div class="new-actions__main">
        <div class="new-actions__main-image">
            <img src="/theme/site/i/action.jpg" alt="">
        </div>
        <div class="new-actions__main-content">
            <div class="new-actions__main-title">Все клиенты Баренц Финанс участвуют в программе «Уровни лояльности»</div>
            <div class="new-actions__main-text">Для постоянных клиентов компании, которые берут  в Баренц Финанс кредиты онлайн на карту, действует программа «Уровни лояльности». Благодаря ей пользователь сервиса постепенно увеличивает свою индивидуальную скидку на дисконтную процентную ставку.</div>
            <div class="new-actions__main-bottom">
              <div class="new-actions__main-btn">Все акции</div>
            </div>
        </div>
    </div>
    <div class="new-actions__list">
        <div class="new-actions__item">
            <div class="new-actions__item-title">Приведи друга</div>
            <div class="new-actions__item-text">Хотите заработать? Пригласите друга и получите 500 рублей!</div>
            <div class="new-actions__item-dots"></div>
        </div>
        <div class="new-actions__item">
            <div class="new-actions__item-title">Бонус 300 рублей</div>
            <div class="new-actions__item-text">Подпишитесь на нас в социальной сети ВК и получите промокод!</div>
            <div class="new-actions__item-dots"></div>
        </div>
        <div class="new-actions__item">
            <div class="new-actions__item-title">Розыгрыш IPhone 13</div>
            <div class="new-actions__item-text">Оформи займ и участвуй в розыгрыше нового смартфона!</div>
            <div class="new-actions__item-dots"></div>
        </div>
        <div class="new-actions__item">
            <div class="new-actions__item-title">Финансовая грамотность</div>
            <div class="new-actions__item-text">Займы - это доступный и удобный финансовый инструмент.</div>
            <div class="new-actions__item-dots"></div>
        </div>
    </div>
  </div>
  *}
</div>
{*}
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
                  <input type="range" name="amount" min="{$min_summ}" max="{$max_summ}" value="{$current_summ}" class="slider js-input-summ" id="amount-one">
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
                  <input type="range" name="period" min="{$min_period}" max="{$max_period}" value="{$current_period}" class="slider js-input-period" id="amount-two">
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
                <input type="text" name="phone" id="phone" class="form-control -fs-18 -gil-m js-mask-phone js-loan-phone" value="">
                <input type="hidden" name="code" id="" class="js-mask-sms js-loan-code" value="">
                <div class="error_text js-loan-phone-error" style="display:none">Укажите номер телефона</div>
              </div>
              <div class="form-group">
                <div class="form_row">
                    <div class="check mb-0 js-loan-agreement-block">
                      <input type="checkbox" class="custom-checkbox js-loan-agreement" id="check_agreement" name="agreement" value="1" checked="true" />
                      <label for="check_agreement" class="check_box -gil-m">
                         <span>Я ознакомлен со <a href="#agreement_list" class="green-link js-toggle-agreement-list" >следующим</a></span>
                      </label>
                    </div>
                  </div>
              </div>
                {include file='agreement_list.tpl'}

              <div class="form-group form-btn">
                <a href="javascript:void(0);" class="btn btn-secondary -fs-20 -fullwidth js-loan-start">Получить займ</a>
                <!--<span class="bottom_text -fs-14 -center">нажимая на кнопку, вы соглашаетесь с
                <a href="#agreement_list" data-fancybox>договором оферты</a>
                </span>-->
              </div>

              {if $is_developer}
                <div class="form-group">
                  <div class="form_row">
                      <div class="check mb-0 check_box justify-content-center">
                          <span><a href="#promo_code" class="green-link js-toggle-promo-code" >У меня есть промокод</a></span>
                      </div>
                  </div>
                </div>

                <div id="promo_code" style="display:none" class="pr-3 pl-3">
                  <div class="text-center text-success">
                      <p>Промокод активирован            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="8" viewBox="0 0 10 8" fill="none">
                              <path d="M9.88442 1.8301L4.15429 7.55898C4.00072 7.71194 3.75208 7.71194 3.59912 7.55898L0.114476 4.05205C-0.0384842 3.89847 -0.0384842 3.6489 0.114476 3.49625L0.947087 2.66426C1.10067 2.51099 1.3493 2.51099 1.50226 2.66426L3.87965 5.05744L8.4957 0.441075C8.64866 0.288115 8.8973 0.288115 9.0515 0.441075L9.88411 1.2743C10.0386 1.42757 10.0386 1.67714 9.88442 1.8301Z" fill="#33CC66"></path>
                          </svg>
                      </p>
                  </div>
                  <div class="text-center text-danger">
                      <p>Промокод не применен</p>
                  </div>
                </div
              {/if}


            </form>
          </div>
        </div>


        <div class="col-lg-7">
              <div class="itop_info">
                <div class="section_title itop_info_title">
                  <div class="-blue -fs-24 -com-m ">Всего за 3 минуты</div>
                  <div class="-black -fs-42 -com-sb">Получите займ на карту</div>
                  <div class="-orange -fs-42 -com-sb">не выходя из дома</div>
                </div>
                <div class="itop_info_subtitle -fs-22">
                  Оформите займ и получите деньги
                  на карту уже через 15 минут
                </div>
                <div class="itop_info_desc">
                  <div class="itop_info_desc_row row">
                    <div class="col-3 col-sm-2 col-md-4 col-lg-3">
                      <div class="itop_info_desc_item">
                        <div class="itop_info_desc_item_title -fs-32">{$loan_percent}%</div>
                        <div class="itop_info_desc_item_text -fs-18">низкая ставка</div>
                      </div>
                    </div>
                    <div class="col-4 col-sm-3 col-md-4 col-lg-4">
                      <div class="itop_info_desc_item">
                        <div class="itop_info_desc_item_title -fs-32">15 мин.</div>
                        <div class="itop_info_desc_item_text -fs-18">срок одобрения</div>
                      </div>
                    </div>
                    <div class="col-5 col-sm-3 col-md-4 col-lg-5">
                      <div class="itop_info_desc_item">
                        <div class="itop_info_desc_item_title -fs-32">до {$max_summ|convert} руб.</div>
                        <div class="itop_info_desc_item_text -fs-18">сумма займа</div>
                      </div>
                    </div>

                  </div>

                </div>
              </div>
            </div>
      </div>

    </div>
  </div>

  <div class="section section_bonuses">
    <div class="container">
      <div class="section_row row">
        <div class="col-md-6">
          <div class="bonus_item bonus_item_one">
            <div class="bonus_item_img"><img src="theme/site/i/girl.png" alt=""></div>

          </div>
        </div>
        <div class="col-md-6">
          <div class="bonus_item bonus_item_two">
            <div class="bonus_list">
              <div class="bonus_list_item">
                <div class="bonus_item_icon"><img src="theme/site/i/credit-card.svg" alt=""></div>
                <div class="bonus_item_title -fs-32 -com-sb">Переводим сразу на карту</div>
                <div class="bonus_item_text -fs-22">Деньги будут у вас на счете
                уже через 15 минут</div>
              </div>
              <div class="bonus_list_item">
                <div class="bonus_item_icon"><img src="theme/site/i/clock.svg" alt=""></div>
                <div class="bonus_item_title -fs-32 -com-sb">Простое оформление</div>
                <div class="bonus_item_text -fs-22">Вам понадобится только паспорт и 3 минуты времени</div>
              </div>
            </div>
            <div class="bottom_btn">
              <a href="javascript:void(0);" class="btn btn-secondary -fs-20 -com-sb" onclick="$('html, body').animate({ scrollTop: 140 }, 600);">Получить займ</a>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>

  <div id="how_get" class="section section_steps">
        <div class="container">
          <div class="section_title -fs-42">Займ на комфортных условиях</div>
          <div class="section_subtitle -fs-42">Теперь это легко!</div>
          <div class="section_row steps_row">
            <div class="steps_item step_first">
              <div class="steps_item_num -gil-b -fs-76"><span>01</span></div>
              <div class="steps_item_title -fs-22 -com-m">Заполните заявку </div>
              <div class="steps_item_text">
                Простая форма, нужен только паспорт. Среднее время заполнения: 3 минуты
              </div>
            </div>
            <div class="steps_item step_second">
              <div class="steps_item_num -gil-b -fs-76"><span>02</span></div>
              <div class="steps_item_title -fs-22 -com-m">Получите одобрение </div>
              <div class="steps_item_text">
                В течение 15 минут мы проверим все ваши данные для одобрения займа
              </div>
            </div>
            <div class="steps_item step_third">
              <div class="steps_item_num -gil-b -fs-76"><span>03</span></div>
              <div class="steps_item_title -fs-22 -com-m">Деньги у вас на карте</div>
              <div class="steps_item_text">
                После одобрения мы сразу отправляем деньги вам на банковскую карту
              </div>
            </div>
          </div>
        </div>
      </div>

      <div id="how_repay" class="section section_repay">
        <div class="container">
          <div class="section_repay_row row">
            <div class="col-lg-7">
              <div class="repay_items_row">
                  <div class="repay_item" style="background: url(theme/site/i/paiitem01.png) no-repeat;">
                    <div class="repay_item_text">
                      <span class="repay_text -fs-26 -com-sb">В любом отделении банка</span>
                      <a href="javascript:void(0);" class="repay_item_link link_more -fs-16" onclick="$(this).hide();$('#bank_pay_info').fadeIn();return false;">Подробнее</a>
                      <div id="bank_pay_info" style="display:none">Оплатить заём можно в любом банке России</div>
                    </div>
                  </div>
                  <div class="repay_item" style="background: url(theme/site/i/paiitem02.png) no-repeat;">
                    <div class="repay_item_text">
                      <span class="repay_text -fs-26 -com-sb">Банковской картой</span>
                      <a href="javascript:void(0);" class="repay_item_link link_more -fs-16" onclick="$(this).hide();$('#bank_card_info').fadeIn();return false;">Подробнее</a>
                      <div style="display:none" id="bank_card_info">Просто перейдите в личный кабинет и оплатите займ банковской картой.</div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="col-lg-5">
              <div class="repay_info">
                <div class="section_title -fs-52">Хотите <span class="-orange">погасить займ?</span></div>
                <div class="section_text -fs-26 -com-l">Вы можете сделать это любым удобным для вас способом:</div>
              </div>
            </div>

          </div>
        </div>
      </div>

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
{*}