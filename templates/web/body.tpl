<div class="container">
  <div class="row">
    <img src="http://temecula-catering.com/images/HomeBanner2.jpg" alt="temecula catering">
  </div>
  <div class="page-header row">
    <h1 class="text-center">Temecula Catering Employment Application</h1>
    <p>Thank you for your interest in employment with Temecula Catering. Please fill out the fields below for consideration.</p>
  </div>
  <form class="row" action="" method="POST" enctype="multipart/form-data">
    {if $smarty.server.REQUEST_METHOD == 'POST'}
      <div class="row">
        <div class="span7">
          {if array_key_exists('email_result', $context)}
            {if $context['email_result'] == true}
              <div class="alert alert-success">
                Your application was successfully sent!
              </div>
            {else}
              <div class="alert alert-error">
                There was a problem transmitting your application. Please try again later.
              </div>
            {/if}
          {elseif !empty($errors)}
            <div class="alert alert-error">
              There were problems with your submission. See below for the errors.
            </div>
          {/if}
        </div>
      </div>
    {/if}
    <fieldset class="span12 offset3">
      <div class="control-group {if array_key_exists('name', $errors)}error{/if}">
        {if array_key_exists('name', $errors)}
          <div>
            <span class="help-inline">{$errors['name']}</span>
          </div>
        {/if}
        <input id="last_name" class="input-medium" placeholder="Last Name" type="text" name="last_name" value="{$context['last_name']}">
        <input id="first_name" class="input-medium" placeholder="First Name" type="text" name="first_name" value="{$context['first_name']}">
        <input id="middle_initial" class="input-mini" placeholder="MI" type="text" name="middle_initial" value="{$context['middle_initial']}">
      </div>
    </fieldset>
    <div class="row">
      <fieldset class="span6">
        <legend>Contact Information</legend>
        {include file='address.tpl' prefix='contact_' show_address_to=false address_to_label=''}
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
        <div class="control-group {if array_key_exists('position_desired', $errors)}error{/if}">
          {if array_key_exists('position_desired', $errors)}
            <div>
              <span class="help-inline">{$errors['position_desired']}</span>
            </div>
          {/if}
          <label class="checkbox"><input type="checkbox" name="position_desired[]" value="busser" {if in_array('busser', $context['position_desired'])}checked{/if}>Busser</label>
          <label class="checkbox"><input type="checkbox" name="position_desired[]" value="server" {if in_array('server', $context['position_desired'])}checked{/if}>Server</label>
          <label class="checkbox"><input type="checkbox" name="position_desired[]" value="lead_server" {if in_array('lead_server', $context['position_desired'])}checked{/if}>Lead Server</label>
          <label class="checkbox"><input type="checkbox" name="position_desired[]" value="cook" {if in_array('cook', $context['position_desired'])}checked{/if}>Cook</label>
          <label class="checkbox"><input type="checkbox" name="position_desired[]" value="sous_chef" {if in_array('sous_chef', $context['position_desired'])}checked{/if}>Sous Chef</label>
          <label class="checkbox"><input type="checkbox" name="position_desired[]" value="dishwasher" {if in_array('dishwasher', $context['position_desired'])}checked{/if}>Dishwasher</label>
          <label class="checkbox"><input type="checkbox" name="position_desired[]" value="events_equipment_manager" {if in_array('events_equipment_manager', $context['position_desired'])}checked{/if}>Events Equipment Manager</label>
        </div>
      </fieldset>
    </div>
    <div class="row">
      <fieldset class="span12">
        <legend>Status</legend>
        {include file='yesno.tpl' prompt_class='span6' radio_class='span6' prompt='Are you a citizen of the United States?' name='citizen' }
        {include file='yesno.tpl' prompt_class='span6' radio_class='span6' prompt='If no, are you authorized to work in the United States?' name='authorized' }
        {include file='yesno.tpl' prompt_class='span6' radio_class='span6' prompt='Have you ever worked for this company?' name='prior_employment' }
        {include file='yesno.tpl' prompt_class='span6' radio_class='span6' prompt='Have you ever been convicted of a felony?' name='felony' }
        <textarea rows="4" name="felony_explain" placeholder="If yes, please explain">{$context['felony_explain']}</textarea>
      </fieldset>
    </div>
    <div class="row">
      <fieldset>
        <legend>Education</legend>
          {include file='education_row.tpl' prefix='hs_' show_address_to=true address_to_label='High School'}
          <hr>
          {include file='education_row.tpl' prefix='college_' show_address_to=true address_to_label='College'}
          <hr>
          {include file='education_row.tpl' prefix='other_' show_address_to=true address_to_label='Other'}
      </fieldset>
    </div>
    <fieldset>
      <legend>References</legend>
      <p><strong>Please list three (3) professional references.</strong></p>
      {include file='reference_row.tpl' prefix='reference1_' show_address_to=true address_to_label='Address'}
      <hr>
      {include file='reference_row.tpl' prefix='reference2_' show_address_to=true address_to_label='Address'}
      <hr>
      {include file='reference_row.tpl' prefix='reference3_' show_address_to=true address_to_label='Address'}
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
    <fieldset class="row">
      <legend>Military Service</legend>
      <div class="span12">
        <div id="military_date" class="offset1 form-inline">
          <label class="control-label" for="military_from_Month">From</label>
          {html_select_date
            all_extra='class="input-small"'
            display_days=FALSE
            prefix="military_from_"
            reverse_years=TRUE
            start_year=-50}
          <label class="control-label" for="military_to_Month">To</label>
            {html_select_date
              all_extra='class="input-small"'
              display_days=FALSE
              prefix="military_to_"
              reverse_years=TRUE
              start_year=-50}
        </div>
        <div class="form-horizontal">
          {include file='control_group.tpl' 
            input_class='input-medium' 
            label_text='Branch' 
            name='military_branch'}
          {include file='control_group.tpl'
            input_class='input-medium'
            label_text='Rank at Discharge'
            name='military_rank'}
          {include file='control_group.tpl'
            input_class='input-medium'
            label_text='Type of Discharge'
            name='military_discharge'}
        </div>
        <div class="offset2">
          <textarea id="military_explain" rows="5" name="military_explain" placeholder="If other than honorable, please explain"></textarea>
        </div>
      </div>
    </fieldset>
    <fieldset class="row">
      <legend>Job Performance</legend>
      <fieldset class="span12">
        <legend>Ability</legend>
        {foreach $context['ability'] as $var => $prompt}
          {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt=$prompt name=$var}
        {/foreach}
      </fieldset>
      <fieldset class="span12">
        <legend>Transportation</legend>
        {foreach $context['transportation'] as $var => $prompt}
          {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt=$prompt name=$var}
        {/foreach}
      </fieldset>
      <fieldset class="span12">
        <legend>Other</legend>
        {foreach $context['other_questions'] as $var => $prompt}
          {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt=$prompt name=$var}
        {/foreach}
      </fieldset>
      <fieldset>
        <legend>Disclaimer and Signature</legend>
        <p><em>I certify that my answers are true and complete to the best of my knowledge.</em></p>
        <p><em>If this application leads to employment, I understand that false or misleading information in my application or interview may result in my immediate release.</em></p>
        <div class="offset1 form-inline">
          <div class="control-group {if array_key_exists('signature_name', $errors) || array_key_exists('signature_date', $errors)}error{/if}">
            {if array_key_exists('signature_name', $errors)}
              <div>
                <span class="help-inline">{$errors['signature_name']}</span>
              </div>
            {elseif array_key_exists('signature_date', $errors)}
              <div>
                <span class="help-inline">{$errors['signature_date']}</span>
              </div>
            {/if}
            <label class="control-label" for="signature_name">Name</label>
            <input id="signature_name" class="input-large" type="text" name="signature_name">
            <label class="control-label" for="signature_date">Date</label>
            <input id="signature_date" class="input-small" type="text" name="signature_date" value="{$smarty.now|date_format:'%m/%d/%Y'}">
          </div>
        </div>
        <p><em>Please take a moment to double check your application prior to submitting.</em></p>
        <div class="offset4">
          <input class="btn btn-large" type="submit" value="Apply">
        </div>
      </fieldset>
    </fieldset>
  </form>
  <div id="footer" class="row">
    <p class="muted">Copyright {$smarty.now|date_format:"%Y"} Temecula Catering</p>
  </div>
</div>