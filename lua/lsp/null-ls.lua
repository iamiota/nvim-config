local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("没有找到 null-ls")
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  sources = {
    -- Formatting ---------------------
    formatting.shfmt,
    formatting.stylua,
    -- frontend
    formatting.prettier.with({ -- 比默认少了 markdown
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "graphql",
      },
      prefer_local = "node_modules/.bin",
    }),
    -----------------------------------------------------
    -- formatting.fixjson,
    -- Diagnostics  ---------------------
    -- use global
    -- diagnostics.eslint.with({
    --   prefer_local = "node_modules/.bin",
    -- }),
    -- code actions ---------------------
    code_actions.gitsigns,
    -- code_actions.eslint.with({
    --   prefer_local = "node_modules/.bin",
    -- }),
  },
  -- #{m}: message
  -- #{s}: source name (defaults to null-ls if not specified)
  -- #{c}: code (if available)
  diagnostics_format = "[#{s}] #{m}",
  on_attach = function(_)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
    -- if client.server_capabilities.document_formatting then
    --   vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
    -- end
  end,
})
