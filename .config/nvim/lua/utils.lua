local M = {}

function M.create_augroup(name)
    return vim.api.nvim_create_augroup(name, {clear = true})
end

return M
