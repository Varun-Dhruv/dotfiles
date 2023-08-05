
local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
  return
end
mason.setup()


local masonlsp_status_ok, masonlspconfig = pcall(require, 'mason-lspconfig')
if not lsp_status_ok then
  return
end

masonlspconfig.setup({
    commands={"Mason","MasonUpdate","MasonInstall","MasonInstallAll","MasonUninstallAll","MasonLog"},
})
masonlspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function ()
        require("rust-tools").setup {}
    end
}
