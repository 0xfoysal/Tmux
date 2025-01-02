
## Clone TPM:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
## install requirement
```
sudo apt install xclip
```
## Put this at the bottom of ~/.tmux.conf ($XDG_CONFIG_HOME/tmux/tmux.conf works too):
```
# List of plugins
# Enable mouse mode globally
set -g mouse on
set-option -g set-clipboard on
setw -g mode-keys vi



set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @yank-action 'copy-pipe-and-cancel'
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
set -g status-right "#(acpi | cut -d ',' -f 2) | %H:%M"
set -g status-right "#(git rev-parse --abbrev-ref HEAD 2>/dev/null) | %H:%M"
setw -g window-status-current-style fg=green,bg=black
set -g @plugin 'jimeh/tmux-themepack'

# System monitoring
set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'tmux-plugins/tmux-battery'

# line copy
set-option -g set-clipboard on
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe "xclip -selection clipboard -i"
bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "xclip -selection clipboard -i"



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
### configaration tmux in terminal

```
nano ~/.bashrc  # Replace with your shell's file
# Auto-start tmux
if [ -z "$TMUX" ]; then
    tmux attach || tmux new
fi
```
run
```
source ~/.bashrc  # Replace with your shell's file
```
## manually copy-paste command
```
enter copy mode: 	Ctrl + b then[
to move around: 	Arrow Keys
to mark text:		Ctrl+space
to copy text: 		Alt+w
to paste text:		Ctrl+b then ]
```
