return {
	'HiPhish/rainbow-delimiters.nvim',
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- This module contains a number of default definitions
		local rainbow_delimiters = require 'rainbow-delimiters'

		---@type rainbow_delimiters.config
		vim.g.rainbow_delimiters = {
			strategy = {
				[''] = rainbow_delimiters.strategy['global'],
				vim = rainbow_delimiters.strategy['local'],
			},
			query = {
				[''] = 'rainbow-delimiters',
				lua = 'rainbow-blocks',
			},
			priority = {
				[''] = 110,
				lua = 210,
			},
			highlight = {
				-- 'RainbowDelimiterRed',
				-- 'RainbowDelimiterYellow',
				'RainbowDelimiterBlue',
				-- 'RainbowDelimiterOrange',
				'RainbowDelimiterCyan',
				-- 'RainbowDelimiterGreen',
				'RainbowDelimiterViolet',
			},
		}

	end,
}

