require('catppuccin').setup({
  flavour = "mocha",
    transparent_background = true,
})

vim.cmd('colorscheme catppuccin')
vim.cmd('set colorcolumn=')
vim.cmd [[hi clear CursorLine]]
vim.cmd [[hi CursorLine gui=underline cterm=underline guisp=gray30]]
vim.cmd [[hi LineNr ctermfg=gray guifg=#353535]]
vim.cmd [[hi TelescopeBorder guifg=#aaaaaa guibg=NONE]]
vim.cmd [[hi TelescopeNormal guibg=NONE]]
vim.cmd [[hi TelescopePreviewNormal guibg=NONE]]
vim.cmd [[hi TelescopePromptNormal guibg=NONE]]
vim.cmd [[hi TelescopeResultsNormal guibg=NONE]]
vim.cmd [[hi TelescopeTitle guibg=NONE]]
vim.cmd [[hi TelescopeSelection guibg=grey30]]
vim.cmd [[hi Comment guifg=#637777]]
vim.cmd [[hi FloatBorder guifg=#aaaaaa]]
vim.cmd([[highlight DiagnosticVirtualTextError guibg=NONE]])
vim.cmd([[highlight DiagnosticVirtualTextWarn guibg=NONE]])
vim.cmd([[highlight DiagnosticVirtualTextInfo guibg=NONE]])
vim.cmd([[highlight DiagnosticVirtualTextHint guibg=NONE]])
