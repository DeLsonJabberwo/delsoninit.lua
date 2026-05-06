local _99 = require("99")
_99.setup({
    logger = {
        level = _99.DEBUG,
        path = "/tmp/99.debug",
        print_on_error = true,
    },
    model = "opencode-go/kimi-k2.5",
})
vim.keymap.set("v", "<leader>kv", function() _99.visual() end)
vim.keymap.set("n", "<leader>kx", function() _99.stop_all_requests() end)
vim.keymap.set("n", "<leader>ks", function() _99.search() end)

vim.keymap.set("n", "<leader>km", function()
    require("99.extensions.telescope").select_model()
end)

vim.keymap.set("n", "<leader>kp", function()
    require("99.extensions.telescope").select_provider()
end)
