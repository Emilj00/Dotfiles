local function config()
  require("tiny-code-action").setup({})

  vim.keymap.set("n", "<C-.>", require("tiny-code-action").code_action, { noremap = true, silent = true })
  vim.keymap.set("i", "<C-.>", function() require("tiny-code-action").code_action() end, { noremap = true, silent = true })
end

local dependencies = {}

return {
  "rachartier/tiny-code-action.nvim",
  config = config,
  dependencies = dependencies,
}

