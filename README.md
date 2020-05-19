# dotfiles

## zsh
* abbrev-alias で展開しない場合は `<Ctrl+x><Space>`

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
| `<leader>a`       | `:ALEToggle<CR>`            |
| `<leader>[`       | `<Plug>(ale_previous_wrap)` |
| `<leader>]`       | `<Plug>(ale_next_wrap)`     |
| `<F5>`            | `:w<CR>:!compiler %<CR>`    |
| `nnoremap`        | `Y y$`                      |

### Insert mode
| map     | effect                                             |
| --------| -------------------------------------------------- |
| `jj`    | `<ESC>`                                            |
| `<F5>`  | `<ESC>:w<CR>:!compiler %<CR>`                      |
| `<tab>` | スニペットの展開 or 次のプレースホルダーにジャンプ |

### Command-line mode
| map    | effect                                           |
| ------ | ------------------------------------------------ |
| `%%`   | `getcmdtype() == ':' ? expand('%:h').'/' : '%%'` |


### Plugins
#### [Shougo/dein.vim](https://github.com/Shougo/dein.vim)
プラグインマネージャ

キャッシュのリセット。
```vim
:call dein#recache_runtimepath()
```
このコマンドを実行後、vim を起動する度にプラグインを繰り返し読み込むようになっていしまった。(20200518)
原因は分からないが、deinrc.vim 内の `dein#check_clean()` のパラグラフをコメントアウトすると正常に動作するようになった。

#### [cocopon/iceberg.vim](https://github.com/cocopon/iceberg.vim)
カラースキーム

#### [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
ステータスラインの装飾
```vim
set laststatus=2  " ステータスラインを常に表示
set noshowmode    " -- INSERT -- などを非表示にする
```

```vim
" カラースキームの設定
let g:lightline.colorscheme = 'seoul256'

" buffer がアクティブの時の表示内容
let g:lightline.active.left = []
let g:lightline.active.right = []

" buffer が非アクティブの時の表示内容
let g:lightline.inactive.left = []
let g:lightline.inactive.right = []

" 新しい component を Dictionary で登録し、
" g:lightline.active などに key を追加して反映させる。
" 特定の文字列や、カーソル下の文字などを追加できる
" :h g:lightline.component
let g:lightline.component = {
\  'charvaluehex': '0x%B',
\  'helloworld': 'Hello, world!'
\}

" String を返す function を Dictionary で登録し、
" g:lightline.active などに key を追加して反映させる。
" git branch を表示することなどができる
" :h g:lightline.component_function
let g: lightline.component_function = {
\  'gitbranch': 'FugitiveHead'  " この関数を動かすには tpope/vim-fugitive が必要
\}

" mode 名を変更
let g:lightline.mode_map = {
  \ 'n': 'N',
  \ 'i': 'I',
  \ 'R': 'R',
  \ 'v': 'V',
  \ 'V': 'VL',
  \ "\<C-v>": 'VB',
  \ 'c': 'C',
  \ 's': 'S',
  \ 'S': 'SL',
  \ "\<C-s>": 'SB',
  \ 't': 'T',
  \ }
```

#### [tpope/vim-surround](https://github.com/tpope/vim-surround)
surroundings マッピングを追加する。
| command    | effect                       |
| ---------- | ---------------------------- |
| `cs"'`     | `"` から `'` に変える        |
| `cs'<q>`   | `'` から `<p>` タグに変える  |
| `cst"`     | タグから `"` に変える        |
| `ds"`      | `"` を削除                   |
| `ysiw]`    | `word` を `[]` で囲む        |
| `yss)`     | 1行全体を `()` で囲む        |
| `ysiw<em>` | `word` を `<em></em>` で囲む |
* `ys` や `yss` で囲み文字に開き括弧を指定した場合はスペースを括弧の内側に挿入し、閉じ括弧を指定した場合はスペースを挿入しない。
* `)` の代わりに `b` を使うこともできる。

#### [tpope/vim-repeat](https://github.com/tpope/vim-repeat)
`.` コマンドを、プラグインで追加されたマッピングに対応させる。
対応しているプラグインは以下。
* [tpope/vim-surround](https://github.com/tpope/vim-surround)
* [tpope/vim-speeddating](https://github.com/tpope/vim-speeddating)
* [tpope/vim-unimpaired](https://github.com/tpope/vim-unimpaired)
* [svermeulen/vim-easyclip](https://github.com/svermeulen/vim-easyclip)
* [glts/vim-radical](https://github.com/glts/vim-radical)

上記以外も以下で追加できる？？？
```vim
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
```

#### [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
コメントアウトマッピングを追加する
| command             | effect                                  |
| ------------------- | --------------------------------------- |
| `gcc`               | 行をコメントをトグル                    |
| `gcip`              | `ip` をコメントをトグル                 |
| `:7,17Commentary`   | 7〜17行目をコメントをトグル             |
| `:g/TODO/Commentar` | `TODO` にマッチした行をコメントをトグル |
| `gcgc`              | 行をアンコメント                        |

```vim
" 未対応の言語でコメントのフォーマットを追加
autocmd FileType apache setlocal commentstring=#\ %s
```

#### [Shougo/deoplete.nvim](https://github.com/Shougo/deoplete.nvim)(neovim で使用中)
> vim では以下が必要
> * `has("python3") == 1`
> ** `0` の時は `pip3 install --user pynvim` を実行
> * [roxma/nvim-yarp](https://github.com/roxma/nvim-yarp)
> * [roxma/vim-hug-neovim-rpc](https://github.com/roxma/vim-hug-neovim-rpc)
上の条件を満たしているはずなのになぜかエラーが出た。
解決できなかったので vim では、とりあえず、 neocomplete.vim を使用することにした。(2019\*\*\*\*)

nvim で has('python3') == 0 の場合はインストール。
```zsh
# zsh
pip install neovim
# pip3 install neovim
```
上記で python3 を使えるようにしたら以下で deoplete.nvim をアップデート。
```vim
" nvim
:UpdateRemotePlugins
:q
```

deoplete.nvim を使用可能にする。
```
let g:deoplete#enable_at_startup = 1
```

### [Shougo/neosnippet.vim](https://github.com/Shougo/neosnippet.vim)(neovim で使用中)
スニペット。deoplete と連携中。

#### [Shougo/neocomplete.vim](https://github.com/Shougo/neocomplete.vim)(vim で使用中)
([Shougo/deoplete](https://github.com/Shougo/deoplete.nvim)に移行したい。neovim は移行済み。)


#### [SirVer/ultisnips](https://github.com/SirVer/ultisnips)(vim で使用中)
スニペット。deoplete との連携中。neocomplete では代わりに neosnippet.vim を使用している。(deoplete.vim でも neosnippet.vim が使えるかもしれない。)
```
" スニペット展開するときのキー
let g:UltiSnipsExpandTrigger="<tab>"
" 前の編集箇所にジャンプするときのキー
let g:UltiSnipsJumpForwardTrigger="<c-b>"
" 後ろの編集箇所にジャンプするときのキー
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" 独自のスニペットを定義する
:UltiSnipsEdit
" :UltiSnipsEdit を使用する時の画面分割方法
let g:UltiSnipsEditSplit="vertical"
```

#### [honza/vim-snippets](https://github.com/honza/vim-snippets)(vim で使用中)

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
linter で解析。

nvim で `ale_sign_error` や `ale_sign_warning` に全角文字を設定すると、エディタ部分の表示が左にずれる。signcolumn が全角文字に対応していないのかもしれない。
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

" ale の有効無効のトグル
:ALEToggle

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
