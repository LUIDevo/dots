return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    config = function()
        ------------------------------------------------------------------
        -- 🎨 CUSTOM VARIANTS
        ------------------------------------------------------------------
        local custom_variants = {
            eldritch_mocha = {
                base_flavour = "mocha",
                colors = {
                    base="#0a0910", mantle="#050508", crust="#020203",
                    mauve="#cba6f7", blue="#89b4fa",
                    green="#a6e3a1", yellow="#f9e2af", peach="#fab387", teal="#94e2d5",
                    text="#cdd6f4",
                },
            },
            eldritch_action = {
                base_flavour = "mocha",
                colors = {
                    base="#0a0910", mantle="#050508", crust="#020203",
                    mauve="#89b4fa", blue="#cba6f7",
                    green="#a6e3a1", yellow="#f9e2af", peach="#fab387", teal="#94e2d5",
                    text="#cdd6f4",
                },
            },
            eldritch_sunset = {
                base_flavour = "mocha",
                colors = {
                    base="#0a0910", mantle="#050508", crust="#020203",
                    mauve="#fab387", blue="#cba6f7",
                    green="#a6e3a1", yellow="#f9e2af", peach="#89b4fa", teal="#94e2d5",
                    text="#cdd6f4",
                },
            },
            default_mocha = {
                base_flavour="mocha",
                colors={ base="#1e1e2e", mantle="#181825", crust="#11111b" },
            },
            mocha_pitch = {
                base_flavour="mocha",
                colors={ base="#070712", mantle="#030308", crust="#000000" },
            },
            black_mocha = {
                base_flavour="mocha",
                colors={ base="#000000", mantle="#000000", crust="#000000" },
            },
            ash_mocha = {
                base_flavour="mocha",
                colors={
                    base="#1b1b24", mantle="#15151d", crust="#0f0f15",
                    text="#bac2de", overlay0="#585b70", surface0="#313244",
                },
            },
            mocha_tokyo = {
                base_flavour="mocha",
                colors={
                    base="#20212a", mantle="#020205", crust="#000000",
                    text="#cdd6f4", subtext1="#b6bdd6", subtext0="#9ea6bf",
                    overlay2="#6f6b7f", overlay1="#565265", overlay0="#3f3b4a",
                    surface2="#26242f", surface1="#16151c", surface0="#0b0b11",
                    mauve="#cba6f7", pink="#f5c2e7", blue="#89b4fa",
                    teal="#95e6d9", green="#a6e3a1", yellow="#f9e2af", red="#f38ba8",
                },
            },
            mocha_dark_pastel = {
                base_flavour="mocha",
                colors={
                    base="#05050a", mantle="#020205", crust="#000000",
                    text="#cdd6f4", subtext1="#b6bdd6", subtext0="#9ea6bf",
                    overlay2="#6f6b7f", overlay1="#565265", overlay0="#3f3b4a",
                    surface2="#26242f", surface1="#16151c", surface0="#0b0b11",
                    mauve="#cba6f7", pink="#f5c2e7", blue="#89b4fa",
                    teal="#95e6d9", green="#a6e3a1", yellow="#f9e2af", red="#f38ba8",
                },
            },
        }

        ------------------------------------------------------------------
        -- 🧩 LUALINE THEME GENERATOR
        ------------------------------------------------------------------
        local function make_lualine_theme(c)
            return {
                normal  = { a={bg=c.mauve,fg=c.base,gui="bold"},  b={bg=c.surface1 or c.mantle,fg=c.text}, c={bg=c.mantle,fg=c.text} },
                insert  = { a={bg=c.blue,fg=c.base,gui="bold"},   b={bg=c.surface1 or c.mantle,fg=c.text}, c={bg=c.mantle,fg=c.text} },
                visual  = { a={bg=c.teal,fg=c.base,gui="bold"},   b={bg=c.surface1 or c.mantle,fg=c.text}, c={bg=c.mantle,fg=c.text} },
                command = { a={bg=c.peach,fg=c.base,gui="bold"},  b={bg=c.surface1 or c.mantle,fg=c.text}, c={bg=c.mantle,fg=c.text} },
                replace = { a={bg=c.red or c.mauve,fg=c.base,gui="bold"}, b={bg=c.surface1 or c.mantle,fg=c.text}, c={bg=c.mantle,fg=c.text} },
                inactive= { a={bg=c.crust,fg=c.overlay0 or c.text}, b={bg=c.crust,fg=c.overlay0 or c.text}, c={bg=c.crust,fg=c.overlay0 or c.text} },
            }
        end

        ------------------------------------------------------------------
        -- 🚀 LOAD VARIANT
        ------------------------------------------------------------------
        local active_variant = "eldritch_mocha" -- We track this so we can automatically reload it later

        local function load_variant(name)
            active_variant = name
            local variant = custom_variants[name]
            if not variant then return end

            require("catppuccin").setup({
                flavour = variant.base_flavour,
                no_italic = true,
                color_overrides = { [variant.base_flavour] = variant.colors },

                integrations = { lualine = false, cmp=true }, -- we handle it manually

                custom_highlights = function(colors)
                    return {
                        Keyword = { fg = colors.mauve, style = { "italic" } },
                        Function = { fg = colors.blue },
                        String = { fg = colors.green },
                        Number = { fg = colors.peach },
                        Type = { fg = colors.yellow },
                        Operator = { fg = colors.teal },
                        CursorLineNr = { fg = colors.mauve, style = { "bold" } },
                        Visual = { bg = "#2e2e3e" },
                        Title = { fg = colors.mauve, style = { "bold" } },
                        -- Markdown / Neorg / Render-markdown Headers 
                        ["@markup.list.checked.markdown"] = { fg = colors.green }, 
                        ["@markup.list.unchecked.markdown"] = { fg = colors.overlay2 }, 
                        ["@markup.heading.1.markdown"] = { fg = colors.mauve, bg = "#2d1b3d", style = { "bold" } }, 
                        RenderMarkdownH1 = { fg = colors.mauve, bg = "#2d1b3d", style = { "bold" } }, 
                        RenderMarkdownH1Bg = { bg = "#2d1b3d" },

                        ["@markup.heading.2.markdown"] = { fg = colors.blue, bg = "#1b2b4d", style = { "bold" } }, 
                        RenderMarkdownH2 = { fg = colors.blue, bg = "#1b2b4d", style = { "bold" } }, 
                        RenderMarkdownH2Bg = { bg = "#1b2b4d" }, 
                        ["@markup.heading.4.markdown"] = { fg = colors.teal, bg = "#162e2d", style = { "bold" } }, 
                        RenderMarkdownH4 = { fg = colors.teal, bg = "#162e2d", style = { "bold" } }, 
                        RenderMarkdownH4Bg = { bg = "#162e2d" }, 
                        -- H4: Green Strings 
                        ["@markup.heading.3.markdown"] = { fg = colors.green, bg = "#1c2e1e", style = { "bold" } }, 
                        RenderMarkdownH3 = { fg = colors.green, bg = "#1c2e1e", style = { "bold" } }, 
                        RenderMarkdownH3Bg = { bg = "#1c2e1e" }, 
                        -- H5: Peach Numbers 
                        ["@markup.heading.5.markdown"] = { fg = colors.peach, bg = "#33251e", style = { "bold" } }, 
                        RenderMarkdownH5 = { fg = colors.peach, bg = "#33251e", style = { "bold" } }, 
                        RenderMarkdownH5Bg = { bg = "#33251e" }, 
                        -- H6: Yellow Types 
                        ["@markup.heading.6.markdown"] = { fg = colors.yellow, bg = "#332e1e", style = { "bold" } }, 
                        RenderMarkdownH6 = { fg = colors.yellow, bg = "#332e1e", style = { "bold" } }, 
                        RenderMarkdownH6Bg = { bg = "#332e1e" },

                        CmpItemKindSnippet = { fg = colors.base, bg = colors.mauve },
                        CmpItemKindKeyword = { fg = colors.base, bg = colors.red or colors.mauve },
                        CmpItemKindText = { fg = colors.base, bg = colors.teal },
                        CmpItemKindMethod = { fg = colors.base, bg = colors.blue },
                        CmpItemKindConstructor = { fg = colors.base, bg = colors.blue },
                        CmpItemKindFunction = { fg = colors.base, bg = colors.blue },
                        CmpItemKindFolder = { fg = colors.base, bg = colors.blue },
                        CmpItemKindModule = { fg = colors.base, bg = colors.blue },
                        CmpItemKindConstant = { fg = colors.base, bg = colors.peach },
                        CmpItemKindField = { fg = colors.base, bg = colors.green },
                        CmpItemKindProperty = { fg = colors.base, bg = colors.green },
                        CmpItemKindEnum = { fg = colors.base, bg = colors.green },
                        CmpItemKindUnit = { fg = colors.base, bg = colors.green },
                        CmpItemKindClass = { fg = colors.base, bg = colors.yellow },
                        CmpItemKindVariable = { fg = colors.base, bg = colors.flamingo or colors.pink },
                        CmpItemKindFile = { fg = colors.base, bg = colors.blue },
                        CmpItemKindInterface = { fg = colors.base, bg = colors.yellow },
                        CmpItemKindColor = { fg = colors.base, bg = colors.red or colors.mauve },
                        CmpItemKindReference = { fg = colors.base, bg = colors.red or colors.mauve },
                        CmpItemKindEnumMember = { fg = colors.base, bg = colors.red or colors.mauve },
                        CmpItemKindStruct = { fg = colors.base, bg = colors.blue },
                        CmpItemKindValue = { fg = colors.base, bg = colors.peach },
                        CmpItemKindEvent = { fg = colors.base, bg = colors.blue },
                        CmpItemKindOperator = { fg = colors.base, bg = colors.blue },
                        CmpItemKindTypeParameter = { fg = colors.base, bg = colors.blue },
                    }
                end,
            })

            vim.cmd.colorscheme("catppuccin")

            -- Apply lualine theme tied to THIS variant only
            local ok, lualine = pcall(require, "lualine")
            if ok then
                lualine.setup({ options = { theme = make_lualine_theme(variant.colors) } })
            end
        end

        ------------------------------------------------------------------
        -- 🔁 RESET LUALINE WHEN LEAVING CATPPUCCIN
        ------------------------------------------------------------------
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                if vim.g.colors_name ~= "catppuccin" then
                    local ok, lualine = pcall(require, "lualine")
                    if ok then
                        lualine.setup({ options = { theme = "auto" } })
                    end
                end
            end,
        })

        ------------------------------------------------------------------
        -- 🎛 COMMAND + PICKER
        ------------------------------------------------------------------
        vim.api.nvim_create_user_command("SwitchTheme", function(opts)
            load_variant(opts.args)
        end, {
            nargs = 1,
            complete = function() return vim.tbl_keys(custom_variants) end,
        })

        vim.keymap.set("n", "cv", function()
            local names = vim.tbl_keys(custom_variants)
            table.sort(names)
            require("telescope.pickers").new({}, {
                prompt_title = "Select Catppuccin Variant",
                finder = require("telescope.finders").new_table({ results = names }),
                sorter = require("telescope.config").values.generic_sorter({}),
                attach_mappings = function(buf)
                    require("telescope.actions").select_default:replace(function()
                        local sel = require("telescope.actions.state").get_selected_entry()
                        require("telescope.actions").close(buf)
                        load_variant(sel.value)
                    end)
                    return true
                end,
            }):find()
        end)

        ------------------------------------------------------------------
        -- 🌙 DEFAULT & STARTUP FIX
        ------------------------------------------------------------------
        -- 1. Load immediately so the background is set right away (prevents screen flashing)
        load_variant("eldritch_mocha")

        -- 2. Force a quick reload AFTER all other plugins (like nvim-cmp) have initialized.
        -- This ensures your custom cmp highlights and lualine themes get applied perfectly on startup.
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                if vim.g.colors_name == "catppuccin" then
                    load_variant(active_variant)
                end
            end,
        })
    end,
}
