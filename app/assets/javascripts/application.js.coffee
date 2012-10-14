#= require jquery
#= require jquery_ujs
#= require jquery.tipTip
#= require debug
#= require_tree .

jQuery ->
  # Debugger settings
  window.default_debug_level = 3
  debug.setLevel(default_debug_level)
  debug.info("Application loaded")
