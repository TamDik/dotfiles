# dotfiles

## Vim
`let mapleader = "\<Space>"`

### Normal mode
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

### Insert mode
| map    | effect                            |
| ------ | --------------------------------- |
| `jj`   | `<ESC>`                           |
| `<F5>` | `<ESC>:w<CR>:!compiler %<CR>`     |

### Command-line mode
| map    | effect                                           |
| ------ | ------------------------------------------------ |
| `%%`   | `getcmdtype() == ':' ? expand('%:h').'/' : '%%'` |


### Plugins
#### [cocopon/iceberg.vim](https://github.com/cocopon/iceberg.vim)

#### [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)

#### [tpope/vim-surround](https://github.com/tpope/vim-surround)

#### [tpope/vim-repeat](https://github.com/tpope/vim-repeat)

#### [tpope/vim-commentary](https://github.com/tpope/vim-commentary)

#### [Shougo/neocomplete.vim](https://github.com/Shougo/neocomplete.vim)

#### [SirVer/ultisnips](https://github.com/SirVer/ultisnips)

#### [honza/vim-snippets](https://github.com/honza/vim-snippets)

#### [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)

#### [junegunn/fzf](https://github.com/junegunn/fzf)

#### [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

#### [dense-analysis/ale](https://github.com/dense-analysis/ale)
