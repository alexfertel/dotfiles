require("lsp.lspkind")
require("lsp.rust-tools")

local lspconfig = require("lspconfig")
local util = require("util")

local function on_attach(client, bufnr)
	require("lsp.formatting").setup(client, bufnr)

	local buf_map = vim.api.nvim_buf_set_keymap

	local opts = { noremap = true, silent = true }
	buf_map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_map(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_map(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_map(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_map(bufnr, "n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_map(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_map(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_map(bufnr, "n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_map(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_map(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_map(bufnr, "n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_map(bufnr, "n", "<space>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	-- TypeScript specific stuff
	if client.name == "typescript" or client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		-- require("lsp.ts-utils").setup(client)
	end
end

local lua_cmd = {
	"/home/alex/alex/software/lsps/lua-language-server/bin/Linux/lua-language-server",
	"-E",
	"-e",
	"LANG=en",
	"/home/alex/alex/software/lsps/lua-language-server/main.lua",
}

local servers = {
	pyright = {},
	bashls = {},
	tsserver = {},
	cssls = { cmd = { "css-languageserver", "--stdio" } },
	jsonls = { cmd = { "vscode-json-languageserver", "--stdio" } },
	html = { cmd = { "html-languageserver", "--stdio" } },
	clangd = {},
	sumneko_lua = require("lua-dev").setup({
		library = { plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" } },
		lspconfig = { cmd = lua_cmd },
	}),
	efm = require("lsp.efm").config,
	vimls = {},
	-- tailwindcss = {},
	diagnosticls = require("lsp.diagnosticls"),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}

for server, config in pairs(servers) do
	lspconfig[server].setup(vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	}, config))
	local cfg = lspconfig[server]
	if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
		util.error(server .. ": cmd not found: " .. vim.inspect(cfg.cmd))
	end
end

-- This may be uncommented in the future. I haven't found a way to
-- get support for autoimports, which I love.
--
-- require("null-ls").setup({})
-- lspconfig.tsserver.setup({
-- 	on_attach = function(client, bufnr)
-- 		-- disable tsserver formatting if you plan on formatting via null-ls
-- 		client.resolved_capabilities.document_formatting = false

-- 		local ts = require("nvim-lsp-ts-utils")
-- 		vim.lsp.handlers["textDocument/codeAction"] = ts.code_action_handler

-- 		-- defaults
-- 		ts.setup({
-- 			debug = false,
-- 			disable_commands = false,
-- 			enable_import_on_completion = true,

-- 			-- import all
-- 			import_all_timeout = 5000, -- ms
-- 			import_all_priorities = {
-- 				buffers = 4, -- loaded buffer names
-- 				buffer_content = 3, -- loaded buffer content
-- 				local_files = 2, -- git files or files with relative path markers
-- 				same_file = 1, -- add to existing import statement
-- 			},
-- 			import_all_scan_buffers = 100,
-- 			import_all_select_source = false,

-- 			-- eslint
-- 			eslint_enable_code_actions = true,
-- 			eslint_enable_disable_comments = true,
-- 			eslint_bin = "eslint_d",
-- 			eslint_config_fallback = nil,
-- 			eslint_enable_diagnostics = true,

-- 			-- formatting
-- 			enable_formatting = true,
-- 			formatter = "prettier",
-- 			formatter_config_fallback = nil,

-- 			-- update imports on file move
-- 			update_imports_on_move = true,
-- 			require_confirmation_on_move = false,
-- 			watch_dir = nil,
-- 		})

-- 		-- required to fix code action ranges
-- 		ts.setup_client(client)

-- 		-- no default maps, so you may want to define some here
-- 		local options = { silent = true }
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", options)
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", options)
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", options)
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", options)
-- 	end,
-- })

vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })
