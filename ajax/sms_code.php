<?php
error_reporting(-1);
ini_set('display_errors', 'On');

session_start();

chdir('..');
require 'autoload.php';

class SmsCode extends Core
{
    // задержка между отправкой смс
    private $delay = 30;

    private $response = array();

    public function run()
    {
        $phone = $this->request->get('phone', 'string');

        $action = $this->request->get('action', 'string');
        switch ($action):

            case 'send':

                $this->send_action($phone);

                break;

            case 'send_accept_code':

                $this->send_accept_code_action($phone);

                break;

            case 'check':

                $code = $this->request->get('code', 'string');

                $this->check_action($phone, $code);

                break;

            case 'check_accept_sms':

                $this->check_accept_sms_action();

                break;

        endswitch;

        $this->output();
    }

    private function check_accept_sms_action()
    {
        $accept_code = $this->request->get('code');
        $contract_id = $this->request->get('contract_id');

        if ($contract = $this->contracts->get_contract($contract_id)) {
            if ($contract->accept_code == $accept_code) {
                $this->response['success'] = 1;
            } else {
                $this->response['error'] = 'Код не совпадает';
            }
        } else {
            $this->response['error'] = 'Договор не найден!';
        }
    }


    private function send_accept_code_action($phone)
    {
        if (!empty($_SESSION['sms_time']) && ($_SESSION['sms_time'] + $this->delay) > time()) {
            $this->response['error'] = 'sms_time';
            $this->response['time_left'] = $_SESSION['sms_time'] + $this->delay - time();
        } else {
            $contract_id = $this->request->get('contract_id', 'integer');
            if ($contract = $this->contracts->get_contract($contract_id)) {
                $msg = 'Активируй займ ' . ($contract->amount * 1) . ' в личном кабинете, код' . $contract->accept_code;
                if (!empty($this->is_developer)) {
                    $this->response['mode'] = 'developer';
                    $this->response['developer_code'] = $contract->accept_code;

                    $this->response['message'] = $msg;
                } else {
                    $send_response = $this->sms->send($phone, $msg);
                    $send_response = $send_response['response'];

                    $message =
                        [
                            'code' => $contract->accept_code,
                            'phone' => $phone,
                            'response' => "$send_response"
                        ];

                    $this->sms->add_message($message);

                    $this->response['response'] = $send_response;

                    $this->response['mode'] = 'standart';
                }

                $_SESSION['sms_time'] = time();

                $this->response['success'] = true;
                if (empty($_SESSION['sms_time']))
                    $this->response['time_left'] = 0;
                else
                    $this->response['time_left'] = ($_SESSION['sms_time'] + $this->delay) - time();

            } else {
                $this->response['error'] = 'Договор не найден!';
            }
        }
    }

