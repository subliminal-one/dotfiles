vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("x", "p", '"_dP')


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

local builtin = require("telescope.builtin")

local mono_local_files = function()
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
      builtin.find_files({ cwd = dir })
      return
    end
  end

  builtin.find_files()
end

local mono_local_buffers = function()
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
      builtin.buffers({ cwd = dir, sort_mru = true })
      return
    end
  end

  builtin.buffers()
end

