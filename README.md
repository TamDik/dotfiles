# dotfiles

## Vim
`let mapleader = "\<Space>"`

### Normal
| map               | effect                      |
| ----------------- | --------------------------- |
| `<leader>ff`      | `:Files<CR>`                |
| `<leader>fb`      | `:Buffers<CR>`              |
| `<leader>ft`      | `:Tags<CR>`                 |
| `<leader>fh`      | `:History<CR>`              |
| `<leader>g`       | `:Goyo<CR>`                 |
| `<leader><Space>` | `:nohl<CR>`                 |
| `<leader>s`       | `:sp<CR>`                   |
| `<leader>v`       | `:vs<CR>`                   |
| `<leader>q`       | `:q<CR>`                    |
| `<leader>j`       | `:bprevious<CR>`            |
| `<leader>k`       | `:bnext<CR>`                |
| `<leader>[`       | `<Plug>(ale_previous_wrap)` |
| `<leader>]`       | `<Plug>(ale_next_wrap)`     |
| `<F5>`            | `:w<CR>:!compiler %<CR>`    |
| `nnoremap`        | `Y y$`                      |

### Insert
| map    | effect                            |
| ------ | --------------------------------- |
| `jj`   | `<ESC>`                           |
| `<F5>` | `<ESC>:w<CR>:!compiler %<CR>`     |

### Command-line
| map    | effect                                           |
| ------ | ------------------------------------------------ |
| `%%`   | `getcmdtype() == ':' ? expand('%:h').'/' : '%%'` |

