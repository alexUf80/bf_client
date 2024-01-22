<?php

class Documents extends Core
{
    private $templates = array(
        'IND_USLOVIYA_NL' => 'dogovor.tpl',
        'IND_USLOVIYA_NL_24-01-21' => 'dogovor_24-01-21.tpl',
        'ANKETA_PEP' => 'zayavlenie_na_poluchenie.tpl',
        'ANKETA_PEP_24-01-21' => 'zayavlenie_na_poluchenie_24-01-21.tpl',
        'SOGLASIE_OPD' => 'soglasie_opd.tpl',
        'POLIS' => 'polis.tpl',
        'KID' => 'kid.tpl',
        'POLIS_24-01-21' => 'polis_24-01-21.tpl',
        'KID_24-01-21' => 'kid_24-01-21.tpl',
        'DOP_SOGLASHENIE' => 'prolongation.tpl',
        'POLIS_PROLONGATION' => 'polis_prolongation.tpl',
        'KID_PROLONGATION' => 'kid_prolongation.tpl',
        'POLIS_PROLONGATION_POROG' => 'polis_prolongation_porog.tpl',
        'KID_PROLONGATION_POROG' => 'kid_prolongation_porog.tpl',
        'POLIS_PROLONGATION_POROG_24-01-21' => 'polis_prolongation_porog_24-01-21.tpl',
        'KID_PROLONGATION_POROG_24-01-21' => 'kid_prolongation_porog_24-01-21.tpl',
        'DOP_RESTRUCT' => 'restruct.tpl',
        'GRAPH_RESTRUCT' => 'restruct-ps.tpl',
        'INF_MESSAGE_PDN' => 'message_pdn.tpl',
        'UVEDOMLENIE_OTKAZ_OT_USLUG' => 'uvedomlenie_otkaz_ot_uslug.tpl',
        'DOGOVOR_REJECT_REASON' => 'dogovor_reject_reason.tpl',
    );


    private $names = array(
        'IND_USLOVIYA_NL' => 'Индивидуальные условия',
        'IND_USLOVIYA_NL_24-01-21' => 'Индивидуальные условия',
        'ANKETA_PEP' => 'Заявление-анкета на получение займа',
        'ANKETA_PEP_24-01-21' => 'Заявление-анкета на получение займа',
        'SOGLASIE_OPD' => 'Согласие на обработку персональных данных заемщика',
        'POLIS' => 'Полис страхования',
        'KID' => 'Ключевой информационный документ об условиях добровольного страхования',
        'POLIS_24-01-21' => 'Полис страхования',
        'KID_24-01-21' => 'Ключевой информационный документ об условиях добровольного страхования',
        'DOP_SOGLASHENIE' => 'Дополнительное соглашение о пролонгации',
        'POLIS_PROLONGATION' => 'Полис страхования',
        'KID_PROLONGATION' => 'Ключевой информационный документ (пролонгация)',
        'POLIS_PROLONGATION_POROG' => 'Полис страхования (пролонгация).',
        'KID_PROLONGATION_POROG' => 'Ключевой информационный документ (пролонгация).',
        'POLIS_PROLONGATION_POROG_24-01-21' => 'Полис страхования (пролонгация).',
        'KID_PROLONGATION_POROG_24-01-21' => 'Ключевой информационный документ (пролонгация).',
        'DOP_RESTRUCT' => 'Дополнительное соглашение о реструктуризации',
        'GRAPH_RESTRUCT' => 'График платежей погашения задолженности',
        'INF_MESSAGE_PDN' => 'Информационное сообщение о превышении ПДН',
        'UVEDOMLENIE_OTKAZ_OT_USLUG' => 'Уведомление о праве отказаться от дополнительных услуг',
        'DOGOVOR_REJECT_REASON' => 'Договор на оказание услуги Причина отказа',
    );

    private $client_visible = array(
        'IND_USLOVIYA_NL' => 1,
        'IND_USLOVIYA_NL_24-01-21' => 1,
        'ANKETA_PEP' => 0,
        'ANKETA_PEP_24-01-21' => 0,
        'SOGLASIE_OPD' => 1,
        'POLIS' => 1,
        'KID' => 1,
        'POLIS_24-01-21' => 1,
        'KID_24-01-21' => 1,
        'DOP_SOGLASHENIE' => 1,
        'POLIS_PROLONGATION' => 1,
        'KID_PROLONGATION' => 1,
        'POLIS_PROLONGATION_POROG' => 1,
        'KID_PROLONGATION_POROG' => 1,
        'POLIS_PROLONGATION_POROG_24-01-21' => 1,
        'KID_PROLONGATION_POROG_24-01-21' => 1,
        'DOP_RESTRUCT' => 1,
        'GRAPH_RESTRUCT' => 1,
        'INF_MESSAGE_PDN' => 1,
        'UVEDOMLENIE_OTKAZ_OT_USLUG' => 1,
        'DOGOVOR_REJECT_REASON' => 1,
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
        $query = $this->db->placehold("
            SELECT *
            FROM __documents
            WHERE id = ?
        ", (int)$id);
        $this->db->query($query);
        $result = $this->db->result();
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