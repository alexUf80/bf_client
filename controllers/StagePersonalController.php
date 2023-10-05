<?php

class StagePersonalController extends Controller
{
    public function fetch()
    {
        if (empty($this->user))
        {
            header('Location: /lk/login');
            exit;
        }
        
        if (!empty($this->user->stage_personal))
        {
            header('Location: /stage/passport');
            exit;
        }
        
        $errors = array();    
        if ($this->request->method('post'))
        {
            $lastname = trim((string)$this->request->post('lastname'));
            $firstname = trim((string)$this->request->post('firstname'));
            $patronymic = trim((string)$this->request->post('patronymic'));
            $email = trim((string)$this->request->post('email'));
            $gender = trim((string)$this->request->post('gender'));
            $birth = trim((string)$this->request->post('birth'));
            $birth_place = trim((string)$this->request->post('birth_place'));
            $social = trim((string)$this->request->post('social'));

            $this->design->assign('lastname', $lastname);
            $this->design->assign('firstname', $firstname);
            $this->design->assign('patronymic', $patronymic);
            $this->design->assign('email', $email);
            $this->design->assign('gender', $gender);
            $this->design->assign('birth', $birth);
            $this->design->assign('birth_place', $birth_place);
            $this->design->assign('social', $social);
            
            
            if (empty($lastname))
                $errors[] = 'empty_lastname';
            if (empty($firstname))
                $errors[] = 'empty_firstname';
            if (empty($patronymic))
                $errors[] = 'empty_patronymic';
            if (empty($email))
                $errors[] = 'empty_email';
            if (empty($gender))
                $errors[] = 'empty_gender';
            if (empty($birth))
                $errors[] = 'empty_birth';
            if (empty($birth_place))
                $errors[] = 'empty_birth_place';

            $minAge = 18;
            $maxAge = $this->settings->max_age;

            $birthDate = new DateTime(date('Y-m-d', strtotime($birth)));
            $now = new DateTime();

            $birthCheck = explode('.', $birth);
            $birthCheck = checkdate($birthCheck[1], $birthCheck[0], $birthCheck[2]);

            if(date_diff($birthDate, $now)->y < $minAge)
                $errors['young'] = $minAge;

            if(date_diff($birthDate, $now)->y > $maxAge)
                $errors['old'] = $maxAge;

            if(!$birthCheck)
                $errors['format'] = 1;
                
            
            if (empty($errors))
            {
                $update = array(
                    'lastname' => $lastname,
                    'firstname' => $firstname,
                    'patronymic' => $patronymic,
                    'email' => $email,
                    'gender' => $gender,
                    'birth' => $birth,
                    'birth_place' => $birth_place,
                    'social' => $social,
                    'stage_personal' => 1,
                );

                if (isset($_COOKIE['utm_source'])) 
                    $update['utm_source'] = $_COOKIE['utm_source'];
                if (isset($_COOKIE['utm_medium'])) 
                    $update['utm_medium'] = $_COOKIE['utm_medium'];
                if (isset($_COOKIE['utm_campaign'])) 
                    $update['utm_campaign'] = $_COOKIE['utm_campaign'];
                if (isset($_COOKIE['wm_id'])) 
                    $update['webmaster_id'] = $_COOKIE['wm_id'];
                if (isset($_COOKIE['clickid'])) 
                    $update['click_hash'] = $_COOKIE['clickid'];

                $update = array_map('strip_tags', $update);

                $this->users->update_user($this->user->id, $update);
            
                header('Location: /stage/passport');
                exit;
            }            
        }
        else
        {
            $this->design->assign('lastname', $this->user->lastname);
            $this->design->assign('firstname', $this->user->firstname);
            $this->design->assign('patronymic', $this->user->patronymic);
            $this->design->assign('email', $this->user->email);
            $this->design->assign('gender', $this->user->gender);
            $this->design->assign('birth', $this->user->birth);
            $this->design->assign('birth_place', $this->user->birth_place);
            $this->design->assign('social', $this->user->social);
            
        }
    	
        $this->design->assign('errors', $errors);
        
        return $this->design->fetch('stage/personal.tpl');
    }
    
}