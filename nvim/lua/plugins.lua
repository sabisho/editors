vim.pack.add {
  -- "https://github.com/dmtrKovalenko/fff.nvim",
  'https://github.com/f4z3r/gruvbox-material.nvim',
  'https://github.com/folke/snacks.nvim',
  'https://github.com/folke/which-key.nvim',
  'https://github.com/nvim-mini/mini.nvim'
  -- 'https://github.com/nvim-mini/mini-ai',
  -- 'https://github.com/nvim-mini/mini-icons',
  -- 'https://github.com/nvim-mini/mini-notify',
  -- 'https://github.com/nvim-mini/mini-pairs',
  -- 'https://github.com/nvim-mini/mini-statusline',
  -- 'https://github.com/nvim-mini/mini-surround',
  'https://github.com/stevearc/conform.nvim',
  -- "https://github.com/neovim/nvim-lspconfig",
  { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range '*' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', branch = 'main' },
}

vim.pack.add { 'https://github.com/dmtrKovalenko/fff.nvim' }

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then
        vim.cmd.packadd 'fff.nvim'
      end
      require('fff.download').download_or_build_binary()
    end
  end,
})

vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}

vim.keymap.set('n', 'ff', function()
  require('fff').find_files()
end, { desc = 'FFFind files' })
