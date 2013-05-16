<fieldset class="row">
  <div class="row">
    <div class="span6">
      {include file='address.tpl' address_to_label='Company' prefix="`$prefix`"}
      <div class="form-inline">
        <label for="{$prefix}from_Month">From</label>
        {html_select_date
          all_extra='class="input-small"'
          display_days=FALSE
          prefix="`$prefix`from_"
          reverse_years=TRUE
          start_year=-20}
        <label for="{$prefix}to_Month">To</label>
        {html_select_date 
          all_extra='class="input-small"'
          display_days=FALSE
          prefix="`$prefix`to_"
          reverse_years=TRUE
          start_year=-20}
      </div>
    </div>
    <div class="span6">
      <div class="form-inline salary-group">
        <div class="controls">
          <label class="control-label" for="{$prefix}starting_salary">Starting Salary</label>
          <div class="input-prepend">
            <span class="add-on">$</span>
            <input id="{$prefix}starting_salary" class="input-mini" type="text" name="{$prefix}starting_salary">
          </div>
          <label class="control-label" for="{$prefix}ending_salary">Ending Salary</label>
          <div class="input-prepend">
            <span class="add-on">$</span>
            <input id="{$prefix}ending_salary" class="input-mini" type="text" name="{$prefix}ending_salary">
          </div>
        </div>
      </div>
      <div class="form-horizontal">
        {include file='control_group.tpl'
          input_class='input-medium'
          label_text='Supervisor'
          name="`$prefix`supervisor"}
        {include file='control_group.tpl'
          input_class='input-medium'
          label_text='Job Title'
          name="`$prefix`title"}
        {include file='control_group.tpl'
          input_class='input-medium'
          label_text='Reason for leaving'
          name="`$prefix`leaving"}
        {include file='yesno.tpl' name="`$prefix`contact_employer" prompt='May we contact this employer for a reference?'}
      </div>
    </div>
  </div>
  <textarea id="{$prefix}responsibilities" rows="8" name="{$prefix}responsibilities" placeholder="List your responsibilities here"></textarea>
  

</fieldset>