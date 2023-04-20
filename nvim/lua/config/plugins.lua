return {
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
  },

  -- Always on the root of git directories
  {
    "airblade/vim-rooter",
    lazy = false,
    config = function()
      vim.g.rooter_silent_chdir = 1
      vim.g.rooter_cd_cmd = 'lcd'
      vim.g.rooter_resolve_links = 1
      vim.g.rooter_patterns = { '.git', '.git/' }
    end,
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")
      local custom = require("telescope.actions.mt").transform_mod({
        set_normal = function(_)
          switch_to_normal = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "n", true)
          end
          vim.defer_fn(switch_to_normal, 250)
        end,
      })

      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<C-s>"] = actions.select_horizontal + custom.set_normal,
              ["<C-v>"] = actions.select_vertical + custom.set_normal,
              ["<C-t>"] = actions.select_tab + custom.set_normal,
              ["<CR>"] = actions.select_default + custom.set_normal,
            },
            n = {
              ["<C-s>"] = actions.select_horizontal + custom.set_normal,
              ["<C-v>"] = actions.select_vertical + custom.set_normal,
              ["<C-t>"] = actions.select_tab + custom.set_normal,
              ["<CR>"] = actions.select_default + custom.set_normal,
            },
          },
        },
      }
    end
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    lazy = false ,
    build = "make",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require('telescope').load_extension('fzf')
    end,
  },

  -- Browse the file system and other tree like structures
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  -- Autosave coz I'm lazy
  {
    "Pocco81/auto-save.nvim",
    event = 'VeryLazy',
  },

  -- Fancier statusline
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require('lualine').setup {
        options = {
          -- icons_enabled = false,
          -- theme = 'onedark',
          component_separators = '|',
          section_separators = '',
        },
      }
    end,
  },

  -- Highlight active window
  {
    "nvim-zh/colorful-winsep.nvim",
    lazy = false,
    config = function ()
      require("colorful-winsep").setup({
        highlight = {
          bg = "#282828",
          fg = "#d8a657",
        },
        interval = 30,
        no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
        symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
      })
    end
  },

  -- Git decorations
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }
    end
  },

  -- Incremental parsing system and system highlighting, used by many other plugins
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require'nvim-treesitter.configs'.setup {
        markid = {
          enable = true,
          colors = false
        },
        ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
          -- enable = false,
          -- disable = { "ruby" }
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        matchup = {
          enable = true
        },
      }
    end,
  },

  -- Color scheme
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,
  },

  -- Call out code annotations
  {
    "folke/todo-comments.nvim",
    event = 'VeryLazy',
    config = function()
      require("todo-comments").setup {}
    end,
  },

  -- Highlight same-name identifiers with the same color
  {
    "David-Kunz/markid",
    lazy = false,
  },

  -- Different colors for parenthesis
  {
    "mrjones2014/nvim-ts-rainbow",
    lazy = false,
    config = function()
      require'nvim-treesitter.configs'.setup {
        rainbow = {
          enable = true,
        }
      }
    end,
  },

  -- Pictograms for LSP
  {
    "onsails/lspkind-nvim",
    lazy = false,
  },

  -- Add indentation guides even on blank lines
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function()
      require("indent_blankline").setup {
        buftype_exclude = { 'terminal', 'nofile' },
        filetype_exclude = { 'Trouble', 'trouble', 'noice', 'help', 'startify', 'alpha', 'dashboard', 'lazy', 'packer', 'neogitstatus', 'NvimTree', 'mason.nvim'},
        char = '▏',
        show_current_context = true,
        show_current_context_start = true,  -- underline first line
        use_treesitter = true,
        show_trailing_blankline_indent = false,
      }
    end
  },

  -- Shows a list of options of what can be done for a mapping
  {
    "folke/which-key.nvim",
    event = 'VeryLazy',
    config = function()
      require("which-key").setup({
        window = {
          border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
        },
      })
    end,
  },

  -- Fancy code completion for a bunch of stuff
  {
    "hrsh7th/nvim-cmp",
    priority = 1000,
    lazy = false,
  },
  {
    "hrsh7th/cmp-buffer",
    lazy = false,
  },
  {
    "hrsh7th/cmp-path",
    lazy = false,
  },
  {
    "hrsh7th/cmp-calc",
    lazy = false,
  },
  {
    "hrsh7th/cmp-cmdline",
    lazy = false,
  },
  {
    "ray-x/cmp-treesitter",
    lazy = false,
  },

  -- FIXME: This is breaking indentation for function calls when arguments are split into multiple lines
  -- Auto close parenthesis, quotes, etc
  -- {
  --   "windwp/nvim-autopairs",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require('nvim-autopairs').setup()
  --   end,
  -- },

  -- Autoclose html tags
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      -- Does not work for .html.erb, tried the following but didn't work
      -- https://github.com/windwp/nvim-ts-autotag/issues/85#issuecomment-1439420043
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Append `end` to `if`s in ruby
  {
    "RRethy/nvim-treesitter-endwise",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('nvim-treesitter.configs').setup({
        endwise = {
          enable = true,
        },
      })
    end,
  },

  -- Change surroundings
  {
    "tpope/vim-surround",
    event = 'VeryLazy',
  },

  -- enable repeating supported plugin maps with "."
  {
    "tpope/vim-repeat",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- "gc" to comment visual regions/lines
  {
    "numToStr/Comment.nvim",
    event = 'VeryLazy',
    config = function()
      require('Comment').setup()
    end,
  },

  -- Multiple cursors for find and replace
  {
    "mg979/vim-visual-multi",
    event = 'VeryLazy',
  },

  -- Rails goodies
  {
    "tpope/vim-rails",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- disable autocmd set filetype=eruby.yaml
      vim.api.nvim_create_autocmd(
        { 'BufNewFile', 'BufReadPost' },
        {
          pattern = { '*.yml' },
          callback = function()
            vim.bo.filetype = 'yaml'
          end
        }
      )
    end
  },

  -- Open files on specific lines
  {
    "wsdjeg/vim-fetch",
    lazy = false
  },

  -- peeks lines of the buffer in non-obtrusive way
  {
    "nacro90/numb.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("numb").setup{
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true -- Enable 'cursorline' for the window while peeking
      }
    end,
  },

  -- {
  --   "sbdchd/neoformat",
  --   lazy = false,
  --   config = function()
  --     vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  --       pattern = { "*.rb" },
  --       command = [[:Neoformat]],
  --     })
  --   end,
  -- },

  ------------------------------------------------------
  -- Plugins to try again another time
  -- {
  --   "JoosepAlviste/nvim-ts-context-commentstring",
  --   lazy = false,
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   lazy = false,
  -- },
  -- {"folke/twilight.nvim",
  --   event = 'VeryLazy',
  -- },
}
