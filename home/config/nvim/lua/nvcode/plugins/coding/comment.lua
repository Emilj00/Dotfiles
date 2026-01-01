local map = vim.keymap.set

local function config()
    local comment = require("Comment.api")

    map("n", "<C-/>", comment.toggle.linewise.current)
    map("i", "<C-/>", comment.toggle.linewise.current)

    map("v", "<C-/>", function()
        -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "nx", false)
        comment.toggle.linewise(vim.fn.visualmode())
    end)
end

local dependencies = {}

return {
    "numToStr/Comment.nvim",
    config = config,
    dependencies = dependencies
}
