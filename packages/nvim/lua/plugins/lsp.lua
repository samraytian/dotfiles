vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = { disableOrganizeImports = true }, -- Ruff owns import actions.
  },
})

vim.lsp.config("ruff", {
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false -- Use basedpyright's type information.
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp", { clear = true }),
  callback = function(event)
    local function map(lhs, rhs, desc, mode)
      vim.keymap.set(mode or "n", lhs, rhs, { buffer = event.buf, desc = desc })
    end

    local telescope = require("telescope.builtin")
    map("gd", telescope.lsp_definitions, "Go to definition")
    map("gD", vim.lsp.buf.declaration, "Go to declaration")
    map("grr", telescope.lsp_references, "Find references")
    map("gI", telescope.lsp_implementations, "Go to implementation")
    map("gy", telescope.lsp_type_definitions, "Go to type definition")
    map("K", vim.lsp.buf.hover, "Hover documentation")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })
    map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>cs", telescope.lsp_document_symbols, "Document symbols")
  end,
})

-- Install these tools on PATH using the language's toolchain or package manager.
vim.lsp.enable({ "lua_ls", "basedpyright", "ruff", "rust_analyzer", "sourcekit", "dartls" })
