local function config()
  require('transparent').setup({})
end

local dependencies = {

}

return {
  "tribela/transparent.nvim",

  config = config,
  dependencies = dependencies
}
