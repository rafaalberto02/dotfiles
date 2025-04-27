require("rahenriques.config")
require("rahenriques.remap")

if vim.g.vscode then
    require("rahenriques.vscode")
else
    require("config.lazy")
end
