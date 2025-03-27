return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "williamboman/mason-lspconfig.nvim" },
  },
  config = function()
    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_lspconfig()
    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    -- local project_include_dir = vim.loop.cwd() .. "/include"
    local custom_border = {
      { "╭", "LspFloatBorder" },
      { "─", "LspFloatBorder" },
      { "╮", "LspFloatBorder" },
      { "│", "LspFloatBorder" },
      { "╯", "LspFloatBorder" },
      { "─", "LspFloatBorder" },
      { "╰", "LspFloatBorder" },
      { "│", "LspFloatBorder" },
    }
    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      return open_floating_preview(contents, syntax, opts, ...)
    end

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- lsp_attach is where you enable features that only work
    -- if there is a language server active in the file
    local lsp_attach = function(client, bufnr)
      local opts = { buffer = bufnr }
      local actions = require "telescope.actions"
      local actions_state = require "telescope.actions.state"
      local pickers = require "telescope.pickers"
      local finders = require "telescope.finders"
      local sorters = require "telescope.sorters"
      local dropdown = require "telescope.themes".get_dropdown()

      function Dump(o)
        if type(o) == 'table' then
          local s = '{ '
          for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. Dump(v) .. ','
          end
          return s .. '} '
        else
          return tostring(o)
        end
      end

      -- local colors = vim.fn.getcompletion("", "color")
      local cmd = { "fd", "-uu", "--type", "f", "--color", "never", "compile_commands.json" }

      local function enter(prompt_bufnr)
        local selected = actions_state.get_selected_entry()
        vim.cmd("!/bin/rm compile_commands.json")
        vim.cmd("!ln -s " .. selected[1] .. " .")
        vim.cmd("LspRestart")
        actions.close(prompt_bufnr)
      end

      local function next_color(prompt_bufnr)
        actions.move_selection_next(prompt_bufnr)
      end

      local function prev_color(prompt_bufnr)
        actions.move_selection_previous(prompt_bufnr)
      end

      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set({ 'n', 'x', 'v' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      vim.keymap.set("n", "<leader>lc", function()
        local lc_opts = {
          finder = finders.new_oneshot_job(cmd, {}),
          sorter = sorters.get_generic_fuzzy_sorter({}),

          attach_mappings = function(prompt_bufnr, map)
            map("i", "<CR>", enter)
            map("i", "<C-j>", next_color)
            map("i", "<C-k>", prev_color)
            map("n", "<CR>", enter)
            map("n", "<C-j>", next_color)
            map("n", "<C-k>", prev_color)
            return true
          end,
        }

        pickers.new(dropdown, lc_opts):find()
      end, { desc = "[L]sp [C]onfig" })
      vim.keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
      vim.keymap.set('n', '<leader>gdp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
      vim.keymap.set('n', '<leader>gdn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
      vim.keymap.set('n', '<leader>tds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
      vim.keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')
    end

    lsp_zero.extend_lspconfig({
      sign_text = true,
      lsp_attach = lsp_attach,
      -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
  end,
  keys = {
    { "<leader>i", "<cmd>LspInfo<CR>",    desc = "Lsp-Zero Info" },
    { "<leader>I", "<cmd>LspInstall<CR>", desc = "Lsp-Zero Install" },
  },
}

