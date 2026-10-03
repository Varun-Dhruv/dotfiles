local M = {}

function M.on_attach(_, bufnr)
    local opts = {
        buffer = bufnr,
        silent = true,
    }

    local map = vim.keymap.set

    -- Go to definition
    map("n", "gd", vim.lsp.buf.definition, opts)

    -- Go to declaration
    map("n", "gD", vim.lsp.buf.declaration, opts)

    -- Find references
    map("n", "gr", vim.lsp.buf.references, opts)

    -- Hover documentation
    map("n", "K", vim.lsp.buf.hover, opts)

    -- Rename
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)

    -- Code action
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- Format
    map("n", "<leader>fm", function()
        vim.lsp.buf.format({
            async = true,
        })
    end, opts)

    -- Diagnostics
    map("n", "<leader>d", vim.diagnostic.open_float, opts)

    map("n", "[d", vim.diagnostic.goto_prev, opts)
    map("n", "]d", vim.diagnostic.goto_next, opts)

    -- Show diagnostics for current line
    map("n", "<leader>dl", function()
        vim.diagnostic.open_float(nil, {
            focus = false,
        })
    end, opts)
end

return M