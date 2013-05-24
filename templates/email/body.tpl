<div class="container">
  <div class="row">
    <h1 class="text-center">Temecula Catering Employment Application</h1>
  </div>
  <div class="row">
    <h1 class="text-center">{$context['last_name']}, {$context['first_name']}</h1>
  </div>
  <div class="row">
    <div class="span6">
      <h3>Contact Information</h3>
      <address>
        {$context['contact_address_street_number']}<br>
        {$context['contact_address_city']}, {$context['contact_address_state']} {$context['contact_address_zip']}<br>
        Phone: {$context['phone_number']} | Email: {$context['email']}
      </address>
      Driver License: {$context['driver_license']}
    </div>
    <div class="span6">
      <h3>Applicant Information</h3>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Date Available</th>
            <th>Desired Salary</th>
            <th>Position Desired</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>{$context['date_available']}</td>
            <td>{$context['desired_salary']}</td>
            <td>{$context['position_desired_str']}</td>
          </tr>
        </tbody>
      </table>
      <ul>
        <li>Citizen: {$context['citizen']}</li>
        <li>Authorized to work: {$context['authorized']}</li>
        <li>Ever worked for this company: {$context['prior_employment']}</li>
        <li>Felony conviction: {$context['felony']}</li>
      </ul>
      {if !empty($context['felony_explain'])}
        <div class="well">
          <p>
            {$context['felony_explain']}
          </p>
        </div>
      {/if}
    </div>
  </div>
  <div class="row">
    <h3>Education</h3>
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Address</th>
          <th>Enrollment</th>
          <th>Graduated</th>
          <th>Degree/Diploma</th>
        </tr>
      </thead>
      <tbody>
        {foreach $context['school_prefixes'] as $school_prefix}
          {if !empty($context[$school_prefix|cat:'address_to'])}
            <tr>
              <td>
                <address>
                  <strong>{$context[$school_prefix|cat:'address_to']}</strong><br>
                  {$context[$school_prefix|cat:'address_street_number']}<br>
                  {$context[$school_prefix|cat:'address_city']}, {$context[$school_prefix|cat:'address_state']} {$context[$school_prefix|cat:'address_zip']}
                </address>
              </td>
              <td>{$context[$school_prefix|cat:'from_Year']} to {$context[$school_prefix|cat:'to_Year']}</td>
              <td>{$context[$school_prefix|cat:'graduate']}</td>
              <td>{$context[$school_prefix|cat:'degree']}</td>
            </tr>
          {/if}
        {/foreach}
      </tbody>
    </table>
  </div>
  <div class="row">
    <h3>References</h3>
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Address</th>
          <th>Name</th>
          <th>Relationship</th>
          <th>Phone</th>
        </tr>
      </thead>
      <tbody>
        {foreach $context['reference_prefixes'] as $ref_prefix}
          {if !empty($context[$ref_prefix|cat:'full_name'])}
            <tr>
              <td>
                <address>
                  <strong>{$context[$ref_prefix|cat:'company']}</strong><br>
                  {$context[$ref_prefix|cat:'address_street_number']}<br>
                  {$context[$ref_prefix|cat:'address_city']}, {$context[$ref_prefix|cat:'address_state']} {$context[$ref_prefix|cat:'address_zip']}
                </address>
              </td>
              <td>{$context[$ref_prefix|cat:'full_name']}</td>
              <td>{$context[$ref_prefix|cat:'relationship']}</td>
              <td>{$context[$ref_prefix|cat:'phone']}</td>
            </tr>
          {/if}
        {/foreach}
      </tbody>
    </table>
  </div>
  <div class="row">
    <h3>Previous Employment</h3>
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Address</th>
          <th>Salary</th>
          <th>Supervisor</th>
          <th>Job Title</th>
          <th>Reason for leaving</th>
          <th>Contact?</th>
          <th>Responsibilities</th>
        </tr>
      </thead>
      <tbody>
        {foreach $context['prev_employment_prefixes'] as $prev_emloyment_prefix}
          {if !empty($context[$prev_emloyment_prefix|cat:'address_to'])}
            <tr>
              <td>
                <address>
                  <strong>{$context[$prev_emloyment_prefix|cat:'address_to']}</strong><br>
                  {$context[$prev_emloyment_prefix|cat:'address_street_number']}<br>
                  {$context[$prev_emloyment_prefix|cat:'address_city']}, {$context[$prev_emloyment_prefix|cat:'address_state']} {$context[$prev_emloyment_prefix|cat:'address_zip']}
                </address>
              </td>
              <td>{$context[$prev_emloyment_prefix|cat:'starting_salary']} to {$context[$prev_emloyment_prefix|cat:'ending_salary']}</td>
              <td>{$context[$prev_emloyment_prefix|cat:'supervisor']}</td>
              <td>{$context[$prev_emloyment_prefix|cat:'title']}</td>
              <td>{$context[$prev_emloyment_prefix|cat:'leaving']}</td>
              <td>{$context[$prev_emloyment_prefix|cat:'contact_employer']}</td>
              <td>{$context[$prev_emloyment_prefix|cat:'responsibilities']}</td>
            </tr>
          {/if}
        {/foreach}
      </tbody>
    </table>
  </div>
</div>
{*
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
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Are you able to memorize menus and last minute additions to menus?' name='memorize'}
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Are you able to work an eight (8) hour shift?' name='workday'}
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Are you able to stand for long periods?' name='standing'}
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Are you able to lift up to 50 lbs?' name='lift'}
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Are you available to work weekends and holidays?' name='holidays'}
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Are you able to work late nights?' name='late_nights'}
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Can you carry a food or beverage tray with no problem?' name='carry'}
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt="Are you able to maintain cheerful, professional attitute even if you're having a bad day?" name='cheerful'}
  </fieldset>
  <fieldset class="span12">
    <legend>Transportation</legend>
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Are you able to travel to different job sites outside of Temecula?' name='outside'}
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt="Do you have a valid California driver's license?" name='license_valid'}
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Do you have reliable transportation?' name='reliable'}
  </fieldset>
  <fieldset class="span12">
    <legend>Other</legend>
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Do you currently have a friend or relative working for Temecula Catering?' name='friend'}
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Do you have <strong>daily</strong> access to email?' name='email_access'}
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Do you have a <strong>reliable</strong> cell phone?' name='phone_reliable'}
    {include file='yesno.tpl' prompt_class="span8" radio_class="span2" prompt='Will you submit to drug screening prior to employment and random screenings?' name='screening'}
  </fieldset>
  <fieldset>
    <legend>Disclaimer and Signature</legend>
    <p><em>I certify that my answers are true and complete to the best of my knowledge.</em></p>
    <p><em>If this application leads to employment, I understand that false or misleading information in my application or interview may result in my immediate release.</em></p>
    <div class="offset1 form-inline">
      <label class="control-label" for="signature_date">Name</label>
      <input id="signature_date" class="input-large" type="text" name="signature_name">
      <label class="control-label" for="signature_date">Date</label>
      <input id="signature_date" class="input-small" type="text" name="signature_date" value="{$smarty.now|date_format:'%m/%d/%Y'}">
    </div>
    <p><em>Please take a moment to double check your application prior to submitting.</em></p>
    <div class="offset4">
      <input class="btn btn-large" type="submit" value="Apply">
    </div>
  </fieldset>
</fieldset>
*}