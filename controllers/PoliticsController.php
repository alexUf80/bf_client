<?php

class PoliticsController extends Controller
{
    public function fetch()
    {
        return $this->design->fetch('politics.tpl');
    }
}