<!DOCTYPE html>
<html>

<head>
    <base href="{$config->root_url}/"/>

    <meta charset="utf-8">
    <title>{$meta_title|escape}</title>
    <meta name="description" content="{$meta_keywords|escape}">
    <link rel="shortcut icon" href="theme/site/i/favicon/favicon.ico" type="image/x-icon">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- style -->
    <link rel="stylesheet" href="theme/site/libs/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="theme/site/libs/range/ion.rangeSlider.min.css"/>
    <link rel="stylesheet" href="theme/site/libs/fancybox/jquery.fancybox.min.css">
    <link rel="stylesheet" href="theme/site/libs/jquery/jquery-ui/jquery-ui.min.css"/>
    <link rel="stylesheet" href="theme/site/libs/jquery/jquery-ui/jquery-ui.theme.min.css"/>
    <link rel="stylesheet" href="theme/site/css/common.css?v=1.10"/>
    <link rel="stylesheet" href="theme/site/css/custom.css?v=1.09"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Arimo:wght@400;700&family=Play:wght@400;700&display=swap"
          rel="stylesheet">
    {$smarty.capture.page_styles}


    <script>

        showCessiaModal = function() {
            $('#cessiaModal').modal();


            var seconds = 10;
            var seconds_timer_id = setInterval(function() {
                if (seconds > 0) {
                    seconds --;
                    $('#cessiaModal .close_cessia_sec').text(seconds+' сек.');
                } else {
                    clearInterval(seconds_timer_id);    
                }
            }, 1000);



            setTimeout(function() {
                $('#cessiaModal .close_cessia_btn').show();
                $('#cessiaModal .close_cessia_sec').hide();
            }, 10000)
        }

        {if $is_developer}console.info('DEVELOPER MODE'){/if}
    </script>

    <meta name="yandex-verification" content="2c0068d5cbd1bd2c"/>
