local utils = require("lsp.nvim-lint.utils")
return {
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = { markdown = { "markdownlint" } }
        utils.markdownlint.setup()
        utils.set_autocmd()
    end
}
