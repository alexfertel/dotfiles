require("nvim-autopairs").setup({
	check_ts = true,
	ts_config = {
		lua = { "string" },
		javascript = { "template_string" },
	},
})

-- require("nvim-autopairs.completion.compe").setup({
-- 	map_cr = true, --  map <CR> on insert mode
-- 	map_complete = true, -- it will auto insert `(` after select function or method item
-- })
