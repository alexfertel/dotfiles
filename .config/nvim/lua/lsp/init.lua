require("lspkind")

local lspconfig = require("lspconfig")
local util = require("util")

local function on_attach(client, bufnr)
	require("lsp.formatting").setup(client, bufnr)
	require("lsp.highlighting").setup(client)

	-- TypeScript specific stuff
	if client.name == "typescript" or client.name == "tsserver" then
		require("lsp.ts-utils").setup(client)
	end
end

local diagnosticls_config = {
	filetypes = { "javascript", "typescript" },
	root_dir = function(fname)
		return lspconfig.util.root_pattern("tsconfig.json")(fname) or lspconfig.util.root_pattern(".eslintrc.js")(fname)
	end,
	init_options = {
		linters = {
			eslint = {
				command = "./node_modules/.bin/eslint",
				rootPatterns = { ".eslintrc.js", ".git" },
				debounce = 100,
				args = {
					"--stdin",
					"--stdin-filename",
					"%filepath",
					"--format",
					"json",
				},
				sourceName = "eslint",
				parseJson = {
					errorsRoot = "[0].messages",
					line = "line",
					column = "column",
					endLine = "endLine",
					endColumn = "endColumn",
					message = "[eslint] ${message} [${ruleId}]",
					security = "severity",
				},
				securities = {
					[2] = "error",
					[1] = "warning",
				},
			},
		},
		filetypes = {
			javascript = "eslint",
			typescript = "eslint",
		},
	},
}

local lua_cmd = {
	"/home/alex/alex/software/lsps/lua-language-server/bin/Linux/lua-language-server",
	"-E",
	"-e",
	"LANG=en",
	"/home/alex/alex/software/lsps/lua-language-server/main.lua",
}
-- lua_cmd = { "lua-language-server" }

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
	-- ['null-ls'] = {},
	efm = require("lsp.efm").config,
	vimls = {},
	tailwindcss = {},
	diagnosticls = diagnosticls_config,
	["rust_analyzer"] = {},
}

-- Mappings.

local opts = { noremap = true, silent = true }
util.nmap("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
util.nmap("gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
util.nmap("K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
util.nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
util.nmap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
util.nmap("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
util.nmap("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
util.nmap("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
util.nmap("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
util.nmap("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
util.nmap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
util.nmap("<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
util.nmap("[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
util.nmap("]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
util.nmap("<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
util.nmap("<space>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}

require("lsp.null-ls").setup()

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

vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "LspDiagnosticsDefaultHint" })
