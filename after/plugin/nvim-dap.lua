local mason_dap = require("mason-nvim-dap")
local dap = require("dap")
local ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

-- Dap Virtual Text
dap_virtual_text.setup()

mason_dap.setup({
	ensure_installed = { "cppdbg", "codelldb", "delve" },
	automatic_installation = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

-- Configurations
local c_cpp_config = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
    MIMode = "lldb",
    miDebuggerPath = "/usr/bin/lldb", -- Adjust as needed
  },
}
dap.configurations.c = c_cpp_config
dap.configurations.cpp = c_cpp_config

-- Dap UI

ui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

dap.listeners.before.attach.dapui_config = function()
	ui.open()
end
dap.listeners.before.launch.dapui_config = function()
	ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end

-- Keymaps
local keymaps = vim.keymap.set
local opts = { noremap = true, silent = true }

keymaps("n", "<leader>dt", dap.toggle_breakpoint, opts)
keymaps("n", "<leader>dc", dap.continue, opts)
keymaps("n", "<leader>di", dap.step_into, opts)
keymaps("n", "<leader>do", dap.step_over, opts)
keymaps("n", "<leader>du", dap.step_out, opts)
keymaps("n", "<leader>dr", dap.repl.open, opts)
keymaps("n", "<leader>dl", dap.run_last, opts)
keymaps("n", "<leader>dq", dap.terminate, opts)
keymaps("n", "<leader>db", dap.list_breakpoints, opts)

