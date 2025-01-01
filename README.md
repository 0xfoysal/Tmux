
## Clone TPM:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
## Put this at the bottom of ~/.tmux.conf ($XDG_CONFIG_HOME/tmux/tmux.conf works too):
```
# List of plugins
# Enable mouse mode globally
set -g mouse on

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @yank-action 'copy-pipe-and-cancel'
bind - split-window -h -c "#{pane_current_path}"
bind | split-window -v -c "#{pane_current_path}"
set -g status-right "#(acpi | cut -d ',' -f 2) | %H:%M"
set -g status-right "#(git rev-parse --abbrev-ref HEAD 2>/dev/null) | %H:%M"
setw -g window-status-current-style fg=green,bg=black
set -g @plugin 'jimeh/tmux-themepack'

# System monitoring
set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'tmux-plugins/tmux-battery'

# Productivity plugins
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/tmux-urlview'
set -g @plugin 'tmux-plugins/tmux-copycat'


# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'
 
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

```
Reload TMUX environment so TPM is sourced:
```
# type this in terminal if tmux is already running
tmux source ~/.tmux.conf
```

### info get
```
https://github.com/tmux-plugins/tpm
https://github.com/tmux-plugins/tmux-yank
```
