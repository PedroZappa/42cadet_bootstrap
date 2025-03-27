local keymap = vim.keymap -- for conciseness

-- General Mappings --
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

-- Get Help
keymap.set("n", "<leader>h", ":vertical help ", { desc = "Get Help on..." })
keymap.set("n", "<leadeo", ":vert options<CR>", { desc = "Open Options in a vertical split" })
keymap.set("n", "<leader>mas", ":Man ascii<CR>", { desc = "Get ASCII Man Page" })
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
---- Quickfix keymaps
-- vim.keymap.set("n", "<leader>qf", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "[Q]uickfix : list [O]pen" })
keymap.set("n", "<leader>qf", ":cfirst<CR>", { desc = "[Q]uickfix : jump to [F]irst list item" })
keymap.set("n", "<leader>qn", ":cnext<CR>", { desc = "[Q]uickfix : jump to [N]ext list item" })
keymap.set("n", "<leader>qp", ":cprev<CR>", { desc = "[Q]uickfix : jump to [P]rev list item" })
keymap.set("n", "<leader>ql", ":clast<CR>", { desc = "[Q]uickfix : jump to [L]ast list item" })
keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = "[Q]uickfix : [C]lose" })
-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
-- Change Permissions
keymap.set("n", "<leader>cx", ":!chmod +x %<CR>", { desc = "Make file executable" })
keymap.set("n", "<leader>wf", ":w !sudo tee % >/dev/null<CR>", { desc = "Write Read-only file with sudo" })
-- Diff keymaps
keymap.set("n", "<leader>dp", ":diffput<CR>", { desc = "DIFF : put diff from current to other" })
keymap.set("n", "<leader>dg", ":diffget 1<CR>", { desc = "DIFF : get diff from left (local) during merge" })
keymap.set("n", "<leader>dr", ":diffget 3<CR>", { desc = "DIFF : get diff from right (remote) during merge" })
keymap.set("n", "<leader>d]", "]c", { desc = "DIFF : next diff hunk" })
keymap.set("n", "<leader>d[", "[c", { desc = "DIFF : previous diff hunk" })