</head>
<body class="{if in_array($module, ['MainController'])}home{else}page{/if}">
<style>
    .developer-panel {
        background: #d22;
        color: #fff;
        padding: 10px;
        width: 100%;
    }

    .developer-panel:after {
        content: '';
        display: block;
        clear: both;
    }

    .developer-panel strong {
        float: left;
        font-size: 20px;
    }

    .developer-panel span {
    / / float: right;
        font-size: 16px;
        display: block;
        text-align: center;
        font-weight: bold;
    }

    .developer-panel.is-looker {
        background: #2d2
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
{*
<div class="developer-panel">
  <span>
      На сайте ведутся технические работы до 14.00 (по МСК)
  </span>
</div>
*}
<header class="new-header">
    <div class="new-header__inner">
        <div class="new-header__hamburger-icon hamburger-icon"></div>
        <a href="/" class="new-header__logo logo">
            <img src="/theme/site/i/logo.svg" width="375" height="75" alt="logo" class="logo__icon">
        </a>
        <nav class="new-header__menu menu">
            <a href="/page/get-money/" class="menu__item">Получить деньги</a>
            <a href="/page/repay-a-loan/" class="menu__item">Погасить или продлить займ</a>
            <a href="/page/documents/" class="menu__item">Документы</a>
        </nav>
        <a href="tel:+78001018283" class="new-header__phone phone">
            <span class="phone__number">8 800 101 82 83</span>
            <span class="phone__text">Бесплатно по России</span>
        </a>
        <a href="/lk/" class="new-header__lk lk">Вход в личный кабинет</a>
        <a href="/lk/" class="new-header__lk-mob lk-mob"></a>
    </div>
</header>
{$content}
<footer class="new-footer">
    <div class="wrapper">
        <div class="new-footer__inner">
            <div class="new-footer__block">
                <div class="new-footer__menu">
                    <div class="new-footer__menu-title">Про нас</div>
                    <a href="/page/about-us/" class="new-footer__menu-item">О компании</a>
                    <a href="/page/documents/" class="new-footer__menu-item">Юридическая информация</a>
                    <a href="/contacts/" class="new-footer__menu-item">Контакты и реквизиты</a>
                    <a href="/files/about/confidential_politics.pdf" class="new-footer__menu-item">Политика
                        конфиденциальности</a>
                    <a href="/files/about/cookies_politics.pdf" class="new-footer__menu-item">Политика Cookie</a>
                </div>
                <div class="new-footer__menu">
                    <div class="new-footer__menu-title">Информация о займах</div>
                    <a href="/lk/" class="new-footer__menu-item">Кредит онлайн на карту без отказа срочно</a>
                    <a href="/lk/" class="new-footer__menu-item">Кредит без справки о доходах срочно</a>
                </div>
            </div>
            <div class="new-footer__block">
                <div class="new-footer__menu">
                    <div class="new-footer__menu-title">Частые вопросы:</div>
                    <a href="/page/get-money/" class="new-footer__menu-item">Как получить кредит?</a>
                    <a href="/page/repay-a-loan/" class="new-footer__menu-item">Как погасить или продлить кредит?</a>
                </div>
                <div class="new-footer__menu">
                    <a href="/lk/" class="new-footer__menu-item">Взять кредит наличными</a>
                    <a href="/lk/" class="new-footer__menu-item">Деньги до зарплаты</a>
                    <a href="/lk/" class="new-footer__menu-item">Кредит с 18 лет</a>
                    <a href="/lk/" class="new-footer__menu-item">Кредит безработному</a>
                </div>
            </div>
            <div class="new-footer__block">
                <div class="new-footer__contacts">
                    {*
                    <a href="tel+79914714533" class="new-footer__contacts-item">
                        <div class="new-footer__contacts-item-icon">
                          <img src="/theme/site/i/Telegram.svg">
                        </div>
                        <div class="new-footer__contacts-item-text">8 991 471 45 33</div>
                    </a>
                    <a href="tel+79914714533" class="new-footer__contacts-item">
                        <div class="new-footer__contacts-item-icon">
                          <img src="/theme/site/i/WhatsApp.svg">
                        </div>
                        <div class="new-footer__contacts-item-text">8 991 471 45 33</div>
                    </a>
                    <a href="tel+79914714533" class="new-footer__contacts-item">
                        <div class="new-footer__contacts-item-icon">
                          <img src="/theme/site/i/Viber.svg" style="filter: grayscale(1);">
                        </div>
                        <div class="new-footer__contacts-item-text">8 991 471 45 33</div>
                    </a>
                            *}
                    <a href="tel+78001018283" class="new-footer__contacts-item">
                        <div class="new-footer__contacts-item-icon">
                            <img src="/theme/site/i/Phone.svg">
                        </div>
                        <div class="new-footer__contacts-item-text">8 800 101 82 83<br> звонок бесплатный</div>
                    </a>
                    <a href="mailto:info@mkkbf.ru" class="new-footer__contacts-item">
                        <div class="new-footer__contacts-item-icon">
                            <img src="/theme/site/i/Email.svg">
                        </div>
                        <div class="new-footer__contacts-item-text">info@mkkbf.ru</div>
                    </a>
                    <a href="vk.com/barentsfinans" class="new-footer__contacts-item">
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
        <a href="/page/get-money/" class="new-hamburger-menu__item">Получить деньги</a>
        <a href="/page/repay-a-loan/" class="new-hamburger-menu__item">Погасить или продлить займ</a>
        <a href="/page/documents/" class="new-hamburger-menu__item">Документы</a>
    </div>
</div>
<div id="cessiaModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
     aria-labelledby="mySmallModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" style="max-width: 1000px;">
        <div class="modal-content">
            <div style="display: inline-block" class="modal-header">
                <h2 style="text-align: center" class="modal-title">Уведомление</h2>
                <div style="cursor:pointer;position: absolute;right: 25px;top: 25px;font-weight: bold;display: none;" class="close_cessia_btn">X</div>
                <div style="color:red; position: absolute;right: 25px;top: 25px;" class="close_cessia_sec">10 сек.</div>
            </div>
            <div class="modal-body">
                <p>
                    Общество с ограниченной ответственностью МИКРОКРЕДИТНАЯ КОМПАНИЯ "БАРЕНЦ ФИНАНС" уведомляет Вас о том, что Кредитором по вышеуказанному Договору стал ООО «КОЛЛЕКТОРСКОЕ АГЕНТСТВО «ШАМИЛЬ И ПАРТНЕРЫ».
                </p>
                <p>Реквизиты ООО «КОЛЛЕКТОРСКОЕ АГЕНТСТВО «ШАМИЛЬ И ПАРТНЕРЫ»</p>
                <p>ИНН: 6908019416</p>
                <p>КПП: 690801001</p>
                <p>ОГРН: 1216900005805</p>
                <p>Юридический адрес: 171080, Тверская область, г. Бологое, ул. Кооперативная, д.4, кв. 38.</p>
                <p>Банк: ПАО СБЕРБАНК БИК: 044525225 к/с 30101810400000000225 р/с 40702810240000007284</p>
            </div>
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
</div>
<script src="theme/site/libs/jquery/jquery-3.4.1.min.js"></script>
<script src="theme/site/libs/bootstrap/bootstrap.min.js"></script>
<script src="theme/site/libs/range/ion.rangeSlider.min.js"></script>
<script src="theme/site/libs/jquery/jquery.maskedinput.min.js"></script>
<script src="theme/site/libs/fancybox/jquery.fancybox.min.js"></script>
<script src="theme/site/libs/jquery/jquery-ui/jquery-ui.min.js"></script>
<script src="theme/site/js/common.js"></script>

<script src="theme/site/js/sms.app.js?v=1.01"></script>
<script src="theme/site/js/prolongation_sms.app.js"></script>
<script src="theme/site/js/attach_card.app.js?v=1.01"></script>

{$smarty.capture.page_scripts}


{if !$is_developer}
{literal}
    <!-- Yandex.Metrika counter -->
    <script type="text/javascript">
        (function (m, e, t, r, i, k, a) {
            m[i] = m[i] || function () {
                (m[i].a = m[i].a || []).push(arguments)
            };
            m[i].l = 1 * new Date();
            for (var j = 0; j < document.scripts.length; j++) {
                if (document.scripts[j].src === r) {
                    return;
                }
            }
            k = e.createElement(t), a = e.getElementsByTagName(t)[0], k.async = 1, k.src = r, a.parentNode.insertBefore(k, a)
        })
        (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

        ym(88054135, "init", {
            clickmap: true,
            trackLinks: true,
            accurateTrackBounce: true,
            webvisor: true,
            ecommerce: "dataLayer"
        });
    </script>
    <noscript>
        <div><img src="https://mc.yandex.ru/watch/88054135" style="position:absolute; left:-9999px;" alt=""/></div>
    </noscript>
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
        function save_local_time() {
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
        setInterval(function () {
            save_local_time();
        }, 30000);

    </script>
{/if}
<script>
    $('.close_cessia_btn').on('click',function() {
        $('#cessiaModal').modal('hide');
    });
</script>
</body>
</html>
{if !empty($needToConfirmCookies)}
    <script>
        $(function () {
            $('#cookieModal').modal();
        });
    </script>
{/if}
<div id="cookieModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
     aria-labelledby="mySmallModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Мы используем Яндекс Метрику</h4>
            </div>
            <div class="modal-body">
                <div class="form-group" style="display:flex; flex-direction: column">
                    <div align="justify">Этот сайт использует сервис веб-аналитики Яндекс Метрика, предоставляемый
                        компанией ООО
                        «ЯНДЕКС», 119021, Россия, Москва, ул. Л. Толстого, 16 (далее — Яндекс).<br><br>Сервис Яндекс
                        Метрика использует технологию «cookie» — небольшие текстовые файлы, размещаемые на
                        компьютере пользователей с целью анализа их пользовательской активности.<br><br>Собранная при
                        помощи cookie информация не может идентифицировать вас, однако может помочь нам
                        улучшить работу нашего сайта. Информация об использовании вами данного сайта, собранная при
                        помощи cookie, будет передаваться Яндексу и храниться на сервере Яндекса в ЕС и Российской
                        Федерации. Яндекс будет обрабатывать эту информацию для оценки использования вами сайта,
                        составления для нас отчетов о деятельности нашего сайта, и предоставления других услуг. Яндекс
                        обрабатывает эту информацию в порядке, установленном в условиях использования сервиса Яндекс
                        Метрика.<br><br>Вы можете отказаться от использования cookies, выбрав соответствующие настройки
                        в браузере.
                        Также вы можете использовать <a href="https://yandex.ru/support/metrika/general/opt-out.html" style="color: #0000FF" target="_blank">инструмент</a>.
                        Однако это может повлиять на работу
                        некоторых функций сайта. Используя этот сайт, вы соглашаетесь на обработку данных о вас Яндексом
                        в порядке и целях, указанных выше.
                    </div>
                    <br>
                    <div>
                        <input type="button" class="btn btn-primary" data-dismiss="modal" value="Согласен">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
