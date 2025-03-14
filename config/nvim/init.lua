-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    {
	    "NeogitOrg/neogit",
	    dependencies = {
		    "nvim-lua/plenary.nvim",         -- required
		    "sindrets/diffview.nvim",        -- optional - Diff integration

		    -- Only one of these is needed.
		    "nvim-telescope/telescope.nvim", -- optional
		    "ibhagwan/fzf-lua",              -- optional
		    "echasnovski/mini.pick",         -- optional
	    },
	    config = true
    },
    { 'neoclide/coc.nvim', branch = 'release'},
    { 'echasnovski/mini.nvim' }, --, version = '*' },
    { 'SirVer/ultisnips' },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})

-- Copied and modified from coc.nvim README
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<TAB>"', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
vim.keymap.set("i", "<leader><CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.pairs').setup()
require('mini.surround').setup()

require('mini.files').setup()
vim.keymap.set('n', '<leader><tab>', function() MiniFiles.open() end)

require('mini.pick').setup()
vim.keymap.set('n', '<tab>', '<cmd>Pick files<CR>')

-- Custom options
vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartcase = true

vim.opt.smd = false

vim.opt.smartindent = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.cmd [[colorscheme habamax]]

vim.keymap.set('i', 'jk', "<ESC>")
vim.keymap.set('n', '<leader>h', '<cmd>wincmd h<CR>')
vim.keymap.set('n', '<leader>j', '<cmd>wincmd j<CR>')
vim.keymap.set('n', '<leader>k', '<cmd>wincmd k<CR>')
vim.keymap.set('n', '<leader>l', '<cmd>wincmd l<CR>')

vim.keymap.set('n', '<CR>', 'o<ESC>', { noremap = true })
vim.keymap.set('n', 'H', '<cmd>bprevious<CR>', { noremap = true })
vim.keymap.set('n', 'L', '<cmd>bnext<CR>', { noremap = true })

vim.cmd [[ let g:UltiSnipsExpandTrigger="<leader><TAB>" ]]
vim.cmd [[ let g:UltiSnipsJumpForwardTrigger="<leader><CR>" ]]
