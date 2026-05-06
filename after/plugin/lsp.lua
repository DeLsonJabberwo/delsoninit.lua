local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require('cmp')
local cmp_action = lsp.cmp_action()


local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
  ["<C-y>"] = cmp.mapping.complete(),
})

cmp.setup({
	window = {
		completion = cmp.config.window.bordered({
			border = 'single',
			winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,Search:None',
		}),
		documentation = cmp.config.window.bordered({
			border = 'single',
			winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,Search:None',
		}),
	},
	mapping = cmp_mappings,
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }),
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- local lua_opts = lsp.nvim_lua_ls()
-- require('lspconfig').lua_ls.setup(lua_opts)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
        'gopls',
        'rust_analyzer',
        'lua_ls',
        'jdtls',
        'bashls',
        'cmake',
        'clangd',
        'html',
        'pylsp',
        'cssls',
        'ts_ls',
        'tailwindcss',
        'eslint',
        'htmx',
        'templ',
        'marksman',
        'jsonls',
        'yamlls',
    },
	handlers = {
		lsp.default_setup,
        html = function()
            require("lspconfig").html.setup({
                filetypes = { "html", "templ" },
                init_options = {
                    embedded_languages = {
                        javascript = true,
                        css = true
                    }
                }
            })
        end,
        gopls = function()
            require("lspconfig").gopls.setup({
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                    },
                },
            })
        end,
        templ = function()
            require("lspconfig").templ.setup({
                filetypes = { "templ" },
            })
        end,
        tailwindcss = function()
            require("lspconfig").tailwindcss.setup({
                filetypes = {
                    "html",
                    "css",
                    "scss",
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                    "svelte",
                    "vue",
                    "templ",
                },
                init_options = {
                    userLanguages = {
                        templ = "html",
                    },
                },
                root_dir = require('lspconfig.util').root_pattern(
                    "tailwind.config.js",
                    "tailwind.config.cjs",
                    "package.json",
                    ".git"
                ) or vim.fn.getcwd(),
                settings = {
                    tailwindCSS = {
                        experimental = {
                            classRegex = {
                                [[class="([^"]*)"]], -- Matches class="..."
                                [[class: "([^"]*)"]], -- Matches class: "..."
                            },
                        },
                        validate = true,
                        lint = {
                            cssConflict = "warning",
                            invalidApply = "error",
                            invalidConfigPath = "error",
                            invalidScreen = "error",
                            invalidTailwindDirective = "error",
                            invalidVariant = "error",
                            recommendedVariantOrder = "warning",
                        },
                    },
                },
            })
        end,
        ts_ls = function()
            require("lspconfig").ts_ls.setup({
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                    "templ", "html",
                },
                root_dir = require("lspconfig.util").root_pattern(
                    "package.json",
                    "tsconfig.json",
                    "jsconfig.json",
                    ".git"
                ) or vim.fn.getcwd(),
            })
        end,
        eslint = function ()
            require("lspconfig").eslint.setup({
                filetypes = {
                    "javascript", "javascriptreact",
                    "typescript", "typescriptreact",
                    "html", "templ"
                },
                settings = {
                    workingDirectory = { mode = "auto" },
                }
            })
        end,
-- 		lua_ls = function()
-- 			local lua_opts = lsp.nvim_lua_ls()
-- 			require('lspconfig').lua_ls.setup(lua_opts)
-- 		end,
	},
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
