local cmd = vim.cmd
local g = vim.g

g.mapleader = " "


-- misc utils
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

opt("o", "hidden", true)
opt("o", "ignorecase", true)
opt("o", "splitbelow", true)
opt("o", "splitright", true)
opt("o", "termguicolors", true)
opt("w", "number", true)
opt("w", "relativenumber", true)
opt("o", "numberwidth", 2)
opt("b", "undofile", true)
opt("b", "textwidth", 79)
opt("w", "wrap", true)
opt("w", "cursorline", true)
opt("w", "colorcolumn", "+1")

opt("o", "mouse", "a")
opt("b", "spelllang", "en,fr")


opt("w", "signcolumn", "yes")
opt("o", "cmdheight", 1)

opt("o", "updatetime", 250) -- update interval for gitsigns
opt("o", "clipboard", "unnamedplus")

-- for indenline
opt("b", "expandtab", true)
opt("b", "shiftwidth", 4)

-- folding
opt("o", "foldlevelstart", 50)  -- open most folds by default
opt("w", "foldnestmax", 2)  -- 2 nested fold max

-- nvim-dev-webicons

require "nvim-web-devicons".setup {
    override = {
        html = {
            icon = "",
            color = "#DE8C92",
            name = "html"
        },
        css = {
            icon = "",
            color = "#61afef",
            name = "css"
        },
        js = {
            icon = "",
            color = "#EBCB8B",
            name = "js"
        },
        ts = {
            icon = "ﯤ",
            color = "#519ABA",
            name = "ts"
        },
        kt = {
            icon = "󱈙",
            color = "#ffcb91",
            name = "kt"
        },
        png = {
            icon = " ",
            color = "#BD77DC",
            name = "png"
        },
        jpg = {
            icon = " ",
            color = "#BD77DC",
            name = "jpg"
        },
        jpeg = {
            icon = " ",
            color = "#BD77DC",
            name = "jpeg"
        },
        mp3 = {
            icon = "",
            color = "#C8CCD4",
            name = "mp3"
        },
        mp4 = {
            icon = "",
            color = "#C8CCD4",
            name = "mp4"
        },
        out = {
            icon = "",
            color = "#C8CCD4",
            name = "out"
        },
        Dockerfile = {
            icon = "",
            color = "#b8b5ff",
            name = "Dockerfile"
        },
        rb = {
            icon = "",
            color = "#ff75a0",
            name = "rb"
        },
        vue = {
            icon = "﵂",
            color = "#7eca9c",
            name = "vue"
        },
        py = {
            icon = "",
            color = "#a7c5eb",
            name = "py"
        },
        toml = {
            icon = "",
            color = "#61afef",
            name = "toml"
        },
        lock = {
            icon = "",
            color = "#DE6B74",
            name = "lock"
        },
        zip = {
            icon = "",
            color = "#EBCB8B",
            name = "zip"
        },
        xz = {
            icon = "",
            color = "#EBCB8B",
            name = "xz"
        },
        deb = {
            icon = "",
            color = "#a3b8ef",
            name = "deb"
        },
        rpm = {
            icon = "",
            color = "#fca2aa",
            name = "rpm"
        }
    }
}

-- Bufferline

-- colors

local bar_bg = "#002b36"
local activeBuffer_bg = "#657b83"
local inactiveBuffer_bg = "#073642"
local activeBuffer_fg = "#fdf6e3"
local visibleBuffer_fg = "#eee8d5"
local inactiveBuffer_fg = "#93a1a1"
local duplicate_fg = "#586e75"
local modified_fg = "#b58900"
local info_fg = "#268bd2"
local warning_fg = "#cb4b16"
local error_fg = "#dc322f"

