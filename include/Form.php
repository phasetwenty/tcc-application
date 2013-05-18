<?php
class Form {
  private static $booleanFields = array('authorized', 'carry', 'cheerful', 'citizen', 'felony', 
    'holidays', 'late_nights', 'memorize', 'lift', 'prior_employment', 'standing', 'workday');
  private static $dateFields = array('date_available');
  private static $numericFields = array('desired_salary');
  private static $requiredFields = array('last_name', 'first_name', 'contact_address_to', 
    'contact_city', 'contact_zip', 'driver_license', 'phone_number');

  private $cleaned;
  private $cleanedData;
  private $data;
  private $errors;

  public function __construct($data) {
    $this->data = $data;
    $this->cleaned = FALSE;
    $this->cleanedDate = array();
    $this->errors = array();
  }

  public function &cleanedData() {
    if (!$this->cleaned) {
      $this->clean();
    }
    return $this->cleanedData;
  }

  public function getErrors() {
    if (!$this->cleaned) {
      $this->clean();


    }

    return $this->errors;
  }

  public function isValid() {
    if (!$this->cleaned) {
      $this->clean();
      $this->getErrors();
    }
    return empty($this->errors);
  }

  private function clean() {
    $this->cleanedData = array();
    foreach ($data as $k => $v) {
      $this->cleanedData[$k] = mysql_real_escape_string(htmlentities($v));
    }
    $this->cleaned = TRUE;
  }

  private function isRequired($key) {
    return array_key_exists($key, $requiredFields);
  }

  /*
   * This was not done in the style of the other validators because to work the way I want,
   * it operates directly on Form class members like $errors and $cleanedData.
   */
  private function validateRequired($fields, $message) {
    /*
    $mapMessageToFields = array(
      'This field is required.' => self::$requiredFields,
      'Please make a selection.' => self::$booleanFields);
     */
    foreach ($fields as $fieldName) {
      if (!array_key_exists($fieldName, $this->cleanedData)) {
        $this->errors[$fieldName] = $message;
      }
    }
  }
}
?>