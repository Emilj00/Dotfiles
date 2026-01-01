local function config()
    require('fine-cmdline').setup({})

    vim.keymap.set({"n", "i", "v"}, "<A-Space>", "<cmd>FineCmdline<CR>")
end

local dependencies = {
    'MunifTanjim/nui.nvim',
}

return {
  "VonHeikemen/fine-cmdline.nvim",

  config = config,
  dependencies = dependencies
}

