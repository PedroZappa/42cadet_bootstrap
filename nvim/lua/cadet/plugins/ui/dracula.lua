return {
  "Mofiqul/dracula.nvim",
  priority = 1000, -- Make sure it loads before all other plugins
  config = function()
    local dracula = require("dracula")
    dracula.setup({
      styles = {
        sidebars = "transparent", -- style for sidebars, see below
      },
      -- customize dracula color palette
      colors = {
        bg = "#282A36",
        fg = "#F8F8F2",
        selection = "#44475A",
        comment = "#6272A4",
        red = "#FF5555",
        orange = "#FFB86C",
        yellow = "#F1FA8C",
        green = "#50fa7b",
        purple = "#BD93F9",
        cyan = "#8BE9FD",
        pink = "#FF79C6",
        bright_red = "#FF6E6E",
        bright_green = "#69FF94",
        bright_yellow = "#FFFFA5",
        bright_blue = "#D6ACFF",
        bright_magenta = "#FF92DF",
        bright_cyan = "#A4FFFF",
        bright_white = "#FFFFFF",
        menu = "#21222C",
        visual = "#3E4452",
        gutter_fg = "#4B5263",
        nontext = "#3B4048",
        white = "#ABB2BF",
        black = "#191A21",
      },
      -- show the '~' characters after the end of buffers
      show_end_of_buffer = true,    -- default false
      -- use transparent background
      transparent_bg = true,        -- default false
      -- set custom lualine background color
      lualine_bg_color = "#000000", -- default nil
      -- set italic comment
      italic_comment = true,        -- default false
      -- overrides the default highlights with table see `:h synIDattr`
      overrides = {
        Normal = { bg = "NONE" },
        FloatBorder = { fg = "#e8eb34", bg = "#000000" },
        NonText = { bg = "#000000" },
        Search = { bg = "#34eb34" },
        CurSearch = { bg = "#34eb34", fg = "#8426ff" },
        WhichKey = { fg = "#34eb43" },
        WhichKeyFloat = { bg = "#000001" },
        WhichKeySeparator = { fg = "#8426ff" },
        TelescopeNormal = { bg = "#000000" },
        TelescopeSelection = { bg = "#674b94", fg = "#000000" },
        TelescopePreviewBorder = { fg = "#34eb43" },
        TelescopeResultsBorder = { fg = "#34eb43" },
        TelescopePromptBorder = { fg = "#34eb43" },
        TelescopeBorder = { fg = "#e6e600" },
        TermCursor = { fg = "#34eb43" },
        NormalFloat = { bg = "#000000" },
        WinSeparator = { fg = "#8426ff", bg = "#000000" },
        NotifyBackground = { bg = "#000000" },
        NoiceCmdlinePopupBorder = { fg = "#34eb43" },
        NoiceCmdlineIcon = { fg = "#e6e600" },
        BufferLineFill = { bg = "#000000" },
        StatusLine = { bg = "#000000" },
        NvimTreeWinSeparator = { fg = "#8426ff", bg = "#000000" },
        NvimTreeFolderArrowClosed = { fg = "#34eb43" },
        NvimTreeFolderArrowOpen = { fg = "#34eb43" },
        NvimTreeIndentMarker = { fg = "#e8eb34" },
        NvimTreeNormal = { bg = "NONE", ctermbg = "NONE" },
        NvimTreeRootFolder = { bg = "NONE", ctermbg = "NONE", fg = "#69FF94" },
        CursorLineNr = { fg = "#e8eb34" },
        NvimTreeLineNr = { fg = "#34eb43" },
        LineNr = { fg = "#D6ACFF" },
        LspFloatWinBorder = { fg = "#e8eb34" },
        LspFloatBorder = { fg = "#e8eb34" },
        LspInfoBorder = { fg = "#e8eb34" },
        TreesitterContextBottom = { underline = true, sp = "Grey" },
        TreesitterContextLineNumberBottom = { underline = true, sp = "Grey" },
        NeoTreeBufferNumber = { fg = "#e8eb34" },
        NeoTreeCursorLine = { fg = "#34eb43", bg = "#000000", underline = true },
        NeoTreeTabActive = { fg = "#e8eb34", bold = true },
        NeoTreeTabSeparatorActive = { bg = "#854dff", fg = "#000000" },
        NeoTreeRootName = { fg = "#34eb43", bold = true, italic = true },
        NeoTreeIndentMarker = { fg = "#e8eb34" },
        NeoTreeSignColumn = { fg = "#e8eb34" },
        NeoTreeFileIcon = { fg = "green", bold = true },
        NeoTreeDotfile = { fg = "#6272a4" },
        NeoTreeGitUnstaged = { fg = "#854dff" },
        NeoTreeGitModified = { fg = "#854dff" },
        NeoCodeiumLabel = { bg = "#34eb43", fg = "#000000" },
        BlinkCmpMenu = { bg = "#000000" },
        BlinkCmpScrollBarThumb = { fg = "#854dff" },
        BlinkCmpScrollBarGutter = { bg = "#000000" },
        BlinkCmpDocBorder = { fg = "#e8eb34" },
        BlinkCmpMenuBorder = { fg = "#e8eb34" },
        BlinkCmpMenuSelection = { fg = "#34eb43", bg = "#674b94", bold = true },
        BlinkCmpGhostText = { fg = "#854dff", undercurl = true },
      },

      -- You can use overrides as table like this
      -- overrides = {
      --   NonText = { fg = "white" }, -- set NonText fg to white
      --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
      --   Nothing = {} -- clear highlight of Nothing
      -- },
      -- Or you can also use it like a function to get color from theme
      -- overrides = function (colors)
      --   return {
      --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
      --   }
      -- end,
    })
    -- Load colorscheme
    vim.cmd("colorscheme dracula")
    vim.api.nvim_set_hl(0, "@constructor", { bold = true })
    vim.api.nvim_set_hl(0, "@constant", { bold = true })
    vim.api.nvim_set_hl(0, "@lsp.type.property", { italic = true })

  end,
}

