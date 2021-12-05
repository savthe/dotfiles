" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

Plug 'vim-airline/vim-airline'
Plug 'ycm-core/YouCompleteMe'
" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'jaredgorski/spacecamp'
"Plug 'ParamagicDev/vim-medic_chalk'
"Plug 'eemed/sitruuna.vim'

"Plug 'https://github.com/tomasr/molokai'
"Plug 'https://github.com/gosukiwi/vim-atom-dark'
"Plug 'https://github.com/joshdick/onedark.vim'

call plug#end()

colors night
filetype off                  " required
syntax on
set nocompatible 
set lazyredraw
set autochdir
set clipboard=unnamedplus
set mouse=a
set laststatus=2
set background=dark
set t_Co=256
set number 
set autoindent
set nomodeline
set tabstop=4
set shiftwidth=4
set showcmd
set showmode
set wildmenu
set guicursor+=a:blinkon0
set ttyfast
set cursorline
set ruler
set makeprg=make
set completeopt-=preview
let g:airline#extensions#whitespace#checks = [ 'indent', 'long' ]
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
nnoremap ; :
map <F4> :NERDTreeToggle<CR>
map <F5> :call RunExt()<CR>
map <F6> :!clang++ -std=c++17 -O3 -lpthread -Wall % -I. -o %:r && ./%:r<CR>
map <F9> :!clang++ -std=c++17 -O3 -lpthread -Wall -lsfml-graphics -lsfml-window -lsfml-system % -I. -o %:r && ./%:r<CR>
map <F7> :!make run<CR>

" Disabling annoying ycm auto messages and enabling them usint CTRL+I
let g:ycm_auto_hover = ''
nmap <C-I> <plug>(YCMHover)

set spelllang=ru
:map <F8> :if exists("g:syntax_on") <Bar>
	\   syntax off <Bar>
	\	set spell! <Bar>
	\ else <Bar>
	\   syntax enable <Bar>
	\	set spell! <Bar>
	\ endif <CR>
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
function RunExt()
"	if &modified == 1
"		write
"	endif
	let ext = expand("%:e")
	if ext == "tex"
		"!pdflatex -shell-escape % && (evince %:r.pdf &)
		:silent !pdflatex -shell-escape % 
		:silent !pdflatex -shell-escape % 
		silent !rm %:r.log %:r.toc %:r.aux %:r.out
		:silent exec "!(nohup evince %:r.pdf &) > /dev/null"
		:redraw!
		"!(/home/sav/scripts/okular.sh %:r.pdf &)
		"let vieweropen = system('ps -fe | grep "evince %:r.pdf" | grep -vc grep')
		":echom "TEST: "
		"!(~/scripts/okular.sh %:r.pdf)
	elseif ext == "cpp"
		"!clang++ -g -std=c++11 -lpthread -Wall % -I. -o %:r && ./%:r
		!clang++ -g -std=c++17 -lpthread -Wall % -I. -o %:r && ./%:r
	elseif ext == "c"
		!clang -g -lm % -I. -o %:r && ./%:r
	elseif ext == "xtex"
		!xelatex -8bit --shell-escape % && rm %:r.log && evince %:r.pdf 
	elseif ext == "py"
		!python3 % 
	elseif ext == "plt"
		!gnuplot % 
	endif
endfunction
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
"nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd :call CocAction('jumpDefinition', 'tabe')<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
set signcolumn=number
