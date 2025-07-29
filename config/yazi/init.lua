require("full-border"):setup()
require("starship"):setup()
require("augment-command"):setup({
  prompt = false,
  default_item_group_for_prompt = "hovered",
  smart_enter = true,
  smart_paste = false,
  enter_archives = false,
  extract_behaviour = "rename",
  extract_retries = 3,
  must_have_hovered_item = true,
  skip_single_subdirectory_on_enter = true,
  skip_single_subdirectory_on_leave = true,
  ignore_hidden_items = false,
  wraparound_file_navigation = false,
})
