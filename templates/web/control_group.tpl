<div class="control-group {if array_key_exists($name, $errors)}error{/if}">
  <label class="control-label" for="{$name}">{$label_text}</label>
  <div class="controls">
    <input id="{$name}" class="{$input_class}" type="text" name="{$name}" value="{$context[$name]}">
    {if array_key_exists($name, $errors)}
      <span class="help-inline">{$errors[$name]}</span>
    {/if}
  </div>
</div>