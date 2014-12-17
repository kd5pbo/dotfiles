""" Vundle """
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'fatih/vim-go'
call vundle#end()            " required
filetype plugin indent on    " required


"" Misc. Config """
set nocompatible "Enable cool things
syntax on "Syntax highlighting
set number "Line numbers
filetype plugin indent on "Read indentation plugins per filetype
set ruler "Handy line at the bottom
set title "Set terminal title to filename
set expandtab "Use spaces instead of tabs
set incsearch "Highlight first matches of searches while typing.
set hlsearch "Highlight all matches
"Toggle line numbers
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
">80 Column notification
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
set backspace=indent,eol,start
" Arrows move up and down by display line in insert mode
inoremap <Down> <C-o>g<Down>
inoremap <Up> <C-o>g<Up>

""" Python specific """
"autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

""" Go specific """
"filetype off
"filetype plugin indent off
"set runtimepath+=$GOROOT/misc/vim
"filetype plugin indent on
"syntax on
"let g:go_fmt_fail_silently = 1
