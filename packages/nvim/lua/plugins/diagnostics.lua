vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  severity_sort = true,
  update_in_insert = false,
  float = { border = "rounded", source = "if_many" },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
})

require("tiny-inline-diagnostic").setup({
  options = {
    show_source = { enabled = true },
    multilines = { enabled = true },
    show_all_diags_on_cursorline = true,
  },
})

-- Upstream caches files and completed scans in module locals. Give each LSP
-- client its own instance so projects in the same session cannot share a cache.
local workspaces = {}
local function populate_workspace()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  if #clients == 0 then
    vim.notify("No LSP client attached to this buffer", vim.log.levels.INFO)
    return
  end

  for _, client in ipairs(clients) do
    if client:supports_method("workspace/diagnostic") then
      vim.lsp.buf.workspace_diagnostics({ client_id = client.id })
    else
      local root = client.config.root_dir
      if root and not workspaces[client.id] then
        local result = vim
          .system({ "git", "-C", root, "ls-files", "-z", "--cached", "--others", "--exclude-standard" }, {
            text = false,
          })
          :wait()
        if result.code == 0 then
          local files = {}
          for _, path in ipairs(vim.split(result.stdout, "\0", { plain = true, trimempty = true })) do
            files[#files + 1] = vim.fs.joinpath(root, path)
          end
          local path = vim.api.nvim_get_runtime_file("lua/workspace-diagnostics/init.lua", false)[1]
          local workspace = assert(loadfile(path))()
          workspace.setup({
            workspace_files = function()
              return files
            end,
          })
          workspaces[client.id] = workspace
        else
          vim.notify("Workspace diagnostics requires a Git workspace: " .. root, vim.log.levels.INFO)
        end
      end
      if workspaces[client.id] then
        workspaces[client.id].populate_workspace_diagnostics(client, bufnr)
      end
    end
  end
end

vim.api.nvim_create_user_command("WorkspaceDiagnostics", populate_workspace, {
  desc = "Populate unopened-file diagnostics once per LSP client",
})
vim.keymap.set("n", "<leader>cw", populate_workspace, { desc = "Populate workspace diagnostics" })
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })
vim.keymap.set("n", "<leader>xx", function()
  require("telescope.builtin").diagnostics()
end, { desc = "Workspace diagnostics" })
vim.keymap.set("n", "<leader>xd", function()
  require("telescope.builtin").diagnostics({ bufnr = 0 })
end, { desc = "Buffer diagnostics" })
vim.keymap.set("n", "<leader>xt", function()
  require("tiny-inline-diagnostic").toggle()
end, { desc = "Toggle inline diagnostics" })
