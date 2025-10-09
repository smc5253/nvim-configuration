vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Helps in running bash commands in windows from nvim
vim.opt.shellcmdflag = "-l -c"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
vim.opt.shellslash = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 2           -- A tab character appears as 4 spaces
vim.opt.shiftwidth = 2        -- Indent levels use 4 spaces
vim.opt.softtabstop = 2       -- Pressing <Tab> inserts 4 spaces
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 20  -- scroll offset, so the curr line is always in middle

vim.opt.wrap = false
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.termguicolors = true

-- Customize folding text
function Customfoldtext() 
  local first = vim.fn.getline(vim.v.foldstart)
  local last = vim.fn.getline(vim.v.foldend)
  local lines = vim.v.foldend - vim.v.foldstart + 1
  return "▶ " .. first .. " ... " .. last .. " [" .. lines .. " lines]"
end

vim.wo.foldtext = [[v:lua.Customfoldtext()]]
vim.opt.foldlevelstart = 99  -- For some reason foldlevel = 0 for initial fold, dig into this later

vim.schedule(function() vim.opt.clipboard = "unnamedplus" end)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight relevant text on yank",
	group = vim.api.nvim_create_augroup("highlight-yank", {clear = true}),
	callback = function()
		vim.hl.on_yank({timeout = 250})
	end,
})

vim.opt.updatetime = 300

vim.diagnostic.config({
  virtual_text = false,
  float = {
    max_width = 90,
    wrap = true,
    border = "single",
    focusable = true,
    close_events = {},
  }
})

-- I've found diagnostic float on cursor to be annoying
-- local lnum, win_id = nil, nil
--
-- local function close_floating_window(win_id)
--   if type(win_id) == "number" and vim.api.nvim_win_is_valid(win_id) then
--     vim.api.nvim_win_close(win_id, true)
--   end
-- end
--
-- vim.api.nvim_create_autocmd({"BufEnter", "CursorMoved"}, {
--   desc = "Detect line change to close floating window",
--   group = vim.api.nvim_create_augroup("diagnostic_float", {clear = true}),
--   callback = function() 
--     if lnum == nil then
--       lnum = vim.fn.line(".")
--       _, win_id = vim.diagnostic.open_float(nil)
--     else
--       local currentline = vim.fn.line(".")
--       if lnum ~= currentline then
--         close_floating_window(win_id)
--         lnum = currentline
--         _, win_id = vim.diagnostic.open_float(nil)
--       end
--     end
--   end,
-- })
