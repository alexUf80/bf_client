{$meta_title='Подтверждение платежа' scope=parent}

{capture name='page_scripts'}
    <script src="theme/site/js/payment.app.js?v=1.22"></script>
    <script>
        $('.js-toggle-agreement-list').click(function (e) {
            e.preventDefault();

            $('#agreement_list').slideToggle()
        })

        $('#check_agreement').on('click', function () {
            if ($(this).is(':checked')) {
                $('input[type="checkbox"]').each(function () {
                    $(this).prop('checked', true);
                });
            } else {
                $('input[type="checkbox"]').each(function () {
                    $(this).prop('checked', false);
                });
            }

        });

        $('#confirm_payment').click(function (e) {
            var _error = 0;
            var _agreement = $('.js-loan-agreement').is(':checked');

            $('.js-need-check').each(function () {
                if (!$(this).is(':checked')) {
                    _error = 1;
                    $(this).closest('.check').addClass('-error');
                }
                else {
                    $(this).closest('.check').removeClass('-error');
                }
            })

            if (!_agreement) {
                $('.js-loan-agreement-block').addClass('-error');

                _error = 1;
            }
            else {
                $('.js-loan-agreement-block').removeClass('-error');
            }

            if (_error){
                e.preventDefault();
            }
            else{
                if($(this).attr('disabled')){
                    return;
                    e.preventDefault();
                }
                $(this).attr('disabled', true);
                $(this).hide();
            }

        })
    </script>
{/capture}

{capture name='page_styles'}
    <style>
        input[type="checkbox"] + label:before {
            min-width: 30px !important;
        }
    </style>
{/capture}

