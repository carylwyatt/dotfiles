set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'dahu/vim-fanfingtastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim',{'name':'dracula'}
Plugin 'terryma/vim-smooth-scroll'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'digitaltoad/vim-pug'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'grvcoelho/vim-javascript-snippets'
Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line

" MacOS clipboard sharing
set clipboard=unnamed

" fix snipmate error message
let g:snipMate = { 'snippet_version' : 1 }

" normal mode copies one line, visual mode copies all highlighted
nmap <F12> :.w !pbcopy<CR><CR>
vmap <F12> :w !pbcopy<CR><CR>

" easy buffer switching
map gn :bn<cr>
map gp :bp<cr>
map gd :bp\|bd #<CR>

" airline settings
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#branch#enabled = 1 
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

if !exists('g:airline_symbols')
          let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_right_sep = '«'
" let g:airline_symbols.linenr = '¶'

" caryl's key mappings

" nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"

"auto-open NERDTree in vim
"au VimEnter * NERDTree

"close vim if only NERDTree window exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" search for visually selected text using //
" copies visually selected text, then starts a search command and pastes the
" copied text into search
vnoremap // y/<C-R>"<CR>

" smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" spell check in markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

syntax enable
set omnifunc=syntaxcomplete#Complete
set guifont=Source\ Code\ Pro\ for\ Powerline "make sure to escape the spaces in the name properly
set encoding=utf-8
set t_Co=256
set termguicolors
set background=dark
colorscheme dracula
set number relativenumber 
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set showmatch
