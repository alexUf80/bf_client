<?php

class Documents extends Core
{
    private $templates = array(

        'IND_USLOVIYA_NL' => 'individualnie-usloviya-nl.tpl',
        'IND_USLOVIYA_NL_ZERO' => 'individualnie-usloviya-nl-zero.tpl',
        'SOGLASIE_VZAIMODEYSTVIE' => 'soglasie-na-vzaimodeystvie.tpl',
        'POLIS_STRAHOVANIYA' => 'polis-strahovaniya.08.02.2022.tpl',
        'SOGLASIE_SCORING' => 'soglasie-dlya-skoringa.tpl',
        'SOGLASIE_SPISANIE' => 'soglasie-na-spisanie.tpl',
        'SOLGLASHENIE_PEP' => 'soglashenie-pep.tpl',
        'SOGLASIE_MEGAFON' => 'soglasie-dlya-megafona.tpl', // согласие на иную частоту взаимодействия
        'ANKETA_PEP' => 'zayavlenie-o-vidache-zayma.08.02.2022.tpl',// заявление на выдачу займа
        'PRICHINA_OTKAZA' => 'zayavlenie-na-uslugu-uznay-prichinu-otkaza.tpl',

        'DOP_SOGLASHENIE_PROLONGATSIYA' => 'dopolnitelnoe-soglashenie-o-prolongatsii.tpl',
        'POLIS_ZAKRITIE' => 'polis-zakritie.tpl',

        'DOP_USLUGI_VIDACHA' => 'soglasie-na-okazanie-dopuslugi-pri-vidache.070922.tpl',
        'BUD_V_KURSE' => 'bud_v_kurse.tpl',

        'DOP_USLUGI_PROLONGATSIYA' => 'soglasie-na-okazanie-dopuslugi-pri-prolongatsii.tpl',

        'SUD_PRIKAZ' => 'sudblock_prikaz.tpl',
        'SUD_SPRAVKA' => 'sudblock_spravka.tpl',
        'SUD_VOZBUZHDENIE' => 'sudblock_spravka.tpl',
        'SOGLASIE_OPD' => 'obrabotka_personalnyh_dannyh.070922.tpl',
    );


    private $names = array(
        'ANKETA_PEP' => 'Заявление-анкета на получение займа',
        'IND_USLOVIYA_NL_ZERO' => 'Индивидуальные условия(без подписи)',
        'SOLGLASHENIE_PEP' => 'Соглашение об АСП',
        'SOGLASIE_VZAIMODEYSTVIE' => 'Согласие на взаимодействие с 3 лицами',
        'SOGLASIE_MEGAFON' => 'Согласие на иную частоту взаимодействия',
        'SOGLASIE_SCORING' => 'Согласие на получение КИ',
        'SOGLASIE_SPISANIE' => 'Соглашение о рекуррентных платежах',
        'PRICHINA_OTKAZA' => 'Заявление на услугу Узнай причину отказа',
        'DOP_SOGLASHENIE_PROLONGATSIYA' => 'Дополнительное соглашение',

        'POLIS_ZAKRITIE' => 'Полис при закрытии',

        'IND_USLOVIYA_NL' => 'Индивидуальные условия',
        'POLIS_STRAHOVANIYA' => 'Полис страхования',
        'DOP_USLUGI_VIDACHA' => 'Заявление на страхование',
        'BUD_V_KURSE' => 'Будь в курсе',

        'DOP_USLUGI_PROLONGATSIYA' => 'Согласие на оказание доп услуги при пролонгации',

        'SUD_PRIKAZ' => 'Заявление о вынесении судебного приказа',
        'SUD_SPRAVKA' => 'Справка',
        'SUD_VOZBUZHDENIE' => 'Заявление о возбуждении испольнительного производства',
        'SOGLASIE_OPD' => 'Согласие на обработку персональных данных заемщика'

    );

    private $client_visible = array(
        'ANKETA_PEP' => 1,
        'IND_USLOVIYA_NL_ZERO' => 1,
        'SOLGLASHENIE_PEP' => 1,
        'SOGLASIE_VZAIMODEYSTVIE' => 0,
        'SOGLASIE_MEGAFON' => 0,
        'SOGLASIE_SCORING' => 0,
        'SOGLASIE_SPISANIE' => 0,
        'PRICHINA_OTKAZA' => 0,
        'DOP_SOGLASHENIE_PROLONGATSIYA' => 1,

        'IND_USLOVIYA_NL' => 1,
        'POLIS_STRAHOVANIYA' => 1,
        'POLIS_ZAKRITIE' => 1,
        'DOP_USLUGI_VIDACHA' => 1,
        'BUD_V_KURSE' => 1,

        'DOP_USLUGI_PROLONGATSIYA' => 0,

        'SUD_PRIKAZ' => 0,
        'SUD_SPRAVKA' => 0,
        'SUD_VOZBUZHDENIE' => 0,
        'SOGLASIE_OPD' => 0
    );



    public function create_document($data)
    {
        $id =  $this->add_document(array(
            'user_id' => isset($data['user_id']) ? $data['user_id'] : 0,
            'order_id' => isset($data['order_id']) ? $data['order_id'] : 0,
            'contract_id' => isset($data['contract_id']) ? $data['contract_id'] : 0,
            'type' => $data['type'],
            'name' => $this->names[$data['type']],
            'template' => $this->templates[$data['type']],
            'client_visible' => $this->client_visible[$data['type']],
            'params' => $data['params'],
            'created' => isset($data['created']) ? $data['created'] : date('Y-m-d H:i:s'),
        ));

        return $id;
    }