require "bufferline".setup {
    options = {
        buffer_close_icon= "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        enforce_regular_tabs = false,
        view = "default",
        show_buffer_close_icons = true,
        show_close_icon = false,
        -- separator_style = "thin",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        -- separator_style = {'', ''}
        separator_style = "slant",
        offsets = {{filetype = "NvimTree", text = "File Explorer"}},
        show_tab_indicators = false
    },
    highlights = {
        background = {
            guifg = inactiveBuffer_fg,
            guibg = inactiveBuffer_bg
        },
        fill = {
            guibg = bar_bg,
            guifg = inactiveBuffer_fg
        },
        tab = {
            guibg = inactiveBuffer_bg,
            guifg = inactiveBuffer_fg
        },
        -- focused window
        buffer_selected = {
            guifg = activeBuffer_fg,
            guibg = activeBuffer_bg,
            gui = "bold"
        },
        tab_selected = {
            guifg = activeBuffer_fg,
            guibg = activeBuffer_bg,
            gui = "bold"
        },
        duplicate_selected = {
            guifg = inactiveBuffer_fg,
            guibg = activeBuffer_bg,
        },
        separator_selected = {
            guifg = bar_bg,
            guibg = activeBuffer_bg
        },
        -- unfocused opened window
        buffer_visible = {
            guibg = inactiveBuffer_bg,
            guifg = visibleBuffer_fg
        },
        close_button = {
            guibg = inactiveBuffer_bg,
            guifg = inactiveBuffer_fg
        },
        close_button_visible = {
            guibg = inactiveBuffer_bg,
            guifg = visibleBuffer_fg
        },
        close_button_selected = {
            guifg = activeBuffer_fg,
            guibg = activeBuffer_bg,
            gui = "bold"
        },
        duplicate_visible = {
            guifg = duplicate_fg,
            guibg = inactiveBuffer_bg,
        },
        separator_visible = {
            guibg = inactiveBuffer_bg,
            guifg = bar_bg
        },
        duplicate = {
            guifg = duplicate_fg,
            guibg = inactiveBuffer_bg,
        },
        separator = {
            guibg = inactiveBuffer_bg,
            guifg = bar_bg
        },
        indicator_selected = {
            guifg = activeBuffer_fg,
            guibg = activeBuffer_bg
        },
        modified_selected = {
            guifg = modified_fg,
            guibg = activeBuffer_bg
        },
        modified_visible = {
            guifg = modified_fg,
            guibg = inactiveBuffer_bg
        },
        modified = {
            guifg = modified_fg,
            guibg = inactiveBuffer_bg
        },
        info_selected = {
            guifg = activeBuffer_fg,
            guibg = activeBuffer_bg,
            gui = "bold,undercurl",
            guisp = info_fg
        },
        info_visible = {
            guifg = visibleBuffer_fg,
            guibg = inactiveBuffer_bg,
            gui = "bold,undercurl",
            guisp = info_fg
        },
        info = {
            guifg = inactiveBuffer_fg,
            guibg = inactiveBuffer_bg,
            gui = "bold,undercurl",
            guisp = info_fg
        },
        info_diagnostic_selected = {
            guifg = info_fg,
            guibg = activeBuffer_bg,
            gui = "bold"
        },
        info_diagnostic_visible = {
            guifg = info_fg,
            guibg = inactiveBuffer_bg,
            gui = "bold"
        },
        info_diagnostic = {
            guifg = info_fg,
            guibg = inactiveBuffer_bg,
        },
        warning_selected = {
            guifg = activeBuffer_fg,
            guibg = activeBuffer_bg,
            gui = "bold,undercurl",
            guisp = warning_fg
        },
        warning_visible = {
            guifg = visibleBuffer_fg,
            guibg = inactiveBuffer_bg,
            gui = "bold,undercurl",
            guisp = warning_fg
        },
        warning = {
            guifg = inactiveBuffer_fg,
            guibg = inactiveBuffer_bg,
            gui = "bold,undercurl",
            guisp = warning_fg
        },
        warning_diagnostic_selected = {
            guifg = warning_fg,
            guibg = activeBuffer_bg,
            gui = "bold"
        },
        warning_diagnostic_visible = {
            guifg = warning_fg,
            guibg = inactiveBuffer_bg,
            gui = "bold"
        },
        warning_diagnostic = {
            guifg = warning_fg,
            guibg = inactiveBuffer_bg,
        },
        error_selected = {
            guifg = activeBuffer_fg,
            guibg = activeBuffer_bg,
            gui = "bold,undercurl",
            guisp = error_fg
        },
        error_visible = {
            guifg = visibleBuffer_fg,
            guibg = inactiveBuffer_bg,
            gui = "bold,undercurl",
            guisp = error_fg
        },
        error = {
            guifg = inactiveBuffer_fg,
            guibg = inactiveBuffer_bg,
            gui = "bold,undercurl",
            guisp = error_fg
        },
        error_diagnostic_selected = {
            guifg = error_fg,
            guibg = activeBuffer_bg,
            gui = "bold"
        },
        error_diagnostic_visible = {
            guifg = error_fg,
            guibg = inactiveBuffer_bg,
            gui = "bold"
        },
        error_diagnostic = {
            guifg = error_fg,
            guibg = inactiveBuffer_bg,
        }
    }
}

