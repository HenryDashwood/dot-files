# Notes on how to use tmux
Remember shift key for lots of the characters in these commands
- Install `sudo apt intall tmux`
- Start `tmux`
- Create new pane to the right `Ctrl+b %`
- Create new pane below `Ctrl+b "`
- Navigate between panes `Ctrl+b →` `Ctrl+b ←` `Ctrl+b ↑` `Ctrl+b ↓`
- Close current pane `exit`
- Create new window `Ctrl+b c`
- Switch to window by window number `Ctrl+b [WINDOW NUMBER]`
- Rename current window `Ctrl+b ,` then type in new name and hit `Enter`
- Close window `exit` when there is only one pane left
- Detach session `Ctrl+b d`
- List background sessions `tmux ls`
- Attach to session `tmux attach -t [SESSION NAME]`
- Rename session `tmux rename-session -t [CURRENT NAME] [NEW NAME]` _(name is 0, 1, etc by defualt. `tmux ls` to view)_
- Create new session `tmux new -s [SESSION NAME]` _(Can also just type `tmux` and it will name it after the next number)_
- Delete session `tmux kill-session -t [SESSION NAME]`
