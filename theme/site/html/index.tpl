<!DOCTYPE html>
<html>

<head>
    <base href="{$config->root_url}/" />

  <meta charset="utf-8">
  <title>{$meta_title|escape}</title>
  <meta name="description" content="{$meta_keywords|escape}">
  <link rel="shortcut icon" href="theme/site/i/favicon/favicon.ico" type="image/x-icon">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- style -->
  <link rel="stylesheet" href="theme/site/libs/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="theme/site/libs/range/ion.rangeSlider.min.css" />
  <link rel="stylesheet" href="theme/site/libs/fancybox/jquery.fancybox.min.css">
  <link rel="stylesheet" href="theme/site/libs/jquery/jquery-ui/jquery-ui.min.css" />
  <link rel="stylesheet" href="theme/site/libs/jquery/jquery-ui/jquery-ui.theme.min.css" />
  <link rel="stylesheet" href="theme/site/css/common.css?v=1.10" />
  <link rel="stylesheet" href="theme/site/css/custom.css?v=1.09" />
  <link rel="preconnect" href="https://fonts.googleapis.com"> 
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
  <link href="https://fonts.googleapis.com/css2?family=Arimo:wght@400;700&family=Play:wght@400;700&display=swap" rel="stylesheet">
  {$smarty.capture.page_styles}
  
  
  

  <script>
    {if $is_developer}console.info('DEVELOPER MODE'){/if}
  </script>  

    <meta name="yandex-verification" content="2c0068d5cbd1bd2c" />
</head>
<body class="{if in_array($module, ['MainController'])}home{else}page{/if}">
  <style>
    .developer-panel {
        background:#d22;
        color:#fff;
        padding:10px;
        width:100%;
    }
    .developer-panel:after {
        content:'';
        display:block;
        clear:both;
    }
    .developer-panel strong {
        float:left;
        font-size:20px;
    }
    .developer-panel span {
//        float:right;
        font-size:16px;
        display:block;
        text-align:center;
        font-weight:bold;
    }
    .developer-panel.is-looker {
        background:#2d2
    }
  </style>
  
  {if $is_looker}
  <div class="developer-panel is-looker">
    <strong>ADMIN MODE</strong>
    {if $user}
    <span>ID {$user->id}</span>
    {/if}
  </div>  
  {elseif $is_developer}
  <div class="developer-panel">
    <strong>DEVELOPER MODE</strong>
    {if $user}
    <span>ID {$user->id}</span>
    {/if}
  </div>  
  {/if} 
  
   
{*}
  <div class="developer-panel">
    <span>
        В период с 21:00 по 23:59 (МСК) 01.03.2022 будут проводиться технические работы, портал будет недоступен. 
        <br />Повторите авторизацию после завершения работ. 
        Спасибо за понимание!    
    </span>
  </div>
{*}

