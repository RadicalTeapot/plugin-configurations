return {
    "nomnivore/ollama.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- All the user commands added by the plugin
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

    keys = {
        {
            "<leader>op",
            function () require('ollama').prompt() end, -- Same as Ollama command
            desc = "[O]llama [p]rompt",
            mode = { "n", "v" },
        },

        {
            "<leader>om",
            function() require('ollama').choose_model() end, -- Same as OllamaModel command
            desc = "[O]llama [m]odel",
            mode = { "n", "v" },
        },

        {
            "<leader>oe",
            function() require('ollama').prompt('Raw') end,
            desc = "[O]llama prompt [E]mpty",
            mode = { "n", "v" },
        },

        {
            "<leader>or",
            function() require('ollama').prompt('Rephrase_in_style_of') end,
            desc = "[O]llama prompt [R]ephrase",
            mode = { "n", "v" },
        },

        {
            "<leader>og",
            function() require('ollama').prompt('Generate_Code') end,
            desc = "[O]llama prompt [g]enerate code",
            mode = { "n", "v" },
        },
    },
    opts = {
        model = "phi3",

        prompts = {
            Rephrase_in_style_of = {
                prompt = "Rephrase the following:\n\n$sel\n\n in the style of $input",
                input_label = "Rephrase style: "
            }
        }
    }
}
