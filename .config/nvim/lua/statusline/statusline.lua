local git = require('statusline.git')

function show_mode()
    local current_mode = vim.api.nvim_get_mode().mode
    local label = options.mode_labels[current_mode] or '?'
    return label .. ' '
end

function modified_flag()
    if vim.bo.modified then
        return options.modified_file_icon .. ' '
    end

    return ""
end

status_line.active = function()
    return table.concat({
        "%r",
        show_mode(),
        modified_flag(),
        "%l-%c/%L:%P ",
        git.show_git_branch(),
        "%f",
        "%=",
        "%y %{&ff}",
    })
end
