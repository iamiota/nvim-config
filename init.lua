-- 基础配置
require("basic")

-- 快捷键映射
require("keybindings")

-- 插件管理
require("plugin")

-- 主题设置
require("colorscheme")

-- 自动命令
require("autocmds")

-- 插件配置
require("plugins.notify")
require("plugins.nvim-tree")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.dashboard")
require("plugins.project")
require("plugins.nvim-treesitter")
require("plugins.indent-blankline")
require("plugins.toggleterm")
require("plugins.surround")
require("plugins.comment")

-- 内置LSP
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("plugins.nvim-autopairs")

-- 格式化
require("lsp.formatter")
require("lsp.null-ls")

