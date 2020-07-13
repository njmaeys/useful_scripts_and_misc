"######################## VIM MOVEMENT ########################
" Quick pane navigation ctl and vim keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"######################## VIM MOVEMENT ########################

"######################## PLUGINS ########################
" Set the runtime path to include Vundle and initialize... Plugin manager
set rtp+=~/.vim/bundle/Vundle.vim " rtp is Run Time Path

call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'

" This helps with conf file(s) syntax highlighting
Plugin 'chr4/nginx.vim'

" Helpful hasi vim plugin link
" https://github.com/hashivim/vim-hashicorp-tools
Plugin 'hashivim/vim-terraform'
Plugin 'hashivim/vim-consul'
Plugin 'hashivim/vim-hashicorp-tools'
Plugin 'hashivim/vim-nomadproject'
Plugin 'hashivim/vim-ottoproject'
Plugin 'hashivim/vim-packer'
Plugin 'hashivim/vim-vagrant'
Plugin 'hashivim/vim-vaultproject'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Show hidden files/dirs in nerdtree
let NERDTreeShowHidden=1
let g:NERDTreeNodeDelimiter="\u00a0"

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required

" Autoload nerdtree, even if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
"######################## PLUGINS ########################

"######################## SYNTAX ########################
" Turn on syntax highlighting
filetype plugin on
syntax on

" Set specific syntax highligt when filetype doesn't auto set it
autocmd BufNewFile,BufRead *.conf set syntax=conf
"######################## SYNTAX ########################

" Showing line numbers on file open
set number

" Page navigation mappings... lazy mode
noremap H <home>
vnoremap H <home>
noremap L <end>
vnoremap L <end>
noremap K <pageup>
vnoremap K <pageup>
noremap J <pagedown>
vnoremap J <pagedown>

" Cross Hair
set cursorline
set cursorcolumn

"######################## INDENTATION ########################
if (&filetype=='terraform') || (&filetype=='yaml') || (&filetype=='')
    " terraform
    set ls=2 
    set ts=2
    set tabstop=2 " size of a hard tabstop
    set expandtab " always uses spaces instead of tab characters
    set softtabstop=2 " Sets the number of columns for a TAB
    set shiftwidth=2 " for block comments
    set nocompatible
    set backspace=2
else
    " standard for everything else
    set ls=4
    set ts=4
    set tabstop=4 " size of a hard tabstop
    set expandtab " always uses spaces instead of tab characters
    set softtabstop=4 " Sets the number of columns for a TAB
    set shiftwidth=4 " for block comments
    set nocompatible
    set backspace=2
endif
set ignorecase
"######################## INDENTATION ########################

"Status line - show the percentage through a file 
set statusline =%f\ %P 

" Highlight searching; fuzzy search (highlights as you go); case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

 " Don't wrap lines
set nowrap

 " Quick quit (just hit q)
noremap q :quit<CR>

 " Quick save (just hit s)
noremap s :w<CR>

 " No backup files from vim
set nobackup
set nowritebackup
set noswapfile
