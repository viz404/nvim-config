local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- file explorer
  use("nvim-tree/nvim-tree.lua")
  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")
  -- statusline
  use("nvim-lualine/lualine.nvim")
  -- lua functions that many plugins use
  use("nvim-lua/plenary.nvim")
  -- File search
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
  -- Fuzzy file search
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  -- Syntax highlight
  use("nvim-treesitter/nvim-treesitter")
  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }
  -- code completion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("L3MON4D3/LuaSnip")
  -- Git 
  use("lewis6991/gitsigns.nvim")
  -- Theme
  use("Mofiqul/vscode.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
