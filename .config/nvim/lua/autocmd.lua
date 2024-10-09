if vim.fn.executable('pylsp') == 1 then
    -- if pylsp is installed
    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'python',
        callback = function(args)
            vim.lsp.start({
                name = 'my-server-name',
                cmd = {'pylsp', '--check-parent-process'},
                -- Set the "root directory" to the parent directory of the file in the
                -- current buffer (`args.buf`) that contains either a "setup.py" or a
                -- "pyproject.toml" file. Files that share a root directory will reuse
                -- the connection to the same LSP server.
                root_dir = vim.fs.root(args.buf, {'setup.py', 'pyproject.toml'}),
            })
        end,
    })
end

vim.api.nvim_create_autocmd('FileType', {
    desc = 'set a column at 80 chars',
    pattern = 'markdown',
    group = utils.create_augroup('set_column'),
    callback = function()
        vim.opt_local.colorcolumn = '80'
    end
})
