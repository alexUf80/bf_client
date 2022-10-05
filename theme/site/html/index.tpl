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
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="theme/site/css/common.css?v=1.08"/>
    <link rel="stylesheet" href="theme/site/css/custom.css?v=1.07"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;700&display=swap" rel="stylesheet">

    {$smarty.capture.page_styles}

    <script>
        window.is_developer = {$is_developer}
                {if $is_developer}console.info('DEVELOPER MODE'){/if}
    </script>

    <meta name="yandex-verification" content="0c6a9e1dd7eabe27"/>

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
{elseif 1==2}
    <div class="developer-panel" style="text-align:center">
        <strong></strong>
        Уважаемые клиенты, график работы:<br/>
        31.12.21-02.01.22 - <i>выходные.</i>
        03-07.01.22 - <i>08:00-17:00 (МСК).</i>
        08-09.01.22 - <i>выходные.</i>
        С 10.01.22 - <i>работаем в стандартном режиме.</i>
        <br/>
        Приём платежей остаётся круглосуточным и без выходных.
        <br/>
        <b>С Наступающим Новым годом и Рождеством!</b>
    </div>
{/if}

{*}
<div class="developer-panel">
  <span>
      Уважаемые клиенты, ведутся технические работы, актуальные суммы для платежа можно уточнить в чате
  </span>
</div>
{*}

