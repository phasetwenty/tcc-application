<?php
  class DateValidator {
    const MESSAGE = 'Please enter a valid date.';

    public static function validate($value) {
      return strptime($value, "%m/%d/%Y") === TRUE ? TRUE : MESSAGE;
    }
  }

  class NumberValidator {
    const MESSAGE = 'Please enter a number.';

    public static function validate($value) {
      return is_numeric($value) ? TRUE : MESSAGE;
    }
  }

  class PositionValidator {
    const MESSAGE = 'Please make a selection.';

    private static $positionFields = array('busser', 'server', 'lead_server', 'cook', 'sous_chef', 
      'dishwasher');

    public static function validate($value) {
      if (is_array($value)) {
        foreach (self::$positionFields as $position) {
          if (in_array($position, $value)) {
            return TRUE;
          }
        }
      }
      return MESAGE;
    }
  }

  class RequiredFieldValidator {
    const MESSAGE = 'This field is required.';



    public static function validate($value) {
      if (is_array($value)) {

      }
      return MESSAGE;
    }
  }

  class YearValidator {
    const MESSAGE = 'Please enter a valid year.';

    public static function validate($value) {
      $int = intval($value);
      return $int >= 1900 && $int <= getdate()['year'] ? TRUE : MESSAGE;
    }
  }

?>