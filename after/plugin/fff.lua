local fff = require('fff')

fff.setup({
    lazy_sync = true,
})

vim.keymap.set('n', '<leader>ff', function() fff.find_files() end, { desc = 'FFFind files' })
vim.keymap.set('n', '<leader>fg', function() fff.live_grep() end, { desc = 'LiFFFe grep' })
vim.keymap.set('n', '<leader>fz', function() fff.live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end, { desc = 'Live fffuzy grep' })
vim.keymap.set('n', '<leader>fc', function() fff.live_grep({ query = vim.fn.expand('<cword>') }) end, { desc = 'Search current word' })
