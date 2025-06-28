return {
  'neovim/nvim-lspconfig',
  opts = {
    setup = {
      tailwindcss = function(_, opts)
        opts.settings = {
          tailwindCSS = {
            classFunctions = { 'tv', 'tw', 'clsx', 'tw\\.[a-z-]+' },
          },
        }
      end,
    },
  },
}
