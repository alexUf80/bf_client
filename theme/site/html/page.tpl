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
                    </ul>
                </div>
                <div class="col-md-6">
                    <ul class="docs_list">
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/politica_OPD.pdf" target="_blank">Политика в области обработки персональных данных</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/egrul.pdf" target="_blank">ЕГРЮЛ</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/requisites_barents.pdf" target="_blank">Реквизиты ООО МКК Баренц Финанс</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/ustav.pdf" target="_blank">Устав ООО МКК Баренц Финанс</a></li>
                        <li class="docs_list_item"><a class="docs_list_link" href="/files/about/baza_po_riskam.pdf" target="_blank">Базовый стандарт по управлению рисками микрофинансовых организаций</a></li>
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
