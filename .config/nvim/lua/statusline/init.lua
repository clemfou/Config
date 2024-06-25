-- Configure the statusline
--
status_line = {}

options = {
    mode_labels = {
        -- see lualine
        ['\19']   = 'S-BLOCK',
        ['\22s']  = 'V-BLOCK',
        ['\22']   = 'V-BLOCK',
        ['c']      = 'COMMAND',
        ['ce']     = 'EX',
        ['cv']     = 'EX',
        ['ic']     = 'INSERT',
        ['i']      = 'INSERT',
        ['ix']     = 'INSERT',
        ['niI']    = 'NORMAL',
        ['niR']    = 'NORMAL',
        ['niV']    = 'NORMAL',
        ['n']      = 'NORMAL',
        ['no\22'] = 'O-PENDING',
        ['no']     = 'O-PENDING',
        ['nov']    = 'O-PENDING',
        ['noV']    = 'O-PENDING',
        ['nt']     = 'NORMAL',
        ['ntT']    = 'NORMAL',
        ['r?']     = 'CONFIRM',
        ['Rc']     = 'REPLACE',
        ['rm']     = 'MORE',
        ['r']      = 'REPLACE',
        ['R']      = 'REPLACE',
        ['Rvc']    = 'V-REPLACE',
        ['Rv']     = 'V-REPLACE',
        ['Rvx']    = 'V-REPLACE',
        ['Rx']     = 'REPLACE',
        ['!']      = 'SHELL',
        ['s']      = 'SELECT',
        ['S']      = 'S-LINE',
        ['t']      = 'TERMINAL',
        ['vs']     = 'VISUAL',
        ['Vs']     = 'V-LINE',
        ['v']      = 'VISUAL',
        ['V']      = 'V-LINE',
    },
    git_icons = {
        branch = ' ',
    },
    modified_file_icon = '⌥ '
}

function status_line.setup(opts)
    options = vim.tbl_extend("force", options, opts)
end

require('statusline.statusline')
require('statusline.autocmd')
