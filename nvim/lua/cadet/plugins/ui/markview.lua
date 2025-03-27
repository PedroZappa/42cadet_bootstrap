return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    local presets = require("markview.presets")
    require("markview").setup({
      preview = {
        enable = true,
        draw_range = { 2 * vim.o.lines, 2 * vim.o.lines },
        icon_provider = "devicons",
      },
      markdown = {
        enable = true,
        headings = presets.headings.marker,
        horizontal_rules = presets.horizontal_rules.arrowed,
        tables = presets.double,
        code_blocks = {
          enable = true,
          style = "block",
        },
      },
      html = {
        enable = true,
        container_elements = {
          enable = true,

          ["^b$"] = {
            on_opening_tag = { conceal = "" },
            on_node = { hl_group = "Bold" },
            on_closing_tag = { conceal = "" },
          },
          ["^code$"] = {
            on_opening_tag = {
              conceal = "",
              hl_mode = "combine",
              virt_text_pos = "inline",
              virt_text = { { " ", "MarkviewInlineCode" } },
            },
            on_node = { hl_group = "MarkviewInlineCode" },
            on_closing_tag = {
              conceal = "",
              hl_mode = "combine",
              virt_text_pos = "inline",
              virt_text = { { " ", "MarkviewInlineCode" } },
            },
          },
          ["^em$"] = {
            on_opening_tag = { conceal = "" },
            on_node = { hl_group = "@text.emphasis" },
            on_closing_tag = { conceal = "" },
          },
          ["^i$"] = {
            on_opening_tag = { conceal = "" },
            on_node = { hl_group = "Italic" },
            on_closing_tag = { conceal = "" },
          },
          ["^mark$"] = {
            on_opening_tag = { conceal = "" },
            on_node = { hl_group = "MarkviewPalette1" },
            on_closing_tag = { conceal = "" },
          },
          ["^strong$"] = {
            on_opening_tag = { conceal = "" },
            on_node = { hl_group = "@text.strong" },
            on_closing_tag = { conceal = "" },
          },
          ["^sub$"] = {
            on_opening_tag = {
              conceal = "",
              hl_mode = "combine",
              virt_text_pos = "inline",
              virt_text = { { "↓[", "MarkviewSubscript" } },
            },
            on_node = { hl_group = "MarkviewSubscript" },
            on_closing_tag = {
              conceal = "",
              hl_mode = "combine",
              virt_text_pos = "inline",
              virt_text = { { "]", "MarkviewSubscript" } },
            },
          },
          ["^sup$"] = {
            on_opening_tag = {
              conceal = "",
              hl_mode = "combine",
              virt_text_pos = "inline",
              virt_text = { { "↑[", "MarkviewSuperscript" } },
            },
            on_node = { hl_group = "MarkviewSuperscript" },
            on_closing_tag = {
              conceal = "",
              hl_mode = "combine",
              virt_text_pos = "inline",
              virt_text = { { "]", "MarkviewSuperscript" } },
            },
          },
          ["^u$"] = {
            on_opening_tag = { conceal = "" },
            on_node = { hl_group = "Underlined" },
            on_closing_tag = { conceal = "" },
          },
        },
        headings = {},
        void_elements = {
          enable = true,

          ["^hr$"] = {
            on_node = {
              conceal = "",

              virt_text_pos = "inline",
              virt_text = {
                { "─", "MarkviewGradient2" },
                { "─", "MarkviewGradient3" },
                { "─", "MarkviewGradient4" },
                { "─", "MarkviewGradient5" },
                { " ◉ ", "MarkviewGradient9" },
                { "─", "MarkviewGradient5" },
                { "─", "MarkviewGradient4" },
                { "─", "MarkviewGradient3" },
                { "─", "MarkviewGradient2" },
              },
            },
          },
          ["^br$"] = {
            on_node = {
              conceal = "",

              virt_text_pos = "inline",
              virt_text = {
                { "󱞦", "Comment" },
              },
            },
          },
        },
      },
      yaml = {
        enable = true,
        properties = {
          enable = true,

          data_types = {
            ["text"] = {
              text = " 󰗊 ",
              hl = "MarkviewIcon4",
            },
            ["list"] = {
              text = " 󰝖 ",
              hl = "MarkviewIcon5",
            },
            ["number"] = {
              text = "  ",
              hl = "MarkviewIcon6",
            },
            ["checkbox"] = {
              ---@diagnostic disable
              text = function(_, item)
                return item.value == "true" and " 󰄲 " or " 󰄱 "
              end,
              ---@diagnostic enable
              hl = "MarkviewIcon6",
            },
            ["date"] = {
              text = " 󰃭 ",
              hl = "MarkviewIcon2",
            },
            ["date_&_time"] = {
              text = " 󰥔 ",
              hl = "MarkviewIcon3",
            },
          },

          default = {
            use_types = true,

            border_top = " │ ",
            border_middle = " │ ",
            border_bottom = " ╰╸",

            border_hl = "MarkviewComment",
          },

          ["^tags$"] = {
            match_string = "^tags$",
            use_types = false,

            text = " 󰓹 ",
            hl = nil,
          },
          ["^aliases$"] = {
            match_string = "^aliases$",
            use_types = false,

            text = " 󱞫 ",
            hl = nil,
          },
          ["^cssclasses$"] = {
            match_string = "^cssclasses$",
            use_types = false,

            text = "  ",
            hl = nil,
          },

          ["^publish$"] = {
            match_string = "^publish$",
            use_types = false,

            text = "  ",
            hl = nil,
          },
          ["^permalink$"] = {
            match_string = "^permalink$",
            use_types = false,

            text = "  ",
            hl = nil,
          },
          ["^description$"] = {
            match_string = "^description$",
            use_types = false,

            text = " 󰋼 ",
            hl = nil,
          },
          ["^image$"] = {
            match_string = "^image$",
            use_types = false,

            text = " 󰋫 ",
            hl = nil,
          },
          ["^cover$"] = {
            match_string = "^cover$",
            use_types = false,

            text = " 󰹉 ",
            hl = nil,
          },
        },
      },
    })
  end,
}

