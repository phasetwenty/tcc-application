<?php
  class DateValidator {
    const MESSAGE = 'Please enter a valid date.';

    public static function validate($value) {
      return is_array(strptime($value, "%m/%d/%Y")) ? true : DateValidator::MESSAGE;
    }
  }

  class NumberValidator {
    const MESSAGE = 'Please enter a number.';

    public static function validate($value) {
      return is_numeric($value) ? true : NumberValidator::MESSAGE;
    }
  }

  class PositionValidator {
    const MESSAGE = 'Please make a selection.';
    /*
     * TODO: Put these in a central location so they can't get out of sync with the template values.
     */
    private static $positionFields = array('busser', 'server', 'lead_server', 'cook', 'sous_chef', 
      'dishwasher', 'events_equipment_manager');

    public static function validate($value) {
      if (is_array($value)) {
        foreach (self::$positionFields as $position) {
          if (in_array($position, $value)) {
            return true;
          }
        }
      }
      return PositionValidator::MESSAGE;
    }
  }

  class YearValidator {
    const MESSAGE = 'Please enter a valid year.';

    public static function validate($value) {
      $int = intval($value);
      $date = getdate();
      /*
       * Discovered that function array referencing was added in 5.4, and may not be supported
       * on a general server.
       */
      return $int >= 1900 && $int <= $date['year'] ? true : YearValidator::MESSAGE;
    }
  }

?>