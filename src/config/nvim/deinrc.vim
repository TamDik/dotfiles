if &runtimepath !~# '/dein.vim'
  let s:dein_vim_path = expand('~/repos/github.com/Shougo/dein.vim')
  if !isdirectory(s:dein_vim_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_vim_path
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_vim_path, ':p')
endif

let s:dein_repo_path = expand('~/repos/dein.vim')
let s:dein_cache_path = expand('~/.cache/dein')

if !dein#load_state(s:dein_repo_path)
  finish
endif

let g:dein#install_check_diff = v:false
" let g:dein#auto_recache = !has('win32')
let g:dein#cache_directory = s:dein_cache_path
call dein#begin(s:dein_repo_path)
call dein#load_toml(expand('~/.config/nvim/dein.toml'), {'lazy': 0})
 call dein#load_toml(expand('~/.config/nvim/dein_lazy.toml'), {'lazy': 1})
" call dein#load_toml(expand('~/.config/nvim/dein_ft.toml'), {'lazy': 0})
call dein#end()
call dein#save_state()

if dein#check_install()
  call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

augroup DeinPostSourceHook
  autocmd!
  autocmd VimEnter * call dein#call_hook('post_source')
augroup END

colorscheme nightfox