<div class="wrapper">
    <header class="header">
        <div class="container">
            <div class="header_row row">
                <div class="col-sm-6 col-md-4 col-lg-3 header-col-logo">
                    <div class="header_logo">
                        <a href="/" class="logo"><img src="theme/site/new/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-4 header-col-nav">
                    <div class="header_nav">
                        <nav class="">
                            <ul id="menu-top_menu" class="menu-top_menu">
                                <li id="menu-item-19"
                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-19"><a
                                            href="#about">О нас</a></li>
                                <li id="menu-item-20"
                                    class="get_link menu-item menu-item-type-custom menu-item-object-custom menu-item-20">
                                    <a href="#get">Как получить</a></li>
                                <li id="menu-item-21"
                                    class="get_back_link menu-item menu-item-type-custom menu-item-object-custom menu-item-21">
                                    <a href="#get">Как погасить</a></li>
                                <li id="menu-item-22"
                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-22"><a
                                            href="#quest">Вопросы и ответы</a></li>
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

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>


    <header class="mobheader">
        <div class="header_logo">
            <a href="/" class="logo"><img src="theme/site/new/logo.png" alt=""></a>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="header_btn">
                    {if $user}
                        <a href="account" class="btn btn-primary -lk-btn">Личный кабинет</a>
                    {else}
                        <a href="lk/login" class="btn btn-primary -lk-btn">Личный кабинет</a>
                    {/if}
                </div>
            </div>
            <div class="col-6">
                <div class="header_contacts">

                </div>
            </div>
        </div>
    </header>

    {$content}

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <p>© 2020-{''|date:'Y'}, Лаборатория «Тест-Драйв»</p>
                </div>
                <div class="col-lg-4 col-md-4 text-center">
                    <p>Разработка сайта: <img src="https://ecozaym24.ru/wp-content/uploads/2020/10/dev_logo.png" alt="">
                    </p>
                </div>
                <div class="col-lg-4 col-md-4 text-right">
                    <a class="con_link" href="http://ecozaym24.ru/privacy-policy/">Политика конфиденциальности</a>
                </div>
            </div>
            <div class="footer_links">
                <div class="row">
                    <div class="col-md-4">
                        <ul>
                            <li>
                                <a href="theme/site/new/docs/Базовый_стандарт_защиты_прав_и_интересов_физических_и_юридических.pdf"
                                   target="_blank" rel="noopener">Базовый стандарт защиты прав и интересов физических и
                                    юридических лиц — получателей финансовых услуг</a></li>
                            <li>
                                <a href="theme/site/new/docs/Информация_о_праве_потребителей_финансовых_услуг_на_направление.pdf"
                                   target="_blank" rel="noopener">Информация о праве потребителей финансовых услуг на
                                    направление обращения финансовому уполномоченному</a></li>
                            <li>
                                <a href="theme/site/new/docs/Информация_об_условиях_предоставления_использования_и_возврата_.pdf"
                                   target="_blank" rel="noopener">Информация об условиях предоставления, использования и
                                    возврата потребительского займа</a></li>
                            <li><a href="theme/site/new/docs/Лист записи(1).rtf" target="_blank" rel="noopener">Лист
                                    записи о государственной регистрации</a></li>
                            <li><a href="https://ecozaym24.ru/wp-content/uploads/2021/08/ИНФОРМАЦИЯ.pdf">Информация</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <ul>
                            <li>
                                <a href="theme/site/new/docs/Перечень_лиц_оказывающих_существенное_влияние_ред_2022г.pdf"
                                   target="_blank" rel="noopener">Список участников и лиц, под контролем либо значительным влиянием которых находится МКК</a>
                            </li>
                            <li><a href="theme/site/new/docs/Политика_обработки_и_защиты_персональных_данных.pdf"
                                   target="_blank" rel="noopener">Политика обработки и защиты персональных данных</a>
                            </li>
                            <li><a href="theme/site/new/docs/polojenie_trebovaniya.pdf" target="_blank" rel="noopener">Положение
                                    о требованиях к содержанию обращений
                                    получателей финансовых услуг</a></li>
                            <li><a href="theme/site/new/docs/Правила-предоставления-займов.pdf" target="_blank"
                                   rel="noopener">Правила предоставления микрозаймов</a></li>
                            <li><a href="theme/site/new/docs/Реквизиты_ООО_МКК_ФИНАНСОВЫЙ_АСПЕКТ_1.pdf">Реквизиты ООО
                                    МКК ФИНАНСОВЫЙ АСПЕКТ</a></li>
                            <li><a href="theme/site/new/docs/pamyatka_vss.pdf" target="_blank" rel="noopener">Памятка по
                                    страховым продуктам</a></li>
                            <li><a href="theme/site/new/docs/Условия_предоставления_кредитных_каникул_.pdf" target="_blank" rel="noopener">Условия
                                    предоставления "кредитных каникул"</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <ul>
                            <li><a href="theme/site/new/docs/Свидетельство-ИНН(1).pdf" target="_blank" rel="noopener">Свидетельство
                                    ИНН</a></li>
                            <li><a href="theme/site/new/docs/Свидетельство-МФО(1).pdf" target="_blank" rel="noopener">Свидетельство
                                    МФО</a></li>
                            <li><a href="theme/site/new/docs/Свидетельство-СРО(1).pdf" target="_blank" rel="noopener">Свидетельство
                                    СРО</a></li>
                            <li><a href="theme/site/new/docs/Соглашение-об-использовании-АСП.pdf" target="_blank"
                                   rel="noopener">Соглашение об использовании АСП</a></li>
                            <li><a href="theme/site/new/docs/Общие_условия_договора_потребительского_займа.pdf"
                                   target="_blank" rel="noopener">Общие условия договора потребительского займа</a></li>
                            <li><a href="theme/site/new/docs/Лист записи(1).rtf" target="_blank" rel="noopener">Лист
                                    записи о государственной регистрации</a></li>
                            <li><a href="theme/site/new/docs/Устав-.pdf">Устав</a></li>
                            <li><a href="theme/site/new/docs/Устав-.pdf">Устав</a></li>
                            <li><a href="files/docs/Свидетельство_ИП_Тихомирова_Г.П..pdf">Свидетельство ИП Тихомирова Г.П.</a></li>
                            <li>Почтовый ящик для связи с ИП Тихомирова Г.П. - doc@eco-zaim.ru</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <div class="hide">
        <div class="info-modal" id="sms_code_modal"></div>
        <div class="info-modal" id="error_modal">
            <span class="error-icon"></span>
            <span class="error-message js-error-message"></span>
        </div>
        <div class="info-modal" id="success_modal">
            <span class="success-message js-success-message"></span>
        </div>

        <div class="info-modal" id="repeat_contract_modal">
            <div class="head_3">Поздравляем займ погашен!</div>
            <p class="light_text text-center">
                У Вас есть возможность <a href="" style="color: #007bff">оформить</a> новый займ, с повышенным лимитом.
            </p>
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
<script src="theme/site/js/attach_card.app.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script>
    $('.slick-reviews__list').slick({
        infinite: true,
        slidesToShow: 2,
        slidesToScroll: 1,
        prevArrow: '<button type="button" class="slick-prev"><span>‹</span></button>',
        nextArrow: '<button type="button" class="slick-next"><span>›</span></button>',
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    arrows: true,
                    slidesToShow: 1
                }
            },
        ]
    });
</script>
<script>
    $('a.q_open').on('click', (event) => {
        event.preventDefault();
        $(event.target).toggleClass('active');
        $(event.target).siblings(".answer").slideToggle(300);
    });
</script>
{$smarty.capture.page_scripts}


{if !$is_developer}
    <script src="//code-ya.jivosite.com/widget/UATBY3Z0Ou" async></script>
{/if}

{if $message_error}
    <script>
        $('.js-error-message').html('{$message_error}');
        $.fancybox.open({
            src: '#error_modal'
        })
    </script>
{/if}

{if $closedContract}
    <script>
        $.fancybox.open({
            src: '#repeat_contract_modal'
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

</body>
</html>
