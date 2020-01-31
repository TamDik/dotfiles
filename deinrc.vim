" dein

if &runtimepath !~# '/dein.vim'
  let s:dein_vim_path = expand('~/repos/github.com/Shougo/dein.vim')
  if !isdirectory(s:dein_vim_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_vim_path
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_vim_path, ':p')
endif

let s:dein_repo_path = expand('~/repos/dein.vim')
if !dein#load_state(s:dein_repo_path)
  finish
endif

let g:dein#cache_directory = expand('~/.cache/dein')
call dein#begin(s:dein_repo_path)

let s:config_dir  = $DOTFILES . '/vim'
let s:toml        = s:config_dir . '/dein.toml'
let s:lazy_toml   = s:config_dir . '/dein_lazy.toml'
if filereadable(s:toml)
  call dein#load_toml(s:toml,      {'lazy': 0})
endif
if filereadable(s:lazy_toml)
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
endif

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
