local map = vim.keymap.set

local function config()
    local renamer = require("renamer")
    renamer.setup({})

    map("i", "<F2>", renamer.rename)
end

local dependencies = {
    "nvim-lua/plenary.nvim",
}

return {
    "filipdutescu/renamer.nvim",

    config = config,
    dependencies = dependencies
}
