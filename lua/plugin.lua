local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.notify('Install lazy.nvim')
    vim.fn.system({
        'git', 'clone', '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git', '--branch=stable', -- latest stable release
        lazypath
    })
    vim.notify('Install lazy.nvim finished')
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require('lazy').setup({
    {'rcarriga/nvim-notify'},
    {'famiu/bufdelete.nvim'},
    {'kyazdani42/nvim-tree.lua', dependencies = 'kyazdani42/nvim-web-devicons'},
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'kyazdani42/nvim-web-devicons'
    }, {
        'nvim-lualine/lualine.nvim',
        version = '*',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },
    {'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim'},
    'nvim-telescope/telescope-ui-select.nvim', {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        init = function()
            local db = require('plugins.dashboard')
            db()
        end,
        dependencies = 'kyazdani42/nvim-web-devicons'
    }, 'ahmedkhalf/project.nvim',
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    'lukas-reineke/indent-blankline.nvim', 'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp', 'hrsh7th/vim-vsnip', 'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-nvim-lsp-signature-help',
    -- 'rafamadriz/friendly-snippets',
     'onsails/lspkind-nvim', 'tami5/lspsaga.nvim',
    'mhartington/formatter.nvim',
    {'jose-elias-alvarez/null-ls.nvim', dependencies = 'nvim-lua/plenary.nvim'},
    {
        'jose-elias-alvarez/nvim-lsp-ts-utils',
        dependencies = 'nvim-lua/plenary.nvim'
    }, 'folke/neodev.nvim', 'b0o/schemastore.nvim', 'akinsho/toggleterm.nvim',
    'ur4ltz/surround.nvim', 'numToStr/Comment.nvim', 'windwp/nvim-autopairs',
    'lewis6991/gitsigns.nvim', 'mg979/vim-visual-multi'
})
