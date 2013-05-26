<?php
  class PostProcessor {
    private static $school_prefixes = array('hs_', 'college_', 'other_');

    private $data;

    public function __construct(&$data) {
      $this->data = $data;
    }

    public function &process() {
      $this->data['position_desired_str'] = implode(', ', $this->data['position_desired']);
      $this->data['school_prefixes'] = self::$school_prefixes;

      $this->data['prev_employment_prefixes'] = array('previous_employment1_', 'previous_employment2_', 'previous_employment3_');
      $this->data['reference_prefixes'] = array('reference1_', 'reference2_', 'reference3_');

      return $this->data;
    }
  }
?>