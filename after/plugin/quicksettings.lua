function wordwrap_toggle()
    if vim.opt_local.wrap:get() then
        vim.opt_local.wrap = false
    else
        vim.opt_local.wrap = true
    end
end
