<?php

class ContactsController extends Controller
{
    public function fetch()
    {
        return $this->design->fetch('contacts.tpl');
    }
}