"""""""""" NOTHING ABOVE THIS!!!!! """"""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install Vundle itself
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let Vundle manage Vundle, required
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" copy/paste the vimrc code from github
" then install with :PluginInstall
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here come my plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto completion
" Install, then:
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --all
Plugin 'Valloric/YouCompleteMe'

" Auto close misc. delimiters
Plugin 'cohama/lexima.vim'
" Auto close HTML tags
Plugin 'alvan/vim-closetag'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End of my plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All non-Vundle-related stuff goes below
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set mouse=a
set number

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with > use 4 spaces width
set shiftwidth=4
" on pressing tab insert 4 spaces
set expandtab

" go to pervious/next line with left/right arrow keys
set whichwrap=b,s,<,>,[,]

let mapleader=','
let maplocalleader=','

" Mostly for internal terminal
" cd to the directory that contains the file being edited
autocmd BufEnter * silent! lcd %:p:h
" When splitting vertically, e.g. for the internal terminal,
" put the new buffer at the bottom
set splitbelow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Experimental ==> might not work...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocompletion
"setlocal omnifunc=syntaxcomplete#Complete
"set complete+=k
"set omnifunc

" Synctex
" comes from https://gist.github.com/vext01/16df5bd48019d451e078
function! Synctex()
        execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . bufname('%')[:-5]. ".pdf &"
        redraw!
endfunction
map <leader><space> :call Synctex()<cr>

function TeXCompile()
    w
    execute "silent !lualatex -synctex=1 -interaction=nonstopmode " . @%
    redraw!
    call Synctex()
endfunction
map <leader><enter> :call TeXCompile()<cr>

" use correct filetype for LaTeX
let g:tex_flavor='latex'

function Biber()
    execute "silent !biber " . expand('%:r')
    redraw!
endfunction
map <leader>b :call Biber()<cr>

function LilyPond()
    w
    execute "silent !lilypond " . expand('%:p')
    redraw!
endfunction

function OpenPDF()
    execute "silent !zathura " . expand('%:r') . ".pdf &"
endfunction
