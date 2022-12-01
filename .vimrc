" enforce 8 colors
set t_Co=8
"set t_Co=256
set encoding=utf-8
set ttimeoutlen=50

set hidden
" show line numbers
set number
" always do syntaxhighlighting
syntax on
" highlight all search matches
set hlsearch
" keep indentation when opening new lines
set autoindent
" set some vi-modes
set nocompatible
" show matching brackets
set showmatch
" set width of tabs
set et
set shiftwidth=4
set tabstop=4

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

let g:airline_powerline_fonts = 1
let g:airline_theme='term'
