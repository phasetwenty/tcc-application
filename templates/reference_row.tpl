<fieldset>
  <label for="{$prefix}full_name">Full Name:</label>
  <input id="{$prefix}full_name" type="text" name="{$prefix}full_name">
  <label for="{$prefix}relationship">Relationship:</label>
  <input id="{$prefix}relationship" type="text" name="{$prefix}relationship">
  <label for="{$prefix}phone">Phone:</label>
  <input id="{$prefix}phone" type="text" name="{$prefix}phone">
  <label for="{$prefix}company">Company:</label>
  <input id="{$prefix}company" type="text" name="{$prefix}company">
  {include file='address.tpl'}
</fieldset>