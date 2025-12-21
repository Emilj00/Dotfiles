local map = vim.keymap.set

local function config()
    local barbar = require('barbar')
    barbar.setup({
        icons = {
            filetype = { enabled = true },
        },

        close_command = "Bdelete %d",
        right_mouse_command = "Bdelete %d",
        left_mouse_command = "BufferGoto %d",
        middle_mouse_command = nil,

        show_buffer_close_icons = true,
        show_close_icon = false,
        separator_style = "slant",
        enforce_regular_tabs = true,
    })

    local function switch_to_buffer(i)
        local mode = vim.fn.mode()

        if mode == "i" then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>:BufferGoto " .. i .. "<CR>", true, false, true), 'n', false)
        else
            vim.cmd("BufferGoto " .. i)
        end
    end

    for i = 1, 9 do
        map({ "i", "n", "v" }, "<A-" .. i .. ">", function() switch_to_buffer(i) end, { noremap = true, silent = true })
    end

    map({ "i", "n", "v" }, "<C-w>", "<Cmd>bp<Bar>bd#<CR>", { noremap = true, silent = true })
end

local dependencies = {
    "nvim-tree/nvim-web-devicons",
}

return {
    "romgrk/barbar.nvim",

    config = config,
    dependencies = dependencies,
}
