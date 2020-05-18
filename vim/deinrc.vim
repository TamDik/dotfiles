" dein

if &runtimepath !~# '/dein.vim'
  let s:dein_vim_path = expand('~/repos/github.com/Shougo/dein.vim')
  if !isdirectory(s:dein_vim_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_vim_path
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_vim_path, ':p')
endif

function! s:load_dein_toml(filename, ...)
  if !filereadable(a:filename)
    echo 'File Not Found : ' . a:filename
    return
  endif
  let lazy = get(a:000, 0, 0)
  call dein#load_toml(a:filename, {'lazy': lazy})
endfunction

let s:dein_repo_path = expand('~/repos/dein.vim')
if has('nvim')
  let s:dein_cache_path = expand('~/.cache/dein/nvim')
else
  let s:dein_cache_path = expand('~/.cache/dein/vim')
endif

if !dein#load_state(s:dein_repo_path)
  finish
endif

let g:dein#cache_directory = s:dein_cache_path
call dein#begin(s:dein_repo_path)
if has('nvim')
  call s:load_dein_toml(g:NVIM_ROOT . '/dein_nvim.toml')
else
  call s:load_dein_toml(g:VIM_ROOT . '/neocomplete.toml')
endif

call s:load_dein_toml(g:VIM_ROOT . '/dein.toml')
call s:load_dein_toml(g:VIM_ROOT . '/dein_lazy.toml', 1)
call dein#end()
call dein#save_state()

if dein#check_install()
  call dein#install()
endif

" let s:removed_plugins = dein#check_clean()
" if len(s:removed_plugins) > 0
"   call map(s:removed_plugins, "delete(v:val, 'rf')")
"   call dein#recache_runtimepath()
" endif
