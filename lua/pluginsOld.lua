-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	vim.notify("正在安装Pakcer.nvim，请稍后...")
	paccker_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})

	-- https://github.com/wbthomason/packer.nvim/issues/750
	local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
	if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
	end
	vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("没有安装 packer.nvim")
	return
end

packer.startup({
	function(use)
		-- Packer 可以升级自己
		use("wbthomason/packer.nvim")
		-------------------------- plugins -------------------------------------------
		use("rcarriga/nvim-notify")

		-- nvim-tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})

		-- flutter
		use({
			"akinsho/flutter-tools.nvim",
			requires = "nvim-lua/plenary.nvim",
		})

		-- bufferline
		use({
			"akinsho/bufferline.nvim",
			requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
		})

		-- lualine
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
		})
		use("arkav/lualine-lsp-progress")

		-- telescope
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})

		-- telescope extensions
		use("LinArcX/telescope-env.nvim")
		use("nvim-telescope/telescope-ui-select.nvim")

		-- dashboard-nvim
		use {
		  'glepnir/dashboard-nvim',
		  event = 'VimEnter',
		  config = function()
		    local db = require('plugin-config.dashboard')
		    db()
		  end,
		  requires = { 'nvim-tree/nvim-web-devicons' },
		}

		-- project
		use("ahmedkhalf/project.nvim")

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use("p00f/nvim-ts-rainbow")

		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")

		--------------------- LSP --------------------
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })
		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- Snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
		use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")
		-- UI 增强
		use("onsails/lspkind-nvim")
		use("tami5/lspsaga.nvim")
		-- 代码格式化
		use("mhartington/formatter.nvim")
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
		-- TypeScript 增强
		use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
		-- Lua 增强
		use("folke/neodev.nvim")
		-- JSON 增强
		use("b0o/schemastore.nvim")

		-------------------------------------------------------
		use({ "akinsho/toggleterm.nvim" })
		-- surround
		use("ur4ltz/surround.nvim")
		-- Comment
		use("numToStr/Comment.nvim")
		-- nvim-autopairs
		use("windwp/nvim-autopairs")
		-- git
		use({ "lewis6991/gitsigns.nvim" })
		----------------------------------------------
		use({ "mg979/vim-visual-multi" })

		use({ "j-hui/fidget.nvim", tag = "legacy"})
		if paccker_bootstrap then
			packer.sync()
		end
	end,
	config = {
		-- 最大并发数
		max_jobs = 16,
	},
})