    public function get_templates()
    {
    	return $this->templates;
    }

    public function get_template($type)
    {
    	return isset($this->templates[$type]) ? $this->templates[$type] : null;
    }

    public function get_template_name($type)
    {
    	return isset($this->names[$type]) ? $this->names[$type] : null;
    }    
    
	public function get_document($id)
	{
//		$this->db->query('SET NAMES '.$this->config->db_charset);
        $query = $this->db->placehold("
            SELECT *
            FROM __documents
            WHERE id = ?
        ", (int)$id);
        $this->db->query($query);
        if ($result = $this->db->result())
            $result->params = unserialize($result->params);
//        $result->content = iconv('utf8', 'cp1251', $result->content);
        return $result;
    }

	public function get_documents($filter = array())
	{
		$id_filter = '';
		$user_id_filter = '';
		$order_id_filter = '';
		$contract_id_filter = '';
		$client_visible_filter = '';
        $keyword_filter = '';
        $limit = 1000;
		$page = 1;

        if (!empty($filter['id']))
            $id_filter = $this->db->placehold("AND id IN (?@)", array_map('intval', (array)$filter['id']));

        if (!empty($filter['user_id']))
            $user_id_filter = $this->db->placehold("AND user_id IN (?@)", array_map('intval', (array)$filter['user_id']));

        if (!empty($filter['order_id']))
            $order_id_filter = $this->db->placehold("AND order_id IN (?@)", array_map('intval', (array)$filter['order_id']));

        if (!empty($filter['contract_id']))
            $contract_id_filter = $this->db->placehold("AND contract_id IN (?@)", array_map('intval', (array)$filter['contract_id']));

        if (isset($filter['client_visible']))
            $client_visible_filter = $this->db->placehold("AND client_visible = ?", (int)$filter['client_visible']);

		if(isset($filter['keyword']))
		{
			$keywords = explode(' ', $filter['keyword']);
			foreach($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND (name LIKE "%'.$this->db->escape(trim($keyword)).'%" )');
		}

		if(isset($filter['limit']))
			$limit = max(1, intval($filter['limit']));

		if(isset($filter['page']))
			$page = max(1, intval($filter['page']));

        $sql_limit = $this->db->placehold(' LIMIT ?, ? ', ($page-1)*$limit, $limit);

        $query = $this->db->placehold("
            SELECT *
            FROM __documents
            WHERE 1
                $id_filter
        		$user_id_filter
        		$order_id_filter
        		$contract_id_filter
                $client_visible_filter
 	            $keyword_filter
            ORDER BY id ASC
            $sql_limit
        ");
        $this->db->query($query);
        if ($results = $this->db->results())
        {
            foreach ($results as $result)
            {
                $result->params = unserialize($result->params);
            }
        }

        return $results;
	}

	public function count_documents($filter = array())
	{
        $id_filter = '';
		$user_id_filter = '';
		$order_id_filter = '';
		$contract_id_filter = '';
        $client_visible_filter = '';
        $keyword_filter = '';

        if (!empty($filter['id']))
            $id_filter = $this->db->placehold("AND id IN (?@)", array_map('intval', (array)$filter['id']));

        if (!empty($filter['user_id']))
            $user_id_filter = $this->db->placehold("AND user_id IN (?@)", array_map('intval', (array)$filter['user_id']));

        if (!empty($filter['order_id']))
            $order_id_filter = $this->db->placehold("AND order_id IN (?@)", array_map('intval', (array)$filter['order_id']));

        if (!empty($filter['contract_id']))
            $contract_id_filter = $this->db->placehold("AND contract_id IN (?@)", array_map('intval', (array)$filter['contract_id']));

        if (isset($filter['client_visible']))
            $client_visible_filter = $this->db->placehold("AND client_visible = ?", (int)$filter['client_visible']);

        if(isset($filter['keyword']))
		{
			$keywords = explode(' ', $filter['keyword']);
			foreach($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND (name LIKE "%'.$this->db->escape(trim($keyword)).'%" )');
		}

		$query = $this->db->placehold("
            SELECT COUNT(id) AS count
            FROM __documents
            WHERE 1
                $id_filter
        		$user_id_filter
        		$order_id_filter
        		$contract_id_filter
                $client_visible_filter
                $keyword_filter
        ");
        $this->db->query($query);
        $count = $this->db->result('count');

        return $count;
    }

    public function add_document($document)
    {
        $document = (array)$document;

        if (isset($document['params']))
            $document['params'] = serialize($document['params']);

		$query = $this->db->placehold("
            INSERT INTO __documents SET ?%
        ", $document);
        $this->db->query($query);
        $id = $this->db->insert_id();
//echo __FILE__.' '.__LINE__.'<br /><pre>';var_dump($query);echo '</pre><hr />';exit;
        return $id;
    }

    public function update_document($id, $document)
    {
        $document = (array)$document;

        if (isset($document['params']))
            $document['params'] = serialize($document['params']);

		$query = $this->db->placehold("
            UPDATE __documents SET ?% WHERE id = ?
        ", $document, (int)$id);
        $this->db->query($query);

        return $id;
    }

    public function delete_document($id)
    {
		$query = $this->db->placehold("
            DELETE FROM __documents WHERE id = ?
        ", (int)$id);
        $this->db->query($query);
    }

    public function get_document_by_template($user_id, $type)
    {
        $query = $this->db->placehold("
            SELECT *
            FROM __documents
            WHERE user_id = ?
            and `type` = ?
        ", (int)$user_id, $type);
        $this->db->query($query);
        if ($result = $this->db->result())
            $result->params = unserialize($result->params);
        return $result;
    }
}