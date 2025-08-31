local utils = require("neotab.utils")

local M = {}

---@type ntab.escaped_pos
local saved_escape = nil

function M.reset_escape()
    saved_escape = nil
end

---@param b ntab.escaped_pos
function M.set_has_escaped(b)
    saved_escape = b
end

function M.revert_last_escape()
    if saved_escape ~= nil then
        local line = vim.api.nvim_get_current_line()
        local y = saved_escape.pos[2] + 1
        local new_line = line:sub(0, y - 1)
            .. saved_escape.char
            .. line:sub(y, y)
            .. line:sub(y + saved_escape.punc:len() + 1)
        vim.api.nvim_set_current_line(new_line)

        utils.move_cursor(1, 0, saved_escape.pos)
        saved_escape = nil
    end
end

return M
