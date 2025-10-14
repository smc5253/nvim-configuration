vim.cmd [[let &shell = '"C:\\Program Files\\Git\\bin\\bash.exe"']]
vim.cmd [[let &shellcmdflag = '-s']]

require("config.keymaps")
require("config.options")
require("config.lazy")
