lua << EOF
local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local themes = require('telescope.themes')

require('telescope').setup {
  defaults = {
    prompt_prefix = ' >',

    winblend = 0,
    preview_cutoff = 120,

    layout_strategy = 'horizontal',
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      }
    },

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    prompt_position = "top",
    color_devicons = true,

    file_sorter = sorters.get_fzy_sorter,

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.select_vertical,
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  },
  extensions = {
    fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
    }
  }
}
pcall(require('telescope').load_extension, 'fzy_native')
pcall(require('telescope').load_extension, 'gh')
EOF

nnoremap <leader>pg :lua require('telescope.builtin').git_files()<CR>
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
