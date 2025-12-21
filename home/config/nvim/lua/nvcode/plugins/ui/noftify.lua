local function config()
  vim.opt.termguicolors = true
  vim.notify = require("notify")
end

local dependencies = {

}

return {
  "rcarriga/nvim-notify",

  config = config,
  dependencies = dependencies
}