local opt = {silent = true}

local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "

--command that adds new buffer and moves to it
map("n", "<C-t>", [[<Cmd>tabnew<CR>]], opt)

--removing a buffer
map("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt)

-- tabnew and tabprev
map("n", "<S-t>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-n>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
map("n", "gb", [[<Cmd>BufferLinePick<CR>]], opt)

-- Statusline

local gl = require("galaxyline")
local gls = gl.section

gl.short_line_list = {"NvimTree", "minimap"} -- keeping this table { } as empty will show inactive statuslines

local colors = {
    bg = "#073642",
    line_bg = "#073642",
    fg = "#839496",
    fg_green = "#859900",
    fg_dark = "#002b36";
    yellow = "#b58900",
    cyan = "#2aa198",
    darkblue = "#268bd2",
    green = "#859900",
    orange = "#cb4b16",
    purple = "#6c71c4",
    magenta = "#d33682",
    blue = "#268bd2",
    red = "#dc322f",
    lightbg = "#657b83",
}

local mode_colors = {
    __ = {colors.fg_dark, colors.yellow},
    c  = {colors.fg_dark, colors.magenta},
    i  = {colors.fg_dark, colors.orange},
    ic = {colors.fg_dark, colors.orange},
    ix = {colors.fg_dark, colors.orange},
    n  = {colors.fg_dark, colors.yellow},
    ni = {colors.fg_dark, colors.yellow},
    no = {colors.fg_dark, colors.yellow},
    R  = {colors.fg_dark, colors.orange},
    Rv = {colors.fg_dark, colors.orange},
    s  = {colors.fg_dark, colors.orange},
    S  = {colors.fg_dark, colors.orange},
    [""] = {colors.fg_dark, colors.red},
    t  = {colors.fg_dark, colors.yellow},
    v  = {colors.fg_dark, colors.green},
    V  = {colors.fg_dark, colors.green},
    ['']  = {colors.fg_dark, colors.green},
}

local function highlight(group, fg, bg, gui)
    local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
    if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
    vim.cmd(cmd)
end

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

gls.left[1] = {
    statusIcon = {
        provider = function()
            return "  " .. require("galaxyline.provider_fileinfo").get_file_icon() .. " "
        end,
        condition = buffer_not_empty,
        separator = " ",
        highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg},
        separator_highlight = {colors.bg, colors.fg}
    }
}

gls.left[2] = {
    FileName = {
        provider = {"FileName", "FileSize"},
        condition = buffer_not_empty,
        highlight = {colors.bg, colors.fg}
    }
}

gls.left[3] = {
    teech = {
        provider = function()
            return ""
        end,
        highlight = {colors.fg, colors.bg}
    }
}

gls.left[4] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.green, colors.line_bg},
    }
}

