set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" https://github.com/tpope/vim-fugitive
" Git support
Plugin 'tpope/vim-fugitive'

" https://vimawesome.com/plugin/nerdtree-red
" File explorer
Plugin 'scrooloose/nerdtree'

" https://vimawesome.com/plugin/vim-airline
" Status bar
" https://github.com/powerline/fonts
" Fonts that work well with terminal and vim-airline for arrows
Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" https://vimawesome.com/plugin/syntastic
" Syntax highlighter
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" https://vimawesome.com/plugin/ctrlp-vim-red
" Fuzzy search
Plugin 'kien/ctrlp.vim'

" https://vimawesome.com/plugin/the-nerd-commenter

Plugin 'scrooloose/nerdcommenter'
" Comment lines
" Following is needed for nercommenter
filetype plugin on

" https://vimawesome.com/plugin/commentary-vim
Plugin 'tpope/vim-commentary'

" https://vimawesome.com/plugin/indent-guides
" Nice display of tabs and where code blocks start
Plugin 'nathanaelkane/vim-indent-guides'
" Enable by default
let g:indent_guides_enable_on_vim_startup = 1

" https://vimawesome.com/plugin/youcompleteme
" Autocomplete
Plugin 'valloric/youcompleteme'
" $ ./install.py --js-completer

syntax enable
if has('gui_running')
    set guifont=Noto\ Mono\ for\ Powerline
    set background=light
    let g:solarized_termtrans=0
else
    " https://superuser.com/questions/370556/vim-colors-not-working-properly-in-terminal
    " https://gist.github.com/yasith/1508312
    set t_Co=256
    set background=light
    let g:solarized_termcolors=&t_Co
    let g:solarized_termtrans=0
endif
colorscheme solarized

" https://vimawesome.com/plugin/delimitmate
" Automatic closing of quotes, parenthesis, etc
Plugin 'raimondi/delimitmate'

" https://vimawesome.com/plugin/vim-multiple-cursors
" Sublime/Atom style multiple selections for refactoring
Plugin 'terryma/vim-multiple-cursors'

" https://vimawesome.com/plugin/vim-javascript
" Syntax highlighting and indentation for JS
Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

" https://vimawesome.com/plugin/tagbar
" Class outline viewer, toggle with F8
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" https://github.com/hushicai/tagbar-javascript.vim
" JavaScript tags support
Plugin 'hushicai/tagbar-javascript.vim'

" https://vimawesome.com/plugin/emmet-vim
" Emmet shortcuts for vim
Plugin 'mattn/emmet-vim'

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Make Vim more useful
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
"set backupdir=~/.vim/backups
"set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set lcs=trail:·,eol:¬,nbsp:_
"set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
"if exists("&relativenumber")
"	set relativenumber
"	au BufReadPost * set relativenumber
"endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
