local util = require 'lspconfig.util'

local function get_typescript_server_path(root_dir)
  local project_root = util.find_node_modules_ancestor(root_dir)
  return project_root and (util.path.join(project_root, 'node_modules', 'typescript', 'lib')) or ''
end

return {
  on_setup = function(server)
    server.setup({
      -- init_options = {
      --   typescript = {
      --     tsdk = "~/.nvm/versions/node/v16.13.0/lib/node_modules/typescript/lib"
      --   }
      -- },
      -- on_new_config = function(new_config, new_root_dir)
      --   new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
      -- end
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件插件处理
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- 绑定快捷键
        require("keybindings").mapLSP(buf_set_keymap)
      end,
    })
  end,
}
