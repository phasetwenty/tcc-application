<div class="form-horizontal">
  {include file='control-group.tpl'
    input_class=''
    label_text="$address_to_label"
    name="`$prefix`address_to"}
  {include file='control-group.tpl'
    input_class=''
    label_text='City'
    name="`$prefix`address_city"}
  {include file='control-group.tpl'
    input_class='input-mini'
    label_text='State'
    name="`$prefix`address_state"}
  {include file='control-group.tpl'
    input_class='input-mini'
    label_text='ZIP'
    name="`$prefix`address_zip"}
</div>