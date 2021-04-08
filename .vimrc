call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'

call plug#end()

let g:ale_linters = {
      \ 'ruby':['rubocop'],
      \ 'css': ['prettier'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'typescript': ['tslint'],
      \ 'json': ['prettier'],
      \ 'less': ['prettier'],
      \ 'python': ['flake8'],
      \ 'scss': ['prettier'],
      \ 'yaml': ['prettier'],
      \ }
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'ruby':['rubocop'],
      \ 'css': ['prettier'],
      \ 'scss': ['prettier'],
      \ 'html': ['prettier'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'typescript': ['prettier'],
      \ 'json': ['prettier'],
      \ 'less': ['prettier'],
      \ 'python': ['black', 'isort'],
      \ 'yaml': ['prettier'],
      \ }

let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma none'

let g:deoplete#enable_at_startup = 1
let g:ale_completion_enabled = 0
let g:ale_completion_autoimport = 1
set omnifunc=ale#completion#OmniFunc

let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:airline#extensions#ale#enabled = 1
let g:ale_linters_explicit = 1
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_list_window_enabled = 1
let g:ale_list_window_size = 5

let g:airline_powerline_fonts = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeGitStatusUseNerdFonts = 1

let g:webdevicons_enable = 1
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set backspace=indent,eol,start
set completeopt=menu,preview
set termguicolors
set incsearch
set hlsearch
set ttyfast
set showmode
set rtp+=/usr/local/opt/fzf
set title
set mouse=a
set clipboard=unnamed
set encoding=utf-8
set number
set relativenumber
set showcmd
set ruler
set showmatch
set laststatus=2
set expandtab
set tabstop=4
set shiftwidth=4
set list
set listchars=tab:→\ ,trail:·,nbsp:·
set cursorline
set scrolloff=8

" Different tab/space stops"
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype eruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype make setlocal noexpandtab

set nobackup
set nowritebackup
set nowb
set noswapfile

set undolevels=1000

syntax on
colorscheme onedark
set guifont=Hack_Nerd_Font:h13
set textwidth=110
set cc=+1

highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey


nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>wa :wa<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>qa :qa<CR>

nnoremap <silent> <C-f> :FZF<CR>
nnoremap <silent> <Leader>f :Ag<CR>
nnoremap <silent> <Leader>/ :BLines<CR>

nnoremap <silent> <Leader><Leader>h <C-w>H
nnoremap <C-h> <C-w>h
nnoremap <silent> <Leader><Leader>j <C-w>J
nnoremap <C-j> <C-w>j
nnoremap <silent> <Leader><Leader>k <C-w>K
nnoremap <C-k> <C-w>k
nnoremap <silent> <Leader><Leader>l <C-w>L
nnoremap <C-l> <C-w>l

nnoremap <silent> <Leader><Leader>s <C-w>s <C-w>j :Files<CR>
nnoremap <silent> <Leader><Leader>v <C-w>v <C-w>l :Files<CR>

nnoremap <silent> <Leader>nt :NERDTreeFind<CR> <C-w>=
nnoremap <silent> <Leader>fx :ALEFix<CR>

nnoremap <silent> <Leader>a A
nnoremap <silent> <Leader>i I
nnoremap <silent> <Leader>o O
nnoremap <silent> <Leader>g G
