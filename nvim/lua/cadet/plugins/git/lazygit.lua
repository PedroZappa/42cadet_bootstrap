return {
	"kdheepak/lazygit.nvim",
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	keys = {
		{ "<leader>ggg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	},
}

