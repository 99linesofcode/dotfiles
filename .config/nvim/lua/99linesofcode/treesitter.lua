local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end

treesitter.setup {
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'css',
    'scss',
    'dockerfile',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'php',
    'phpdoc',
    'rust',
    'ruby',
    'tsx',
    'typescript',
    'vim',
    'vue',
    'yaml',
  },
	autopairs = {
		enable = true,
	},
	indent = {
    enable = true,
    disable = {
      'css',
    },
  },
}
