local o = vim.o

o.rnu = true
o.number = true

o.autoindent = true
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.scrolloff = 6

-- search
o.ignorecase = true
o.smartcase = true

o.cursorline = true
o.signcolumn = "yes"


vim.opt.clipboard:append("unnamedplus")


-- split
o.splitright = true
o.splitbelow = true

