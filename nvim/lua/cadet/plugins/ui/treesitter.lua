return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    -- "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
    -- "nvim-treesitter/nvim-treesitter-refactor", -- Provides "got to def" capabilities
    { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "nix",
        "c",
        "bash",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "javascript",
        "html",
        "markdown",
        "make",
        "http",
      },
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<C-s>",
          node_decremental = "<C-x>",
        },
      },
      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      -- textobjects = {
      --   select = {
      --     enable = true,
      --     -- Automatically jump forward to textobj, similar to targets.vim
      --     lookahead = true,
      --     keymaps = {
      --       -- You can use the capture groups defined in textobjects.scm
      --       ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
      --       ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
      --       ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
      --       ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      --       -- You can also use captures from other query groups like `locals.scm`
      --       ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      --     },
      --     -- You can choose the select mode (default is charwise 'v')
      --     --
      --     -- Can also be a function which gets passed a table with the keys
      --     -- * query_string: eg '@function.inner'
      --     -- * method: eg 'v' or 'o'
      --     -- and should return the mode ('v', 'V', or '<c-v>') or a table
      --     -- mapping query_strings to modes.
      --     selection_modes = {
      --       ["@parameter.outer"] = "v", -- charwise
      --       ["@function.outer"] = "v",  -- linewise
      --       ["@class.outer"] = "<c-v>", -- blockwise
      --     },
      --     include_surrounding_whitespace = true,
      --     lsp_interop = {
      --       enable = true,
      --       border = 'none',
      --       floating_preview_opts = {},
      --       peek_definition_code = {
      --         ["<leader>df"] = "@function.outer",
      --         ["<leader>dF"] = "@class.outer",
      --       },
      --     },
      --   },
      -- },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = { query = "@class.outer", desc = "Next class start" },
          --
          -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
          ["]o"] = "@loop.*",
          -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
          --
          -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
          -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    })

    -- https://github.com/nvim-treesitter/nvim-treesitter-context
    require("treesitter-context").setup({
      enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = "outer",     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = "cursor",          -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20,     -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    })
    -- Jump to context
    vim.keymap.set("n", "[c", function()
      require("treesitter-context").go_to_context(vim.v.count1)
    end, { silent = true })
  end,
}
