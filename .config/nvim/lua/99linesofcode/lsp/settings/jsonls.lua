local default_schemas = nil
local status_ok, jsonls_settings = pcall(require, 'nlspsettings.jsonls')
if status_ok then
  default_schemas = jsonls_settings.get_default_schemas()
end

local schemas = {
  {
    description = 'TypeScript compiler configuration file',
    fileMatch = {
      'tsconfig.json',
      'tsconfig.*.json',
    },
    url = 'https://json.schemastore.org/tsconfig.json',
  },
  {
    description = 'Babel configuration',
    fileMatch = {
      '.babelrc',
      '.babelrc.json',
      'babel.config.json',
    },
    url = 'https://json.schemastore.org/babelrc.json',
  },
  {
    description = 'ESLint config',
    fileMatch = {
      '.eslintrc',
      '.eslintrc.json',
    },
    url = 'https://json.schemastore.org/eslintrc.json',
  },
  {
    description = 'Stylelint config',
    fileMatch = {
      '.stylelintrc',
      '.stylelintrc.json',
      'stylelint.config.json',
    },
    url = 'https://json.schemastore.org/stylelintrc',
  },
  {
    description = 'Json schema for properties json file for a GitHub Workflow template',
    fileMatch = {
      '.github/workflow-templates/**.properties.json',
    },
    url = 'https://json.schemastore.org/github-workflow-template-properties.json',
  },
  {
    description = 'NPM configuration file',
    fileMatch = {
      'package.json',
    },
    url = 'https://json.schemastore.org/package.json',
  },
}

local function extend(tab1, tab2)
  for _, value in ipairs(tab2 or {}) do
    table.insert(tab1, value)
  end
  return tab1
end

local opts = {
  settings = {
    json = {
      schemas = extend(schemas, default_schemas),
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line '$', 0 })
        end,
      },
    },
  },
}

return opts
