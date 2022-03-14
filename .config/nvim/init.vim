let mapleader ='\'
source $HOME/.config/nvim/vim-plug/plugins.vim

" Goyo plugin makes text more readable when writing prose:
       map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
       map <leader>o :setlocal spell! spelllang=es_ar<CR>

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

""""""""""""""""""""""""""""""""""""""""""""""""
" ==>   Splits
""""""""""""""""""""""""""""""""""""""""""""""""
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Make adjusting split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

""""""""""""""""""""""""""""""""""""""""""""""""

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	 nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
       autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
       autocmd BufRead,BufNewFile tmp/neomutt* :Goyo | set bg=light
       autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
       autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set ic			" Ignore case
set hidden		" Hide buffers when they are abandoned
" set termguicolors
set mouse=a		" Enable mouse usage (all modes)
set expandtab		" Turn tab into spaces
set hidden
set nobackup
set shiftwidth=4
set clipboard+=unnamedplus
set title
set bg=light
set nohlsearch
set noruler

" Some basics:
	nnoremap c "_c
	filetype plugin on
	set encoding=utf-8
	set number relativenumber

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Toggle autocompiler
    map <leader>a :!setsid autocomp.sh % &<CR>

" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
   	autocmd BufWritePre * %s/\n\+\%$//e
   	autocmd BufWritePre *.[ch] %s/\%$/\r/e

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/Documentos/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex
        " autocmd BufNewFile,BufFilePre,BufRead *.rmd,*.Rmd set filetype=markdown
        " autocmd Filetype markdown map <F5> :!Rscript -e "rmarkdown::render('%', 'pdf_document')"<CR

let s:hidden_all = 0
set showmode
set showcmd
set ruler
set laststatus=2

if !has('gui_running')
  set t_Co=256
endif

 let g:lightline = {
             \ 'colorscheme': 'deus',
             \ }
