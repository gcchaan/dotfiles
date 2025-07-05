local function file_exists(path)
  local file = io.open(path, "r")
  if file then
    file:close()
    return true
  else
    return false
  end
end

local asdf_path = vim.fn.expand("$HOME") .. "/.asdf/installs/nodejs/24.0.1/bin/node"
local node_path = file_exists(asdf_path) and asdf_path or "node"

return {
  "zbirenbaum/copilot.lua",
  opts = {
    copilot_node_command = node_path, -- Node.js version must be > 20
  }
}
