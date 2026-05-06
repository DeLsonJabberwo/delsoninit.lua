-- Native treesitter highlighting (replaces nvim-treesitter plugin)
-- Parsers are started automatically when available.
-- Install missing parsers with :treesitter install <lang>
vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})

vim.o.winborder = 'single'
