<?php
error_reporting(-1);
ini_set('display_errors', 'On');

session_start();

require 'autoload.php';

try 
{
    $view = new IndexController();

/*
    if (1 || empty($view->is_developer))
    {
        echo '<h1 style="color:red;text-align:center;margin-top:10%">На сайте проводятся технические работы. <br />Ориентировочное время окончания 23:00 05.07.2021</h1>';    
        exit;
    }
*/

//echo $_SERVER['SCRIPT_URL'] ;exit;
/*
    if ($_SERVER['SCRIPT_URL'] == '/wl')
    {
        $_SESSION['test_access'] = 1;
        header('Location:/');
        exit;
    }
    elseif (empty($_SESSION['test_access']))
    {
        if (strpos($_SERVER['SCRIPT_URL'], 'document') === false)
        { 
            header('Location:/404');
            exit;
        }
    }
*/
/*
if (!$view->is_developer)
{
            header("http/1.0 403 Forbidden");
        	$_GET['page_url'] = '403';
        	$_GET['module'] = 'PageController';
        	print $view->fetch();   
    exit;
}
*/
  
    if(($res = $view->fetch()) !== false)
    {
        if ($res == 403)
        {
            header("http/1.0 403 Forbidden");
        	$_GET['page_url'] = '403';
        	$_GET['module'] = 'PageController';
        	print $view->fetch();   
        }
        else
        {
        	// Выводим результат
        	header("Content-type: text/html; charset=UTF-8");	
        	print $res;
        
        }
    }
    else 
    { 
    	// Иначе страница об ошибке
    	header("http/1.0 404 not found");
    	
    	// Подменим переменную GET, чтобы вывести страницу 404
    	$_GET['page_url'] = '404';
    	$_GET['module'] = 'PageController';
    	print $view->fetch();   
    }
}
catch (Exception $e)
{
    echo __FILE__.' '.__LINE__.'<br /><pre>';var_dump($e);echo '</pre><hr />'; 
}

