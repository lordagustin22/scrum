local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

-------------------------------------- globals -----------------------------------------
g.nvchad_theme = config.ui.theme
g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency

-------------------------------------- options ------------------------------------------
opt.laststatus = 3 -- global statusline
opt.showmode = false
opt.showmatch = true

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hidden = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = "\\"

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- reload some chadrc options on-save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.tbl_map(
    vim.fs.normalize,
    vim.fn.glob(vim.fn.stdpath "config" .. "/lua/custom/**/*.lua", true, true, true)
  ),
  group = vim.api.nvim_create_augroup("ReloadNvChad", {}),

  callback = function(opts)
    local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]
    local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
    local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

    require("plenary.reload").reload_module "base46"
    require("plenary.reload").reload_module(module)
    require("plenary.reload").reload_module "custom.chadrc"

    config = require("core.utils").load_config()

    vim.g.nvchad_theme = config.ui.theme
    vim.g.transparency = config.ui.transparency

    -- statusline
    require("plenary.reload").reload_module("nvchad_ui.statusline." .. config.ui.statusline.theme)
    vim.opt.statusline = "%!v:lua.require('nvchad_ui.statusline." .. config.ui.statusline.theme .. "').run()"

    require("base46").load_all_highlights()
    -- vim.cmd("redraw!")
  end,
})

-------------------------------------- commands ------------------------------------------
local new_cmd = vim.api.nvim_create_user_command

new_cmd("NvChadUpdate", function()
  require "nvchad.update"()
end, {})

-------------------------------------------------------------------------------------------------------------
-- options imported from init.vim and translated into lua

-- Runs a script that cleans out tex build files whenever I close out of a .tex file.
vim.api.nvim_exec([[
    autocmd VimLeave *.tex !texclear %
]], false)

-- Disables automatic commenting on newline
vim.api.nvim_command('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

-- Perform dot commands over visual blocks
vim.api.nvim_command('vnoremap . :normal .<CR>')

-- Automatically deletes all trailing whitespace and newlines at end of file on save
vim.api.nvim_command('autocmd BufWritePre * %s/\\s\\+$//e')
vim.api.nvim_command('autocmd BufWritePre * %s/\\n\\+\\%$//e')
vim.api.nvim_command('autocmd BufWritePre *.[ch] %s/\\%$/\\r/e')

-- Ensure files are read as what I want
vim.api.nvim_command('autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff')
vim.api.nvim_command('autocmd BufRead,BufNewFile *.tex set filetype=tex')

opt.compatible = false
opt.encoding = "utf-8"
vim.cmd('filetype plugin on')
vim.cmd('syntax on')

vim.cmd[[
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
vnoremap . :normal .<CR>
]]

-- bindings
vim.cmd[[
nnoremap c "_c

map <leader>c :w! \| !compiler "%:p"<CR>

"" spellcheck activation
map <leader>o :setlocal spell! spelllang=es_ar<CR>

"" toggle autocompiler
map <leader>a :!setsid autocomp.sh % &<CR>

"" replace all is aliased to S
nnoremap S :%s//g<Left><Left>

"" Open corresponding .pdf/.html or preview
map <leader>p :!opout "%:p"<CR>

"" Save file as sudo on files that require root permission
cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

map <leader>ww :VimwikiIndex<CR>
]]
-------------------------------------------------------------------------------------------------------------
