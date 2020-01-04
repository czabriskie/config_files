" make it so vim isn't compatible with vi and allows the use of cool vim features
set nocompatible

" turn off the default filetype controls in vim, so it doesn't interfere with vundle
filetype off

" include vundle's location in vim's runtime path
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" point to Vundle package on GitHub, so it will auto update 
Plugin 'gmarik/vundle'

" point to SimplyFold plugin. This always asks for password and username of
" github so I decided to comment it out for now
" Plugin 'tmhedberg/SimplyFold'

" give Python files Python indent following PEP 8 standards
Plugin 'vim-scripts/indentpython.vim'
"All plugins must be declared between the call to vundle#rc() and the line below

"The YouCompleteMe package allows autofill for packages
Plugin 'Valloric/YouCompleteMe'

" Checks the syntax on each save
Plugin 'vim-syntastic/syntastic'

" Checks PEP 8 style guidelines
Plugin 'nvie/vim-flake8'

" Adds colorschemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" Add file tree
Plugin 'scrooloose/nerdtree'

"Add tabs
Plugin 'jistr/vim-nerdtree-tabs'

" Allows you to search for files and tags with Ctrl+P
Plugin 'kien/ctrlp.vim'

" Allows me to use github commands inside of vim
Plugin 'tpope/vim-fugitive'

" Adds a status bar that displays things about the file being edited
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" allows tmux and vim to be seamless
Plugin 'christoomey/vim-tmux-navigator'

" allows latex to be used inside vim
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'

filetype plugin indent on

"Add PEP 8 indentation for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4|
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=79|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix|
    \ set encoding=utf-8

" Settings for js, html and css files
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" enable syntax highlighting
 syntax enable

" show line numbers
set nu

" show the matchin part of the pair for [] {} and ()
" set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Allow splitting of the console to open multiple files at once
" :sp
set splitbelow
" :vs
set splitright

" split navigations for the split console allowed above
" ^ctrl + J move to the split below
nnoremap <C-J> <C-W><C-J>
" ^ctrl + K move to the split above
nnoremap <C-K> <C-W><C-K>
" ^ctrol + l move to the split to the right
nnoremap <C-L> <C-W><C-L>
" ^ctrl + h move to the split to the left
nnoremap <C-H> <C-W><C-H>

" Enable folding of code that isn't being worked on
set foldmethod=indent
set foldlevel=99

" makes auto-complete window go away when I'm done with it
let g:ycm_autoclose_preview_window_after_completion=1

" defines a shortcut for goto definition
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" allows youCompleteMe to be aware of virtualenvironments 

py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF

" change colorscheme based upon the VIM mode
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

"Allow switching between dark and light theme in solarized package
call togglebg#map("<F5>")

"runs tree tabs on startup of vim. Not sure if I want this yet, but could be
"useful
let g:nerdtree_tabs_open_on_console_startup=1

"allows to cut, copy, and or paste to/from other applicaions outside of vim
"Don't actually understand what this does yet so I commented it out
" set clipboard=unnamed
   

