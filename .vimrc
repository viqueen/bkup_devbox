""" vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'carakan/new-railscasts-theme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/promptline.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'sbdchd/neoformat'
Plugin 'neomake/neomake'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

""" filetypes
filetype plugin on
filetype indent on

set autoread

au BufNewFile,BufRead .eslintrc set filetype=json
au BufNewFile,BufRead .babelrc set filetype=json

autocmd BufWritePre * :%s/\s\+$//e
""" autocmd vimenter * NERDTree

""" ui
syntax on
set wildmenu
set ruler
set mouse=a
set cmdheight=2
set number
set cursorline

colorscheme new-railscasts

hi CursorLine cterm=bold
hi Normal guibg=NONE ctermbg=NONE

""" search
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch

""" text
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set encoding=utf-8

set ai
set si
set wrap

set backspace=indent,eol,start

""" airline
set laststatus=2
let g:airline_theme='serene'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set encoding=UTF-8
