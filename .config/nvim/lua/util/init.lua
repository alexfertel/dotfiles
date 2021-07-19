_G.dump = function(...)
  print(vim.inspect(...))
end

_G.load = function(file)
    require("plenary.reload").reload_module(file, true)
    return require(file)
end

local M = {}

M.functions = {}

function M.execute(id)
  local func = M.functions[id]
  if not func then
    error("Function doest not exist: " .. id)
  end
  return func()
end

local map = function(mode, key, cmd, opts, defaults)
  opts = vim.tbl_deep_extend("force", { silent = true }, defaults or {}, opts or {})

  if type(cmd) == "function" then
    table.insert(M.functions, cmd)
    if opts.expr then
      cmd = ([[luaeval('load("util").execute(%d)')]]):format(#M.functions)
    else
      cmd = ("<cmd>lua load('util').execute(%d)<cr>"):format(#M.functions)
    end
  end
  if opts.buffer ~= nil then
    local buffer = opts.buffer
    opts.buffer = nil
    return vim.api.nvim_buf_set_keymap(buffer, mode, key, cmd, opts)
  else
    return vim.api.nvim_set_keymap(mode, key, cmd, opts)
  end
end

function M.map(mode, key, cmd, opt, defaults)
  return map(mode, key, cmd, opt, defaults)
end

local modes = {"n", "v", "x", "i", "o", "t", "s"}
for _, mode in pairs(modes) do
    M[mode.."map"] = function(key, cmd, opts)
        return map(mode, key, cmd, opts)
    end
    M[mode.."noremap"] = function(key, cmd, opts)
        return map(mode, key, cmd, opts, { noremap = true })
    end
end

function M.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return M
