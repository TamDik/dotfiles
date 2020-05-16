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
