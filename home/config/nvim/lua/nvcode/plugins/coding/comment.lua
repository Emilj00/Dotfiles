local map = vim.keymap.set

local function config()
    local comment = require("Comment.api")

    map("n", "<C-/>", comment.toggle.linewise.current)
    map("i", "<C-/>", comment.toggle.linewise.current)

    map("v", "<C-/>", function() comment.toggle.linewise(vim.fn.visualmode()) end)
end

local dependencies = {}

return {
    "numToStr/Comment.nvim",
    config = config,
    dependencies = dependencies
}
