<fieldset class="previous_employment">
  <label for="{$prefix}company">Company:</label>
  <input id="{$prefix}company" type="text" name="{$prefix}company">
  {include file='address.tpl' address_to_label='Address'}
  <label for="{$prefix}supervisor">Supervisor</label>
  <input id="{$prefix}supervisor" type="text" name="{$prefix}supervisor">
  <label for="{$prefix}title">Job Title:</label>
  <input id="{$prefix}title" type="text" name="{$prefix}title">
  <label for="{$prefix}starting_salary">Starting Salary: $</label>
  <input id="{$prefix}starting_salary" type="text" name="{$prefix}starting_salary">
  <label for="{$prefix}ending_salary">Ending Salary: $</label>
  <input id="{$prefix}ending_salary" type="text" name="{$prefix}ending_salary">
  <label for="{$prefix}responsibilities">Responsibilities:</label>
  <textarea id="{$prefix}responsibilities" rows="10" cols="50" name="{$prefix}responsibilities"></textarea>
  <label for="{$prefix}from_Month">From:</label>
  {html_select_date display_days=FALSE prefix="`$prefix`from_" reverse_years=TRUE start_year=-20}
  <label for="{$prefix}to_Month">To:</label>
  {html_select_date display_days=FALSE prefix="`$prefix`to_" reverse_years=TRUE start_year=-20}
  <label for="{$prefix}leaving">Reason for leaving:</label>
  <input id="{$prefix}leaving" type="text" name="{$prefix}leaving">
  {include file='yesno.tpl' name="`$prefix`contact_employer" prompt='May we contact this employer for a reference?'}
</fieldset>