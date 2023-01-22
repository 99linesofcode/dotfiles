local options = {
  autoindent = true,
  backup = false,
  backspace = 'indent,eol,start',
  colorcolumn = '80',
  cursorline = true,
  expandtab = true,
  hlsearch = false,
  ignorecase = true,
  incsearch = true,
  list = true,
  nu = true,
  relativenumber = true,
  scrolloff = 8,
  shiftround = true,
  shiftwidth = 2,
  smartcase = true,
  smartindent = true,
  smarttab = true,
  softtabstop = 4,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  updatetime = 300,
  undodir = os.getenv('HOME') .. '/.vim/undodir',
  undofile = true,
  wrap = false,
  wildmenu = true,
  wildmode = 'longest:list,full',
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.opt.wildignore:append '*/.git/*,*.swp'
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
