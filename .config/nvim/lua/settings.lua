opt.fileencoding    = "utf8"
opt.encoding        = "utf8"
opt.spelllang       = "fr,en"

opt.undodir     = env.HOME .. '/.cache/nvim/undo'
opt.undofile    = true

opt.number          = true
opt.relativenumber  = true
opt.cursorline  = true
opt.splitbelow  = true
opt.splitright  = true
opt.nrformats   = opt.nrformats + 'alpha'
-- enable command line history
opt.history     = 500
-- 3 lines after the cursor when scrolling
opt.scrolloff   = 3
-- sync with system clipboard
opt.clipboard   = "unnamedplus"
-- show matching braces/tags
opt.matchtime   = 4
opt.showmatch   = true
opt.showmode    = false

-- spaces instead of tabs
opt.expandtab   = true
opt.shiftwidth  = 4
opt.tabstop     = 4
-- indent
opt.autoindent  = true
opt.shiftround  = true
opt.smartindent = true
opt.smarttab    = true
-- break long lines to fit window
opt.wrap        = true
-- ignore case when searching
opt.ignorecase  = true
opt.smartcase   = true

opt.whichwrap:append {
    -- whichwrap+=<,>,[,]
    ['<'] = true,
    ['>'] = true,
    ['['] = true,
    [']'] = true,
}

opt.listchars = {
    multispace = '···+',
    nbsp = '♯',
    tab = '⏵ ',
    trail = '·',
}

opt.list = false

function toggle_list()
    -- toggle the display of special characters
    opt.list = not(vim.opt.list:get())
end
