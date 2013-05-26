<?php
  require_once('include/Validators.php');

  class Form {
    private static $booleanFields = array('authorized', 'carry', 'cheerful', 'citizen', 'felony',
      'holidays', 'late_nights', 'memorize', 'lift', 'prior_employment', 'standing', 'workday');
    private static $dateFields = array('date_available');
    private static $nameFields = array('last_name', 'first_name');
    private static $numericFields = array('desired_salary');
    private static $requiredFields = array('contact_address_street_number', 'contact_address_city', 
      'contact_address_state', 'contact_address_zip', 'driver_license', 'email', 'phone_number');

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
        $this->validateName(self::$nameFields, 'Please include your full name.');
        $this->validateRequired(self::$booleanFields, 'Please make a selection.');
        $this->validateRequired(self::$requiredFields, 'This field is required.');

        foreach (self::$dateFields as $f) {
          $result = DateValidator::validate($this->cleanedData[$f]);
          if ($result !== true) {
            $this->errors[$f] = $result;
          }
        }

        foreach (self::$numericFields as $f) {
          $result = NumberValidator::validate($this->cleanedData[$f]);
          if ($result !== true) {
            $this->errors[$f] = $result;
          }
        }
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
          $result[$k] = htmlentities($v);
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
     * These validators are customized, unlike the others which are generic for their data types.
     */

    private function validateName($fields, $message) {
      foreach ($fields as $fieldName) {
        if (!array_key_exists($fieldName, $this->cleanedData) ||
            trim($this->cleanedData[$fieldName]) == false) {
          $this->errors['name'] = $message;
        }
      }
    }


    private function validateRequired($fields, $message) {
      foreach ($fields as $fieldName) {
        if (!array_key_exists($fieldName, $this->cleanedData) ||
            trim($this->cleanedData[$fieldName]) == false) {
          $this->errors[$fieldName] = $message;
        }
      }
    }
  }
?>