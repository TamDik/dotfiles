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
カラースキーム

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
tmux と vim の画面移動を同一キーで行うことを可能にする。
* `<ctrl-h>` => 左に移動
* `<ctrl-j>` => 下に移動
* `<ctrl-k>` => 上に移動
* `<ctrl-l>` => 右に移動
* `<ctrl-\>` => 前の分割に移動

~/.tmux.conf に以下を追記。
```tmux
# ~/.tmux.conf
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

bind-key -T copy-mode-vi 'C-h' select-pane -L
bind-key -T copy-mode-vi 'C-j' select-pane -D
bind-key -T copy-mode-vi 'C-k' select-pane -U
bind-key -T copy-mode-vi 'C-l' select-pane -R
bind-key -T copy-mode-vi 'C-\' select-pane -l
```

Tmux Plugin Manager (TPM) を使用している場合は以下を ~/.tmux.conf に追記。
```tmux
# ~/.tmux.conf
set -g @plugin 'christoomey/vim-tmux-navigator'
run '~/.tmux/plugins/tpm/tpm'
```

キーバインドを変更する場合は ~/.tmux.conf の `bind-key` の書き換えと、以下を ~/.vimrc に追記。
```vim
" ~/.vimrc
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
```

vim から抜けて tmux に入った時に buffer を自動的に保存したい場合
```vim
" ~/.vimrc
let g:tmux_navigator_save_on_switch = 1  " :update 現在の buffer のみを対象に、変更されていた場合保存
let g:tmux_navigator_save_on_switch = 2  " :wall   全ての buffer を保存
```

tmux のズームモード (\<prefix\>z)で、tmux に移動する方向へ移動しようとした時、自動的にズームを解除する
```vim
" ~/.vimrc
let g:tmux_navigator_disable_when_zoomed = 1
```

\<prefix\> C-l をスクリーンクリアに割り当てる
```tmux
~/.tmux.conf
bind C-l send-keys 'C-l'
```


#### [dense-analysis/ale](https://github.com/dense-analysis/ale)
```vim
" :ALEFix で使用される Function を設定する
b:ale_fixers = ['prettier', 'eslint']  " ftplugin file 内に記述
g:ale_fixers = {'*': ['trim_whitespace'], 'javascript': ['eslint']}  " vimrc 内に記述

" 保存時に自動的に :ALEFix を実行する
let g:ale_fix_on_save = 1


" Deoplete との連携
call deoplete#custom#option('sources', {
\ '_': ['ale', 'foobar'],
\})

" Deoplete など外部プラグインを使用せずに補完したいときに設定する
" NOTE: ALE がロードされる前に設定する必要がある
let g:ale_completion_enabled = 1

" omni-completion(<C-x><C-o>) に設定する
set omnifunc=ale#completion#OmniFunc

let g:ale_completion_tsserver_autoimport = 1

" カーソル下の単語の定義にジャンプする
:ALEGoToDefinition

" カーソル下の単語のリファレンスを見つける
:ALEFindReferences

:ALEHover

:ALESymbolSearch

" 現在の設定を見る
:ALEInfo


" linter を設定する
let b:ale_linters = ['eslint']  "ftplugin file 内に記述
let g:ale_linters = {'javascript': ['eslint']}  " vimrc に記述

" ale_linters で設定されていない言語で全ての linter を無効にする
" 0 （デフォルト）の時には全ての linter が有効になる
let g:ale_linters_explicit = 1

" エラーがなくても、ガター部分を開いたままにするかの設定
let g:ale_sign_column_always = 1

" マークの形状
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" マークの色
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" エラーの箇所（エディタ部分）をハイライトするかの設定
let g:ale_set_highlights = 0

" Airline との連携
let g:airline#extensions#ale#enabled = 1

" エラーの詳細を返す Function
" Status line などに使える
ale#statusline#Count(buffer)  " buffer 内にある問題の個数を Dictionary で返す
ale#statusline#FirstProblem(buffer, type)

" エラーのフォーマット
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" hooks
augroup YourGroup
    autocmd!
    autocmd User ALELintPre    call YourFunction()
    autocmd User ALELintPost   call YourFunction()

    autocmd User ALEJobStarted call YourFunction()

    autocmd User ALEFixPre     call YourFunction()
    autocmd User ALEFixPost    call YourFunction()
augroup END

" 前後のエラーに移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" linter の起動タイミング
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
```

#### [junegunn/goyo.vim](https://github.com/junegunn/goyo.vim)
```vim
" Goyo をトグルする
:Goyo

" サイズの設定
let g:goyo_width = 80
let g:goyo_height = '100%'

" ？？？
let g:goyo_linenr = 0

" hooks
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
```
