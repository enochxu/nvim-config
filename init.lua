require("enoch.core")
require("enoch.lazy")

local path = vim.fn.stdpath("config") .. "/ginit.vim"
local source_cmd = "source " .. path
vim.cmd(source_cmd)
