<div class="row form-inline">
  <div class="{$prompt_class}">{$prompt}</div>
  <div class="control-group {$radio_class} {if array_key_exists($name, $errors)}error{/if}">
    <label class="radio inline">
      <input type="radio" name="{$name}" value="yes" {if array_key_exists($name, $context) && $context[$name] eq 'yes'}checked{/if}>
      Yes
    </label>
    <label class="radio inline">
      <input type="radio" name="{$name}" value="no" {if array_key_exists($name, $context) && $context[$name] eq 'no'}checked{/if}>
      No
    </label>
    {if array_key_exists($name, $errors)}
      <span class="help-inline">{$errors[$name]}</span>
    {/if}
  </div>
</div>