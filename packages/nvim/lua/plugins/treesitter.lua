local treesitter = require("nvim-treesitter")
local attempted = {}

local function start(buf, lang)
  local ok, loaded = pcall(vim.treesitter.language.add, lang)
  if not ok or not loaded then
    return false
  end
  if not vim.treesitter.query.get(lang, "highlights") then
    return false
  end
  vim.treesitter.start(buf, lang)
  return true
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
  callback = function(event)
    local buf = event.buf
    local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
    vim.treesitter.stop(buf)
    if not lang or start(buf, lang) then
      return
    end

    local parser = require("nvim-treesitter.parsers")[lang]
    if not parser or parser.tier == 4 or attempted[lang] then
      return
    end
    -- Install on first use without blocking editing or retrying failed downloads.
    attempted[lang] = true
    treesitter.install({ lang }):await(function(err, success)
      vim.schedule(function()
        if err or not success then
          vim.notify(
            "Tree-sitter: installation failed for " .. lang .. "; retry with :TSInstall " .. lang,
            vim.log.levels.WARN
          )
          return
        end
        for _, candidate in ipairs(vim.api.nvim_list_bufs()) do
          if
            vim.api.nvim_buf_is_loaded(candidate)
            and vim.treesitter.language.get_lang(vim.bo[candidate].filetype) == lang
          then
            start(candidate, lang)
          end
        end
      end)
    end)
  end,
})
