local utils = require("neotab.utils")

local M = {}

---@type ntab.escaped_pos
local last_escaped_pos = nil

function M.reset_escape()
    last_escaped_pos = nil
end

---@param b ntab.escaped_pos
function M.set_has_escaped(b)
    last_escaped_pos = b
end

function M.revert_last_escape()
    if last_escaped_pos ~= nil then
        vim.cmd("silent undo")
        utils.move_cursor(0, 0, last_escaped_pos)
        last_escaped_pos = nil
    end
end

return M
