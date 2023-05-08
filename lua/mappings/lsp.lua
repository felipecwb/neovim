return {
    gD = vim.lsp.buf.declaration,
    gd = vim.lsp.buf.definition,
    gi = vim.lsp.buf.implementation,
    gr = vim.lsp.buf.references,
    K = vim.lsp.buf.hover,
    ['<C-k>'] = vim.lsp.buf.signature_help,
    ['<space>D'] = vim.lsp.buf.type_definition,
    ['<space>rn'] = vim.lsp.buf.rename,
    ['<space>ca'] = vim.lsp.buf.code_action,
    ['<space>f'] = function() vim.lsp.buf.format { async = true } end,

    -- diagnostics
    ['<space>e'] = vim.diagnostic.open_float,
    ['<space>q'] = vim.diagnostic.setloclist,
    ['[d'] = vim.diagnostic.goto_prev,
    [']d'] = vim.diagnostic.goto_next,
}
