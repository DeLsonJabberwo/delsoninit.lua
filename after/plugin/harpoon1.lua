-- THIS WAS FROM HARPOON 1 --

--local mark = require("harpoon.mark")
--local ui = require("harpoon.ui")
--
--vim.keymap.set("n", "<leader>a", mark.add_file)
--vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
--
--vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
--vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
--vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
--vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

-- END WORKING HARPOON 1 --


-- For some reason, the above method works here even though it still doesn't in delson.remap

-- vim.api.nvim_set_keymap("n", "<leader>a", [[<cmd>lua mark.add_file()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-e>", [[<cmd>lua ui.toggle_quick_menu()<CR>]], { noremap = true, silent = true })
-- 
-- vim.api.nvim_set_keymap("n", "<C-h>", '<cmd>lua ui.nav_file(1)<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-t>", '<cmd>lua ui.nav_file(2)<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-n>", '<cmd>lua ui.nav_file(3)<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-s>", '<cmd>lua ui.nav_file(4)<CR>', { noremap = true, silent = true }) ]]--

