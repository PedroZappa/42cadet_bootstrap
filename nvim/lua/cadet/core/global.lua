-- Set leader and localleader
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- vim.g.maplocalleader = "\\"
vim.g.RTP = vim.split(vim.o.runtimepath, ",")[1]
vim.g.RC = os.getenv("HOME") .. "/.config/nvim"

-- Set PATH
vim.cmd("set path=.,**")
-- Spell Path
vim.g.spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

-- 42 Header Settings
vim.g.user42 = 'cadet'
vim.g.mail42 = 'cadet@student.42porto.com'

-- Rest.nvim
vim.g.rest_nvim = {
    -- ...
}

-- Python Settings
vim.g.python3_host_prog = '/usr/bin/python3'

