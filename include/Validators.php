<?php
  class DateValidator {
    const MESSAGE_DATE = 'Please enter a valid date.';
    const MESSAGE_PERIOD = 'Please select a valid period.';
    const MESSAGE_YEAR = 'Please enter a valid year.';

    public static function validateDateString($value) {
      return is_array(strptime($value, "%m/%d/%Y")) ? true : self::MESSAGE_DATE;
    }

    /*
     * Validate the individual values separately, so that you can get the correct error message
     * applied to each.
     */
    public static function validateYearPeriod($valueFrom, $valueTo) {
      $intFrom = intval($valueFrom);
      $intTo = intval($valueTo);
      return $intFrom < $intTo ? true : self::MESSAGE_PERIOD;
    }

    public static function validateYear($value) {
      $int = intval($value);
      $date = getdate();
      return $int >= 1900 && $int <= $date['year'] ? true : self::MESSAGE_YEAR;
    }
  }

  class EducationValidator {
    const MESSAGE_STRING = 'This field is required.';
    private static $PREFIXES = array('hs_', 'college_', 'other_');
    private static $STRING_FIELDS = array('address_to', 'street_number', 'city', 'state', 'zip', 
      'degree');
    private static $YEAR_FIELDS = array('from_Year', 'to_Year');

    private $data;

    public function __construct($data) {
      $this->data = $data;
    }

    public function validateOne($name, $value) {
      foreach (self::$PREFIXES as $prefix) {
        $name = str_replace($prefix, '', $name);
      }

      if (in_array($name, self::STRING_FIELDS)) {
        return empty($value) ? self::MESSAGE_STRING : true;
      } else if (in_array($name, self::$YEAR_FIELDS)) {
        return DateValidator::validateYear($value) ? true : DateValidator::MESSAGE_YEAR;
      }

    }

  }

  class NumberValidator {
    const MESSAGE = 'Please enter a number.';

    public static function validate($value) {
      return is_numeric($value) ? true : self::MESSAGE;
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
      return self::MESSAGE;
    }
  }

?>