gls.left[5] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = " ",
        highlight = {colors.orange, colors.line_bg},
    }
}

gls.left[6] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " ",
        highlight = {colors.red, colors.line_bg},
    }
}

-- gls.left[7] = {
--     LeftEnd = {
--         provider = function()
--             return " "
--         end,
--         separator = " ",
--         separator_highlight = {colors.line_bg, colors.line_bg},
--         highlight = {colors.line_bg, colors.line_bg}
--     }
-- }

gls.left[7] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.bg},
    }
}

-- gls.left[8] = {
--     Space = {
--         provider = function()
--             return " "
--         end,
--         highlight = {colors.line_bg, colors.line_bg}
--     }
-- }

gls.left[9] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.orange, colors.bg}
    }
}

gls.right[1] = {
    GitIcon = {
        provider = function()
            return "   "
        end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.green, colors.line_bg}
    }
}

gls.right[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.green, colors.line_bg}
    }
}

gls.right[3] = {
    ViMode = {
        provider = function()
            local modehl = mode_colors[vim.fn.mode()]
            highlight('GalaxyViMode', modehl[1], modehl[2])
            highlight('GalaxyViModeInv', modehl[2], modehl[1])
            highlight('GalaxyViModeSep', colors.bg, modehl[2])
            highlight('GalaxyViModeInvSep', modehl[2], colors.bg)

            function setDefault (t, d)
              local mt = {__index = function () return d end}
              setmetatable(t, mt)
            end
            local icons = {
              __ = '- ',
              c  = ' command ',
              i  = ' insert ',
              ic = ' insert ',
              ix = ' insert ',
              n  = ' normal ',
              ni = ' normal ',
              no = ' normal ',
              R  = '﯒ replace ',
              Rv = '﯒ replace ',
              s  = ' select ',
              S  = ' select ',
              [""] = ' select ',
              t  = ' terminal ',
              v  = ' visual ',
              V  = ' visual Line ',
              [''] = ' visual Block ',
            }
            setDefault(icons, vim.fn.mode())
            return icons[vim.fn.mode()]
        end,
        highlight = "GalaxyViMode",
        separator_highlight = "GalaxyViModeInvSep",
        separator = " "
    }
}

gls.right[4] = {
    right_LeftRounded = {
      provider = function()
          return ""
      end,
      highlight = "GalaxyViModeSep",
    }
}

gls.right[5] = {
    right_saveStatus = {
      provider = function()
        return "  " .. vim.bo.filetype .. " "
      end,
      highlight = {colors.blue, colors.bg},
    }
}

gls.right[6] = {
    PerCent = {
        provider = "LinePercent",
        separator = "",
        separator_highlight = {colors.fg, colors.bg},
        highlight = {colors.bg, colors.fg}
    }
}

gls.right[7] = {
    SpecialIconsSep = {
        provider = function()
          return ""
        end,
        highlight = {colors.yellow, colors.fg}
    }
}

gls.right[8] = {
    ReadOnly = {
        provider = function()
          if vim.bo.readonly then
            highlight('GalaxyReadOnly', colors.red, colors.yellow)
            return "  "
          else
            highlight('GalaxyReadOnly', colors.cyan, colors.yellow)
            return "  "
          end
        end,
        highlight = "GalaxyReadOnly"
    }
}

gls.right[9] = {
    Modified = {
        provider = function()
          if vim.bo.modified then
            return "  "
          else
            return "   "
          end
        end,
        separator = "",
        separator_highlight = {colors.bg, colors.yellow},
        highlight = {colors.bg, colors.yellow}
    }
}

gls.right[10] = {
    Paste = {
        provider = function()
          if vim.o.paste then
            return "  "
          else
            return "   "
          end
        end,
        separator = "",
        separator_highlight = {colors.bg, colors.yellow},
        highlight = {colors.bg, colors.yellow}
    }
}

