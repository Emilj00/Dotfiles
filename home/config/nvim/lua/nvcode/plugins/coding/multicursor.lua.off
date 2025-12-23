local function config()
    local map = vim.keymap.set

    local mc = require("multicursor-nvim")
    mc.setup()

    map("i", "<S-M-Up>", function() mc.lineAddCursor(-1) end)
    map("i", "<S-M-Down>", function() mc.lineAddCursor(1) end)

    map("v", "<C-d>", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>")

    map("n", "<C-LeftMouse>", mc.handleMouse)
end

local dependencies = {}

return {
    "jake-stewart/multicursor.nvim",

    config = config,
    dependencies = dependencies
}
