local function augroup(name)
    return vim.api.nvim_create_augroup(name, {clear = true})
end

vim.api.nvim_create_autocmd('FileType', {
    desc = 'set a column at 80 chars',
    pattern = {'markdown'},
    group = utils.create_augroup('set_column'),
    callback = function()
        vim.opt_local.colorcolumn = '80'
    end
})
