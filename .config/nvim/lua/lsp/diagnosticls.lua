local lspconfig = require("lspconfig")

return {
	filetypes = { "javascript", "typescript" },
	root_dir = function(fname)
		local possible_patterns = { "tsconfig.json", ".eslintrc.js", ".eslintrc.json" }
		for _, pattern in pairs(possible_patterns) do
			local r = lspconfig.util.root_pattern(pattern)(fname)
			if r then
				return r
			end
		end

		return false
	end,
	init_options = {
		linters = {
			eslint = {
				command = "./node_modules/.bin/eslint",
				rootPatterns = { ".eslintrc.js", ".eslintrc.json", ".git" },
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
