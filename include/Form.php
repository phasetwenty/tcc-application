<?php
class Form {
  private $dateFields = array('date_available')
  private $positionFields = array('busser', 'server', 'lead_server', 'cook', 'sous_chef', 'dishwasher');
  private $numericFields = array('desired_salary');
  private $requiredFields = array('last_name', 'first_name', 'contact_address_to', 'contact_city', 
    'contact_zip', 'driver_license', 'phone_number');

  private $cleanedData;
  private $data;
  private $errors;
  private $cleaned;

  public __construct($data) {
    $this->data = $data;
    $this->cleaned = FALSE;
  }

  public function clean() {
    $this->cleanedData = array();
    foreach ($data as $k => $v) {
      $this->cleanedData[$k] = mysql_real_escape_string(htmlentities($v));
    }
    $this->cleaned = TRUE;
  }

  public function getErrors() {
    if (!$this->cleaned) {
      $this->clean();
    }

    foreach ($requiredFields as $k => $v) {
      if (!array_key_exists($k, $cleanedData) ||
          empty($cleanedData[$k])) {
        errors[$k] = 'This field is required.';
      }
    }
  }

  public function hasErrors() {
    if (!$this->cleaned) {
      $this->clean();
      $this->getErrors();
    }
    return !empty($this->errors);
  }

  public function isValid() {
    return $this->hasErrors();
  }

  private function isRequired($key) {
    return array_key_exists($key, $requiredFields);
  }

  private function validateDate($value) {
    return strptime($value, "%m/%d/%Y") === FALSE;
  }

  private function validateNumber($value) {
    return is_numeric($value);
  }

  private function validateYear($value) {
    $yearInt = intval($value);
    return $yearInt >= 1900 && $yearInt <= getdate()['year'];
  }
}
?>