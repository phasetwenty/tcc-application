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
    <table class="table table-bordered">
      <caption><h3>Education</h3></caption>
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
    <table class="table table-bordered">
      <caption><h3>References</h3></caption>
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
    <table class="table table-bordered">
      <caption><h3>Previous Employment</h3></caption>
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
  <div class="row">
    <table class="table table-bordered">
      <caption>Q/A</caption>
      <thead>
        <tr>
          <th>Question</th>
          <th>Answer</th>
        </tr>
      </thead>
      <tbody>
        {foreach $initial['ability'] as $var => $prompt}
          <tr>
            <td>{$prompt}</td>
            <td>{$context[$var]}</td>
          </tr>
        {/foreach}
        {foreach $initial['transportation'] as $var => $prompt}
          <tr>
            <td>{$prompt}</td>
            <td>{$context[$var]}</td>
          </tr>
        {/foreach}
        {foreach $initial['other_questions'] as $var => $prompt}
          <tr>
            <td>{$prompt}</td>
            <td>{$context[$var]}</td>
          </tr>
        {/foreach}
      </tbody>
    </table>
  </div>
  {if !empty($context['military_branch'])}
    <div class="row">
      <table>
        <caption><h3>Military Service</h3></caption>
        <thead>
          <tr>
            <th>Branch</th>
            <th>Time</th>
            <th>Rank</th>
            <th>Type of discharge</th>
            {if !empty($context['military_explain'])}
              <th>Explanation</th>
            {/if}
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>{$context['military_branch']}</td>
            <td>{$context['military_from_Month']} {$context['military_from_Year']} to {$context['military_to_Month']} {$context['military_to_Year']}</td>
            <td>{$context['military_rank']}</td>
            <td>{$context['military_discharge']}</td>
            {if !empty($context['military_explain'])}
              <td>{$context['military_explain']}</td>
            {/if}
          </tr>
        </tbody>
      </table>
    </div>
  {/if}
</div>