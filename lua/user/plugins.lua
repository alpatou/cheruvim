-- =============================
-- == 		Plug 							====
-- =============================


local lazy = {}

function lazy.install(path) 
	if not vim.loop.fs_stat(path) then 
		print('Installing lazy.nvim...')
		vim.fn.system({
			'git',
			'clone',
			 '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end


function lazy.setup(plugins) 
	lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
	{'folke/tokyonight.nvim'},
	{'kaicataldo/material.vim'},
  {'nvim-lualine/lualine.nvim'},
})

-- for material 
vim.g.material_terminal_italics = 1
vim.g.material_theme_style =  'lighter-community' 

vim.opt.termguicolors = true


vim.cmd.colorscheme('tokyonight-day')

require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = 'tokyonight-day',
    component_separators = '|-|',
    section_separators = '---',
	}
})

