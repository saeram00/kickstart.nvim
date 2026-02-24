return {

  -- Default colorscheme.
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    name = 'gruvbox',
    config = function()
      ---@diagnostic disable-next-line: missing-fields

      -- Default options:
      require('gruvbox').setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = 'hard', -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'gruvbox'
    end,
  },

  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    name = 'kanagawa',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('kanagawa').setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = 'wave', -- Load "wave" theme
        background = { -- map the value of 'background' option to a theme
          dark = 'wave', -- try "dragon" !
          light = 'lotus',
        },
      }
    end,
  },

  {
    'aliqyan-21/darkvoid.nvim',
    lazy = false,
    name = 'darkvoid',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('darkvoid').setup {
        transparent = false,
        glow = true,
        show_end_of_buffer = true,

        colors = {
          fg = '#c0c0c0',
          bg = '#1c1c1c',
          cursor = '#bdfe58',
          line_nr = '#404040',
          visual = '#303030',
          comment = '#585858',
          string = '#d1d1d1',
          func = '#e1e1e1',
          kw = '#f1f1f1',
          identifier = '#b1b1b1',
          type = '#a1a1a1',
          type_builtin = '#c5c5c5', -- current
          -- type_builtin = "#8cf8f7", -- glowy blue old (was present by default before type_builtin was introduced added here for people who may like it)
          search_highlight = '#1bfd9c',
          operator = '#1bfd9c',
          bracket = '#e6e6e6',
          preprocessor = '#4b8902',
          bool = '#66b2b2',
          constant = '#b2d8d8',

          -- enable or disable specific plugin highlights
          plugins = {
            gitsigns = true,
            nvim_cmp = true,
            treesitter = true,
            nvimtree = false,
            telescope = true,
            lualine = false,
            bufferline = false,
            oil = false,
            whichkey = true,
            nvim_notify = true,
          },

          -- gitsigns colors
          added = '#baffc9',
          changed = '#ffffba',
          removed = '#ffb3ba',

          -- Pmenu colors
          pmenu_bg = '#1c1c1c',
          pmenu_sel_bg = '#1bfd9c',
          pmenu_fg = '#c0c0c0',

          -- EndOfBuffer color
          eob = '#3c3c3c',

          -- Telescope specific colors
          border = '#585858',
          title = '#bdfe58',

          -- bufferline specific colors
          bufferline_selection = '#1bfd9c',

          -- LSP diagnostics colors
          error = '#dea6a0',
          warning = '#d6efd8',
          hint = '#bedc74',
          info = '#7fa1c3',
        },
      }
    end,
  },

  {
    'folke/tokyonight.nvim',
    lazy = false,
    name = 'tokyonight',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = true }, -- Disable italics in comments
        },
      }
    end,
  },

  -- Huez as theme manager.
  {
    'vague2k/huez.nvim',
    import = 'huez-manager.import',
    branch = 'stable',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    event = 'VeryLazy', -- Could also be 'UIEnter'.
    config = function()
      require('huez').setup {
        fallback = 'gruvbox', -- Default if nothing loads.
        -- exclude = {}, -- To hide builtin colors.
      }
      -- Optional: auto-apply saved theme very early (huez usually does this itself)
      -- vim.schedule(function() require("huez").load() end)
    end,

    -- Colorscheme picker.
    keys = {
      {
        '<leader>tc',
        vim.cmd.Huez,
        desc = '[T]elescope [C]olorscheme picker',
      },
    },
  },
}
