local M = {}
 
local bufnr = api.nvim_get_current_buf()

local function list_marks()
    -- retrieve local marks
    local marks = {}
    for _, m in pairs(fn.getmarklist(bufnr)) do

        if m.mark:match("^'[a-z]$") then
            marks[m.mark:sub(2, 2)] = { m.pos[2], m.pos[3] - 1 }
        end
    end

    return marks
end

local function define_sign(mark)
    fn.sign_define(mark, {
        text = mark,
        texthl='red',
        linehl='',
        numhl=''
    })
end

function M.display_marks()
    local marks = list_marks()

    if next(marks) then
        opt.signcolumn  = 'yes'

        for mark, pos in pairs(marks) do
            local line_pos = pos[1]
            define_sign(mark)

            fn.sign_place(0, '', mark, bufnr, {
                lnum = line_pos,
                priority = 90
            })

        end
    end
end

api.nvim_create_autocmd({"BufRead"}, {
    callback = function()
        require('marksline').display_marks()
    end
})

return M
