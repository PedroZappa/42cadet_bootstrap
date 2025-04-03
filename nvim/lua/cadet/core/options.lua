local opt = vim.opt

-- Options--
-- set font
opt.guifont = "Fira Code Nerd Font:h11"
vim.diagnostic.config {
  float = { border = "rounded" }, -- add border to diagnostic popups
}
-- Line Numbers
opt.number = true
opt.numberwidth = 1
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.ruler = true
opt.linebreak = false

-- Tab
local tab_width = 2
opt.tabstop = tab_width
opt.softtabstop = tab_width
opt.shiftwidth = tab_width
opt.expandtab = false
-- Buffer tabs
opt.showtabline = 2
-- opt.winbar = '=%=%k %r %h %m %f %w'
-- Indentation
opt.autoindent = true
opt.smartindent = true
-- Line Wrapping
opt.whichwrap = '<,>'
opt.wrap = false
-- C Indentation
opt.cindent = true
-- opt.breakindent = false

-- Windows
opt.splitbelow = true
opt.splitright = true
opt.equalalways = false

-- Cursor
opt.cursorcolumn = true
opt.cursorline = true
opt.formatoptions:remove("o")
-- opt.colorcolumn = '80';  -- Overriden for NeoColumn

-- sync with system Clipboard (through + register)
opt.clipboard = "unnamedplus"

-- Scroll
-- opt.scrolloff = 7
-- opt.sidescrolloff = 88
-- opt.sidescrolloff = 999

-- Fold Marks
opt.fmr = "{{{,}}}"

-- Enable folding by indentation (use different method if needed)
vim.opt.foldmethod = "expr"

-- Automatically open all folds when a file is opened
vim.opt.foldlevelstart = 99

-- Configure fold options
vim.opt.foldenable = true                   -- Enable folding
vim.opt.foldlevel = 99                      -- Open most folds by default
vim.opt.foldnestmax = 10                    -- Maximum fold nesting
vim.opt.foldminlines = 1                    -- Minimum number of lines for a fold
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

-- Spelling
opt.spell = false
vim.opt.spelllang = 'pt,en'
-- Show nine spell checking candidates at most

-- Backup
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Search
opt.incsearch = true

-- Virtual Edit
opt.virtualedit = "block"

-- Inc Command
opt.inccommand = "split"

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- LSP
vim.g.bulitin_lsp = true

-- Other
opt.showcmd = true
opt.showmode = true
opt.laststatus = 3
-- opt.iskeyword:append("-") -- Considers '-' as part of a word

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
-- vim.opt.list = true -- show list chars
-- vim.opt.listchars = {
--     -- these list chars
--     tab = "<->",
--     nbsp = "␣",
--     extends = "…",
--     precedes = "…",
--     trail = "·",
--     multispace = "·", -- show chars if I have multiple spaces between text
--     leadmultispace = " ", -- ...but don't show any when they're at the start
-- }
-- more defined window border
opt.fillchars:append({
  vert = "┃",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
  diff = "╱",
})

-- Backspace
opt.backspace = "indent,eol,start"

-- Time
opt.updatetime = 50

-- Other
opt.isfname:append("@-@")
