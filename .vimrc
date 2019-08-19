" Quick pane navigation ctl and vim keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easy find replace four spaces with tabs since all our projects use tabs...
" stupid sublime
map t :%s/    /\t/g
" Removing this for now since we started using editorconfigs... leaving in
" case i ever want it again

" Set the runtime path to include Vundle and initialize... Plugin manager
set rtp+=~/.vim/bundle/Vundle.vim " rtp is Run Time Path

call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Show hidden files/dirs
let NERDTreeShowHidden=1
let g:NERDTreeNodeDelimiter="\u00a0"

" All of your Plugins must be added before the following line
call vundle#end()			" required
filetype plugin indent on	" required

" Autoload nerdtree, even if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif

" Turn on syntax highlighting
syntax on
highlight Comment ctermfg='Red'
highlight Number ctermfg='DarkMagenta'
highlight String ctermfg='White'
highlight Float ctermfg='Blue'

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

" Use spaces not tabs
set ls=2 
set ts=4
set tabstop=4 " size of a hard tabstop
set expandtab " always uses spaces instead of tab characters
set softtabstop=4 " Sets the number of columns for a TAB
set shiftwidth=4 " for block comments
set nocompatible
set backspace=2
set ignorecase

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
