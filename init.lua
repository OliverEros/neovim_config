require "core"


-- START OF NVCHAD CONFIG
local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)

-- END OF NVCHAD CONFIG




-- ========================================
-- ===========  Custom configurations  ====
-- ========================================








-- ========================================
-- ===========    PLUGINS  ================
-- ========================================


local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'chemzqm/vim-jsx-improve'
  
  -- Install tailwindcss
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'
vim.cmd [[call plug#end()]]


require "plugins"
