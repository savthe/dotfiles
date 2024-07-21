local dracula = require("dracula")
dracula.setup({
colors = {
    comment = "#637777",
    selection = "#222922",
  },
  show_end_of_buffer = true, -- default false
  -- use transparent background
  transparent_bg = true, -- default false
  -- set custom lualine background color
  lualine_bg_color = "#44475a", -- default nil
  -- set italic comment
  italic_comment = true, -- default false
  -- overrides the default highlights with table see `:h synIDattr`
  --overrides = {},
  -- You can use overrides as table like this
  -- overrides = {
  --   NonText = { fg = "white" }, -- set NonText fg to white
  --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
  --   Nothing = {} -- clear highlight of Nothing
  -- },
  -- Or you can also use it like a function to get color from theme
  -- overrides = function (colors)
  --   return {
  --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
  --   }
  -- end,

  overrides = function (colors)

vim.cmd('set colorcolumn=')
vim.cmd [[hi Normal guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
vim.cmd [[hi CursorLineNr guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
vim.cmd [[hi ColorColumn guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
vim.cmd [[hi DiffText guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
vim.cmd [[hi Folded guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
vim.cmd [[hi FoldColumn guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
vim.cmd [[hi SignColumn guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
vim.cmd [[hi StatusLine guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
--vim.cmd [[hi CursorLine gui=underline cterm=underline guisp=gray30]]
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
     return {
    --   NonText = { }, -- set NonText fg to white of theme
     }
  end,
})

-- vim.cmd('colorscheme dracula')
