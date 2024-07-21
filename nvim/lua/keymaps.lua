local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('i', 'jk', '<Esc>', {noremap = true})
map('n', ',<space>', ':nohlsearch<CR>', {noremap = true})
map('n', ',f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], default_opts)
map('n', ',b', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], default_opts)
map('n', ',a', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
map('n', ',s', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
map('n', ',c', [[<cmd>lua require('telescope.builtin').command_history()<cr>]], default_opts)
map('n', ',t', ':TagbarToggle<CR>', default_opts)
map('n', ',r', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)
map('n', ';', ':', {silent = false})
map('n', ',d', ':Gvdiffsplit ', {silent = false})
map('n', 'j', 'gj', {silent = false})
map('n', 'k', 'gk', {silent = false})
