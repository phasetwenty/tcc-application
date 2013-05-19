<?php
  require_once('include/Smarty-3.1.13/Smarty.class.php');
  require_once('include/Form.php');

  define('PROJECT_ROOT', '/home/chris/Workspace/tcc-application/');
  define('WORKING_DIR', '/var/www/tcc-application/');

  $application = new Smarty();
  $application->setTemplateDir(PROJECT_ROOT . 'templates/web/');
  $application->setCompileDir(WORKING_DIR . 'compile/');
  $application->setCacheDir(WORKING_DIR . 'cache/');

  $application->assign('errors', array());
  $application->assign('context', array());
  $form = new Form($_POST);
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $_ = $form->isValid();
    $application->assign('errors', $form->errors());
    $application->assign('context', $form->cleanedData());
    
    $email = new Smarty();
    $email->setTemplateDir(PROJECT_ROOT . 'templates/email/');
    $email->setCompileDir(WORKING_DIR . 'compile/');
    $email->setCacheDir(WORKING_DIR . 'cache/');
    $email->assign($form->cleanedData());
    $email->display('body.tpl');
    /*
    if ($form->isValid()) {
      // Create email
    } else {
      $smarty->assign('errors', $form->errors());
      $smarty->assign('context', $form->cleanedData());
    }
    */
  }
  $application->display('main.tpl');
  printf("<pre>Errors\n%s</pre>", var_export($form->errors(), true));
  printf("<pre>Context\n%s</pre>", var_export($form->cleanedData(), true));
  printf("<pre>_POST\n%s</pre>", var_export($_POST, true));
?>