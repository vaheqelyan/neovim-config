vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- enable completion when available
    if client:supports_method("textDocument/completion") then
      -- trigger completion menu on every keypress
      client.server_capabilities.completionProvider.triggerCharacters = {
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
        'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
        '1', '2', '3', '4', '5', '6', '7', '8', '9',
        '!', '@', '#', '$', '%', '^', '&', '*',
      }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    -- auto-format ("lint") on save
    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

-- see `:h completeopt`
vim.opt.completeopt = "fuzzy,menuone,noinsert,popup"
-- map <c-space> to activate completion
vim.keymap.set("i", "<c-space>", function() vim.lsp.completion.get() end)
-- map <cr> to <c-y> when the popup menu is visible and item is selected
vim.keymap.set("i", "<cr>", function()
  local compinfo = vim.fn.complete_info({ "pum_visible", "selected" })
  if compinfo.pum_visible and
      compinfo.selected >= 0 then
    return "<c-y>"
  end
  return "<cr>"
end, { expr = true })

vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".git", vim.uv.cwd() },
  settings = {
    Lua = {
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.lsp.enable("lua_ls")

vim.lsp.config("*", {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
  },
})

local diagnostic_signs = {
  [vim.diagnostic.severity.ERROR] = "",
  [vim.diagnostic.severity.WARN] = "",
  [vim.diagnostic.severity.INFO] = "",
  [vim.diagnostic.severity.HINT] = "󰌵",
}

local shorter_source_names = {
  ["Lua Diagnostics."] = "Lua",
  ["Lua Syntax Check."] = "Lua",
}

function diagnostic_format(diagnostic)
  return string.format(
    "%s %s (%s): %s",
    diagnostic_signs[diagnostic.severity],
    shorter_source_names[diagnostic.source] or diagnostic.source,
    diagnostic.code,
    diagnostic.message
  )
end

vim.diagnostic.config({
  signs = {
    text = diagnostic_signs,
  },
  virtual_lines = {
    current_line = true,
    format = diagnostic_format,
  },
  underline = true,
  severity_sort = true,
})