-- Buffers
-- Save & Close
keymap.set("n", "<leader>wa", ":wqa<cr>", { desc = "save and close all" })
keymap.set("n", "<leader>wq", ":wq<cr>", { desc = "save and close all" })
keymap.set("i", "jk", "<Esc>", { desc = "esc and save" })
keymap.set("n", "<leader>w", ":wall<CR>", { desc = "save all" })
keymap.set("n", "qq", "@a", { desc = "close all" })
keymap.set("n", "qf", ":q!<cr>", { desc = "close current bufferall without saving" })
keymap.set(
  "n",
  "<leader>tf",
  ":!touch %<cr>",
  { silent = true, noremap = true, desc = "touch file to reload observers" }
)
keymap.set("n", "<leader>_", "5<c-w>-", { remap = true, silent = false })
keymap.set("n", "<leader>+", "5<c-w>+", { remap = true, silent = false })
keymap.set("n", "<C-q>", ":bp<bar>sp<bar>bn<bar>bd<CR><CR>", { desc = "Close active buffer" })
keymap.set("n", "<leader>xs", ":clo<CR>", { desc = "Close split" })
keymap.set("n", "<tab>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Windows
-- Resizing window
keymap.set("n", "<C-up>", "<C-w>+", { desc = "Up" })
keymap.set("n", "<C-down>", "<C-w>-", { desc = "Down" })
keymap.set("n", "<C-left>", "<C-w>>", { desc = "Left" })
keymap.set("n", "<C-right>", "<C-w><", { desc = "Right" })
-- Splitting windows
keymap.set("n", "<leader>vs", ":vsplit<CR>", { desc = "Vertical split" })
keymap.set("n", "<leader>hs", ":split<CR>", { desc = "Horizontal split" })
-- Navigation
keymap.set("n", "<c-u>", "<c-u>zz", { desc = "Page Up and Center Cursor" })
keymap.set("n", "<c-d>", "<c-d>zz", { desc = "Page Down and Center Cursor" })
keymap.set("n", "<BS>", "^", { desc = "Move to first non-whitespace char of line" })
keymap.set("v", "<S-PageDown>", ":m '>+1<CR>gv=gv", { desc = "Move Line Down in Visual Mode" })
keymap.set("v", "<S-PageUp>", ":m '<-2<CR>gv=gv", { desc = "Move Line Up in Visual Mode" })
-- Navigate Search Results
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- LSP
-- Disable/Enable LSP
keymap.set("n", "<leader>ld", ":LspStop<CR>", { desc = "Disable LSP" })
keymap.set("n", "<leader>le", ":LspStart<CR>", { desc = "Enable LSP" })

-- Terminals
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal" })
keymap.set("t", "<C-h>", "<C-\\><C-n><C-h>", { noremap = true, silent = true })
keymap.set("t", "<C-j>", "<C-\\><C-n><C-j>", { noremap = true, silent = true })
keymap.set("t", "<C-k>", "<C-\\><C-n><C-k>", { noremap = true, silent = true })
keymap.set("t", "<C-l>", "<C-\\><C-n><C-l>", { noremap = true, silent = true })
keymap.set("t", "<A-m>", "<C-\\><C-n><A-m>", { noremap = true, silent = true })
keymap.set("n", "<leader>Tsv", ":vsp term://", { desc = "Open terminal", noremap = true, silent = false })
keymap.set("n", "<leader>Tsh", ":sp term://", { desc = "Open terminal", noremap = true, silent = false })
-- Exec Command lines
keymap.set("n", "<leader>ex", ":.w !bash -e<CR>", { desc = "Execute current line and output to command line" })
keymap.set("n", "<leader>eX", ":%w !bash -e<CR>", { desc = "Execute all lines and output to command line" })
keymap.set(
  "n",
  "<leader>el",
  ":.!bash -e<CR>",
  { desc = "Execute current line & replace w/ result", noremap = true, silent = false }
)
keymap.set("n", "<leader>eL", ":% !bash %<CR>", { desc = "Execute all lines & replace w/ result" })

keymap.set("n", "<leader>bm", function()
  vim.fn.system("bear -- make")
  vim.cmd("write")
end, { desc = "Run bare -- make command and write current buffer" })

-- Editing
-- Toggle Relative numbers
keymap.set("n", "<leader>rl", ":set relativenumber!<CR>", { desc = "Toggle relative numbers" })
-- Selecting
keymap.set("n", "<leader>L", "vg_", { desc = "select to end of line" })
keymap.set("n", "<leader>sa", "ggVG", { desc = "Select all" })
keymap.set("n", "<leader>sap", "ggVGp", { desc = "Select all & paste" })
keymap.set("n", "<leader>gp", "`[v`]", { desc = "Select last pasted text" })
-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Move text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Inserting
keymap.set("i", "<C-n>", "<C-e><C-o>A;<ESC>", { desc = "insert semicolon at the end of the line" })
-- Join
keymap.set("n", "J", "mzJ`z", { desc = "Join lines w/out spaces" })
-- Search & Replace Scripts
keymap.set(
  "n",
  "<leader>sr",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "Replace word from whole file" }
)

local function replace_symbol_in_workspace()
  local old_symbol = vim.fn.input("Replace symbol: ")
  if old_symbol == "" then
    print("No symbol provided!")
    return
  end
  local new_symbol = vim.fn.input("With: ")
  if new_symbol == "" then
    print("No replacement provided!")
    return
  end
  local file_pattern = vim.fn.input("Files: (eg. **/*.c) ")
  if file_pattern == "" then
    print("No file pattern provided!")
    return
  end
  vim.cmd(":args " .. file_pattern)
  vim.api.nvim_exec2(":argdo %s/\\<" .. old_symbol .. "\\>/" .. new_symbol .. "/gc | update", { output = true })
  -- Print a message confirming completion
  print("Replaced '" .. old_symbol .. "' with '" .. new_symbol .. "' in the workspace.")
