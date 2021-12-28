local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local servers = require("nvim-lsp-installer.servers")
local server = require("nvim-lsp-installer.server")
local shell = require("nvim-lsp-installer.installers.shell")
local path = require("nvim-lsp-installer.path")

local server_name = "home_assistant"

configs[server_name] = {
  default_config = {
    filetypes = { "yaml" },
    root_dir = lspconfig.util.root_pattern(".git"),
  },
}

local root_dir = server.get_server_root_path(server_name)

local home_assistant_installer = function(_, callback)
  shell.polyshell(
    "git clone --depth 1 https://github.com/keesschollaart81/vscode-home-assistant.git . && npm install && npm run compile:server"
  )
  callback(true)
end

local home_assistant = server.Server:new({
  name = server_name,
  root_dir = root_dir,
  installer = home_assistant_installer,
  default_options = {
    cmd = { path.concat({ root_dir, "home_assistant_lsp" }), "--langserver" },
  },
})

servers.register(home_assistant)