gls.right[11] = {
    Spell = {
        provider = function()
          if vim.wo.spell then
            return " 暈 (" .. vim.o.spelllang .. ") "
          else
            return "   "
          end
        end,
        separator = "",
        separator_highlight = {colors.bg, colors.yellow},
        highlight = {colors.bg, colors.yellow}
    }
}

require("colorizer").setup()
require("neoscroll").setup()

-- Lspconfig
function on_attach(client, bufnr)
    local function map(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings
    local opts = {noremap = true, silent = true}
    map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    map("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    map("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        map("v", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end
end

local lspconf = require "lspconfig"
local servers = {"html", "cssls", "pyright" , "bashls", "rls", "jsonls"}

for k, lang in pairs(servers) do
    lspconf[lang].setup {
        root_dir = vim.loop.cwd,
        on_attach = on_attach
    }
  end

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

-- lua lsp settings
require "lspconfig".sumneko_lua.setup {
    cmd = {"lua-lsp"},
    root_dir = function()
        return vim.loop.cwd()
    end,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                globals = {"vim"}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            },
            telemetry = {
                enable = false
            }
        }
    }
}

require "lspconfig".jsonls.setup {
    cmd = {"json-languageserver"},
    root_dir = function()
        return vim.loop.cwd()
    end,
    on_attach = on_attach,
}

-- Compe
vim.o.completeopt = "menuone,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"

require "compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        path = true,
        buffer = true,
        calc = true,
        vsnip = true,
        nvim_lsp = true,
        nvim_lua = true,
        spell = true,
        tags = true,
        snippets_nvim = true,
        treesitter = true
    }
}

map('i', '<C-Space>', "compe#complete()", {expr = true, noremap = true, silent = true})
map('i', '<CR>', "compe#confirm('<CR>')", {expr = true, noremap = true, silent = true})
map('i', '<C-e>', "compe#close('<C-e>')", {expr = true, noremap = true, silent = true})

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

-- tab completion

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["compe#complete"]()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

--  mappings

map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

function _G.completions()
    local npairs = require("nvim-autopairs")
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

local base16 = require "base16"
base16(base16.themes["solarized-dark"], true)


-- blankline
local indent = 4

g.indent_blankline_char = "▏"
g.indent_blankline_use_treesitter = true
g.indent_blankline_show_current_context = true

cmd "highlight IndentBlanklineChar guifg=#073642 gui=nocombine"

g.indent_blankline_filetype_exclude = { "help", "terminal" }
g.indent_blankline_buftype_exclude = { "terminal" }

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

-- Treesitter
local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "javascript",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        "python",
        "rust",
        "nix",
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    autopairs = {enable = true}
}

-- Mappings

local opt = {}

-- vim.cmd([[nnoremap <expr> s v:count ? (v:count > 5 ? "m'" . v:count : '') . 's' : 'gs']])
-- vim.cmd([[nnoremap <expr> r v:count ? (v:count > 5 ? "m'" . v:count : '') . 'r' : 'gr']])

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them!

