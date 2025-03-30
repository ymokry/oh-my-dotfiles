return {
  {
    'folke/tokyonight.nvim',
    opts = { style = 'night' },
  },
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'tokyonight-night',
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'tokyonight-night',
      },
    },
  },
}
