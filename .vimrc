set nocompatible              " be iMproved, required
set exrc
set noswapfile
set nobackup
set encoding=utf-8
set clipboard=unnamedplus
syntax enable
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()		" required, all plugins must appear after this line.

Plugin 'gmarik/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'junegunn/goyo.vim'
Plugin 'vimwiki/vimwiki'
"Plugin 'WolfgangMehner/vim-plugins'

call vundle#end()		" required, all plugins must appear before this line.

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" stuff and things
    set relativenumber                          " set numbers on side
    set noshowmode                              " hide stuffs
    set noerrorbells                            " sounds? no thanks
    set vb t_vb=                                " same as above
    set autochdir                               " change working dir
    colorscheme gruvbox                         " pretty pretty
    set background=dark                         " I like not being blind
    set splitbelow splitright                   " make splits make sense
    set tabstop=4                               " tabs
    set shiftwidth=4                            " same as above
    set nohlsearch                              " do not highlight the things
    set nowrap                                  " no text wrapping
	set autoread                                " read open files again when changed outside Vim
	set autowrite                               " write a modified buffer on each :next , ...
	set backspace=indent,eol,start              " backspacing over everything in insert mode
	set complete+=k                             " scan the files given with the 'dictionary' option
   	set ttymouse=sgr
"   set mouse=nicr

" Enable autocompletion:
    set wildmenu
	set wildmode=longest,list,full

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

    let mapleader ="'"

" lightline
    let g:lightline = {
        \ 'colorscheme': 'gruvbox',
        \ }
    set laststatus=2

    if !has('gui_running')
    set t_Co=256
    endif

" nerdtree
    map <leader>n :NERDTreeToggle<CR>
    " autocmd vimenter * NERDTree
    let g:NERDTreeDirArrowExpandable = ''
    let g:NERDTreeDirArrowCollapsible = ''
    let NERDTreeMinimalUI = 1
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Keybindings:

" Autocomplete brackets and quotes:
	inoremap  <leader>(  ()<Left>
	inoremap  <leader>[  []<Left>
	inoremap  <leader>{  {}<Left>
	inoremap  <leader>'  ''<Left>
	inoremap  <leader>"  ""<Left>

" Remap ESC to ii
    imap ii <Esc>

" map : to ; because wth not
    nnoremap ; :

" Disable arrow keys in Normal mode
    no <Up> <Nop>
    no <Down> <Nop>
    no <Left> <Nop>
    no <Right> <Nop>

" Disable arrow keys in Insert mode
    ino <Up> <Nop>
    ino <Down> <Nop>
    ino <Left> <Nop>
    ino <Right> <Nop>
" In insert or command mode, move normally by using Ctrl
	inoremap <C-h> <Left>
	inoremap <C-j> <Down>
	inoremap <C-k> <Up>
	inoremap <C-l> <Right>
	cnoremap <C-h> <Left>
	cnoremap <C-j> <Down>
	cnoremap <C-k> <Up>
	cnoremap <C-l> <Right>

" goyo yo yo yo
    map <leader>g :Goyo<CR>

" new line w/o insert
    map <leader>o o<Esc>
    map <leader>O O<Esc>

" Splits are annoying
	map <leader>h <C-w>h
	map <leader>j <C-w>j
	map <leader>k <C-w>k
	map <leader>l <C-w>l
    map - <C-W>-
    map + <C-W>+
    map < <C-W><
    map > <C-W>>
    map = <C-W>=

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

