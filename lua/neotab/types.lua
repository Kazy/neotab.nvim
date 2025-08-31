---@alias ntab.info { pos: integer, char: string }

---@alias ntab.pair { open: string, close: string }

---@class ntab.out.opts
---@field ignore_beginning? boolean
---@field behavior? ntab.behavior

---@alias ntab.behavior
---| "nested"
---| "closing"

---@alias ntab.escaped_pos nil | {pos: [integer, integer], punc: string, char: string}

---@class ntab.md
---@field prev ntab.info
---@field next ntab.info
---@field pos integer

---@class ntab.trigger
---@field pairs ntab.pair[]
---@field format? string
---@field cond? string
---@field ft? string[]
