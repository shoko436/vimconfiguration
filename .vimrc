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

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'

Plug 'lifepillar/vim-solarized8'

call plug#end()

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
autocmd Filetype terraform setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
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
set background=dark
colorscheme solarized8
set guifont=Hack_Nerd_Font:h13
set textwidth=110
set cc=+1

highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey

nnoremap <SPACE> <Nop>
let mapleader=" "

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

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

nnoremap <silent> <Leader><Leader>n :NERDTreeFind<CR> <C-w>=

nnoremap <silent> <Leader>a A
nnoremap <silent> <Leader>i I
nnoremap <silent> <Leader>o O
nnoremap <silent> <Leader>g G

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fc <Plug>(coc-format-selected)
nmap <leader>fc <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader><leader>a <Plug>(coc-codeaction-selected)
nmap <leader><leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>n  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>p  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>r  :<C-u>CocListResume<CR>
