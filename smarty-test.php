<?php
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

  $smarty->assign('errors', array());
  $smarty->assign('context', array());
  $form = new Form($_POST);
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $_ = $form->isValid();
    $smarty->assign('errors', $form->errors());
    
    $postProcessor = new PostProcessor($form->cleanedData());
    $context = $postProcessor->process();
    $smarty->assign('context', $context);
    /*
    if ($form->isValid()) {
      // Create email
    } else {
      $smarty->assign('errors', $form->errors());
      $smarty->assign('context', $form->cleanedData());
    }
    */
  }
  $smarty->display('debug.tpl');

?>