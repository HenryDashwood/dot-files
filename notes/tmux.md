# Notes on how to use tmux

Remember shift key for lots of the characters in these commands

| Action                       | Command                                            | Notes                             |
| ---------------------------- | -------------------------------------------------- | --------------------------------- |
| Install                      | `sudo apt install tmux`                            |                                   |
| Create new pane to the right | `Ctrl+b %`                                         |                                   |
| Start                        | `tmux`                                             |                                   |
| Create new pane below        | `Ctrl+b "`                                         |                                   |
| Navigate between panes       | `Ctrl+b →` `Ctrl+b ←` `Ctrl+b ↑` `Ctrl+b ↓`        |                                   |
| Close current pane           | `exit`                                             |                                   |
| Create new window            | `Ctrl+b c`                                         |                                   |
| Switch to window by number   | `Ctrl+b [WINDOW NUMBER]`                           |                                   |
| Rename current window        | `Ctrl+b ,` + `[NEW NAME]` + `Enter`                |                                   |
| Close window                 | `exit` when there is only one pane left            |                                   |
| Detach session               | `Ctrl+b d`                                         |                                   |
| List background sessions     | `tmux ls`                                          |                                   |
| Attach to session            | `tmux attach -t [SESSION NAME]`                    |                                   |
| Rename session               | `tmux rename-session -t [CURRENT NAME] [NEW NAME]` | name is 0, 1, etc by defualt.     |
| Create new session           | `tmux new -s [SESSION NAME]`                       | `tmux` names it after next number |
| Delete session               | `tmux kill-session -t [SESSION NAME]`              |                                   |
| Enter scroll mode in pane|`Ctrl+b [`|`q` to quit mode|
