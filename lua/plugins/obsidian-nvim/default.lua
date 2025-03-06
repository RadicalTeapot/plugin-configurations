local vaultPath = vim.fn.expand([[$data/Obsidian vaults/Personal vault]])
local notesPath = vim.fs.normalize(vaultPath .. [[/**.md]])

local function extract_type_name(input)
    local pattern = "^%d+ (%w+)$" -- Match any 1 or more digits followed by a single space and 1 or more word characters (e.g., 10 Project)
    local _, _, group = string.find(input, pattern)

    if group then
        return group
    else
        return nil
    end
end

local function get_para_type(relative_note_path)
    local parents = relative_note_path:parents()

    local type_name = parents[#parents - 1]
    if type_name == nil then
        return nil
    end

    -- Match against PARA types
    type_name = extract_type_name(string.lower(tostring(type_name.name)))
    local types = { project = "project", area = "area", resource = "resource", archive = "archive" }
    if not type_name or not types[type_name] then
        return nil
    end

    return type_name
end

local function get_topic_name(relative_note_path)
    local parents = relative_note_path:parents()

    local topic_name = parents[#parents - 2]
    if topic_name == nil then
        return nil
    end

    -- Use name rather than stem to avoid issues with spaces in name (stem only returns the first part of the string)
    return tostring(topic_name.name)
end

local build_note_metadata = function(relative_note_path)
    return {
        para_type = get_para_type(relative_note_path),
        topic = get_topic_name(relative_note_path),
        title = tostring(relative_note_path.stem)
    }
end

local function as_wikilink(text)
    return "[["..text.."]]"
end

local function is_valid_para_metadata(metadata)
    return metadata ~= nil and metadata.para_type ~= nil
end

return {
    lazy = true,
    event = {
        "BufReadPre " .. notesPath,
        "BufNewFile " .. notesPath,
    },
    opts = {
        workspaces = { { name = "vault", path = vaultPath } },
        daily_notes = {
            folder = "01 Periodic notes/daily",
            date_format = "%Y-%m-%d",
            -- TODO Add template
        },
        -- Use nvim_cmp after 2 chars have been entered for autocompletion
        completion = { nvim_cmp = true, min_chars = 2 },
        -- TODO Override mappings

        ui = {
            enable = false,
            checkboxes = {
                [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                ["x"] = { char = "", hl_group = "ObsidianDone" },
                [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                ["/"] = { char = "󰟃", hl_group = "ObsidianTilde" },
            },
        },

        note_frontmatter_func = function(note)
            local client = require("obsidian").get_client()
            local workspace = client.current_workspace

            local frontmatter_table = {}
            if workspace ~= nil then
                local path = note.path:relative_to(workspace.path)
                local metadata = build_note_metadata(path)
                if is_valid_para_metadata(metadata) then
                    frontmatter_table["para-type"] = metadata.para_type
                    frontmatter_table["topic"] = as_wikilink(metadata.topic)
                    frontmatter_table["title"] = metadata.title
                end
            end

            -- `note.metadata` contains any manually added fields in the frontmatter.
            -- So here we just make sure those fields are kept in the frontmatter.
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    frontmatter_table[k] = v
                end
            end

            if note.aliases ~= nil and #note.aliases > 0 then
                frontmatter_table["aliases"] = note.aliases
            end
            if note.tags ~= nil and #note.tags > 0 then
                frontmatter_table["tags"] = note.tags
            end

            return frontmatter_table
        end,
    },
}
