<?php

class StageAddressController extends Controller
{
    public function fetch()
    {
        if (empty($this->user))
        {
            header('Location: /lk/login');
            exit;
        }
        
        if (!empty($this->user->stage_address))
        {
            header('Location: /stage/work');
            exit;
        }
        
        if (empty($this->user->stage_passport))
        {
            header('Location: /stage/passport');
            exit;
        }
        
        if ($this->request->get('step') == 'prev')
        {
            $this->users->update_user($this->user->id, array('stage_passport'=>0));
            header('Location: /stage/passport');
            exit;
        }
        
        if ($this->request->method('post'))
        {
            $Faktregion = (string)$this->request->post('Faktregion');
            $Faktcity = (string)$this->request->post('Faktcity');
            $Faktdistrict = (string)$this->request->post('Faktdistrict');
            $Faktlocality = (string)$this->request->post('Faktlocality');
            $Faktdistrict_shorttype = (string)$this->request->post('Faktdistrict_shorttype');
            $Faktlocality_shorttype = (string)$this->request->post('Faktlocality_shorttype');
            $Faktstreet = (string)$this->request->post('Faktstreet');
            $Fakthousing = (string)$this->request->post('Fakthousing');
            $Faktbuilding = (string)$this->request->post('Faktbuilding');
            $Faktroom = (string)$this->request->post('Faktroom');
            $Faktindex = (string)$this->request->post('Faktindex');
            $Faktregion_shorttype = (string)$this->request->post('Faktregion_shorttype');
            $Faktcity_shorttype = (string)$this->request->post('Faktcity_shorttype');
            $Faktstreet_shorttype = (string)$this->request->post('Faktstreet_shorttype');

            if ($this->request->post('clone_address', 'integer'))
            {
                $Regregion = $Faktregion;
                $Regcity = $Faktcity;
                $Regdistrict = $Faktdistrict;
                $Regdistrict_shorttype = $Faktdistrict_shorttype;
                $Reglocality = $Faktlocality;
                $Reglocality_shorttype = $Faktlocality_shorttype;
                $Regstreet = $Faktstreet;
                $Reghousing = $Fakthousing;
                $Regbuilding = $Faktbuilding;
                $Regroom = $Faktroom;
                $Regindex = $Faktindex;
                $Regregion_shorttype = $Faktregion_shorttype;
                $Regcity_shorttype = $Faktcity_shorttype;
                $Regstreet_shorttype = $Faktstreet_shorttype;
            }
            else
            {
                $Regregion = (string)$this->request->post('Regregion');
                $Regcity = (string)$this->request->post('Regcity');
                $Regdistrict = (string)$this->request->post('Regdistrict');
                $Reglocality = (string)$this->request->post('Reglocality');
                $Regdistrict_shorttype = (string)$this->request->post('Regdistrict_shorttype');
                $Reglocality_shorttype = (string)$this->request->post('Reglocality_shorttype');
                $Regstreet = (string)$this->request->post('Regstreet');
                $Reghousing = (string)$this->request->post('Reghousing');
                $Regbuilding = (string)$this->request->post('Regbuilding');
                $Regroom = (string)$this->request->post('Regroom');
                $Regindex = (string)$this->request->post('Regindex');
                $Regregion_shorttype = (string)$this->request->post('Regregion_shorttype');
                $Regcity_shorttype = (string)$this->request->post('Regcity_shorttype');
                $Regstreet_shorttype = (string)$this->request->post('Regstreet_shorttype');                
            }


            $this->design->assign('Faktregion', $Faktregion);
            $this->design->assign('Faktcity', $Faktcity);
            $this->design->assign('Faktstreet', $Faktstreet);
            $this->design->assign('Faktdistrict', $Faktdistrict);
            $this->design->assign('Faktdistrict_shorttype', $Faktdistrict_shorttype);
            $this->design->assign('Faktlocality', $Faktlocality);
            $this->design->assign('Faktlocality_shorttype', $Faktlocality_shorttype);
            $this->design->assign('Fakthousing', $Fakthousing);
            $this->design->assign('Faktbuilding', $Faktbuilding);
            $this->design->assign('Faktroom', $Faktroom);
            $this->design->assign('Faktindex', $Faktindex);
            $this->design->assign('Faktregion_shorttype', $Faktregion_shorttype);
            $this->design->assign('Faktcity_shorttype', $Faktcity_shorttype);
            $this->design->assign('Faktstreet_shorttype', $Faktstreet_shorttype);

            $this->design->assign('Regregion', $Regregion);
            $this->design->assign('Regcity', $Regcity);
            $this->design->assign('Regdistrict', $Regdistrict);
            $this->design->assign('Regdistrict_shorttype', $Regdistrict_shorttype);
            $this->design->assign('Reglocality', $Reglocality);
            $this->design->assign('Reglocality_shorttype', $Reglocality_shorttype);
            $this->design->assign('Regstreet', $Regstreet);
            $this->design->assign('Reghousing', $Reghousing);
            $this->design->assign('Regbuilding', $Regbuilding);
            $this->design->assign('Regroom', $Regroom);
            $this->design->assign('Regindex', $Regindex);
            $this->design->assign('Regregion_shorttype', $Regregion_shorttype);
            $this->design->assign('Regcity_shorttype', $Regcity_shorttype);
            $this->design->assign('Regstreet_shorttype', $Regstreet_shorttype);
            $time_zone = $this->request->post('time_zone');
            
            
            $errors = array();
            
            if (empty($Faktregion))
                $errors[] = 'empty_faktregion';

            if (empty($time_zone))
                $errors[] = 'empty_time_zone';
            else{
                if($time_zone == 'msk')
                    $time_zone = 0;
            }

            if (empty($Faktcity) && empty($Faktlocality))
                $errors[] = 'empty_faktcity';
            if (empty($Fakthousing))
                $errors[] = 'empty_fakthousing';

            if (empty($Regregion))
                $errors[] = 'empty_regregion';
            if (empty($Regcity) && empty($Reglocality))
                $errors[] = 'empty_regcity';
            if (empty($Reghousing))
                $errors[] = 'empty_reghousing';
            
            $this->design->assign('errors', $errors);

            if (empty($errors))
            {
                $update = array(
                    'Faktregion' => $Faktregion,
                    'Faktcity' => $Faktcity,
                    'Faktdistrict' => $Faktdistrict,
                    'Faktdistrict_shorttype' => $Faktdistrict_shorttype,
                    'Faktlocality' => $Faktlocality,
                    'Faktlocality_shorttype' => $Faktlocality_shorttype,
                    'Faktstreet' => $Faktstreet,
                    'Fakthousing' => $Fakthousing,
                    'Faktbuilding' => $Faktbuilding,
                    'Faktroom' => $Faktroom,
                    'Faktindex' => $Faktindex,
                    'Faktregion_shorttype' => $Faktregion_shorttype,
                    'Faktcity_shorttype' => $Faktcity_shorttype,
                    'Faktstreet_shorttype' => $Faktstreet_shorttype,

                    'Regregion' => $Regregion,
                    'Regcity' => $Regcity,
                    'Regdistrict' => $Regdistrict,
                    'Regdistrict_shorttype' => $Regdistrict_shorttype,
                    'Reglocality' => $Reglocality,
                    'Reglocality_shorttype' => $Reglocality_shorttype,
                    'Regstreet' => $Regstreet,
                    'Reghousing' => $Reghousing,
                    'Regbuilding' => $Regbuilding,
                    'Regroom' => $Regroom,
                    'Regindex' => $Regindex,
                    'Regregion_shorttype' => $Regregion_shorttype,
                    'Regcity_shorttype' => $Regcity_shorttype,
                    'Regstreet_shorttype' => $Regstreet_shorttype,
                    'time_zone' => $time_zone,
                    'stage_address' => 1,
                );

                $update = array_map('strip_tags', $update);
                
                $this->users->update_user($this->user->id, $update);
            
                header('Location: /stage/work');
                exit;
            }            
        }
        else
        {
            $this->design->assign('Faktregion', $this->user->Faktregion);
            $this->design->assign('Faktcity', $this->user->Faktcity);
            $this->design->assign('Faktdistrict', $this->user->Faktdistrict);
            $this->design->assign('Faktdistrict_shorttype', $this->user->Faktdistrict_shorttype);
            $this->design->assign('Faktlocality', $this->user->Faktlocality);
            $this->design->assign('Faktlocality_shorttype', $this->user->Faktlocality_shorttype);
            $this->design->assign('Faktstreet', $this->user->Faktstreet);
            $this->design->assign('Fakthousing', $this->user->Fakthousing);
            $this->design->assign('Faktbuilding', $this->user->Faktbuilding);
            $this->design->assign('Faktroom', $this->user->Faktroom);
            $this->design->assign('Faktindex', $this->user->Faktindex);
            $this->design->assign('Faktregion_shorttype', $this->user->Faktregion_shorttype);
            $this->design->assign('Faktcity_shorttype', $this->user->Faktcity_shorttype);
            $this->design->assign('Faktstreet_shorttype', $this->user->Faktstreet_shorttype);

            $this->design->assign('Regregion', $this->user->Regregion);
            $this->design->assign('Regcity', $this->user->Regcity);
            $this->design->assign('Regdistrict', $this->user->Regdistrict);
            $this->design->assign('Regdistrict_shorttype', $this->user->Regdistrict_shorttype);
            $this->design->assign('Reglocality', $this->user->Reglocality);
            $this->design->assign('Reglocality_shorttype', $this->user->Reglocality_shorttype);
            $this->design->assign('Regstreet', $this->user->Regstreet);
            $this->design->assign('Reghousing', $this->user->Reghousing);
            $this->design->assign('Regbuilding', $this->user->Regbuilding);
            $this->design->assign('Regroom', $this->user->Regroom);
            $this->design->assign('Regindex', $this->user->Regindex);
            $this->design->assign('Regregion_shorttype', $this->user->Regregion_shorttype);
            $this->design->assign('Regcity_shorttype', $this->user->Regcity_shorttype);
            $this->design->assign('Regstreet_shorttype', $this->user->Regstreet_shorttype);
        }

    	return $this->design->fetch('stage/address.tpl');
    }
    
}