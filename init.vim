call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/nanotech/jellybeans.vim'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/joshdick/onedark.vim'
"Plug 'https://github.com/tomasr/molokai'
"Plug 'https://github.com/sainnhe/gruvbox-material'
"Plug 'https://github.com/dracula/vim'
Plug 'https://github.com/rakr/vim-one'
Plug 'https://github.com/haishanh/night-owl.vim'
"Plug 'https://github.com/HenryNewcomer/vim-theme-papaya'
"Plug 'https://github.com/romainl/Apprentice'
"Plug 'https://github.com/whatyouhide/vim-gotham'
Plug 'https://github.com/cseelus/vim-colors-lucid'
Plug 'https://github.com/christophermca/meta5'
"Plug 'https://github.com/owickstrom/vim-colors-paramount'
Plug 'https://github.com/jaredgorski/SpaceCamp'
Plug 'https://github.com/gosukiwi/vim-atom-dark'
Plug 'tribela/vim-transparent'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme night-owl 

set signcolumn=number
set termguicolors
set cursorline
set number 
set tabstop=2 shiftwidth=2 expandtab
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

"===Airline===
"typo in theme... I like default look
let g:airline_theme='seagul'
"let g:airline#extensions#whitespace#checks = [ 'indent', 'long' ]
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2

nmap ; :
nmap <F3> :TagbarToggle<CR>
nmap <F4> :NERDTreeToggle<CR>
nmap <F5> :call RunExt()<CR>

"===COC===
"Fix for Float box color
highlight CocErrorFloat ctermfg=White guifg=#ffffff

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd :call CocAction('jumpDefinition', 'tabe')<CR>

"===NerdTree===
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

function! RunExt() abort
  if &filetype ==# 'python'
    split | term python %
  elseif &filetype ==# 'cpp'
    terminal g++ % && ./a.out
  elseif &filetype ==# 'tex'
		!pdflatex -shell-escape % 
		!rm %:r.log %:r.toc %:r.aux %:r.out
		!evince %:r.pdf &
  else
    echomsg 'filetype' &filetype 'is not supported'
  endif
endfunction
