return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()

    local colors = require("solarized-osaka.colors").setup({ transform = true })
    local config = require("solarized-osaka.config").options

    local solarized_osaka  = {
      normal = {
        a = { bg = colors.base03, fg = colors.blue100 },
        b = { bg = colors.fg, fg = colors.black },
        c = { bg = colors.bg_statusline, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.base03, fg = colors.green100 },
      },

      command = {
        a = { bg = colors.base03, fg = colors.yellow100 },
      },

      visual = {
        a = { bg = colors.base03, fg = colors.magenta100 },
      },

      replace = {
        a = { bg = colors.base03, fg = colors.red100 },
      },

      terminal = {
        a = { bg = colors.base03, fg = colors.orange100 },
      },

      inactive = {
        a = { bg = colors.bg_statusline, fg = colors.blue },
        b = { bg = colors.bg_statusline, fg = colors.fg, gui = "bold" },
        c = { bg = colors.bg_statusline, fg = colors.fg },
      }
    }

    for _, mode in pairs(solarized_osaka) do
      if config.lualine_bold then
        mode.a.gui = "bold"
      end
    end

    -- local empty = require('lualine.component'):extend()

    -- local function jarak()
      --   return ' '
      -- end

      local empty = require('lualine.component'):extend()
      function empty:draw(default_highlight)
        self.status = ''
        self.applied_separator = ''
        self:apply_highlights(default_highlight)
        self:apply_section_separators()
        return self.status
      end

      local function process_sections(sections)
        for name, section in pairs(sections) do
          local left = name:sub(9, 10) < 'x'
          for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
            table.insert(section, pos * 2, { empty, color = { fg = colors.base03, bg = colors.base03 } })
          end
          for id, comp in ipairs(section) do
            if type(comp) ~= 'table' then
              comp = { comp }
              section[id] = comp
            end
            -- comp.separator = left and { right = '' } or { left = '' }
            comp.separator = left and { right = ' ' } or { left = ' '}
            -- comp.separator = {left = '' } and { right = '' }
          end
        end
        return sections
    end

    require('lualine').setup{
      options =
        {
          theme = solarized_osaka,
          -- icons_enabled = true,
          -- component_separators = { left = '>', right = '┇' },
          -- section_separators = {left = '', right = ''  },
        },
      ignore_focus = {},
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
        },
      sections = process_sections {
        lualine_a = {
          { 'mode', 
            -- icons_enabled = true, 
            icon = {
              " ",
              color = { fg = colors.base4, bg = colors.base03, gui = 'bold'}
            },
            -- color = { fg = colors.base0, bg = colors.green300, gui = 'bold' },
            -- separator = { left = '', right = '' },
            -- left_padding = 2, right_padding = 0,
          },
        },
        -- lualine_b = { 'filename', 'branch' },
        lualine_b = {
          {
            'branch',
            -- separator = { left = '', right = '' },
            -- left_padding = 0, right_padding = 2,
            icon = {
              "",
              -- align = 'left',
              color = { fg = colors.orange100, bg = colors.base03, gui = 'bold'},
              --   -- separator = {left = '', right = ''}
            },
            -- left_padding = 0,
            color = { fg = colors.orange100, bg = colors.base03, gui = 'bold' },
          },
          {
            'diff',
            -- separator = { right = '',left = ''},
            colored = true,
            symbols = { added = " " , modified = " " , removed = " " },
            diff_color = {
              added = { fg = colors.green300, bg = colors.base03, gui = 'bold' },
              modified = { fg = colors.yellow300, bg = colors.base03, gui = 'bold' },
              removed = { fg = colors.red300, bg = colors.base03, gui = 'bold' },
            }
          },
        },
        lualine_c = {
          {
            'filename', 
            on_click = function() 
              require('telescope.builtin').find_files()
              -- print('file name clicked') 
            end, 
            icon = ' ',
            color = { fg = colors.yellow100, bg = colors.base03, gui = 'bold'},
            path = 4,
            file_status = false,
            -- separator = { right = '┇', left = '┇'},
          },
        },
        lualine_x = {
          {
            'diagnostics',
            on_click = function()
              require('telescope.builtin').diagnostics()
            end,
            -- separator = { left = '' },
            sources = { 'nvim_diagnostic'},
            sections = { 'error', 'warn', 'info', 'hint' },

            diagnostics_color = {
              error = { fg = colors.red300, bg = colors.base03 , gui = 'bold'}, -- Changes diagnostics' error color.
              added = { fg = colors.green300, bg = colors.base03, gui = 'bold'},
              warn  = { fg = colors.yellow300, bg = colors.base03, gui = 'bold' },  -- Changes diagnostics' warn color.
              info  = { fg = colors.blue300, bg = colors.base03, gui = 'bold' },  -- Changes diagnostics' info color.
              hint  = { fg = colors.cyan300, bg = colors.base03, gui = 'bold' },  -- Changes diagnostics' hint color.
            },
            symbols = { error = " ", warn = " ", hint = "󰌵 ", info = " " },
            colored = true,           -- Displays diagnostics status in color if set to true.
            update_in_insert = true, -- Update diagnostics in insert mode. default = false
            always_visible = false,   -- Show diagnostics even if there are none.
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = colors.orange300 },
          },
          {
            -- code from https://github.com/nvim-lualine/lualine.nvim/blob/566b7036f717f3d676362742630518a47f132fff/examples/evil_lualine.lua
            -- Lsp server name .
            function()
              local msg = 'No LSP'
              local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
              local clients = vim.lsp.get_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end
              return msg
            end,
            -- icon = ' LSP:',
            -- icon = {'  ', color = {bg = colors.base03, fg = colors.red100}},
            -- separator = { left = '', right = ''},
            -- separator = { left = ' ', right = ' '},
            color = { fg = colors.base4, gui = 'bold', bg = colors.base03 },
          },

          {
            'filetype',
            color = {bg = colors.base03, fg = colors.magenta100, gui = 'bold'}
            -- separator = { left = '', right = ' ' },
          }
        },
        lualine_y = {
          {
            'progress', left_padding = 0,
            color = {bg = colors.base03, fg = colors.cyan100, gui = 'bold'}
          }
        },
        lualine_z = {
          { 
            -- 'location', 
            -- function()
            --   return "Ln:%l Col:%c"
            -- end
            -- separator = { right = '' }, left_padding = 2 },
          }  
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    }
  end
}