end
keymap.set("n", "<leader>srs", replace_symbol_in_workspace, { desc = "Replace symbol in workspace" })

-- GREATEST MAPPING EVER : djunho
-- preserves the buffer when pasting over a highlighted selection
keymap.set("x", "<leader>p", [["_dP]])
-- THE OTHER GREATEST MAPPING EVER : asbjornHaland
-- Yank to the clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- Trim Trailing blanks
keymap.set("n", "<leader>trm", ":%s/\\s\\+$//e<CR>", { desc = "Trim trailing blanks" })

-- Clear Highlights
keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Completion
-- Turn on/off completion
-- vim.keymap.set("n", "<leader>p", '<cmd>lua require("cmp").setup { enabled = true }<cr>', { desc = "Enable completion" })
-- vim.keymap.set(
--   "n",
--   "<leader>P",
--   '<cmd>lua require("cmp").setup { enabled = false }<cr>',
--   { desc = "Disable completion" }
-- )

-- Open in Browser
keymap.set("n", "<leader>W", ":lua vim.ui.open(vim.fn.expand('%'))<CR>", { desc = "Open in [W]eb Browser" })

-- Plugins
-- Undotree mappings
keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Undotree Toggle" })
-- Git
keymap.set("n", "<leader>gs", ":Git<CR>")
keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")

-- compilin
keymap.set("n", "<leader>mk", ":vertical terminal make<CR>G", { desc = "Run Make on current dir" })

-- Parrot Crash
keymap.set(
  "n",
  "<leader>pl",
  ":term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:vs<CR>"
    .. ":term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR><C-w>2h"
    .. ":term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR>"
    .. ':term curl parrot.live<CR>:set winbar=""<CR>:set nonu<CR>:set nornu<CR>',
  { desc = "Parrot Party!!!" }
)

-----------------
------ Git ------
-----------------
vim.keymap.set("n", "<leader>ga", function()
  local Menu = require("nui.menu")
  local menu_items = {
    Menu.item("🚀 LazyGit", { id = "lazygit" }),
    Menu.item("📝 Generate Git Commit", { id = "commit" }),
  }

  local menu = Menu({
    position = "50%",
    size = {
      width = 60,
      height = 3,
    },
    border = {
      style = "rounded",
      text = {
        top = " Git Actions ",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }, {
    lines = menu_items,
    max_width = 60,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    },
    on_submit = function(item)
      if item.id == "lazygit" then
        vim.cmd("LazyGit")
      elseif item.id == "commit" then
        require("zedro.funkz.commiter").commit()
      end
    end,
  })

  menu:mount()
end, { desc = "Git Actions" })

-----------------
---- Doxygen ----
-----------------
vim.keymap.set("n", "<leader>gD", function()
  local Menu = require("nui.menu")
  local menu_items = {
    Menu.item("Generate Defgrouper", { id = "defgrouper" }),
    Menu.item("Generate New Comments", { id = "new_comments" }),
    Menu.item("Generate Updated Comments", { id = "update_comments" }),
    Menu.item("Generate Separator", { id = "separator" }),
  }

  local menu = Menu({
    position = "50%",
    size = {
      width = 40,
      height = 5,
    },
    border = {
      style = "rounded",
      text = {
        top = " Doxygen Actions ",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }, {
    lines = menu_items,
    max_width = 40,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    },
    on_submit = function(item)
      if item.id == "defgrouper" then
        require("zedro.funkz.doxygen").doxygen_defgrouper()
      elseif item.id == "new_comments" then
        require("zedro.funkz.doxygen").document()
      elseif item.id == "update_comments" then
        require("zedro.funkz.doxygen").update()
      elseif item.id == "separator" then
        require("zedro.funkz.commenter").add_boxed_comment()
      end
    end,
  })

  menu:mount()
end, { desc = "Doxygen Actions" })

