local function config()
  require("tiny-inline-diagnostic").setup({
      signs = {
          left = "",
          right = "",
          diag = "●",
          arrow = "    ",
          up_arrow = "    ",
          vertical = " │",
          vertical_end = " └",
      },
      blend = {
          factor = 0.22,
      },
      show_all_lines = true,
  })
end

local dependencies = {}

return {
    "rachartier/tiny-inline-diagnostic.nvim",

    config = config,
    dependencies = dependencies,
}

