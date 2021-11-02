local function resolve_link(str)
  local word = str:match("%[.*%]%(.*%)")
  if word == nil then return end

  local title = word:match("%[(.*)%]")
  local link  = word:match("%((.*)%)") .. '#'
  local file, anchor

  local parts = {}
  for v in link:gmatch('(.-)#') do
    table.insert(parts, v)
  end

  local file = parts[1]
  if #parts == 2 then
    anchor = parts[2]
  end

  return {
    text = word,
    title = title,
    file = file,
    anchor = anchor,
  }
end

local M = {}

M.home = function()
  local path = vim.fn.getcwd()

  if path == "/srv/mtc/notes" then
    vim.cmd("edit tasks/inbox.md")
    return
  end
end

M.follow_link = function(str)
  local line = vim.api.nvim_get_current_line()
  local link = resolve_link(line)
  local lnum = 0
  if link == nil then return end

  local relative_file = string.format("%s/%s", vim.fn.expand("%:p:h"), link.file)
  local is_readable = vim.fn.filereadable(relative_file)
  if vim.fn.filereadable(relative_file) == 1 then
    vim.cmd(string.format("edit +%d %s", lnum, relative_file))
    return
  end

  local absolute_file = link.file;
  local is_readable = vim.fn.filereadable(absolute_file)
  if vim.fn.filereadable(absolute_path) == 1 then
    vim.cmd(string.format("edit +%d %s", lnum, absolute_file))
    return
  end

  print(string.format("Unable to create file '%s'", link.file))
end

return M
