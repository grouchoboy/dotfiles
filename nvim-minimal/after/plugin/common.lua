vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.o.showtabline = 2
vim.cmd("colorscheme gruvbox")

local autopairs = require("nvim-autopairs")
autopairs.setup{}

local comment = require('Comment')
comment.setup()

require("zen-mode").setup {
    window = { 
        width = 90,
        options = {
            number = true,
        },
    },
}

vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle()
    vim.wo.wrap = false
end)




