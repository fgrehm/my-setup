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
    tag = '0.1.1',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-s>'] = "select_horizontal",
              ['<C-v>'] = "select_vertical",
            },
            n = {
              ['<C-s>'] = "select_horizontal",
              ['<C-v>'] = "select_vertical",
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
          --[[ disable = { "embedded_template" } ]]
        },
        indent = {
          enable = true
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        matchup = {
          enable = true
        }
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

  -- Snippet Engine
  {
    "L3MON4D3/LuaSnip",
    lazy = false,
    build = "make install_jsregexp",
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

  -- Autoclose html tags
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Change surroundings
  {
    "tpope/vim-surround",
    event = 'VeryLazy',
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
  

  -------------------------

  -- -- {
  -- --   "luukvbaal/statuscol.nvim",
  -- --   lazy = false,
  -- --   config = function()
  -- --     require("statuscol").setup({
  -- --       separator = " ",
  -- --       setopt = true,
  -- --       order = "SNsFs"
  -- --     })
  -- --   end
  -- -- },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   lazy = false,
  --   config = function()
  --     require("indent_blankline").setup {
  --       buftype_exclude = { 'terminal', 'nofile' },
  --       filetype_exclude = { 'Trouble', 'trouble', 'noice', 'help', 'startify', 'alpha', 'dashboard', 'lazy', 'packer', 'neogitstatus', 'NvimTree', 'mason.nvim'},
  --       char = '▏',
  --       show_current_context = true,
  --       show_current_context_start = true,  -- underline first line
  --       use_treesitter = true,
  --       show_trailing_blankline_indent = false,
  --     }
  --   end
  -- },
  -- {
  --   "JoosepAlviste/nvim-ts-context-commentstring",
  --   lazy = false,
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   lazy = false,
  -- },
  -- {
  --   "SmiteshP/nvim-gps",
  --   config = function()
  --     require("nvim-gps").setup({
  --       icons = {
  --         ["class-name"] = ' ',      -- Classes and class-like objects
  --         ["function-name"] = ' ',   -- Functions
  --         ["method-name"] = ' ',     -- Methods (functions inside class-like objects)
  --         ["container-name"] = '⛶ ',  -- Containers (example: lua tables)
  --         ["tag-name"] = '炙'         -- Tags (example: html tags)
  --       }
  --     })
  --   end
  -- },
  -- -- {
  -- --   "AckslD/nvim-neoclip.lua",
  -- --   config = function()
  -- --     require("neoclip").setup()
  -- --   end
  -- -- },
  -- {
  --   "nacro90/numb.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require("numb").setup{
  --       show_numbers = true, -- Enable 'number' for the window while peeking
  --       show_cursorline = true -- Enable 'cursorline' for the window while peeking
  --     }
  --   end,
  -- },
  -- {
  --   "karb94/neoscroll.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require("neoscroll").setup()
  --   end,
  -- },
  -- {
  --   "tpope/vim-rails",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     -- disable autocmd set filetype=eruby.yaml
  --     vim.api.nvim_create_autocmd(
  --       { 'BufNewFile', 'BufReadPost' },
  --       {
  --         pattern = { '*.yml' },
  --         callback = function()
  --           vim.bo.filetype = 'yaml'
  --         end
  -- 
  --       }
  --     )
  --   end
  -- },
  -- -- {
  -- --   "tpope/vim-abolish",
  -- --   event = { "BufReadPre", "BufNewFile" },
  -- -- },
  -- {
  --   "tpope/vim-sleuth",
  --   event = { "BufReadPre", "BufNewFile" },
  -- },
  -- -- {
  -- --   "tpope/vim-bundler",
  -- --   event = { "BufReadPre", "BufNewFile" },
  -- -- },
  -- -- {
  -- --   "tpope/vim-capslock",
  -- --   lazy = false,
  -- -- },
  -- {
  --   "tpope/vim-repeat",
  --   event = { "BufReadPre", "BufNewFile" },
  -- },
  -- {
  --   "tpope/vim-endwise",
  --   event = { "BufReadPre", "BufNewFile" },
  -- },
  -- -- {
  -- --   "tpope/vim-dispatch",
  -- --   event = { "BufReadPre", "BufNewFile" },
  -- -- },
  -- -- {
  -- --   "tpope/vim-dadbod",
  -- --   lazy = false,
  -- -- },
  -- -- {
  -- --   "tpope/vim-jdaddy",
  -- --   event = { "BufReadPre", "BufNewFile" },
  -- -- },
  -- -- {
  -- --   "tpope/vim-fugitive",
  -- --   lazy = false
  -- -- },
  -- -- {
  -- --   "christoomey/vim-tmux-navigator",
  -- --   lazy = false,
  -- -- },
  -- -- {
  -- --   "ludovicchabant/vim-gutentags",
  -- --   lazy = false,
  -- --   config = function()
  -- --     vim.cmd('set tags+=tags,.git/tags')
  -- --     vim.g.gutentags_enabled = 1
  -- --     vim.g.gutentags_generate_on_missing = 1
  -- --     vim.g.gutentags_generate_on_write = 1
  -- --     vim.g.gutentags_resolve_symlinks = 1
  -- --     vim.g.gutentags_ctags_tagfile = '.git/tags'
  -- --     vim.g.gutentags_project_root = { '.git' }
  -- --     vim.g.gutentags_ctags_extra_args = { '--fields=+l' }
  -- --     vim.g.gutentags_add_default_project_roots = 0
  -- --     vim.g.gutentags_ctags_executable_ruby = 'ripper-tags'
  -- --     vim.g.gutentags_ctags_extra_args_ruby = { '--ignore-unsupported-options', '--recursive' }
  -- --     -- vim.g.gutentags_trace = 1
  -- --   end,
  -- -- },
  -- -- {
  -- --   "rcarriga/nvim-dap-ui",
  -- --   event = 'VeryLazy',
  -- --   config = function()
  -- --     require("dapui").setup()
  -- --   end,
  -- -- },
  -- -- {
  -- --   "theHamsta/nvim-dap-virtual-text",
  -- --   event = 'VeryLazy',
  -- --   config = function()
  -- --     require("nvim-dap-virtual-text").setup()
  -- --   end,
  -- -- },
  -- {
  --   "folke/todo-comments.nvim",
  --   event = 'VeryLazy',
  --   config = function()
  --     require("todo-comments").setup {}
  --   end,
  -- },
  -- -- {
  -- --   "gorbit99/codewindow.nvim",
  -- --   event = 'VeryLazy',
  -- --   config = function()
  -- --     local codewindow = require("codewindow")
  -- --     codewindow.setup()
  -- --     codewindow.apply_default_keybinds()
  -- --   end,
  -- -- },
  -- -- {
  -- --   "jeffkreeftmeijer/vim-numbertoggle",
  -- --   lazy = false,
  -- -- },
  -- -- {
  -- --   "folke/zen-mode.nvim",
  -- --   cmd = "ZenMode",
  -- --   opts = {
  -- --     plugins = {
  -- --       gitsigns = false,
  -- --       tmux = false,
  -- --       twilight = true,
  -- --     },
  -- --   },
  -- -- },
  -- -- {
  -- --   "lambdalisue/suda.vim",
  -- --   event = 'VeryLazy',
  -- -- },
  -- {
  --   "andymass/vim-matchup",
  --   lazy = false,
  -- },
  -- {
  --   "chrisbra/csv.vim",
  --   event = 'VeryLazy',
  -- },
  -- -- {
  -- --   "kazhala/close-buffers.nvim",
  -- --   event = 'VeryLazy',
  -- -- },
  -- {"folke/twilight.nvim",
  --   event = 'VeryLazy',
  -- },
  -- -- {"zdharma-continuum/zinit-vim-syntax",
  -- --   event = 'VeryLazy',
  -- -- },
  -- -- {"rhysd/committia.vim",
  -- --   event = 'VeryLazy',
  -- -- },
  -- -- {"chaoren/vim-wordmotion",
  -- --   event = 'VeryLazy',
  -- -- },
  -- -- {"windwp/nvim-spectre",
  -- --   event = 'VeryLazy',
  -- -- },
  -- {"folke/trouble.nvim",
  --   event = 'VeryLazy',
  -- },
  -- {"mrbjarksen/neo-tree-diagnostics.nvim",
  --   event = 'VeryLazy',
  -- },

  -- -=--------------------------------------------
  -- {
  --   "MunifTanjim/nui.nvim",
  --   lazy = false,
  -- },
  -- {
  --   "weilbith/nvim-code-action-menu",
  --   lazy = false,
  -- },
  --
  -- {
  --   "hrsh7th/cmp-vsnip",
  --   lazy = false,
  -- },
  -- {
  --   "hrsh7th/vim-vsnip",
  --   lazy = false,
  -- },
  -- {
  --   "quangnguyen30192/cmp-nvim-tags",
  --   lazy = false,
  -- },
  -- -- {
  -- --   "rafamadriz/friendly-snippets",
  -- --   lazy = false,
  -- -- },
  -- -- {
  -- --   "lukas-reineke/cmp-rg",
  -- --   lazy = false,
  -- -- },
}
