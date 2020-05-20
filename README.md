# dotfiles

## Install
```sh
git clone https://github.com/TamDik/dotfiles.git
cd dotfiles
./setup.sh
```
Run the following command before you run `./setup.sh`, if you want to change the location of dotfiles directory which is different from remote repository.
```sh
export DOTFILES=~/path/to/dotfiles
```

## Requirements
* zsh
    * `chsh -s $(which zsh)`
* powerline patched fonts 
    * See [nerd-fonts](https://github.com/ryanoasis/nerd-fonts/blob/master/readme.md#font-installation)


## zsh
* abbrev-alias で展開しない場合は `<Ctrl+x><Space>`

## Vim
`let mapleader = "\<Space>"` 
### Normal mode
| map               | effect                      |
| ----------------- | --------------------------- |
| `<leader>ff`      | `:Files<CR>`                |
| `<leader>fb`      | `:Buffers<CR>`              |
| `<leader>fl`      | `:Lines<CR>`                |
| `<leader>ft`      | `:Tags<CR>`                 |
| `<leader>fh`      | `:History<CR>`              |
| `<leader>g`       | `:Goyo<CR>`                 |
| `<leader><Space>` | `:nohl<CR>`                 |
| `<leader>s`       | `:sp<CR>`                   |
| `<leader>v`       | `:vs<CR>`                   |
| `<leader>q`       | `:q<CR>`                    |
| `<leader>j`       | `:bprevious<CR>`            |
| `<leader>k`       | `:bnext<CR>`                |
| `<leader>a`       | `:ALEToggle<CR>`            |
| `<leader>[`       | `<Plug>(ale_previous_wrap)` |
| `<leader>]`       | `<Plug>(ale_next_wrap)`     |
| `<F5>`            | `:w<CR>:!compiler %<CR>`    |
| `nnoremap`        | `Y y$`                      |

### Insert mode
| map          | effect                                             |
| ------------ | -------------------------------------------------- |
| `jj`         | `<ESC>`                                            |
| `<F5>`       | `<ESC>:w<CR>:!compiler %<CR>`                      |
| `<tab>`      | スニペットの展開 or 次のプレースホルダーにジャンプ |
| `<C-z>`      | 前のプレースホルダーにジャンプ                     |
| `<c-x><c-k>` | `<plug>(fzf-complete-word)`                        |
| `<c-x><c-f>` | `<plug>(fzf-complete-path)`                        |
| `<c-x><c-l>` | `<plug>(fzf-complete-line)`                        |

### Command-line mode
| map    | effect                                           |
| ------ | ------------------------------------------------ |
| `%%`   | `getcmdtype() == ':' ? expand('%:h').'/' : '%%'` |
