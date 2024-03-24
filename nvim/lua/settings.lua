local opt = vim.opt

opt.mouse = 'a'             
opt.encoding = 'utf-8'      
opt.showcmd = true        
vim.cmd([[
filetype indent plugin on
syntax enable
]])
opt.swapfile = false     

-- Visuals
opt.number = true       
opt.wrap = true       
opt.expandtab = true 
opt.tabstop = 2    
opt.smartindent = true
opt.shiftwidth = 2   

-- 2 spaces for selected filetypes
vim.cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja,rust setlocal shiftwidth=2 tabstop=2
]]

opt.so = 5                   --Отступ курсора от края экрана
--opt.foldcolumn = '2'         --Ширина колонки для фолдов
opt.signcolumn = 'number'         --Ширина колонки для фолдов
opt.colorcolumn =  '119'     --Расположение цветной колонки

-- remove line lenght marker for selected filetypes
vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

opt.cursorline = true  
opt.termguicolors = true

-- Компактный вид у тагбара и Отк. сортировка по имени у тагбара
vim.g.tagbar_compact = 1
vim.g.tagbar_sort = 0

opt.ignorecase = true        --Игнорировать размер букв
opt.smartcase = true         --Игнор прописных буквj

opt.foldmethod = 'indent'
opt.foldnestmax = 1
opt.foldenable = true
opt.foldlevel = 2
vim.diagnostic.config({ virtual_lines = true })
vim.diagnostic.config({ virtual_text = true })
vim.api.nvim_set_option("clipboard","unnamedplus") 
--
-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end
]], false)

