<fieldset class="education_row">
  {include file='address.tpl'}
  <label for="{$prefix}from_Year">From:</label>
  {html_select_date display_months=FALSE display_days=FALSE prefix='{$prefix}from_' reverse_years=TRUE start_year=-50}
  <label for="{$prefix}to_Year">To:</label>
  {html_select_date display_months=FALSE display_days=FALSE prefix='{$prefix}from_' reverse_years=TRUE start_year=-50}
  {include file='yesno.tpl' prompt='Did you graduate?'}
  <label for="{$prefix}degree">Degree/Diploma:</label>
  <input id="{$prefix}degree" type="text" name="{$prefix}degree">
</fieldset>