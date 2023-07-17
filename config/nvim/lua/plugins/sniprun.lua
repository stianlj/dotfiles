return {
  "michaelb/sniprun",
  build = "bash install.sh",
  opts = {
    selected_interpreters = { "JS_TS_deno" },
    repl_enable = { "JS_TS_deno" },
  },
}
