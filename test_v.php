<?php
error_reporting(-1);
ini_set('display_errors', 'On');

require 'autoload.php';
$core = new Core();

if($_GET['p'] !== 'dD123344_G') {
    exit;
}

var_dump($_GET['id']);
$user = $core->users->get_user((int)$_GET['id']);

$curl = curl_init();

var_dump(date('Y-m-d', strtotime($user->passport_date)));

$gender = [
    'male' => 1,
    'female' => 2
];

$json = '{
    "user": {
        "passport": {
            "series": ' . substr($user->passport_serial, 0, 4) . ',
            "number": ' . substr($user->passport_serial, 5) . ',
            "issued_date": "' . date('Y-m-d', strtotime($user->passport_date)) . '",
            "issued_by": "' . $user->passport_issued . '",
            "issued_city": "' . $user->Regcity . '"
        },
        "person": {
            "last_name": "' . $user->lastname . '",
            "first_name": "' . $user->firstname . '",
            "middle_name": "' . $user->patronymic . '",
            "birthday": "' . date('Y-m-d', strtotime($user->birth)) . '",
            "birthday_city": "' . $user->birth_place . '",
            "gender": ' . $gender[$user->gender] . '
        },
        "registration_address": {
            "city": "' . $user->Regcity . '",
            "street": "' . $user->Regstreet . '"
        }
    },
    "requisites": {
        "member_code": "VK01RR000000",
        "user_id": "VK01RR000005",
        "password": "7MX3KtBJ"
    }
}';
var_dump($json);
