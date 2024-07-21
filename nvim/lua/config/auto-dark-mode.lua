local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		vim.cmd('colorscheme dracula')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
		vim.cmd('colorscheme shirotelin')

    vim.cmd [[hi Normal guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
    vim.cmd [[hi LineNr guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
    vim.cmd [[hi CursorLineNr guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
    vim.cmd [[hi ColorColumn guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
    vim.cmd [[hi DiffText guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
    vim.cmd [[hi Folded guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
    vim.cmd [[hi FoldColumn guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
    vim.cmd [[hi SignColumn guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
    vim.cmd [[hi StatusLine guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
    vim.cmd [[hi EndOfBuffer guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
    vim.cmd [[hi Comment  guifg=#666666 ctermfg=darkgrey cterm=italic gui=italic]]
    vim.cmd [[hi cComment guifg=#666666 ctermfg=darkgrey cterm=italic gui=italic]]
    vim.cmd [[hi clear CursorLine]]
    vim.cmd [[hi clear TabLineFill]]
    vim.cmd [[hi clear TabLine]]
    vim.cmd [[hi clear Title]]
    vim.cmd [[hi TabLineSel cterm=bold gui=bold]]
    vim.cmd [[hi DiagnosticInfo  guifg=#666666 ctermfg=darkgrey cterm=italic gui=italic]]
    vim.cmd [[hi DiagnosticWarn  guifg=#cc0000 ctermfg=darkgrey cterm=italic gui=italic]]
    vim.cmd [[hi DiagnosticHint  guifg=#5566bb ctermfg=darkgrey cterm=italic gui=italic]]
    vim.cmd [[hi DiagnosticOk    guifg=#666666 ctermfg=darkgrey cterm=italic gui=italic]]
    vim.cmd [[hi FloatBorder guifg=#444488 guibg=none]]
    vim.cmd [[hi Pmenu guibg=none]]
    vim.cmd [[hi VertSplit cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=#aaaabb]]
    vim.cmd [[hi NormalFloat guibg=#333333, ctermbg=gray]] 
    vim.cmd [[hi StatusLineNC guibg=#666666 guifg=#666666]]
    vim.cmd [[hi TelescopeBorder guifg=#aaaaaa guibg=NONE]]
    vim.cmd [[hi TelescopeNormal guibg=NONE]]
    vim.cmd [[hi TelescopePreviewNormal guibg=NONE]]
    vim.cmd [[hi TelescopePromptNormal guibg=NONE]]
    vim.cmd [[hi TelescopeResultsNormal guibg=NONE]]
    vim.cmd [[hi TelescopeTitle guibg=NONE]]
    vim.cmd [[hi TelescopeSelection guifg=white guibg=grey40]]
    vim.cmd [[hi Normal guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
    vim.cmd [[hi Identifier term=NONE cterm=NONE gui=NONE]]
    vim.cmd [[hi Statement term=NONE cterm=NONE gui=NONE]]
    vim.cmd [[hi Conditional term=NONE cterm=NONE gui=NONE]]
    vim.cmd [[hi ClassName term=NONE cterm=NONE gui=NONE]]
    vim.cmd [[hi Identifier term=NONE cterm=NONE gui=NONE]]
	end,
})
