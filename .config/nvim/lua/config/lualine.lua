-- This is a modified version of https://gist.github.com/hoob3rt/b200435a765ca18f09f83580a606b878
-- merged with https://github.com/folke/dot

local devicons = require("nvim-web-devicons")

local function clock()
	return " " .. os.date("%H:%M")
end

local colors = {
	bg = "#202328",
	fg = "#CBCCC6",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		icons_enabled = true,
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_v = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	extensions = { "nvim-tree" },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

-- These two tables can be made one, but I'm lazy
local mode_names = {
	["n"] = "NORMAL",
	["no"] = "O-PENDING",
	["nov"] = "O-PENDING",
	["noV"] = "O-PENDING",
	["no"] = "O-PENDING",
	["niI"] = "NORMAL",
	["niR"] = "NORMAL",
	["niV"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "V-LINE",
	[""] = "V-BLOCK",
	["s"] = "SELECT",
	["S"] = "S-LINE",
	[""] = "S-BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["ix"] = "INSERT",
	["R"] = "REPLACE",
	["Rc"] = "REPLACE",
	["Rv"] = "V-REPLACE",
	["Rx"] = "REPLACE",
	["c"] = "COMMAND",
	["cv"] = "EX",
	["ce"] = "EX",
	["r"] = "REPLACE",
	["rm"] = "MORE",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

local mode_colors = {
	n = colors.red,
	i = colors.green,
	v = colors.blue,
	[""] = colors.blue,
	V = colors.blue,
	c = colors.magenta,
	no = colors.red,
	s = colors.orange,
	S = colors.orange,
	[""] = colors.orange,
	ic = colors.yellow,
	R = colors.violet,
	Rv = colors.violet,
	cv = colors.red,
	ce = colors.red,
	r = colors.cyan,
	rm = colors.cyan,
	["r?"] = colors.cyan,
	["!"] = colors.red,
	t = colors.red,
}

ins_left({
	function()
		local mode = vim.fn.mode()
		vim.api.nvim_command("hi! LualineMode guifg=" .. colors.bg .. " guibg=" .. mode_colors[mode])
		return " " .. mode_names[mode]
	end,
	color = "LualineMode",
	left_padding = 0,
})

ins_left({
	"filename",
	condition = conditions.buffer_not_empty,
	file_status = true,
	path = 1,
	color = { fg = colors.magenta, gui = "bold" },
})

ins_left({
	"branch",
	icon = "",
	condition = conditions.check_git_workspace,
	color = { fg = colors.violet, gui = "bold" },
})

ins_left({
	"diagnostics",
	sources = { "nvim_lsp" },
	symbols = { error = " ", warn = " ", info = " " },
	color_error = colors.red,
	color_warn = colors.yellow,
	color_info = colors.cyan,
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater than 2
ins_left({
	function()
		return "%="
	end,
})
local function lsp_progress()
	local messages = vim.lsp.util.get_progress_messages()
	if #messages == 0 then
		local msg = "No Active Lsp"

		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		msg = ""

		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				if msg == "" then
					msg = client.name
				else
					msg = msg .. " | " .. client.name
				end
			end
		end

		local bufname = vim.fn.bufname()
		local extension = bufname:match("[^.]+$")
		local icon = devicons.get_icon(bufname, extension)
		if icon == nil then
			return msg
		else
			return icon .. " " .. msg
		end
	end
	local status = {}
	for _, msg in pairs(messages) do
		table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
	end
	local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
	local ms = vim.loop.hrtime() / 1000000
	local frame = math.floor(ms / 120) % #spinners
	return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

vim.cmd([[autocmd User LspProgressUpdate let &ro = &ro]])

ins_left({
	lsp_progress,
	color = { fg = colors.orange, gui = "bold" },
})

ins_right({
	"fileformat",
	upper = true,
	icons_enabled = true,
	color = { fg = colors.green, gui = "bold" },
})

ins_right({ "location", icon = "並", color = { fg = colors.blue } })

ins_right({ "progress", color = { fg = colors.violet, gui = "bold" } })

ins_right({
	"diff",
	-- Is it me or the symbol for modified is really weird
	symbols = { added = "+", modified = "~", removed = "-" },
	color_added = colors.green,
	color_modified = colors.orange,
	color_removed = colors.red,
	condition = conditions.hide_in_width,
})

ins_right({
	clock,
	color = { fg = colors.yellow },
	condition = conditions.hide_in_width,
})

ins_right({
	function()
		local mode = vim.fn.mode()
		vim.api.nvim_command("hi! LualineEnd guifg=" .. colors.bg .. " guibg=" .. mode_colors[mode])
		return "▊"
	end,
	color = "LualineEnd", -- Sets highlighting of component
	right_padding = 0,
})

require("lualine").setup(config)
