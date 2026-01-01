local map = vim.keymap.set

local function config()
    require("nvim_comment").setup({
        create_mappings = false,
    })

    map({ "n", "i" }, "<C-/>", "<cmd>CommentToggle<CR>")
    map("v", "<C-/>", ":CommentToggle<CR>")
end

return {
    "terrortylor/nvim-comment",

    config = config,
}

