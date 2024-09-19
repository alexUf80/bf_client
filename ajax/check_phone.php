<?php
error_reporting(0);
ini_set('display_errors', 'Off');

chdir('..');
require 'autoload.php';

class CheckPhone extends Core
{
    private $response = array();

    public function __construct()
    {
    	parent::__construct();
        
    }
    
    
    public function run()
    {
        $phone = $this->request->get('phone');

        $clear_phone = $this->sms->clear_phone($phone);

        $user_id = $this->users->get_phone_user($clear_phone);

        $user = $this->users->get_user($user_id);

        $ip = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '';
        $date_from = date('Y-m-d', time());
        $date_to = date('Y-m-d', time() + 1 * 86400);

        $query = $this->db->placehold("
            SELECT * 
            FROM __sms_messages
            WHERE ip = ?
            and created > ?
            and created < ?
            ORDER BY id DESC 
        ", $ip, $date_from, $date_to);
        $this->db->query($query);
        $results = $this->db->results();
        if (count($results) >= 3) {
            $this->response['too_many'] = $ip;
            $this->captcha();
        }
        else

        if (strlen($clear_phone) != 11)
        {
            $this->response['incorrect'] = $clear_phone;
        }
        else
        {
            if ($user->blocked == 1) {
                $this->response['user_removed'] = 1;
                $this->output();
            }

            if ($exist_id = $this->users->get_phone_user($clear_phone))
            {
                $this->response['user_exists'] = 1;

                $user = $this->users->get_user((int)$exist_id);
                if (empty($this->is_developer))
                    $this->response['have_pass'] = (int)!empty($user->password);
            }
            else
            {
                $this->response['not_found'] = 1;
            }

            $this->captcha();
            

        }

        $this->output();
    }
    
    private function output()
    {
       	header("Content-type: application/json; charset=UTF-8");
        header("Cache-Control: must-revalidate");
        header("Pragma: no-cache");
        header("Expires: -1");	
        
        echo json_encode($this->response);
        exit;

    }

    private function captcha()
    {
        $this->response['recaptcha'] = 0;
        $secret = '6LdP60gqAAAAAIyHOLW3Doz2oLU2WW98nzsKoSg4';


        $this->response['recaptcha'] = $this->request->get('recaptcha');
        if (!empty($this->request->get('recaptcha', 'string'))) {
            $curl = curl_init('https://www.google.com/recaptcha/api/siteverify');
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, 'secret=' . $secret . '&response=' . $this->request->get('recaptcha', 'string'));
            $out = curl_exec($curl);
            curl_close($curl);

            $out = json_decode($out);
            if ($out->success == true) {
                $query = $this->db->placehold('INSERT INTO s_capcha_log SET ?%', array('phone' => $clear_phone));
                $this->db->query($query);
                $this->response['recaptcha'] = 1;
            }
        }
    }
}

$check_phone = new CheckPhone();
$check_phone->run(); 