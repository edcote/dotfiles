set nocompatible

" Plugins
execute pathogen#infect()

" Syntax highlighting
syntax on
filetype plugin indent off

" Whitespace
set shiftwidth=2
set tabstop=2
set expandtab
set noautoindent
set nosmartindent

set list
set listchars=tab:\>\ ,trail:.,extends:>,precedes:<

" Interface
set novisualbell
set ruler
set number

if has("gui_running")
  set guifont=Terminus
  colorscheme desert
else
  set nonumber
endif

" Search options
set ignorecase
set hlsearch
set incsearch

" Buffer options
nmap <C-d> :bdelete<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
