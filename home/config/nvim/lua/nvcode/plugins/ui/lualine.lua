local function config()
    local lualine = require("lualine")

    lualine.setup({
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "    ", right = "    " },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = true,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = { '%{printf("NVcode")}' },
            lualine_b = { "branch" },
            lualine_c = { "filename" },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        winbar = {
            -- Bar on top of window
        },
        tabline = {
            -- Bar on top of everything
        },
        inactive_winbar = {},
        extensions = {},
    })
end

local dependencies = {
  "nvim-tree/nvim-web-devicons",
}

return {
  "nvim-lualine/lualine.nvim",

  config = config,
  dependencies = dependencies
}