    private function send_action($phone)
    {

        $ip = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '';
        $date_from = date('Y-m-d', time());
        $date_to = date('Y-m-d', time() + 1 * 86400);
        // до 19.09 14:57
        $close_ip = ['103.251.167.20', '104.244.79.44', '104.244.79.50', '104.244.79.61', '107.189.1.175', '107.189.1.9', '107.189.13.253', '107.189.13.91', '107.189.14.4', '107.189.2.108', '107.189.29.184', '107.189.30.69', '107.189.30.86', '107.189.31.232', '107.189.4.12', '107.189.4.209', '107.189.5.18', '107.189.6.36', '107.189.7.114', '107.189.7.141', '107.189.8.226', '109.70.100.2', '109.70.100.3', '109.70.100.4', '109.70.100.5', '109.70.100.6', '109.70.100.65', '109.70.100.66', '109.70.100.67', '109.70.100.69', '109.70.100.70', '109.70.100.71', '141.98.11.62', '154.213.185.133', '162.247.74.216', '162.247.74.27', '171.25.193.78', '176.126.15.8', '176.59.200.32', '178.17.174.164', '179.43.159.199', '185.100.85.22', '185.100.87.166', '185.107.57.64', '185.129.61.5', '185.132.53.12', '185.183.159.40', '185.207.107.130', '185.220.100.241', '185.220.100.242', '185.220.100.243', '185.220.100.247', '185.220.100.248', '185.220.100.249', '185.220.100.251', '185.220.100.252', '185.220.100.253', '185.220.100.254', '185.220.100.255', '185.220.101.0', '185.220.101.1', '185.220.101.10', '185.220.101.101', '185.220.101.102', '185.220.101.103', '185.220.101.104', '185.220.101.107', '185.220.101.109', '185.220.101.11', '185.220.101.110', '185.220.101.12', '185.220.101.13', '185.220.101.136', '185.220.101.139', '185.220.101.14', '185.220.101.158', '185.220.101.16', '185.220.101.162', '185.220.101.168', '185.220.101.17', '185.220.101.170', '185.220.101.18', '185.220.101.19', '185.220.101.190', '185.220.101.2', '185.220.101.20', '185.220.101.21', '185.220.101.22', '185.220.101.29', '185.220.101.30', '185.220.101.34', '185.220.101.36', '185.220.101.37', '185.220.101.38', '185.220.101.4', '185.220.101.40', '185.220.101.44', '185.220.101.45', '185.220.101.48', '185.220.101.49', '185.220.101.5', '185.220.101.55', '185.220.101.58', '185.220.101.6', '185.220.101.60', '185.220.101.64', '185.220.101.65', '185.220.101.66', '185.220.101.67', '185.220.101.68', '185.220.101.7', '185.220.101.70', '185.220.101.72', '185.220.101.73', '185.220.101.74', '185.220.101.75', '185.220.101.76', '185.220.101.77', '185.220.101.78', '185.220.101.79', '185.220.101.8', '185.220.101.82', '185.220.101.83', '185.220.101.84', '185.220.101.87', '185.220.101.88', '185.220.101.9', '185.220.101.99', '185.241.208.115', '185.241.208.202', '185.241.208.206', '185.241.208.81', '185.244.192.175', '185.246.188.149', '185.246.188.74', '185.252.232.218', '185.40.4.101', '185.40.4.132', '185.40.4.38', '185.40.4.92', '185.40.4.94', '185.40.4.95', '185.56.83.83', '188.244.106.81', '192.42.116.19', '192.42.116.20', '192.42.116.24', '193.189.100.197', '193.233.133.109', '193.26.115.43', '194.26.192.161', '195.176.3.19', '195.80.151.242', '199.195.251.119', '199.195.251.78', '2.56.10.36', '2.58.56.220', '2.58.56.35', '204.8.96.122', '204.8.96.154', '204.8.96.155', '204.8.96.163', '204.8.96.82', '207.188.137.212', '209.141.59.116', '23.154.177.19', '23.154.177.20', '23.154.177.21', '23.154.177.22', '23.154.177.24', '23.154.177.25', '23.154.177.26', '23.154.177.8', '31.42.47.99', '37.252.254.33', '37.252.255.135', '45.128.157.46', '45.129.84.246', '45.132.246.245', '45.134.225.36', '45.138.16.113', '45.138.16.222', '45.138.16.76', '45.139.122.176', '45.141.215.114', '45.141.215.17', '45.141.215.40', '45.141.215.80', '45.141.215.81', '45.141.215.88', '45.148.10.111', '45.9.148.113', '45.94.31.180', '5.255.115.58', '5.255.117.56', '5.255.127.222', '5.255.99.108', '5.45.102.93', '5.79.66.19', '51.81.33.188', '54.36.209.253', '54.36.209.254', '77.221.159.193', '77.221.159.75', '77.91.86.95', '78.142.18.219', '79.137.198.213', '80.94.92.106', '84.252.120.163', '89.37.95.34', '89.58.63.200', '91.132.144.59', '92.243.24.163', '92.246.84.133', '94.142.241.194', '94.228.169.70'];

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
        if (count($results) >= 3 || in_array($ip, $close_ip)) {
            $this->response['error'] = 'sms_time';
            $this->response['time_left'] = $_SESSION['sms_time'] + $this->delay - time();
        }

         else 
         if (!empty($_SESSION['sms_time']) && ($_SESSION['sms_time'] + $this->delay) > time()) {
            $this->response['error'] = 'sms_time';
            $this->response['time_left'] = $_SESSION['sms_time'] + $this->delay - time();
        } else {
            if ($phone == '7000 000-0011')
                $rand_code = '0000';
            else
                $rand_code = mt_rand(1000, 9999);

            $sms_message = array(
                'code' => $rand_code,
                'phone' => $phone,
                'ip' => isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '',
                'created' => date('Y-m-d H:i:s'),
            );
            $this->response['phone'] = $phone;
            if (!empty($this->is_developer)) {
                $this->response['mode'] = 'developer';
                $this->response['developer_code'] = $rand_code;

                $sms_message['response'] = 'DEVELOPER MODE';
            } else {
                $via_call = $this->request->get('via_call', 'string');

                if ($via_call) {
                    $send_response = $this->sms->send_code_via_call($phone);

                    file_put_contents(__DIR__ . DIRECTORY_SEPARATOR . 'call.log', date("Y-m-d H:i:s") . ' - ' . $send_response . "\n", FILE_APPEND | LOCK_EX);
                    preg_match('/.+ (CODE - (?<code>\d+))/ui', $send_response, $match);
                    if (isset($match['code'])) {
                        $code = substr($match['code'], -4);
                        $sms_message['code'] = $code;
                    }

                    $this->delay = 60;

                    $this->response['response'] = $send_response;
                    $sms_message['response'] = $send_response;
                } else {
                    $send_response = $this->sms->send($phone, "$rand_code - код подтверждения https://barents-finans.ru/lk/");
                    // $sms_message['message'] = "$rand_code - код подтверждения https://barents-finans.ru/lk/";
                    $this->response['response'] = $send_response;
                    $sms_message['response'] = $send_response;

                    $this->response['mode'] = 'standart';
                }
            }

            $this->sms->add_message($sms_message);

            $_SESSION['sms_time'] = time();

            $this->response['success'] = true;
            if (empty($_SESSION['sms_time']))
                $this->response['time_left'] = 0;
            else
                $this->response['time_left'] = ($_SESSION['sms_time'] + $this->delay) - time();
        }
    }

    private function check_action($phone, $code)
    {
        if ($db_code = $this->sms->get_code($phone)) {
            $this->response['success'] = intval($db_code == $code);

        } else {
            $this->response['success'] = 0;
        }
    }

    private function output()
    {
        header("Content-type: application/json; charset=UTF-8");
        header("Cache-Control: must-revalidate");
        header("Pragma: no-cache");
        header("Expires: -1");

        echo json_encode($this->response);
    }
}

$sms_code = new SmsCode();
$sms_code->run();