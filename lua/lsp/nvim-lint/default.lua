local utils = require("lsp.nvim-lint.utils")
return {
    config = function()
        local lint = require("lint")
        utils.set_autocmd()
    end
}
