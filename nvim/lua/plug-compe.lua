-- Setup for compe

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  },

  -- source = {
  --   path = true;
  --   buffer = true;
  --   calc = true;
  --   nvim_lsp = true;
  --   nvim_lua = true;
  --   vsnip = true;
  --   ultisnips = true;
  --   luasnip = true;
  -- },
  source = {
    omni = {filetypes = {'tex'}};
    path = true;
    buffer = true;
    spell = {filetypes = {'markdown', 'tex'}};
    emoji = true;
    nvim_lsp = true;
    nvim_lua = true;
    ultisnips = true;
    calc = false;
    vsnip = false;
  };
  -- require'lspconfig'.rust_analyzer.setup {
  --   capabilities = capabilities,
  -- },
  --
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- capabilities.textDocument.completion.completionItem.snippetSupport = true
  -- capabilities.textDocument.completion.completionItem.resolveSupport = {
  --   properties = {
  --     'documentation',
  --     'detail',
  --     'additionalTextEdits',
  --   },
  -- },
}

-- Key mappings.
vim.cmd([[
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
" hightligh
highlight link CompeDocumentation NormalFloat
]])
