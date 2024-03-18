{capture name='page_scripts'}


{/capture}

{capture name='page_styles'}
    
{/capture}

<main class="main">
  <div class="section ">
    <div class="wrapper">
      <div class="section_row row">

        
        <div class="col-lg-12">
          {* <h1>{$page->name}</h1> *}
          <section class="breadcrumbs">
            <a href="" class="breadcrumbs__link breadcrumbs__link_home">Главная</a>
            <span class="breadcrumbs__separator"> / </span>
            <a class="breadcrumbs__link breadcrumbs__link_active">{$page->name|escape}</a>
          </section>
            {if $page->url == 'documents'}
            <h2>Правоустанавливающие документы</h2>
            <div class="row">
              <div class="col-md-6">
                  <ul class="docs_list">				
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/standart_zashiti.pdf" target="_blank">Базовый стандарт защиты прав и интересов физических и юридических лиц - получателей финансовых услуг</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/baza_mkk.pdf" target="_blank">Базовый стандарт совершения микрофинансовой организацией операций на финансовом рынке</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/mfo_bank_rossii.pdf" target="_blank">Информационная памятка Банка России о МФО</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/sro.pdf" target="_blank">СРО ООО МКК БФ</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/soglashenie_asp.pdf" target="_blank">Соглашение об использовании Аналога собственноручной подписи</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/bank_card_insurance_rules.pdf" target="_blank">Правила страхования банковских карт</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/rules_of_combined_accident_and_disease_insurance.pdf" target="_blank">Правила комбинированного страхования от несчас                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/predostavlenie_vozvrat_new.pdf" target="_blank">Информация об условиях предоставления, использования и возврата потребительского микрозайма</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/recommendations_to_the_client_on_protecting_information_from_the_effects_of_malicious_codes.pdf" target="_blank">Рекомендации клиенту по защите информации от воздействия вредоносных кодов в целях противодействия незаконным фонансовым операциям</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/payment_security_policy.pdf" target="_blank">Политика безопасности платежей</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/ogrn_inn_ooo_mkk_bf.pdf" target="_blank">ОГРН ИНН ООО МКК БФ</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/information_about_the_structure_and_composition_of_the_participants_of_the_microfinance_organization.pdf" target="_blank">Информация о структуре и составе участников микрофинансовой организации ООО МКК БФ</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/instructions_for_repayment_of_the_loan.pdf" target="_blank">Инструкция по погашению займа</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/Consent_OPD_and_KI.pdf" target="_blank">Согласие на обработку персональных данных, и получение информации из бюро кредитных историй</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/memo_on_115_FZ.pdf" target="_blank">Памятка клиенту по 115 ФЗ</a></li>                   
                  </ul>
                </div>
                <div class="col-md-6">
                    <ul class="docs_list">
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/politica_OPD.pdf" target="_blank">Политика в области обработки персональных данных</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/egrul.pdf" target="_blank">ЕГРЮЛ</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/requisites_barents.pdf" target="_blank">Реквизиты ООО МКК Баренц Финанс</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/ustav.pdf" target="_blank">Устав ООО МКК Баренц Финанс</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/ustav_03_08_2022.pdf" target="_blank">Изменения в Устав ООО МКК Баренц Финанс от 03.08.2022</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/ustav_14_06_2023.pdf" target="_blank">Изменения в Устав ООО МКК Баренц Финанс от 14.06.2023</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/ustav_28_06_2022.pdf" target="_blank">Изменения в Устав ООО МКК Баренц Финанс от 28.06.2022</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/baza_po_riskam.pdf" target="_blank">Базовый стандарт по управлению рисками микрофинансовых организаций</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/pravila_predostavleniya_uslugi_prichina_otkaza_bf.pdf" target="_blank">Правила предоставления услуги причина отказа</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/usloviya_uslugi_prichina_otkaza_bf.pdf" target="_blank">Условия предоставления услуги Причина отказа</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/rules_for_granting_microloans.pdf" target="_blank">Правила предоставления потребительских займов</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/general_terms_of_a_consumer_microloan.pdf" target="_blank">Общие условия договора потребительского микрозайма</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/certificate_of_entry_of_information_into_the_state_register.pdf" target="_blank">Свидетельство о внесении сведений в государственный реестр МФО</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/rules_for_granting_credit_holidays.pdf" target="_blank">Правила предоставления кредитных каникул</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/memo_for_mobilized_and_participants.pdf" target="_blank">Памятка для мобилизованных и участников СВО</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/information_provided_to_the_recipient_of_the_financial_service.pdf" target="_blank">Информация предоставляемая получателю финансовой услуги</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/information_on_the_right_of_consumers_of_financial_services_to_appeal_to_the_financial_commissioner.pdf" target="_blank">Информация о праве потребителей финансовых услуг на обращение к финансовому уполномоченному</a></li>                   
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/about_borrowers_and_other_users_pd.pdf" target="_blank">Положение об обработке  ПД заемщиков и иных пользователей сайта</a></li>                   
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/helper_document.pdf" target="_blank">Справочник финансовых продуктов</a></li>
                        {*}
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/Агентский_договор_между_ИП_и_МКК_docx.pdf" target="_blank">Агентский договор между ИП и МКК</Агентский договор между ИП и МКК 115 ФЗ</a></li>                   
                        {*}
                    </ul>
                </div>
            </div>

            <h2>Архив правил предоставления займов</h2>
            <div class="row">
              <div class="col-md-6">
                  <ul class="docs_list">				
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/rules_for_granting_microloans_19_11_2021.pdf" target="_blank">Правила предоставления потребительских займов от 19.11.2021</a></li>
                      <li class="docs_list_item"><a class="docs_list_link" href="/files/about/rules_for_granting_microloans_01_03_2022.pdf" target="_blank">Правила предоставления потребительских займов от 01.03.2022</a></li>
                  </ul>
                </div>
                <div class="col-md-6">
                    <ul class="docs_list">
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/rules_for_granting_microloans_02_06_2022.pdf" target="_blank">Правила предоставления потребительских займов от 02.06.2022</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/rules_for_granting_microloans_16_09_2022.pdf" target="_blank">Правила предоставления потребительских займов от 16.09.2022</a></li>
                    </ul>
                </div>
            </div>
            {/if}

          <div>
              {$page->body}
          </div>
        </div>
      </div>

    </div>
  </div>
</main>
