call pathogen#infect()
"call pathogen#helptags()
set encoding=utf-8
filetype plugin indent on
set nowrap
set guioptions+=b
set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab
set nu
syntax enable
set gfn=Monospace\ 11
set cursorline 
set cc=80
set autochdir
cd %:h

set t_Co=256
color seoul256

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|bin|cache)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$'
  \}
