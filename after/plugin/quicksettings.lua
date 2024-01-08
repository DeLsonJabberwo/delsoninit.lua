function wordwrap_toggle()
    if vim.opt_local.wrap:get() then
        vim.opt_local.wrap = false
    else
        vim.opt_local.wrap = true
    end
end

function codeium()
    if (vim.g.codeium_enabled == true) then
        vim.g.codeium_enabled = false
        print("Codeium disabled")
    else
        vim.g.codeium_enabled = true
        print("Codeium enabled")
    end
end
