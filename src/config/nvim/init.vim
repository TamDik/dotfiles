scriptencoding utf-8
set encoding=utf-8

if &compatible
  set nocompatible
endif

let g:mapleader = "\<Space>"

execute 'source' . expand('~/.config/nvim/optionrc.vim')
execute 'source' . expand('~/.config/nvim/mappingrc.vim')
execute 'source' . expand('~/.config/nvim/deinrc.vim')
execute 'source' . expand('~/.config/nvim/colorrc.vim')

" default plugins
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
