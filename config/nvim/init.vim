" This is NVim config. It usually goes to ~/.config/nvim
" It should be compatable with vim, but needs to be renamed.

" Some plugins depend on external packets. Use this command:
" sudo apt install npm ripgrep fonts-powerline clangd
"
" Use Vim Plug plugin to manage plugins.
" https://github.com/junegunn/vim-plug
" After Vim Plug is installed, run vim and ':PlugInstall'. 
call plug#begin()

" File manager plugin (F4)
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Fuzzy finder (for text, files, text in files in subfolders and so on)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Cute bottom bar. You should install fonts manually: sudo apt install fonts-powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CoC - Conqueror of Completion is great plugin, but it needs recent version of nodejs. If you don't
" want to update nodejs, change 'branch' to 'tag' and find a tag which is compatable with you version
" of nodejs: https://github.com/neoclide/coc-git/tags
" After coc is installed, install plugins for it:
" :CocInstall coc-clangd // you'll need clangd for this: sudo apt install clangd
" :CocInstall pyright
" :CocInstall coc-sh
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Shows tags in current source file (F3)
Plug 'https://github.com/preservim/tagbar'

" Git diff and other stuff
Plug 'https://github.com/tpope/vim-fugitive'

" Colorschemes
Plug 'https://github.com/EdenEast/nightfox.nvim'
Plug 'https://github.com/arcticicestudio/nord-vim'
Plug 'https://github.com/rose-pine/neovim'
Plug 'https://github.com/mhartington/oceanic-next'
Plug 'https://github.com/dracula/vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'https://github.com/tomasr/molokai'
Plug 'https://github.com/rakr/vim-one'
Plug 'https://github.com/haishanh/night-owl.vim'
Plug 'https://github.com/HenryNewcomer/vim-theme-papaya'
Plug 'https://github.com/romainl/Apprentice'
Plug 'https://github.com/whatyouhide/vim-gotham'
Plug 'https://github.com/cseelus/vim-colors-lucid'
Plug 'https://github.com/christophermca/meta5'
Plug 'https://github.com/owickstrom/vim-colors-paramount'
Plug 'https://github.com/jaredgorski/SpaceCamp'
Plug 'https://github.com/gosukiwi/vim-atom-dark'
Plug 'https://github.com/nanotech/jellybeans.vim'


call plug#end()

colorscheme dracula
hi clear CursorLine
"hi CursorLine term=bold cterm=bold guibg=Grey10

set signcolumn=number
set termguicolors
"set cc=100
set cursorline
set number 
set tabstop=2 shiftwidth=2 expandtab
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set spelllang=en,ru
set clipboard+=unnamedplus
set tw=100

" This makes searching case insensitive if all letters are lower case
set ignorecase
set smartcase

"===Airline===
let g:airline_theme='jellybeans'
"let g:airline#extensions#whitespace#checks = [ 'indent', 'long' ]
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#languageclient#enabled = 0  
let g:airline#extensions#nvimlsp#enabled = 0
let g:airline#extensions#coc#enabled = 0
let g:python3_host_prog = '/usr/bin/python'

nmap ; :

" Used for git diff. Open a file, press F2 and enter (or paste a specific commit hash)
nnoremap <F2> :Gvdiffsplit<Space>
nmap <F3> :TagbarToggle<CR>
"nmap <F3> :Vista!!<CR>
nmap <F4> :NERDTreeToggle<CR>
nmap <F5> :call RunExt()<CR>
nnoremap <silent> <F8> :set spell!<cr>
inoremap <silent> <F8> <C-O>:set spell!<cr>

let mapleader = ","
" ,b shows opened buffers
nmap <Leader>b :Buffers<CR>
" ,t lists files
nmap <Leader>t :Files<CR>
" ,r tag search
nmap <Leader>r :Tags<CR>
" ,s fuzzy search of text in all files from current folder. 'sudo apt install ripgrep' for it.
nmap <Leader>s :Rg<CR>

"===COC===
"Fix for Float box color
highlight CocErrorFloat ctermfg=White guifg=#ffffff

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <C-G> <C-B>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
"nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gd :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> Gd :call CocAction('jumpImplementation', 'tabe')<CR>

"===NerdTree===
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

function! RunExt() abort
  if &filetype ==# 'python'
    split | term python %
  elseif &filetype ==# 'cpp'
    split | term g++ % && ./a.out
  elseif &filetype ==# 'gnuplot'
    split | term gnuplot %
  elseif &filetype ==# 'tex'
		!pdflatex -shell-escape % 
		!pdflatex -shell-escape % 
		!rm %:r.log %:r.toc %:r.aux %:r.out
		!evince %:r.pdf &
  else
    echomsg 'filetype' &filetype 'is not supported'
  endif
endfunction
