-- Global
vim.opt.fillchars = {
  fold = " ",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.opt.listchars = {
  tab = ">>>",
  trail = "·",
  precedes = "←",
  extends = "→",eol = "↲",
  nbsp = "␣",
}
vim.opt.foldnestmax = 4
vim.opt.foldlevel = 1
vim.opt.foldcolumn = "1"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.showtabline = 2
vim.opt.mouse = 'a'
vim.opt.backupcopy = 'yes'
vim.opt.undolevels = 1000
vim.opt.shortmess:append { c = true, S = true }
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrapscan = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.errorbells = false
vim.opt.joinspaces = false
vim.opt.title = true
vim.opt.encoding = 'UTF-8'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.clipboard = 'unnamedplus'
vim.opt.laststatus = 3
vim.opt.timeoutlen = 500
vim.opt.breakindent = true
if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = 'screen'
end
-- Buffer
vim.opt.fileformat = 'unix'
vim.opt.tabstop = 2
vim.opt.spelllang = 'it'
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
-- Window
vim.opt.number = true
vim.opt.colorcolumn = "+1"
vim.opt.list = true
vim.opt.signcolumn = 'yes:1'
vim.opt.relativenumber = false
vim.opt.cursorline = true

-- , as leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 0 and last_pos <= vim.fn.line("$") then
      vim.api.nvim_win_set_cursor(0, {last_pos, 0})
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback =  function()
    vim.highlight.on_yank()
  end,
})
