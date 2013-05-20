<fieldset class="row">
  <div class="form-horizontal span6">
    {include file='control_group.tpl'
      input_class='input-medium'
      label_text='Full Name'
      name="`$prefix`full_name"}
    {include file='control_group.tpl'
      input_class='input-medium'
      label_text='Relationship'
      name="`$prefix`relationship"}
    {include file='control_group.tpl'
      input_class='input-medium'
      label_text='Phone Number'
      name="`$prefix`phone"}
    {include file='control_group.tpl'
      input_class='input-medium'
      label_text='Company'
      name="`$prefix`company"}
  </div>
  <div class="span6">
    {include file='address.tpl' show_address_to=true prefix="`$prefix`address_"}
  </div>
</fieldset>