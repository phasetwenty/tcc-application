<?php
  require_once('include/Display.php');
  require_once('include/Smarty-3.1.13/Smarty.class.php');
  require_once('include/Form.php');
  require_once('include/PostProcessor.php');

  define('PROJECT_ROOT', '/home/chris/Workspace/tcc-application/');
  define('WORKING_DIR', '/var/www/tcc-application/');

  error_reporting(E_ERROR);

  $smarty = new Smarty();
  $smarty->setTemplateDir(array(PROJECT_ROOT . 'templates/',
    'web' => PROJECT_ROOT . 'templates/web/',
    'email' => PROJECT_ROOT . 'templates/email/'));
  $smarty->setCompileDir(WORKING_DIR . 'compile/');
  $smarty->setCacheDir(WORKING_DIR . 'cache/');
  $smarty->debugging = true;

  $context = Display::initialContext();
  $smarty->assign('errors', array());

  $form = new Form($_POST);
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $isValid = $form->isValid();
    $postProcessor = new PostProcessor($form->cleanedData());
    $context = array_merge($postProcessor->process(), $context);
    if ($isValid) {
      $smarty->assign('context', $context);
      $body = $smarty->fetch('file:[email]body.tpl');
      $headers = 'Content-type: text/html; charset=utf-8' . "\r\n";
      $context['email_result'] = mail("phasetwenty@gmail.com", 
        "Temecula Catering Application", 
        $body,
        $headers);
    } else {
      $smarty->assign('errors', $form->errors());
    }
  }
  $smarty->assign('context', $context);
  $smarty->display('debug.tpl');
?>