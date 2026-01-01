local function config()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
        open_mapping = [[<a-`>]],
        hide_numbers = true,

        start_in_insert = true,
        insert_mappings = true,

        size = 27,
        persist_size = true,

        direction = "horizontal",

        close_on_exit = true,
        shell = vim.o.shell,

        on_open = function(term)
            vim.api.nvim_buf_set_option(term.bufnr, "mouse", "")
        end,

        on_close = function(_)
            vim.opt.mouse = "a"
        end,
    })
end

local dependencies = {}

return {
    "akinsho/toggleterm.nvim",
    config = config,
    dependencies = dependencies,
}

