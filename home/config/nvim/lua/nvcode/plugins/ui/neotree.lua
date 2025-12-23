local map = vim.keymap.set

local function config()
  vim.cmd("augroup NeoTreeKeys | autocmd! | augroup END")

  require("neo-tree").setup({
    close_if_last_window = true,
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
         filtered_items = {
	       visible = true,
	         hide_dotfiles = false,
           hide_gitignored = false,
         },
    },
    use_default_mappings = false,
    window = {
      width = 38,

      mappings = {
        ["<C-b>"] = "close_window",

        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["<esc>"] = "cancel",

        ["<F2>"] = "rename",

        ["<C-n>"] = "add",
        ["<C-S-n>"] = "add_directory",
        ["<C-c>"] = "copy_to_clipboard",
        ["<C-x>"] = "cut_to_clipboard",
        ["<C-v>"] = "paste_from_clipboard",
        ["<Del>"] = "delete",

        ["<C-\\>"] = "open_vsplit",
        ["<C-->"] = "open_split",
      },
    },
  })

  map({"i", "v"}, "<C-b>", "<Esc><cmd>Neotree<CR>", { silent = true })
end

local dependencies = {
  "MunifTanjim/nui.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
}

return {
  "nvim-neo-tree/neo-tree.nvim",

  config = config,
  dependencies = dependencies,
}
