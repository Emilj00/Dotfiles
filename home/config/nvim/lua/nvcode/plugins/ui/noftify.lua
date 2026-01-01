local function config()
    vim.opt.termguicolors = true
    local notify = require("notify")

    notify.setup({
        background_colour = "#000000",

        render = "default",
        stages = "fade",
    })

    vim.notify = notify
end

return {
    "rcarriga/nvim-notify",
    config = config,
}

