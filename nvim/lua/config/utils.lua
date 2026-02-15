local file_exists = function(file)
  local fd = io.open(file, "r")
  return fd ~= nil and io.close(fd)
end

local is_project = function(dir)
  local files = {
    dir .. "/" .. "package.json",
    dir .. "/" .. "composer.json",
  }

  for _, file in pairs(files) do
    if file_exists(file) then
      return true
    end
  end

  return false
end

local find_project_dir = function()
  local cwd = vim.fn.getcwd()
  local buf_cwd = vim.fn.expand("%:p:h")
  local _, y = string.find(buf_cwd, cwd, 1, true)
  local parts = string.sub(buf_cwd, y + 1)

  local bits = { cwd }
  local path = ""
  for bit in string.gmatch(parts, "[^/]+") do
    path = path .. "/" .. bit
    local entry = cwd .. path
    table.insert(bits, entry)
  end

  local length = #bits

  for x = length, 1, -1 do
    local dir = bits[x]

    if is_project(dir) then
      return dir
    end
  end

  return nil
end

local M = {}

M.formatFile = function()
  local result = require("conform").format({
    async = false,
    lsp_fallback = true,
  })
  if result == true then
    vim.cmd.write()
  end
end

M.findProjectFile = function()
  Snacks.picker.files({ cwd = find_project_dir() })
end

M.findProjectBuffer = function()
  Snacks.picker.buffers({ filter = { cwd = find_project_dir() } })
end

M.yankRelativePath = function()
  local file_path = vim.fn.expand("%:.")
  local relative_path = vim.fn.fnamemodify(file_path, ":.")
  vim.fn.setreg("+", relative_path)
end

return M
