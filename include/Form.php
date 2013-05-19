<?php
class Form {
  private static $booleanFields = array('authorized', 'carry', 'cheerful', 'citizen', 'felony', 
    'holidays', 'late_nights', 'memorize', 'lift', 'prior_employment', 'standing', 'workday');
  private static $dateFields = array('date_available');
  private static $numericFields = array('desired_salary');
  private static $requiredFields = array('last_name', 'first_name', 'contact_address_to', 
    'contact_address_city', 'contact_address_state', 'contact_address_zip', 'driver_license', 
    'email', 'phone_number');

  private $cleaned;
  private $cleanedData;
  private $data;
  private $errors;

  public function __construct($data) {
    $this->data = $data;
    $this->cleaned = false;
    $this->cleanedData = array();
    $this->errors = array();
  }

  public function &cleanedData() {
    if (!$this->cleaned) {
      $this->clean();
    }
    return $this->cleanedData;
  }

  public function errors() {
    $this->clean();

    if (empty($this->errors)) {
      $this->validateRequired(self::$booleanFields, 'Please make a selection.');
      $this->validateRequired(self::$requiredFields, 'This field is required.');
    }

    return $this->errors;
  }

  public function isValid() {
    $this->clean();
    $this->errors();
    return empty($this->errors);
  }

  private function clean() {
    if (!$this->cleaned) {
      $this->cleanedData = $this->cleanHelper($this->data);
    }
    return $this->cleanedData;
  }

  private function cleanHelper($array) {
    $result = array();
    foreach ($array as $k => $v) {
      if (!is_array($v)) {
        $result[$k] = mysql_real_escape_string(htmlentities($v));
      } else {
        $result[$k] = $this->cleanHelper($v);
      }
    }
    return $result;
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
      if (!array_key_exists($fieldName, $this->cleanedData) ||
          trim($this->cleanedData[$fieldName]) == false) {
        $this->errors[$fieldName] = $message;
      }
    }
  }
}
?>