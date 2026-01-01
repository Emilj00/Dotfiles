return {
    { "-- File --", },
    { "Format Document",     function() vim.lsp.buf.format() end },
    { "Save File",           function() vim.cmd("w") end },
    { "", },

    { "-- EDITOR --" },
    { "Change Color Theme",  function() require("telescope.builtin").colorscheme() end },
    { "Toggle Transparency", function() vim.cmd("TransparentToggle") end },
    { "Toggle Line Numbers", function() vim.wo.number = not vim.wo.number end },
    { "Toggle Wrap",         function() vim.wo.wrap = not vim.wo.wrap end },
    { "Quit Neovim (Force)", function() vim.cmd("qa!") end },
    { "" },

    { "-- GIT --" },
    { "Show Lazygit", function() require("nvcode.terminals").lazygit:toggle() end },
    { "" },


    { "-- MISC --" },
    { "Toggle Showkeys", function() vim.cmd("ShowkeysToggle") end },
    { "" },
}

