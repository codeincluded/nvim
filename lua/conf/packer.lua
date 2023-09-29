-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

--	require('packer').startup(function(use)
--		use({ 'rose-pine/neovim', as = 'rose-pine' })
--	end)
	
--	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
end)