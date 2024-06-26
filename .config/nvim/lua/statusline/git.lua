local M = {}

local function get_current_directory()
    return vim.fn.expand('%:p:h')
end

local function is_git_repo()
    local dir = get_current_directory()
    local result = vim.fn.system(
        'git -C ' .. dir .. ' rev-parse --is-inside-work-tree'
    )

    return vim.v.shell_error == 0 and vim.fn.trim(result) == "true"
end

function M.show_git_branch()
    if is_git_repo() and vim.bo.modifiable then
        local dir = get_current_directory()
        local git_branch = vim.fn.system(
            'git -C ' .. dir .. ' symbolic-ref --short HEAD'
        )
        git_branch = vim.fn.substitute(git_branch, '\n', '', 'g')

        return options.git_icons.branch .. 'on ' .. git_branch .. ' '
    end

    return ""
end

return M
