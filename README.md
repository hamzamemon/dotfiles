# Java's dotfiles
These are the dotfiles and configuration used on my systems.

* Settings for
  * vim/nvim (text editor)
  * zsh (shell)
  * i3/i3-gaps (window manager)
  * polybar (status bar)
  * ranger(file manager)
  * termite (terminal emulator)

### i3
1. Navigate to `~/.config/i3/`
2. Copy `config-desktop` or `config-laptop` to `config`
3. Adjust the monitor name(s) and workspace outputs for `$LEFT`, `$CENTER` and `$RIGHT`. Monitor
   names can be found by running `xrandr`

### Polybar
1. Navigate to `~/.config/polybar/`
2. Copy `config-desktop` or `config-laptop` to `config`
3. Under the "Bars" section, adjust the monitor variables to those found in the i3 portion,
   adding/deleting bars if needed
4. Copy `launch-desktop.sh` or `launch-laptop.sh` to `launch.sh`
5. Adjust the `polybar --reload` lines with the names of the bars set in `config`
