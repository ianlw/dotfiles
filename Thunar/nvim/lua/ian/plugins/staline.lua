require('staline').setup{
	sections = {
		left = {
    		' ', 'right_sep', '-mode', 'left_sep', ' ',
			'right_sep', '-file_name', 'left_sep', ' ', 'branch'
		},
		mid  = {'lsp',},
		right= {
       		'right_sep', '-cool_symbol', 'left_sep',
			' ', 'right_sep', '-line_column', 'left_sep', ' ',
		}
	},

	defaults={
       fg = "#000000",
		cool_symbol = " ",
		left_separator = "",
		right_separator = "",
		-- line_column = "%l:%c [%L]",
		true_colors = true,
		line_column = "[%l:%c] 並%L% ",
		-- font_active = "bold",
        inactive_color  = "#0D151D",
        inactive_bgcolor = "none",
	},
	mode_colors = {
		n  = "#c2caff",
		i  = "#ff7cb5",
		ic = "#ffc8f4",
		c  = "#ce0249",
		v  = "#ffc4a9"       -- etc
	}
}


--[[
require('stabline').setup{
	style       = "bubble", -- others: arrow, slant, bubble
   stab_left   = "",
	stab_right  = " ",

	fg          = "#000000",
	bg = "#e41061",
    inactive_bg = "#c2caff",
	inactive_fg = "#282828",
	-- stab_bg     = Default is darker version of bg.,

	font_active = "bold",
    font_inactive = "italic",
	exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
	stab_start  = "",   -- The starting of stabline
	stab_end    = "",
}

--]]
