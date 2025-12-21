local function config()
    vim.opt.background = "dark"
    vim.cmd.colorscheme("gruvbox")
end

local dependencies = {

}

return {
  "ellisonleao/gruvbox.nvim",

  config = config,
  dependencies = dependencies
}
