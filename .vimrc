"""
"""  Initialize things
"""

" skip everything if vim-tiny or vim-small
if !1 | finish | endif

set nocompatible    " no vi-compatible

scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932
set fileformats=unix,dos,mac

if !has('gui_running')
  set t_Co=256
endif

"""
"""  NeoBundle
"""

if has('vim_starting')
  " Required:
  if has('win32') || has('win32unix') || has('win64')
    set runtimepath+=~/vimfiles/bundle/neobundle.vim/
  else
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  end
endif

" Required:
if has('win32') || has('win32unix') || has('win64')
  call neobundle#begin(expand('~/vimfiles/bundle/'))
else
  call neobundle#begin(expand('~/.vim/bundle/'))
end

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'

" My Bundles here:
"
" Note: Do not set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'vim-jp/autofmt'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'cocopon/lightline-hybrid.vim'
NeoBundle 'popkirby/lightline-iceberg'
NeoBundle 'gre/play2vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'PProvost/vim-ps1'

" color scheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'matthewtodd/vim-twilight'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'vim-scripts/oceanlight'
NeoBundle 'vim-scripts/simpleandfriendly.vim'
NeoBundle 'vim-scripts/xoria256.vim'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'sjl/badwolf'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'djjcast/mirodark'
NeoBundle 'vim-scripts/BusyBee'
NeoBundle 'sickill/vim-monokai'

call neobundle#end()

" Required:
filetype plugin indent on

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"""
"""  Unite
"""
" call unite#custom#profile('default', 'context', {
"  \   'start_insert': 1
"  \ })
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200
call unite#custom_default_action('file', 'tabopen')
call unite#custom_default_action('buffer', 'tabopen')
call unite#custom_default_action('source/bookmark/directory', 'vimfiler')
nnoremap <silent> ,uy :<C-u>Unite -start-insert history/yank<CR>
nnoremap <silent> ,,  :<C-u>Unite -start-insert buffer file_mru<CR>
nnoremap <silent> ,ur :<C-u>Unite -start-insert -buffer-name=register register<CR>
"nnoremap <silent> ,uu :<C-u>Unite -start-insert file_mru buffer<CR>
nnoremap <silent> ,uk :<C-u>Unite -start-insert bookmark<CR>

"""
"""  VimFiler
"""
" autocmd VimEnter * if !argc() | VimFiler -split | endif
call vimfiler#custom#profile('default', 'context', {
    \ 'safe' : 0,
    \ })
let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = ''  " make dotfiles visible
"nnoremap ,f  :<C-u>VimFilerBufferDir -buffer-name=vimfilersplit -find -force-quit -simple -split -winwidth=45<CR>
"nnoremap ,F  :<C-u>VimFilerBufferDir -buffer-name=vimfiler -find -force-quit -split<CR>
nnoremap ,f  :<C-u>VimFilerBufferDir -buffer-name=vimfiler -find<CR>

"""
"""  VimShell
"""
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
nnoremap <silent> ,vs :<C-u>VimShellBufferDir<CR>

"""
"""  lightline.vim
"""
let g:lightline = {
      \ 'colorscheme': 'hybrid',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'fugitive', 'readonly', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'charvaluehex', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%04B'
      \ },
      \ 'component_function': {
      \   'fugitive':     'MyFugitive',
      \   'readonly':     'MyReadonly',
      \   'modified':     'MyModified',
      \   'filename':     'MyFilename'
      \ }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "RO"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

"""
"""  various other settings
"""

syntax on
set number    " show line numbers

" invisible chars
" http://blog.remora.cx/2011/08/display-invisible-characters-on-vim.html
set list
if has('win32') || has('win32unix') || has('win64')
  set listchars=tab:>.,trail:-,extends:>,precedes:<,nbsp:%
else
  "set listchars=tab:»\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
  set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:%
endif

" tabs
" http://peacepipe.toshiville.com/2006/05/vimrc-vim.html
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=2

set scrolloff=5    " line margin while scrolling

" backup files
if has('mac')
  set backupdir=~/.Trash
else
  set backupdir=~/.vimbackup
endif

if has('persistent_undo')
  set undodir=~/.vimundo
  set undofile
endif

" move cursor as displayed (<C-n>,<C-p> instead for movement between physical lines)
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" http://yuzuemon.hatenablog.com/entry/20110304/1299199079
inoremap <c-h> <LEFT>
inoremap <c-j> <DOWN>
inoremap <c-k> <UP>
inoremap <c-l> <Right>

" don't fold a line automatically
" (this will overwrite default 'textwidth' setting)
" http://d.hatena.ne.jp/WK6/20120606/1338993826
autocmd FileType text setlocal textwidth=0

" .md as markdown, instead of modula2
" http://rcmdnk.github.io/blog/2013/11/17/computer-vim/
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

if has('win32') || has('win32unix') || has('win64')
  set nowrap

  " open a new tabpage whenever a file is dropped
  " http://vimwiki.net/?tips%2F100
  " autocmd VimEnter * tab all
  " autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'

  nnoremap <C-F4> :<C-u>tabclose<CR>
  nnoremap <C-n> :<C-u>tabnew<CR>
endif

" REMARKS
" - :<C-u>...  deletes range specification vim inserts
