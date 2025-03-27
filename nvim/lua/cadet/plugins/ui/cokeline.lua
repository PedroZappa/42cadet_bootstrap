return {
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",       -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
    "stevearc/resession.nvim"      -- Optional, for persistent history
  },
  config = function()
    -- Buffer Pickers
    local is_picking_focus = require('cokeline.mappings').is_picking_focus
    local is_picking_close = require('cokeline.mappings').is_picking_close
    -- Colors
    local get_hex = require('cokeline.hlgroups').get_hl_attr
    local purple = '#854dff'
    local green = '#50fa7b'
    local yellow = '#F1FA8C'

    -- Function to get diagnostic severity for a buffer
    local get_max_diagnostic_severity = function(buffer)
      local diagnostics = vim.diagnostic.get(buffer.number)
      local max_severity = nil

      for _, diagnostic in ipairs(diagnostics) do
        if not max_severity or diagnostic.severity < max_severity then
          max_severity = diagnostic.severity
        end
      end

      return max_severity
    end
    -- Function to determine the color based on diagnostics
    local get_name_fg_color = function(buffer)
      local severity = get_max_diagnostic_severity(buffer)
      if severity == vim.diagnostic.severity.ERROR then
        return get_hex('DiagnosticError', 'fg')
      elseif severity == vim.diagnostic.severity.WARN then
        return get_hex('DiagnosticWarn', 'fg')
      elseif severity == vim.diagnostic.severity.INFO then
        return get_hex('DiagnosticInfo', 'fg')
      elseif severity == vim.diagnostic.severity.HINT then
        return get_hex('DiagnosticHint', 'fg')
      else
        -- If no diagnostics, use the default color
        return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'fg')
      end
    end

    require('cokeline').setup({
      default_hl = {
        fg = function(buffer)
          return
              buffer.is_focused
              and purple
              or get_name_fg_color(buffer)
        end,
        bg = 'NONE',
      },
      sidebar = {
        filetype = { 'neo-tree' },
        components = {
          {
            text = function(buf)
              return '🬗🬥🬢🬤🬶🬢🬶🬢🬗🬥🬢🬤🬶🬢🬗🬥🬢🬤🬶🬢🬗🬥🬢🬤🬶🬢🬗🬥🬢🬤🬥🬶🬢🬗🬥🬢🬤🬶🬢'
            end,
            fg = purple,
            bg = function() return get_hex('NvimTreeNormal', 'bg') end,
            bold = true,
          },
        }
      },
      components = {
        {
          text = '⫼',
          align = 'center',
          fg = purple,
        },
        {
          -- text = function(buffer) return (buffer.index ~= 1) and '⫼ ' or '  ' end,
          text = '  ',
          fg = purple,
        },
        {
          text = function(buffer)
            return
                (is_picking_focus() or is_picking_close())
                and buffer.pick_letter .. ' '
                or buffer.devicon.icon
          end,
          fg = function(buffer)
            return
                (is_picking_focus() and purple)
                or (is_picking_close() and purple)
                or buffer.devicon.color
          end,
          italic = function()
            return
                (is_picking_focus() or is_picking_close())
          end,
          bold = function()
            return
                (is_picking_focus() or is_picking_close())
          end
        },
        {
          text = function(buffer) return buffer.unique_prefix end,
          fg = get_hex('Comment', 'fg'),
          italic = true
        },
        {
          text = function(buffer) return buffer.filename .. ' ' end,
          fg = get_name_fg_color,
          style = 'bold',
          bold = function(buffer) return buffer.is_focused end
        },
        {
          text = function(buffer)
            if buffer.is_modified then
              return '● '
            else
              return '  '
            end
          end,
          fg = yellow,
        },
        {
          text = '󰖭',
          on_click = function(_, _, _, _, buffer)
            buffer:delete()
          end
        },
        {
          text = ' ',
        },
      },
    })

    -- Mappings
    vim.keymap.set("n", "<leader>bp", function()
      require('cokeline.mappings').pick("focus")
    end, { desc = "Pick a buffer to focus" })
  end,
}

