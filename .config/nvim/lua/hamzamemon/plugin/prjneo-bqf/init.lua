local status_ok, bqf = pcall(require, "bqf")
if not status_ok then
  return
end

bqf.setup {
    auto_enable = true,
    magic_window = true,
    auto_resize_height = true, -- highly recommended enable
    preview = {
        auto_preview = true,
        border_chars = {'│', '│', '─', '─', '╭', '╮', '╰', '╯', '█'},
        delay_syntax = 80,
        win_height = 15,
        win_vheight = 15,
        wrap = false,
        should_preview_cb = nil,
    },
    -- make `drop` and `tab drop` to become preferred
    func_map = {
        drop = 'o',
        openc = 'O',
        split = '<C-s>',
        tabdrop = '<C-t>',
        tabc = '',
        ptogglemode = 'z,',
    },
    filter = {
        fzf = {
            action_for = {
                ['ctrl-t'] = 'tabedit',
                ['ctrl-v'] = 'vsplit',
                ['ctrl-x'] = 'split',
                ['ctrl-q'] = 'signtoggle',
                ['ctrl-c'] = 'closeall',
                ['ctrl-s'] = 'split',
                ['ctrl-t'] = 'tab drop',
            },
            extra_opts = {'--bind', 'ctrl-o:toggle-all', '--prompt', '> '},
        }
    }
}