call plug#begin('~/.vim/plugged')
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

endif " has("autocmd")

if (has("termguicolors"))
 set termguicolors
endif

" PLUGINS

" Language
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

" Editing
" Plug 'w0rp/ale'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'

" Colour schemes
Plug 'ajmwagar/vim-deus'
Plug 'BrainDeath0/Hypsteria'

" Version control
Plug 'tpope/vim-fugitive'

" SETTINGS

" General
set hidden               " hide when switching buffers, don't unload
set spelllang=en_nz      " spell check with New Zealand English
set title                " use filename in window title
set gdefault             " replace everything by default
" set visualbell           " stop the beep
set colorcolumn=80       " for cleaner code
set showtabline=0        " hide tab line
" set synmaxcol=120      " Limit syntax highlighting
set number

" Backup swap files
set nobackup		" do not keep a backup file, use versions instead
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Infinite undo
set undofile
set undodir=~/.vim/undo//
set undolevels=1000
set undoreload=10000

" Tabs
set expandtab            " replace tabs with spaces
set shiftwidth=2         " spaces for autoindenting
set softtabstop=2        " spaces for editing, e.g. <Tab> or <BS>
set tabstop=2            " spaces for <Tab>
set autoindent		" always set autoindenting on
" syntax on

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

" Colour
colorscheme hypsteria
" set background=dark

" Plugin settings
" Syntastic
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_args=['-c', 'mishguru', '--ext', '.js,.jsx']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_html_checkers=['']
let g:syntastic_always_populate_loc_list = 1

" vim-javascript
let g:javascript_plugin_flow = 1

" NERDTree
let NERDTreeDirArrows = 1
let g:NERDTreeNodeDelimiter = "\u00a0"
map <C-b> :NERDTreeToggle<CR>
map <C-n> :NERDTreeFind<CR>

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

call plug#end()
