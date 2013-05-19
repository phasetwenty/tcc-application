<?php
  require_once('include/Smarty-3.1.13/Smarty.class.php');
  require_once('include/Form.php');

  define('PROJECT_ROOT', '/home/chris/Workspace/tcc-application/');
  define('WORKING_DIR', '/var/www/tcc-application/');

  $smarty = new Smarty();
  $smarty->setTemplateDir(PROJECT_ROOT . 'templates/');
  $smarty->setCompileDir(WORKING_DIR . 'compile/');
  $smarty->setCacheDir(WORKING_DIR . 'cache/');

  $smarty->assign('errors', array());
  $smarty->assign('context', array());
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $form = new Form($_POST);
    if (!$form->isValid()) {
      $smarty->assign('errors', $form->errors());
      $smarty->assign('context', $form->cleanedData());
    }

    $smarty->display('main.tpl');
    printf("<pre>Errors\n%s</pre>", var_export($form->errors(), true));
    printf("<pre>Context\n%s</pre>", var_export($form->cleanedData(), true));
    printf("<pre>_POST\n%s</pre>", var_export($_POST, true));
  } else {
    $smarty->display('main.tpl');
  }
?>