return {
	"MrSloth-dev/42-NorminetteNvim",
	dependencies = {
    "nvim-lua/plenary.nvim",
    "echasnovski/mini.icons"
  },
	config = function()
	require("norminette").setup({
		auto_run = false,
		keybind = "<leader>nrm",
	})
	end,
}

