local function config()
    local treesitter = require('nvim-treesitter.config')
    treesitter.setup({
        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        indent = { enable = true, },
    })
end


local dependencies = {

}

return {
  'nvim-treesitter/nvim-treesitter',

  lazy = false,
  build = ':TSUpdate',

  config = config,
  dependencies = dependencies,
}

