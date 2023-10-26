local g = vim.g
local o = vim.o
local opt = vim.opt

-- Uncomment the next line to make Vim more Vi-compatible
-- NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
-- options, so any other options should be set AFTER setting 'compatible'.
o.nocompatible = true

-- Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
o.splitbelow = true
o.splitright = true

vim.cmd('syntax on')

-- The following are commented out as they cause vim to behave a lot
-- differently from regular Vi. They are highly recommended though.
-- o.ic = true			-- Ignore case
o.showmatch = true		-- Show matching brackets.
o.ignorecase = true		-- Do case insensitive matching
o.smartcase = true		-- Do smart case matching
o.incsearch = true		-- Incremental search
o.autowrite = true		-- Automatically save before commands like :next and :make
o.hidden = true		-- Hide buffers when they are abandoned

-- Better editing experience
o.expandtab = true		-- Turn tab into spaces
o.smarttab = true
o.cindent = true
o.autoindent = true
o.hidden = true
o.nobackup = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"

-- Better editor UI
o.number = true
o.numberwidth = 5
o.relativenumber = true
-- o.signcolumn = 'yes:2'
o.cursorline = true

o.clipboard = 'unnamedplus'
o.title = true
o.nohlsearch = true
o.encoding = 'utf-8'
-- o.noruler = true

-- Colors

o.termguicolors = true
o.background = 'dark'

-- Smooth scrolling
o.smoothscroll = true

-- Remember 50 items in commandline history
o.history = 50

-- Preserve view while jumping
o.jumpoptions = 'view'

opt.mouse = 'a'		-- Enable mouse usage (all modes)

-- Enable autocompletion:
o.wildmode = 'longest,list,full'

-- Define file extensions to syntax mappings for Vimwiki
g.vimwiki_ext2syntax = {
    ['.Rmd'] = 'markdown',
    ['.rmd'] = 'markdown',
    ['.md'] = 'markdown',
    ['.markdown'] = 'markdown',
    ['.mdown'] = 'markdown',
}

-- Configure Vimwiki
g.vimwiki_list = {
    { path = '~/.local/share/vimwiki', syntax = 'markdown', ext = '.md' },
}

-- Set global variables
g.hidden_all = 0
-- g.lightline = { colorscheme = 'gruvbox' }

-- Set options
o.showmode = true
o.showcmd = true
o.ruler = true
o.laststatus = 2

-- Check if not running in a GUI
if not vim.fn.has('gui_running') then
    o.t_Co = 256
end

-- Activate plugins
require('lualine').setup()
g.rainbow_active = 1
g.python_highlight_all = 1

g.mapleader = ' '
g.maplocalleader = ' '