<main class="main js-lk-app">
    <div class="section_lk_navbar">
        <div class="container">
            <nav class="navbar lk_menu">
                <ul class="nav lk_menu_nav -gil-m">
                    <li class="nav-item">
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
                </ul>
            </nav>
        </div>
    </div>
    <div class="content_wrap">
        <div class="container">

            {if $error_time}
                <h2 class="text-danger text-center">
                    Уважаемый клиент, <br/>ведутся технические работы, <br/>повторите попытку через 10 минут
                </h2>
            {else}
                <h1>Подтверждение платежа</h1>
                <div class="new_order_box " data-status="{$order->status}" data-order="{$order->order_id}">

                    <input type="hidden" name="amount" value="{$amount}"/>
                    <input type="hidden" name="contract_id" value="{$contract_id}"/>
                    <input type="hidden" name="code_sms" value="{$code_sms}"/>

                    <div class="hide payment-block-error alert alert-danger">

                    </div>

                    <div class="row">

                        {if $error}
                            <div class="col-12">
                                <div class="alert alert-danger">
                                    {$error}
                                </div>
                            </div>
                        {/if}

                        <div class="col-12">
                            <div class="-fs-32 -gil-b -green text-center pb-3">
                                Сумма платежа {$amount} руб.
                            </div>
                        </div>
                        <div class="col-md-8 pt-4">

                            <ul class="payment-card-list row">
                                {foreach $cards as $card}
                                    <li class="col-12 col-md-4 col-sm-6 ">
                                        <input type="radio" name="card_id" id="card_{$card->id}" value="{$card->id}"
                                               {if $card@first}checked{/if} />
                                        <label for="card_{$card->id}">
                                            <strong>{$card->pan}</strong>
                                            <span>{$card->expdate}</span>
                                        </label>
                                    </li>
                                {/foreach}
                                <li class="col-12 col-md-4 col-sm-6 ">
                                    <input type="radio" id="card_other" name="card_id" value="other"
                                           {if !$cards}checked=""{/if} />
                                    <label for="card_other">
                                        <strong>Другая карта</strong>
                                        <span>&nbsp;</span>
                                    </label>
                                </li>
                            </ul>

                        </div>
                        <div class="col-md-4">
                            {if $amount == $full_amount}
                                <div>
                                    <div class="pt-4 text-center">
                                        <a href="#" id="close_contract" data-full-amount="{$full_amount}"
                                           class="btn btn-primary btn-block">
                                            {if $contract->status == 11}
                                                Оплатить займ
                                            {else}
                                                Погасить займ
                                            {/if}
                                        </a>
                                    </div>
                                </div>
                            {else}
                                {*}
                                {*}
                                <div class="order_accept_icon"></div>
                                <div class="form-group">
                                    <div class="form_row">
                                        <div class="check mb-0 js-loan-agreement-block">
                                            <input type="checkbox" class="custom-checkbox js-loan-agreement"
                                                    id="check_agreement" name="agreement" value="1"/>
                                            <label for="check_agreement" class="check_box -gil-m">
                                                <span>Я ознакомлен и согласен со <a href="#agreement_list"
                                                                                    class="green-link js-toggle-agreement-list">следующим</a></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div id="agreement_list" style="display:none" class="pr-3 pl-3">
                                    <ul>
                                    </ul>
                                    <div class="">
                                        <div class="form_row">
                                            <div class="check">
                                                <input type="hidden" class="custom-checkbox" name="pers" value="1"/>
                                                <input type="checkbox"
                                                    class="custom-checkbox" {if !in_array($user->phone_mobile, ['79171018924', '79179400617'])}{/if}
                                                    id="pers" checked value="1"/>
                                                <label for="pers" class="check_box -gil-m">
                                                <span>
                                                    Согласие на обработку
                                                    <a href="/files/about/soglasie_opd.pdf" target="_blank"
                                                    style="color: #4A2982">персональных данных</a>
                                                </span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="form_row">
                                            <div class="check">
                                                <input type="hidden" class="custom-checkbox" name="soglasie_pep" value="1"/>
                                                <input type="checkbox" class="custom-checkbox" id="soglasie_pep" checked value="1"/>
                                                <label for="soglasie_pep" class="check_box -gil-m">
                                                <span>
                                                    Соглашение
                                                    <a style="color: #4A2982" href="/files/about/soglashenie_o_ispolzovanii_pep.pdf" target="_blank"> АСП</a>
                                                </span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="form_row">
                                            <div class="check">
                                                <input type="hidden" class="custom-checkbox" name="pravila" value="1"/>
                                                <input type="checkbox" class="custom-checkbox js-need-check" id="pravila" checked value="1"/>
                                                <label for="pravila" class="check_box -gil-m">
                                                <span>
                                                    Правила предоставления
                                                    <a style="color: #4A2982" href="/files/about/pravila_predostavleniya.pdf" target="_blank"> микрозаймов</a>
                                                </span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="form_row">
                                            <div class="check">
                                                <input type="hidden" class="custom-checkbox" name="service_insurance" value="1"/>
                                                <input type="checkbox"
                                                    class="custom-checkbox"
                                                    id="service_insurance" checked value="1"/>
                                                <label for="service_insurance" class="check_box -gil-m">
                                                <span>
                                                    согласен заключить договор страхования в соответствии
                                                    <a style="color: #4A2982" href="/files/about/strahovanie_kart.pdf" target="_blank">с правилами страхования карт</a>
                                                </span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="form_row">
                                            <div class="check">
                                                <input type="hidden" class="custom-checkbox" name="obshie_usloviya" value="1"/>
                                                <input type="checkbox"
                                                    class="custom-checkbox js-need-check"
                                                    id="obshie_usloviya" checked value="1"/>
                                                <label for="obshie_usloviya" class="check_box -gil-m">
                                                <span>
                                                    Общие условия
                                                    <a style="color: #4A2982" href="/files/about/obshie_usloviya.pdf" target="_blank"> потребительского микрозайма</a>
                                                </span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="form_row">
                                            <div class="check">
                                                <input type="hidden" class="custom-checkbox" name="vozvrat" value="1"/>
                                                <input type="checkbox"
                                                    style="width: 100px" class="custom-checkbox js-need-check"
                                                    id="vozvrat" checked value="1"/>
                                                <label for="vozvrat" class="check_box -gil-m">
                                                <span>
                                                    Информация об условиях предоставления, использования
                                                    <a style="color: #4A2982" href="/files/about/predostavlenie_vozvrat.pdf" target="_blank"> и возврата потребительского микрозайма</a>
                                                </span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    {*}
                                    {if $order->contract}
                                    {*}
                                        <div class="">
                                            <div class="form_row">
                                                <div class="check">
                                                    <input type="hidden" class="custom-checkbox" name="ind_usloviya" value="1"/>
                                                    <input type="checkbox" class="custom-checkbox js-need-check" id="ind_usloviya" checked value="1"/>
                                                    <label for="ind_usloviya" class="check_box -gil-m">
                                                        <a style="color: #4A2982"
                                                        href="{$config->root_url}/preview/dop_soglashenie?contract_id={$contract_id}"
                                                        target="_blank">
                                                            <span>Дополнительное соглашение</span>
                                                        </a>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        {*}
                                        {foreach $documents as $document}
                                            {if $document->type == 'ANKETA_PEP'}
                                                <div class="">
                                                    <div class="form_row">
                                                        <div class="check">
                                                            <input type="hidden" class="custom-checkbox" name="pep" value="1"/>
                                                            <input type="checkbox" class="custom-checkbox" id="pep" value="1"/>
                                                            <label for="pep" class="check_box -gil-m">
                                                                <a class="pep" style="color: #4A2982"
                                                                href="/document/{$order->user_id}/{$document->id}?insurance=1"
                                                                target="_blank">
                                                                    <span>Заявление на получение займа</span>
                                                                </a>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/if}
                                        {/foreach}
                                        {*}
                                    {*}
                                    {/if}
                                    {*}
                                </div>
                                {*}
                                {*}


                                <input type="hidden" name="prolongation" value="{$prolongation}">
                                <div class="pt-4 text-center">
                                    <a href="#" id="confirm_payment" class="btn btn-primary btn-block">Оплатить</a>
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>
            {/if}


        </div>
    </div>
</main>
