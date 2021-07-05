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
set laststatus=2

if has("gui_running")
  set guifont=Terminus
  colorscheme desert
else
  colorscheme industry
endif

" Search options
set ignorecase
set hlsearch
set incsearch

" Buffer options
nmap <C-d> :bdelete<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
