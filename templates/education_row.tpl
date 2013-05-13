<fieldset class="row">
  <div class="span6">
    {include file='address.tpl'}
  </div>
  <div class="span6">
    <div class="row form-inline">
      <label for="{$prefix}from_Year">From</label>
      {html_select_date
        all_extra='class="input-small"'
        display_months=FALSE
        display_days=FALSE
        prefix="`$prefix`from_"
        reverse_years=TRUE start_year=-50}
      <label for="{$prefix}to_Year">To</label>
      {html_select_date 
        all_extra='class="input-small"'
        display_months=FALSE
        display_days=FALSE
        prefix="`$prefix`to_"
        reverse_years=TRUE
        start_year=-50}
    </div>
    {include file='yesno.tpl' name="`$prefix`graduate" prompt='Did you graduate?' prompt_class='span2' radio_class='span2'}
  </div>
  <div class="row">
    <div class="form-inline">
      <label for="{$prefix}degree">Degree/Diploma</label>
      <input id="{$prefix}degree" type="text" name="{$prefix}degree">
    </div>
  </div>
</fieldset>