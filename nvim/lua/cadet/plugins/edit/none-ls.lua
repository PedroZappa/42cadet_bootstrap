return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local gitsigns = null_ls.builtins.code_actions.gitsigns.with({
      config = {
        filter_actions = function(title)
          return title:lower():match("blame") == nil -- filter out blame actions
        end,
      },
    })

    null_ls.setup({
      sources = {
        gitsigns,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.completion.spell,
        -- Diagnostics
        -- null_ls.builtins.diagnostics.codespell,       -- Spell checker
        null_ls.builtins.diagnostics.write_good,      -- markdown
        null_ls.builtins.diagnostics.markdownlint,    -- markdown
        null_ls.builtins.diagnostics.vint,            -- Vimscript
        null_ls.builtins.diagnostics.zsh,             -- zsh
        null_ls.builtins.diagnostics.yamllint,        -- YAML
        null_ls.builtins.diagnostics.stylelint,       -- sccs, less, css, sass
        null_ls.builtins.diagnostics.cmake_lint,      -- CMake
        null_ls.builtins.diagnostics.cppcheck,        -- C/C++
        null_ls.builtins.diagnostics.gccdiag,         -- C/C++
        null_ls.builtins.diagnostics.statix,          -- Nix
        null_ls.builtins.diagnostics.deadnix,         -- Nix
        null_ls.builtins.diagnostics.sqruff,          -- SQL
        null_ls.builtins.diagnostics.vacuum,          -- OpenAPI linter
        -- Formatting
        null_ls.builtins.formatting.codespell,        -- Spell checker
        -- null_ls.builtins.formatting.write_good, -- markdown
        null_ls.builtins.formatting.stylua,           -- lua
        null_ls.builtins.formatting.alejandra,        -- Nix formatter
        -- null_ls.builtins.formatting.nix_flake_fmt,    -- Nix Flake
        null_ls.builtins.formatting.clang_format,     -- C/C++
        null_ls.builtins.formatting.cmake_format, -- CMake
        null_ls.builtins.formatting.gersemi,          -- CMake
        null_ls.builtins.formatting.biome,            -- javascript, typescript, jason, etc,
        null_ls.builtins.formatting.djlint,           -- django, jinja.html
        null_ls.builtins.formatting.isort,            -- python
        null_ls.builtins.formatting.nginx_beautifier, -- nginX
        null_ls.builtins.formatting.ocdc,             -- Changelog formatter
        -- null_ls.builtins.formatting.pg_format,        -- SQL, postgresql
        -- null_ls.builtins.formatting.prettierd,        -- HTML, CSS, JSON, etc
        -- null_ls.builtins.formatting.remark,           -- Makdown
        -- null_ls.builtins.formatting.yamlfix,          -- YAML
        -- Hover
        null_ls.builtins.hover.dictionary,            --  Word Definitions
        null_ls.builtins.hover.printenv,              -- Environment Variables
      },

      border = nil,
      cmd = { "nvim" },
      debounce = 250,
      debug = false,
      default_timeout = 5000,
      diagnostic_config = {},
      diagnostics_format = "#{m}",
      fallback_severity = vim.diagnostic.severity.ERROR,
      log_level = "warn",
      notify_format = "[null-ls] %s",
      on_attach = nil,
      on_init = nil,
      on_exit = nil,
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
      root_dir_async = nil,
      should_attach = nil,
      temp_dir = "~/.null-ls",
      update_in_insert = false,
    })
  end,
}

