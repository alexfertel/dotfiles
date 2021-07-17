local lspconfig = require("lspconfig")

local M = {}

local linters = {
	eslint = {
		sourceName = "eslint",
		command = "eslint_d",
		rootPatterns = { ".eslintrc.js", "package.json" },
		debounce = 100,
		args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
		parseJson = {
			errorsRoot = "[0].messages",
			line = "line",
			column = "column",
			endLine = "endLine",
			endColumn = "endColumn",
			message = "${message} [${ruleId}]",
			security = "severity",
		},
		securities = { ["2"] = "error", ["1"] = "warning" },
	},
}

local formatters = {
	prettier = { command = "prettier", args = { "--stdin-filepath", "%filepath" } },
}

M.filetypes = {
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
	"javascript.jsx",
	"typescript.tsx",
}

local function populate_with(fts, word)
	local tbl = {}

	for _, key in pairs(fts) do
		tbl[key] = word
	end

	return tbl
end

M.root_dir = function(fname)
	local possible_patterns = { "tsconfig.json", ".eslintrc.js", ".eslintrc.json" }
	for _, pattern in pairs(possible_patterns) do
		local r = lspconfig.util.root_pattern(pattern)(fname)
		if r then
			return r
		end
	end

	return false
end

M.init_options = {
	formatters = formatters,
	linters = linters,
	formatFiletypes = populate_with(M.filetypes, "prettier"),
	filetypes = populate_with(M.filetypes, "eslint"),
}

return M
