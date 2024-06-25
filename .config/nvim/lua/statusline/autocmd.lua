
vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
    group = utils.create_augroup('statusline'),
    callback = function()
        vim.opt.statusline = "%!v:lua.status_line.active()"
    end
})