-- map("n", "dd", [=[ "_dd ]=], opt)
-- map("v", "dd", [=[ "_dd ]=], opt)
map("v", "x", [=[ "_x ]=], opt)

-- copy any selected text with pressing y

map("", "<leader>c", '"+y', opt)

-- OPEN TERMINALS --
map("n", "<C-S-h>", [[<Cmd>vnew term://zsh <CR>]], opt) -- open term over right
map("n", "<C-H>", [[<Cmd> split term://zsh | resize 10 <CR>]], opt) -- open term bottom

-- COPY EVERYTHING --
-- map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- toggle numbers ---
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)
map("n", "<leader>m", [[ <Cmd> set nu! rnu!<CR>]], opt)

map("n", "<leader>z", [[ <Cmd> ZenMode<CR>]], opt)
-- Writing mode
local writing_mode = false
-- local spell_mode = vim.wo.spell
function toggle_writing_mode()
  require("zen-mode").toggle({
    window = {width = 100, options = {number = false, relativenumber = false, signcolumn = "no", linebreak = true, cursorline = false, colorcolumn = "", spell=true}},
    plugins = {options = {textwidth = 0}}
  })
  if writing_mode then
    base16(base16.themes["solarized-dark"], true)
    set_highlights()
    writing_mode = false
  else
    base16(base16.themes["solarized-light"], true)
    writing_mode = true
  end
end

map("n", "<leader>Z", [[ <Cmd> lua toggle_writing_mode()<CR>]], opt)
map("i", "<down>", "<c-\\><c-o>gj", {nowait = true, noremap = true})
map("i", "<up>", "<c-\\><c-o>gk", {nowait = true, noremap = true})



map("n", "<F11>", [[ <Cmd> set spell!<CR>]], opt)
map("i", "<F11>", [[ <Cmd> set spell!<CR>]], opt)
map("n", "<F2>", [[ <Cmd>set paste!<CR>]], opt)
map("i", "<F2>", [[ <Cmd>set paste!<CR>]], opt)


map('n', '<C-c>', '<cmd> let @/ = ""<CR>', opt)

map('n', '<leader>ç', '<cmd> MinimapToggle<CR>', opt)
map('t', '<Esc>', '<C-\\><C-n>', opt)

-- highlights --
function set_highlights()

  cmd "hi LineNr guifg=#657b83 guibg=NONE"
  cmd "hi Comment guifg=#657b83"

  cmd "hi SignColumn guibg=NONE"
  cmd "hi VertSplit guibg=NONE guifg=#073642"
  cmd "hi EndOfBuffer guifg=#073642"
  cmd "hi PmenuSel guibg=#859900"
  cmd "hi Pmenu  guibg=#002b36"

  cmd "hi Normal guibg=NONE ctermbg=NONE"
  -- cmd "hi Normal guibg=#002b36"

  cmd "hi CursorLine guibg=#073642"
  cmd "hi ColorColumn guibg=#073642"
end
set_highlights()

-- Telescope
require("telescope").setup {}

local opt = {noremap = true, silent = true}

vim.g.mapleader = " "

-- mappings
map("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
map("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
map("n", "<Leader>fg", [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], opt)
map("n", "<Leader>fs", [[<Cmd>lua require('telescope.builtin').spell_suggest()<CR>]], opt)
map("n", "<Leader>fa", [[<Cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], opt)
map("n", "<Leader>fh", [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], opt)
map("n", "<Leader>fo", [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)
map("n", "<Leader>fe", [[<Cmd>lua require('telescope.builtin').symbols()<CR>]], opt)
map("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)

-- nvimTree
vim.o.termguicolors = true

g.nvim_tree_side = "left"
g.nvim_tree_width = 25
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
g.nvim_tree_auto_ignore_ft = {'startify'}
g.nvim_tree_auto_open = 1
g.nvim_tree_tab_open = 1
g.nvim_tree_auto_close = 0
g.nvim_tree_quit_on_open = 1
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":~"
-- g.nvim_tree_tab_open = 0
g.nvim_tree_allow_resize = 1
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_disable_netrw = 0

g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
}

g.nvim_tree_icons = {
    default = " ",
    symlink = " ",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★"
    },
    folder = {
        default = "",
        open = "",
        symlink = ""
    }
}

local get_lua_cb = function(cb_name)
    return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
end

-- Mappings for nvimtree

map("n", "<leader>a", ":NvimTreeToggle<CR>", opt)

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
  { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
  { key = "<C-v>",                        cb = tree_cb("vsplit") },
  { key = "<C-x>",                        cb = tree_cb("split") },
  { key = "<C-t>",                        cb = tree_cb("tabnew") },
  { key = "<",                            cb = tree_cb("prev_sibling") },
  { key = ">",                            cb = tree_cb("next_sibling") },
  { key = "P",                            cb = tree_cb("parent_node") },
  { key = "<BS>",                         cb = tree_cb("close_node") },
  { key = "<S-CR>",                       cb = tree_cb("close_node") },
  { key = "<Tab>",                        cb = tree_cb("preview") },
  { key = "K",                            cb = tree_cb("first_sibling") },
  { key = "J",                            cb = tree_cb("last_sibling") },
  { key = "I",                            cb = tree_cb("toggle_ignored") },
  { key = "H",                            cb = tree_cb("toggle_dotfiles") },
  { key = "R",                            cb = tree_cb("refresh") },
  { key = "a",                            cb = tree_cb("create") },
  { key = "d",                            cb = tree_cb("remove") },
  { key = "r",                            cb = tree_cb("rename") },
  { key = "<C-r>",                        cb = tree_cb("full_rename") },
  { key = "x",                            cb = tree_cb("cut") },
  { key = "c",                            cb = tree_cb("copy") },
  { key = "p",                            cb = tree_cb("paste") },
  { key = "y",                            cb = tree_cb("copy_name") },
  { key = "Y",                            cb = tree_cb("copy_path") },
  { key = "gy",                           cb = tree_cb("copy_absolute_path") },
  { key = "[c",                           cb = tree_cb("prev_git_item") },
  { key = "]c",                           cb = tree_cb("next_git_item") },
  { key = "-",                            cb = tree_cb("dir_up") },
  { key = "q",                            cb = tree_cb("close") },
  { key = "g?",                           cb = tree_cb("toggle_help") },
}

cmd "hi NvimTreeFolderIcon guifg = #268bd2"
cmd "hi NvimTreeFolderName guifg = #268bd2"
cmd "hi NvimTreeIndentMarker guifg=#073642"

-- Gitsigns
require("gitsigns").setup {
    signs = {
        add = {hl = "DiffAdd", text = "▌", numhl = "GitSignsAddNr"},
        change = {hl = "DiffChange", text = "▌", numhl = "GitSignsChangeNr"},
        delete = {hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr"},
        topdelete = {hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr"},
        changedelete = {hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr"}
    },
    numhl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
        ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
        ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
        ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
    },
    watch_index = {
        interval = 100
    },
    sign_priority = 5,
    status_formatter = nil -- Use default
}

cmd "hi DiffAdd guifg=#268bd2 guibg = none"
cmd "hi DiffChange guifg =#fdf6e3 guibg = none"
cmd "hi DiffModified guifg = #b58900 guibg = none"

require("nvim-autopairs").setup({
  check_ts = true
})
require("lspkind").init()

-- hide line numbers in terminal windows
vim.api.nvim_exec([[
  au BufEnter term://* setlocal nonumber
]], false)

-- inactive statuslines as thin splitlines
cmd("highlight! StatusLineNC gui=underline guibg=NONE guifg=#073642")

-- cmd "hi clear CursorLine"
cmd "hi cursorlinenr guibg=NONE guifg=#fdf6e3"

-- Zenmode
require("zen-mode").setup {
  plugins = {
    kitty =  {
      enabled = true,
      font = "+2"
    }
  },
  -- on_open = function(win)
  --    cmd[[MinimapClose]]
  -- end,
  -- -- callback where you can add custom code when the Zen window closes
  -- on_close = function()
  --   cmd[[Minimap]]
  -- end,
}

-- Minimap
-- g.minimap_width = 10
-- g.minimap_auto_start = 1
-- g.minimap_auto_start_win_enter = 1
-- g.minimap_highlight_range = 1
-- g.minimap_block_buftypes = {'terminal', 'help'}

-- quick-scope
g.qs_highlight_on_keys = {'f', 'F', 't', 'T', 'à', 'À'}  -- à doesn't seem to work?
g.qs_buftype_blacklist = {'terminal', 'nofile'}
