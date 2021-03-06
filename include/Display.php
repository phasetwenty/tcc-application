<?php
  class Display {
    public static $POSITIONS_AVAILABLE = array(
      'busser' => 'Busser',
      'server' => 'Server',
      'lead_server' => 'Lead Server',
      'cook' => 'Cook',
      'sous_chef' => 'Sous Chef',
      'dishwasher' => 'Dishwasher',
      'events_equipment_manager'=> 'Events Equipment Manager');

    public static $QUESTIONS = array(
      'ability' => array(
        'memorize' => 'Are you able to memorize menus and last minute additions to menus?',
        'workday' => 'Are you able to work an eight (8) hour shift?',
        'standing' => 'Are you able to stand for long periods?',
        'lift' => 'Are you able to lift up to 50 lbs?',
        'holidays' => 'Are you available to work weekends and holidays?',
        'late_nights' => 'Are you able to work late nights?',
        'carry' => 'Can you carry a food or beverage tray with no problem?',
        'cheerful' => "Are you able to maintain cheerful, professional attitute even if you're having a bad day?"),
      'other_questions' => array(
        'friend' => 'Do you currently have a friend or relative working for Temecula Catering?',
        'email_access' => 'Do you have <strong>daily</strong> access to email?',
        'phone_reliable' => 'Do you have a <strong>reliable</strong> cell phone?',
        'screening' => 'Will you submit to drug screening prior to employment and random screenings?'),
      'status' => array(
        'citizen' => 'Are you a citizen of the United States?',
        'authorized' => 'If no, are you authorized to work in the United States?',
        'prior_employment' => 'Have you ever worked for this company?',
        'felony' => 'Have you ever been convicted of a felony?'),
      'transportation' => array(
        'outside' => 'Are you able to travel to different job sites outside of Temecula?',
        'license_valid' => "Do you have a valid California driver's license?",
        'reliable' => 'Do you have reliable transportation?'));
      public static $SCHOOL_PREFIXES = array('hs_', 'college_', 'other_');

      private static $SECTION_PREFIXES = array(
        'prev_employment_prefixes' => 'previous_employment', 
        'reference_prefixes' => 'reference');

      public static function initial() {
        $result = array_merge(self::$QUESTIONS, 
          array('school_prefixes' => self::$SCHOOL_PREFIXES));
        $result['positions_available'] = self::$POSITIONS_AVAILABLE;

        foreach (self::$SECTION_PREFIXES as $name => $prefix) {
          $section = array();
          for ($i = 1; $i <= 3; $i++) {
            $section[] = sprintf("%s%d_", $prefix, $i);
          }
          $result[$name] = $section;
        }
        return $result;
      }
  }

?>