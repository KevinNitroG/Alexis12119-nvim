-- NOTE: Neovim options

local options = {
  laststatus = 3, -- global statusline
  backup = false, -- creates a backup file
  breakindent = true,
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  -- fileformats = "unix,dos", -- prefer file formats to read by neovim
  -- fixendofline = false, -- set to "true" to auto add endline char at the end of file
  hidden = true, -- required to keep multiple buffers and open multiple buffers
  ignorecase = true, -- ignore case in search patterns
  linebreak = true, -- for wrap to not break word
  mouse = "a", -- allow the mouse to be used in neovim
  confirm = true, -- Confirm to save changes before exiting modified buffer
  pumheight = 8, -- pop up menu height
  pumblend = 0, -- transparency of pop-up menu
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = true, -- creates a swapfile
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion (4000ms default)
  winblend = 0, -- make transparency for floating window (cmp,...)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  cursorlineopt = "number", -- highlight number only
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 5, -- set number column width to 4 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = true, -- display lines as one long line
  scrolloff = 8, -- minimal number of columns to scroll horizontally.
  sidescrolloff = 8, -- minimal number of screen columns
  lazyredraw = false, -- Won't be redrawn while executing macros, register and other commands.
  termguicolors = true, -- Enables 24-bit RGB color in the TUI
  fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " }, -- make EndOfBuffer invisible
  ruler = false, -- show the line and column number of the cursor position``
  cmdheight = 0, -- height of the command line
  helpheight = 10, -- height of the help window
  -- shell = vim.fn.executable "pwsh" and "pwsh" or "powershell",
  -- shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  -- shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  -- shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  -- shellquote = "",
  -- shellxquote = "",
}

local global = {
  mkdp_auto_close = false, -- Don't Exit Preview When Switching Buffers
  snipmate_snippets_path = vim.fn.stdpath "config" .. "/snippets/snipmate", -- path to snipmate snippets
  vscode_snippets_path = vim.fn.stdpath "config" .. "/snippets/vscode", -- path to vscode snippets
  startup_message = false, -- Show startup message
  random_header = false, -- Show random header
  skip_ts_context_commentstring_module = true, -- disable treesitter context commentstring
  toggle_cmp = true, -- enable nvim-cmp
  ["loaded_node_provider"] = 0, -- disable node provider
  ["loaded_python3_provider"] = 0, -- disable python3 provider
  ["loaded_perl_provider"] = 0, -- disable perl provider
  ["loaded_ruby_provider"] = 0, -- disable ruby provider
  toggle_theme_icon = "   ",
  bigfile_size = 1024 * 1024 * 1.5, -- 1.5 MB
}

vim.opt.shortmess:append "Ac" -- Disable asking
vim.opt.whichwrap:append "<>[]hl"
-- vim.opt.iskeyword:append "-"

for name, value in pairs(options) do
  vim.opt[name] = value
end

for name, value in pairs(global) do
  vim.g[name] = value
end

-- Inlay hint by default
if vim.fn.has "nvim-0.10" == 1 then
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
