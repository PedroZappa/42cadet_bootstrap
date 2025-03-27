return {
  "lukas-reineke/indent-blankline.nvim",
  commit = "3d08501caef2329aba5121b753e903904088f7e6",
  main = "ibl",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  ---@module "ibl"
  ---@type ibl.config
  opts = {
  },
  config = function ()
    local highlight = {
      -- "LightPurple",
      "DarkPurple",
    }
    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function ()
      -- vim.api.nvim_set_hl(0, "LightPurple", { fg = "#715da8" })
      vim.api.nvim_set_hl(0, "DarkPurple", { fg = "#5232a8" })
    end)

    require("ibl").setup {
      indent = { highlight = highlight },
    }
  end,
}

