return {
  {
    "yasukotelin/shirotelin",
  },

  {
    "Mofiqul/dracula.nvim",
    config = function()
      local dracula = require("dracula")
      dracula.setup({
        colors = {
          comment = "#637777",
          --selection = "#222922",
          selection = "NONE",
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
          return {
            --   NonText = { }, -- set NonText fg to white of theme
          }
        end,
      })
      vim.cmd.colorscheme "dracula"
    end,
  },

  {
    "f-person/auto-dark-mode.nvim",
    config = function()
      local auto_dark_mode = require('auto-dark-mode')

      auto_dark_mode.setup({
        update_interval = 1000,
        set_dark_mode = function()
          vim.api.nvim_set_option('background', 'dark')
          vim.cmd('colorscheme dracula')

          vim.cmd('set colorcolumn=')
          vim.cmd [[hi Normal guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
          vim.cmd [[hi CursorLineNr guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
          vim.cmd [[hi ColorColumn guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
          vim.cmd [[hi DiffText guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
          vim.cmd [[hi Folded guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
          vim.cmd [[hi FoldColumn guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
          vim.cmd [[hi SignColumn guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
          vim.cmd [[hi StatusLine guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]
          vim.cmd [[hi clear CursorLine]]
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
    end,
  }
}
