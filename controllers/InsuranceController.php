<?php

class InsuranceController extends Controller
{
    public function fetch()
    {
        return $this->design->fetch('insurance.tpl');
    }
}