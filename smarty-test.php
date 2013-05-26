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

  $context = array();
  $context['ability'] = array(
    'memorize' => 'Are you able to memorize menus and last minute additions to menus?',
    'workday' => 'Are you able to work an eight (8) hour shift?',
    'standing' => 'Are you able to stand for long periods?',
    'lift' => 'Are you able to lift up to 50 lbs?',
    'holidays' => 'Are you available to work weekends and holidays?',
    'late_nights' => 'Are you able to work late nights?',
    'carry' => 'Can you carry a food or beverage tray with no problem?',
    'cheerful' => "Are you able to maintain cheerful, professional attitute even if you're having a bad day?");
  $context['transportation'] = array(
    'outside' => 'Are you able to travel to different job sites outside of Temecula?',
    'license_valid' => "Do you have a valid California driver's license?",
    'reliable' => 'Do you have reliable transportation?');
  $context['other_questions'] = array(
    'friend' => 'Do you currently have a friend or relative working for Temecula Catering?',
    'email_access' => 'Do you have <strong>daily</strong> access to email?',
    'phone_reliable' => 'Do you have a <strong>reliable</strong> cell phone?',
    'screening' => 'Will you submit to drug screening prior to employment and random screenings?');
  $smarty->assign('errors', array());

  $form = new Form($_POST);
  if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $isValid = $form->isValid();
    $postProcessor = new PostProcessor($form->cleanedData());
    $context = array_merge($postProcessor->process(), $context);
    if ($isValid) {
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
  $smarty->display('main.tpl');
?>