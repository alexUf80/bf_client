{capture name='page_scripts'}


{/capture}

{capture name='page_styles'}
    
{/capture}

<main class="main">
  <div class="section ">
    <div class="container">
      <div class="section_row row">

        
        <div class="col-lg-12">
          <h1>{$page->name}</h1>
            {if $page->url == 'documents'}
            <h2>Правоустанавливающие документы</h2>
            <div class="row">
				<div class="col-md-6">
                    <ul class="docs_list">				
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/bazovij_standart_zaschity_prav_i_interesov_fiz_i_yur_lits.pdf" target="_blank">Базовый стандарт защиты прав и интересов физических и юридических лиц - получателей финансовых услуг</a></li>
						<li class="docs_list_item"><a class="docs_list_link" href="/files/about/bazovij_standart_sovershenija_operatsij.pdf" target="_blank">Базовый стандарт совершения микрофинансовой организацией операций на финансовом рынке</a></li>
						<li class="docs_list_item"><a class="docs_list_link" href="/files/about/infirmatsionnaja_pamyatka_banka_rossii_o_mfo.pdf" target="_blank">Информационная памятка Банка России о МФО</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/informatsija_dlya_poluchatelej_finansovoj_uslugi_4.pdf" target="_blank">Информация для получателя финансовой услуги</a></li>
						<li class="docs_list_item"><a class="docs_list_link" href="/files/about/informatsija_o_sluzhbe_finansovogo_upolnomochenogo.pdf" target="_blank">Информация о службе финансового уполномоченного</a></li>
						<li class="docs_list_item"><a class="docs_list_link" href="/files/about/obschie_usloviya.pdf" target="_blank">Общие условия</a></li>
						<li class="docs_list_item"><a class="docs_list_link" href="/files/about/svidetelstvo_o_chlenstve_sro_edinstvo.pdf" target="_blank">Свидетельство о членстве в СРО Единство</a></li>
						<li class="docs_list_item"><a class="docs_list_link" href="/files/about/svidetelstvo_na_tovarnij_znak.pdf" target="_blank">Свидетельство на товарный знак</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/usloviya_dogovora_strahovanija.pdf" target="_blank">Условия договора страхования</a></li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <ul class="docs_list">				
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/svidetelstvo_o_vnesenii_svedenij_v_gosreestr_mfo.pdf" target="_blank">Свидетельство  о внесении сведений в гос.реестр МФО</a></li>
        				<li class="docs_list_item"><a class="docs_list_link" href="/files/about/polozhenie_o_porjadke_i_sbore_personalnih_dannyh.pdf" target="_blank">Положение о порядке сбора обработки хранения персональных данных</a></li>
        				<li class="docs_list_item"><a class="docs_list_link" href="/files/about/pravila_predostavlenija_mikrozajmov.pdf" target="_blank">Правила предоставления микрозаймов</a></li>
        				<li class="docs_list_item"><a class="docs_list_link" href="/files/about/spisok_lits_okazyvajuschih_suschestvennoe_vlijanie_nalplus.pdf" target="_blank">Список лиц, оказывающих существенное влияние</a></li>
        				<li class="docs_list_item"><a class="docs_list_link" href="/files/about/pismo_banka_rossii_ot_10_06_2020.pdf" target="_blank">Письмо Банка России от 10.06.2020 N 44-3-13 1359 О сервисе на едином портале государственных и муниципальных услуг</a></li>
        				<li class="docs_list_item"><a class="docs_list_link" href="/files/about/politika_bezopasnosti_platezhej_nalichnoe.pdf" target="_blank">Политика  безопасности  платежей</a></li>
        				<li class="docs_list_item"><a class="docs_list_link" href="/files/about/informatsionnoe_pismo_po_dostupnosti_distantsionnyh_kanalov.pdf" target="_blank">Информационное письмо о рекомендациях по доступности дистанционных каналов для потребителей финансовых услуг</a></li>
        				<li class="docs_list_item"><a class="docs_list_link" href="/files/about/Pravila_195_strahovanie_ot_ns.pdf" target="_blank">Правила № 195 комбинированного страхования от несчастных случаев и болезней</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/Реквизиты_Общества.pdf" target="_blank">Реквизиты Общества</a></li>
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