{*}
  <div class="wrapper">
    <header class="header">
      <div class="container">
        <div class="header_row row">
          <div class="col-sm-6 col-md-4 col-lg-3 header-col-logo">
            <div class="header_logo">
              <a href="/" class="logo"><img src="theme/site/i/logo.png" alt=""></a>
            </div>
          </div>
          <div class="col-lg-4 header-col-nav">
            <div class="header_nav">
              <nav class="navbar header_menu">
                <ul class="nav header_menu_nav -gil-m">
                  <li class="nav-item">
                    <a class="nav-link" href="/#how_get">Как получить</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/#how_repay">Как погасить</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="page/documents">Документы</a>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
          <div class="col-sm-6 col-md-8 col-lg-5 header-col-contact">
            <div class="header_right">
              <div class="header_right_row">
                <div class="header_btn">
                  {if $user}
                  <a href="account" class="btn btn-primary -lk-btn">Личный кабинет</a>
                  {else}
                  <a href="lk/login" class="btn btn-primary -lk-btn">Личный кабинет</a>
                  {/if}
                </div>
                <div class="header_contacts">
                  <a href="tel:88004448234" class="header_phone -gil-b -fs-24">8 800 444 82 34</a>
                  <span class="info -fs-14">звонок бесплатный</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    
    <header class="mobheader">
        <div class="mobheader-logo">
            <a href="/" class="logo"><img src="theme/site/i/logo.png" alt=""></a>
        </div>
        <div class="mobheader-phone">
            <a href="tel:88004448234" class="">8 800 444 82 34</a>
            <span class="">звонок бесплатный</span>
        </div>
        <div class="mobheader-menu">
            <a class="mobheader-toggler" href="javascript:void(0);">
                <span></span>
                <span></span>
                <span></span>
            </a>
            <div class="mobheader-menu-nav">
              <nav class="navbar header_menu">
              {if !$user}
                <ul class="nav header_menu_nav -gil-m">
                  <li class="nav-item">
                    <a class="nav-link" href="/#how_get">Как получить</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/#how_repay">Как погасить</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="page/about">О компании</a>
                  </li>
                </ul>
              {else}
                <ul class="nav header_menu_nav -gil-m">
                  <li class="nav-item active">
                    <a class="nav-link" href="account">Общая информация</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="account/history">История займов</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="account/cards">Банковские карты</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="account/data">Личные данные</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="account/docs">Документы</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link text-danger" href="lk/logout">Выйти</a>
                  </li>
                </ul>
              {/if}
              </nav>
            </div>
        </div>
        
        <div class="mobheader-account">
          {if $user}
          <a href="account" class=""></a>
          {else}
          <a href="lk/login" class=""></a>
          {/if}            
        </div>
    </header>
    {*}

    <header class="new-header">
      <div class="new-header__inner">
        <div class="new-header__hamburger-icon hamburger-icon"></div>
        <a href="/" class="new-header__logo logo">
          <img src="/theme/site/i/logo.svg" width="375" height="75" alt="logo" class="logo__icon">
        </a>
        <nav class="new-header__menu menu">
          <a href="#" class="menu__item">Получить деньги</a>
          <a href="#" class="menu__item">Погасить займ</a>
          <a href="#" class="menu__item">Продлить займ</a>
          <a href="#" class="menu__item">Информация</a>
        </nav>
        <a href="+78001018283" class="new-header__phone phone">
          <span class="phone__number">8 800 101 82 83</span>
          <span class="phone__text">Бесплатно по России</span>
        </a>
        <a href="#" class="new-header__lk lk">Вход в личный кабинет</a>
        <a href="#" class="new-header__lk-mob lk-mob"></a>
      </div>
    </header>
    {$content}
    <footer class="new-footer">
      <div class="wrapper">
        <div class="new-footer__inner">
            <div class="new-footer__block">
                <div class="new-footer__menu">
                    <div class="new-footer__menu-title">Про нас</div>
                    <a href="#" class="new-footer__menu-item">О компании</a>
                    <a href="#" class="new-footer__menu-item">Юридическая информация</a>
                    <a href="#" class="new-footer__menu-item">Контакты и реквизиты       </a>
                </div>
                <div class="new-footer__menu">
                    <div class="new-footer__menu-title">Информация о займах</div>
                    <a href="#" class="new-footer__menu-item">Кредит онлайн на карту без отказа срочно</a>
                    <a href="#" class="new-footer__menu-item">Кредит без справки о доходах срочно</a>
                </div>
            </div>
            <div class="new-footer__block">
                <div class="new-footer__menu">
                    <div class="new-footer__menu-title">Частые вопросы:</div>
                    <a href="#" class="new-footer__menu-item">Как получить кредит?</a>
                    <a href="#" class="new-footer__menu-item">Как погасить кредит?</a>
                    <a href="#" class="new-footer__menu-item">Как продлить кредит?</a>
                </div>
                <div class="new-footer__menu">
                    <a href="#" class="new-footer__menu-item">Взять кредит наличными</a>
                    <a href="#" class="new-footer__menu-item">Деньги до зарплаты</a>
                    <a href="#" class="new-footer__menu-item">Кредит с 18 лет</a>
                    <a href="#" class="new-footer__menu-item">Кредит безработному</a>
                </div>
            </div>
            <div class="new-footer__block">
                <div class="new-footer__contacts">
                    <a href="" class="new-footer__contacts-item">
                        <div class="new-footer__contacts-item-icon">
                          <img src="/theme/site/i/Telegram.svg">
                        </div>
                        <div class="new-footer__contacts-item-text">8 991 471 45 33</div>
                    </a>
                    <a href="" class="new-footer__contacts-item">
                        <div class="new-footer__contacts-item-icon">
                          <img src="/theme/site/i/WhatsApp.svg">
                        </div>
                        <div class="new-footer__contacts-item-text">8 991 471 45 33</div>
                    </a>
                    <a href="" class="new-footer__contacts-item">
                        <div class="new-footer__contacts-item-icon">
                          <img src="/theme/site/i/Viber.svg" style="filter: grayscale(1);">
                        </div>
                        <div class="new-footer__contacts-item-text">8 991 471 45 33</div>
                    </a>
                    <a href="" class="new-footer__contacts-item">
                        <div class="new-footer__contacts-item-icon">
                          <img src="/theme/site/i/Phone.svg">
                        </div>
                        <div class="new-footer__contacts-item-text">8 800 101 82 83<br> звонок бесплатный</div>
                    </a>
                    <a href="" class="new-footer__contacts-item">
                        <div class="new-footer__contacts-item-icon">
                          <img src="/theme/site/i/Email.svg">
                        </div>
                        <div class="new-footer__contacts-item-text">info@mkkbf.ru</div>
                    </a>
                    <a href="" class="new-footer__contacts-item">
                        <div class="new-footer__contacts-item-icon">
                          <img src="/theme/site/i/Vk.svg">
                        </div>
                        <div class="new-footer__contacts-item-text">vk.com/barentsfinans</div>
                    </a>
                </div>
            </div>
        </div>
      </div>
    </footer>
    <div class="new-copiright">
      <div class="wrapper">
        <div class="new-copiright__inner">
          <a href="/" class="new-copiright__logo">
              <img src="/theme/site/i/logo.svg" width="375" height="75" alt="logo" class="logo__icon">
              <span>Кредит онлайн</span>
          </a>
          <span class="new-copiright__text">© 2022 Баренц Финанс. Все права защищены</span>
        </div>
      </div>
    </div>
      
  <div class="new-hamburger-menu">
      <div class="new-hamburger-menu__top">
          <div class="new-hamburger-menu__close">
            <img src="/theme/site/i/1close.svg">
          </div>
          <div class="new-hamburger-menu__logo">
            <img src="/theme/site/i/logo.svg">
          </div>
          <div class="new-hamburger-menu__lk">
            <img src="/theme/site/i/lk.svg">
          </div>
      </div>
      <div class="new-hamburger-menu__list">
          <a href="#" class="new-hamburger-menu__item">Про нас</a>
          <a href="#" class="new-hamburger-menu__item">Как получить кредит</a>
          <a href="#" class="new-hamburger-menu__item">Вопросы и ответы</a>
          <a href="#" class="new-hamburger-menu__item">Контакты</a>
      </div>
  </div>

    {*}
    <footer class="footer">
      <div class="container">
        <div class="footer_row row">
          <div class="col-md-4 col-lg-2 footer-col-logo">
            <div class="footer_logo">
              <a href="/" class="logo"><img src="theme/site/i/logo.png" alt="logo"></a>
              <span class="logo_info -fs-15 -gil-l">Комфортные займы
                на вашу карту
                не выходя из дома</span>
            </div>
          </div>
          <div class="col-lg-3 footer-col-nav">
            <div class="footer_nav">
              <nav class="navbar navbar-expand-lg footer_menu">
                <button class="navbar-toggler">
                  <span class="line"></span>
                  <span class="line"></span>
                  <span class="line"></span>
                </button>
                <ul class="nav footer_menu_nav -gil-m -fs-16">
                  <li class="nav-item">
                    <a class="nav-link" href="page/about">О компании</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/#how_get">Как получить</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/#how_repay">Как погасить</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="page/documents">Документы</a>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
          <div class="col-sm-6 col-md-4 col-lg-4 footer-col-btn">
                    <ul class="docs_list_footer">				
                        <li class=""><a class="docs_list_link_footer" href="/files/about/bazovij_standart_zaschity_prav_i_interesov_fiz_i_yur_lits.pdf" target="_blank">Базовый стандарт защиты прав и интересов физических и юридических лиц - получателей финансовых услуг</a></li>
						<li class=""><a class="docs_list_link_footer" href="/files/about/bazovij_standart_sovershenija_operatsij.pdf" target="_blank">Базовый стандарт совершения микрофинансовой организацией операций на финансовом рынке</a></li>
						<li class=""><a class="docs_list_link_footer" href="/files/about/infirmatsionnaja_pamyatka_banka_rossii_o_mfo.pdf" target="_blank">Информационная памятка Банка России о МФО</a></li>
                        <li class=""><a class="docs_list_link_footer" href="/files/about/informatsija_dlya_poluchatelej_finansovoj_uslugi_5.pdf" target="_blank">Информация для получателя финансовой услуги</a></li>
						<li class=""><a class="docs_list_link_footer" href="/files/about/informatsija_o_sluzhbe_finansovogo_upolnomochenogo.pdf" target="_blank">Информация о службе финансового уполномоченного</a></li>
						<li class=""><a class="docs_list_link_footer" href="/files/about/obschie_usloviya.pdf" target="_blank">Общие условия</a></li>
						<li class=""><a class="docs_list_link_footer" href="/files/about/svidetelstvo_o_chlenstve_sro_edinstvo_new.pdf" target="_blank">Свидетельство о членстве в СРО</a></li>
						<!--li class=""><a class="docs_list_link_footer" href="/files/about/svidetelstvo_na_tovarnij_znak.pdf" target="_blank">Свидетельство на товарный знак</a></li-->
                        <li class=""><a class="docs_list_link_footer" href="/files/about/usloviya_dogovora_strahovanija.pdf" target="_blank">Условия договора страхования</a></li>				
                        <li class=""><a class="docs_list_link_footer" href="/files/about/svidetelstvo_o_vnesenii_svedenij_v_gosreestr_mfo.pdf" target="_blank">Свидетельство  о внесении сведений в гос.реестр МФО</a></li>
        				<li class=""><a class="docs_list_link_footer" href="/files/about/polozhenie_o_porjadke_i_sbore_personalnih_dannyh.pdf" target="_blank">Положение о порядке сбора обработки хранения персональных данных</a></li>
        				<li class=""><a class="docs_list_link_footer" href="/files/about/pravila_predostavlenija_mikrozajmov.pdf" target="_blank">Правила предоставления микрозаймов</a></li>
        				<li class=""><a class="docs_list_link_footer" href="/files/about/spisok_lits_okazyvajuschih_suschestvennoe_vlijanie_nalplus.pdf" target="_blank">Список лиц, оказывающих существенное влияние</a></li>
        				<li class=""><a class="docs_list_link_footer" href="/files/about/pismo_banka_rossii_ot_10_06_2020.pdf" target="_blank">Письмо Банка России от 10.06.2020 N 44-3-13 1359 О сервисе на едином портале государственных и муниципальных услуг</a></li>
        				<li class=""><a class="docs_list_link_footer" href="/files/about/politika_bezopasnosti_platezhej_nalichnoe.pdf" target="_blank">Политика  безопасности  платежей</a></li>
        				<li class=""><a class="docs_list_link_footer" href="/files/about/informatsionnoe_pismo_po_dostupnosti_distantsionnyh_kanalov.pdf" target="_blank">Информационное письмо о рекомендациях по доступности дистанционных каналов для потребителей финансовых услуг</a></li>
        				<li class=""><a class="docs_list_link_footer" href="/files/about/Pravila_195_strahovanie_ot_ns.pdf" target="_blank">Правила № 195 комбинированного страхования от несчастных случаев и болезней</a></li>
                        <li class=""><a class="docs_list_link_footer" href="/files/about/Реквизиты_Общества.pdf" target="_blank">Реквизиты Общества</a></li>
                    </ul>

          </div>
          <div class="col-sm-6 col-md-4 col-lg-3 footer-col-contacts">
            <div class="footer_contacts -fs-14">
              <a href="tel:88004448234" class="footer_phone -fs-24 -gil-b">8 800 444 82 34</a>
              <span class="footer_text -gil-m">звонок бесплатный</span>
              <a href="mailto:mkk@finfive.ru" class="footer_email -gil-b">mkk@finfive.ru</a>
              <div class="work_time">
                <div class="work_time_title -gil-b">Время работы:</div>
                <div class="work_time_text">понедельник - воскресенье <br>с 9:00 до 21:00 </div>
              </div>
            </div>
          </div>
        </div>
        <div class="footer_row">
          <div class="copyright -fs-15">
            Полное наименование: Общество с ограниченной ответственностью «Микрокредитная компания «На личное+» 
            <br />
            Сокращенное наименование: ООО «МКК «На личное+» 
            ИНН 6316253440
            ОГРН 1196313019066
            <br />
            Регистрационный номер записи в государственном реестре микрофинансовых организаций 2003336009529. Дата внесения 20.02.2020 г. 
            <br />
            Является членом Союза «Микрофинансовый Альянс Институты развития малого и среднего бизнеса» с 03.12.2021 г. 
            <br />
            Регистрационный номер в реестре членов Союза «МИКРОФИНАНСОВЫЙ АЛЬЯНС»: 12 21 033 63 1570 от 03 декабря 2021 г.
            <br />
            Адрес ООО МКК "На личное+": 443058, г. Самара, ул. Победы, 86, оф. 2.1.
            <br />
            Режим работы: понедельник-пятница с 9.00 до 18.00. Время работы обособленных подразделений необходимо узнавать по телефону 8 800 444 82 34 (звонок по России бесплатный)
            <br />
            <br />
            Сайт Банка России - https://www.cbr.ru
            <br />
            Страница сайта Банка России, содержащая государственный реестр микрофинансовых организация -  https://www.cbr.ru/microfinance/registry/
            <br />
            Интернет-приемная Банка России https://www.cbr.ru/reception/
            <br />
            СРО «Единство»: сайт - https://www sro-mfo.ru. Юридический адрес: 420066, г. Казань, ул. Чистопольская д.16/15, оф.1. Адрес для корреспонденции: 420066, г. Казань, а/я 100
            <br />
            Финансовый уполномоченный: сайт - https://www finombudsman.ru, 
            телефон 8 (800) 200 00 10 (звонок по России бесплатный), адрес: 119017, г. Москва, Старомонетный пер, д. 3
            <br />
            Потребитель финансовых услуг имеет право направить обращение финансовому уполномоченному.  Порядок обращения см. в Памятке "Информация о службе финансового уполномоченного".

          </div>
        </div>
      </div>
    
      <div class="hide">
        <div class="info-modal" id="sms_code_modal"></div>
        <div class="info-modal" id="error_modal">
            <span class="error-icon"></span>
            <span class="error-message js-error-message"></span>
        </div>
        <div class="info-modal" id="success_modal">
            <span class="success-message js-success-message"></span>
        </div>
      </div>
      
    </footer>
    {*}
      <div class="hide">
        <div class="info-modal" id="sms_code_modal"></div>
        <div class="info-modal" id="error_modal">
            <span class="error-icon"></span>
            <span class="error-message js-error-message"></span>
        </div>
        <div class="info-modal" id="success_modal">
            <span class="success-message js-success-message"></span>
        </div>
      </div>
  </div>
  <script src="theme/site/libs/jquery/jquery-3.4.1.min.js"></script>
  <script src="theme/site/libs/bootstrap/bootstrap.min.js"></script>
  <script src="theme/site/libs/range/ion.rangeSlider.min.js"></script>
  <script src="theme/site/libs/jquery/jquery.maskedinput.min.js"></script>
  <script src="theme/site/libs/fancybox/jquery.fancybox.min.js"></script>
  <script src="theme/site/libs/jquery/jquery-ui/jquery-ui.min.js"></script>
  <script src="theme/site/js/common.js"></script>

  <script src="theme/site/js/sms.app.js"></script>
  <script src="theme/site/js/prolongation_sms.app.js"></script>
  <script src="theme/site/js/attach_card.app.js?v=1.01"></script>
  
  {$smarty.capture.page_scripts}


{if !$is_developer}
{literal}
<script src="//code-ya.jivosite.com/widget/0DbQAAOxcD" async></script>
<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
   (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
   m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
   (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

   ym(78433342, "init", {
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true,
        webvisor:true
   });
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/78433342" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
{/literal}
{/if}
  
  {if $message_error}
  <script>
    $('.js-error-message').html('{$message_error}');
    $.fancybox.open({
        src: '#error_modal'
    })
  </script>
  {/if}
  
  {if $user}
  <script>
    function save_local_time()
    {
        var date = new Date();
        var local_time = parseInt(date.getTime() / 1000);

        $.ajax({
            url: '/ajax/local_time.php',
            data: {
                local: local_time
            }
        });        
    }
    save_local_time();
    setInterval(function(){
        save_local_time();
    }, 30000);
    
  </script>
  {/if}
  
</body>
</html>
