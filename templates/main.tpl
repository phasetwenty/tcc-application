<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Temecula Catering - Application</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.10.3.custom.min.css">
    <link rel="stylesheet" type="text/css" href="css/tcc-application.css">
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
      $(".datepicker").datepicker();
    });
    </script>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <img src="http://temecula-catering.com/images/HomeBanner2.jpg" alt="temecula catering">
      </div>
      <div class="page-header row">
        <h1 class="text-center">Temecula Catering Employment Application</h1>
        <p>Thank you for your interest in employment with Temecula Catering. Please fill out the fields below for consideration.</p>
      </div>
      <form class="row" action="" method="POST" enctype="multipart/form-data">
        <div class="row">
          <fieldset class="span12 offset3">
            <input id="last_name" class="input-medium" placeholder="Last Name" type="text" name="last_name">
            <input id="first_name" class="input-medium" placeholder="First Name" type="text" name="first_name">
            <input id="middle_initial" class="input-mini" placeholder="MI" type="text" name="middle_initial">
          </fieldset>
        </div>
        <div class="row">
          <fieldset class="span6">
            <legend>Contact Information</legend>
            {include file='address.tpl' prefix='contact_' address_to_label='Address'}
            <div class="form-horizontal">
              {include file='control_group.tpl'
                input_class='input-small'
                label_text='Driver License Number'
                name='driver_license'}
              {include file='control_group.tpl'
                input_class='input-medium'
                label_text='Phone Number'
                name='phone_number'}
              {include file='control_group.tpl'
                input_class='input-large'
                label_text='Email'
                name='email'}
            </div>
          </fieldset>
          <fieldset class="span6">
            <legend>Applicant Information</legend>
            <div class="form-horizontal">
              {include file='control_group.tpl'
                input_class='datepicker input-small'
                label_text='Date Available'
                name='date_available'}
              {include file='control_group_dollar.tpl'
                input_class='input-mini'
                label_text='Desired Salary'
                name='desired_salary'}
            </div>
          </fieldset>
          <fieldset class="span6">
            <legend>Position Desired</legend>
            <label class="checkbox"><input type="checkbox" name="position_desired[]" value="busser">Busser</label>
            <label class="checkbox"><input type="checkbox" name="position_desired[]" value="server">Server</label>
            <label class="checkbox"><input type="checkbox" name="position_desired[]" value="lead_server">Lead Server</label>
            <label class="checkbox"><input type="checkbox" name="position_desired[]" value="cook">Cook</label>
            <label class="checkbox"><input type="checkbox" name="position_desired[]" value="sous_chef">Sous Chef</label>
            <label class="checkbox"><input type="checkbox" name="position_desired[]" value="dishwasher">Dishwasher</label>
          </fieldset>
        </div>
        <div class="row">
          <fieldset class="span12">
            <legend>Status</legend>
            {include file='yesno.tpl' prompt_class='span6' radio_class='span2' prompt='Are you a citizen of the United States?' name='citizen' }
            {include file='yesno.tpl' prompt_class='span6' radio_class='span2' prompt='If no, are you authorized to work in the United States?' name='authorized' }
            {include file='yesno.tpl' prompt_class='span6' radio_class='span2' prompt='Have you ever worked for this company?' name='prior_employment' }
            {include file='yesno.tpl' prompt_class='span6' radio_class='span2' prompt='Have you ever been convicted of a felony?' name='felony' }
            <textarea rows="4" name="felony_explain" placeholder="If yes, please explain"></textarea>
          </fieldset>
        </div>
        <div class="row">
          <fieldset>
            <legend>Education</legend>
              {include file='education_row.tpl' prefix='hs_' address_to_label='High School'}
              <hr>
              {include file='education_row.tpl' prefix='college_' address_to_label='College'}
              <hr>
              {include file='education_row.tpl' prefix='other_' address_to_label='Other'}
          </fieldset>
        </div>
        <fieldset>
          <legend>References</legend>
          <p><strong>Please list three (3) professional references.</strong></p>
          {include file='reference_row.tpl' prefix='reference1_' address_to_label='Address'}
          <hr>
          {include file='reference_row.tpl' prefix='reference2_' address_to_label='Address'}
          <hr>
          {include file='reference_row.tpl' prefix='reference3_' address_to_label='Address'}
        </fieldset>
        <fieldset>
          <legend>Previous Employment</legend>
          <p><strong>Please list up to the last three (3) previous employers.</strong></p>
          {include file='previous_employment_row.tpl' prefix='previous_employment1_'}
          <hr>
          {include file='previous_employment_row.tpl' prefix='previous_employment2_'}
          <hr>
          {include file='previous_employment_row.tpl' prefix='previous_employment3_'}
        </fieldset>
        <fieldset>
          <legend>Military Service</legend>
          <label for="military_branch">Branch:</label>
          <input id="military_branch" type="text" name="military_branch">
          <label for="military_from_Month">From:</label>
          {html_select_date display_days=FALSE prefix="military_from_" reverse_years=TRUE start_year=-50}
          <label for="military_to_Month">To:</label>
          {html_select_date display_days=FALSE prefix="military_to_" reverse_years=TRUE start_year=-50}
          <label for="military_rank">Ranch at Discharge:</label>
          <input id="military_rank" type="text" name="military_rank">
          <label for="military_discharge">Type of Discharge:</label>
          <input id="military_discharge" type="text" name="military_discharge">
          <label for="military_explain">If other than honorable, explain:</label>
          <textarea id="military_explain" rows="10" cols="50" name="military_explain"></textarea>
        </fieldset>
        <fieldset>
          <legend>Job Performance</legend>
          <fieldset>
            <legend>Ability</legend>
            {include file='yesno.tpl' prompt='Are you able to memorize menus and last minute additions to menus?' name='memorize'}
            {include file='yesno.tpl' prompt='Are you able to work an eight (8) hour shift?' name='workday'}
            {include file='yesno.tpl' prompt='Are you able to stand for long periods?' name='standing'}
            {include file='yesno.tpl' prompt='Are you able to lift up to 50 lbs?' name='lift'}
            {include file='yesno.tpl' prompt='Are you available to work weekends and holidays?' name='holidays'}
            {include file='yesno.tpl' prompt='Are you able to work late nights?' name='late_nights'}
            {include file='yesno.tpl' prompt='Can you carry a food or beverage tray with no problem?' name='carry'}
            {include file='yesno.tpl' prompt="Are you able to maintain cheerful, professional attitute even if you're having a bad day?" name='cheerful'}
          </fieldset>
          <fieldset>
            <legend>Transportation</legend>
            {include file='yesno.tpl' prompt='Are you able to travel to different job sites outside of Temecula?' name='outside'}
            {include file='yesno.tpl' prompt="Do you have a valid California driver's license?" name='license_valid'}
            {include file='yesno.tpl' prompt='Do you have reliable transportation?' name='reliable'}
            {include file='yesno.tpl' prompt='Do you currently have a friend or relative working for Temecula Catering?' name='friend'}
            {include file='yesno.tpl' prompt='Do you have <strong>daily</strong> access to email?' name='email_access'}
            {include file='yesno.tpl' prompt='Do you have a <strong>reliable</strong> cell phone?' name='phone_reliable'}
            {include file='yesno.tpl' prompt='Will you submit to drug screening prior to employment and random screenings?' name='screening'}
          </fieldset>
          <fieldset>
            <legend>Disclaimer and Signature</legend>
            <p><em>I certify that my answers are true and complete to the best of my knowledge.</em></p>
            <p><em>If this application leads to employment, I understand that false or misleading information in my application or interview may result in my immediate release.</em></p>
            <label for="signature_name">Name:</label>
            <input id="signature_name" type="text" name="signature_name">
            <label for="signature_date">Date:</label>
            <input id="signature_date" class="datepicker" type="text" name="signature_date">
            <p><em>Please take a moment to double check your application prior to submitting.</em></p>
            <input type="submit" value="Apply">
          </fieldset>
        </fieldset>
      </form>
      <div id="footer">
        <p>Copyright {$smarty.now|date_format:"%Y"} Temecula Catering</p>
      </div>
    </div>
  </body>
</html>