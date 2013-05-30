<?php
  class PostProcessor {

    private $data;

    public function __construct(&$data) {
      $this->data = $data;
    }

    public function &process() {
      $this->data['position_desired_str'] = implode(', ', $this->data['position_desired']);
      return $this->data;
    }
  }
?>