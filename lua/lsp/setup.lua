-- local lsp_installer = require("nvim-lsp-installer")
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "tailwindcss",
    "bashls",
    "cssls",
    "emmet_ls",
    "html",
    "jsonls",
    "pyright",
    "yamlls",
    "volar",
  },
})

local lspconfig = require("lspconfig")

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  bashls = require("lsp.config.bash"),
  pyright = require("lsp.config.pyright"),
  html = require("lsp.config.html"),
  cssls = require("lsp.config.css"),
  emmet_ls = require("lsp.config.emmet"),
  jsonls = require("lsp.config.json"),
  tsserver = require("lsp.config.ts"),
  yamlls = require("lsp.config.yamlls"),
  volar = require("lsp.config.vue"),
  tailwindcss = require("lsp.config.tailwindcss")
  -- dartls = require("lsp.config.dart"),
  -- remark_ls = require("lsp.config.markdown"),
}

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded" }),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({
      handlers=handlers
    })
  end
end

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
