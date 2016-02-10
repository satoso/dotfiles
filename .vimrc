"----- Initialize things -----

" skip everything if vim-tiny or vim-small
if !1 | finish | endif

" 'set encoding' and then 'scriptencoding'
" http://rbtnn.hateblo.jp/entry/2014/12/28/010913
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932
set fileformats=unix,dos,mac

if !has('gui_running') | set t_Co=256 | endif

if isdirectory($HOME.'/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME.'\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
endif

"----- NeoBundle -----

if has('vim_starting')
  set runtimepath+=$MY_VIMRUNTIME/bundle/neobundle.vim/
endif

call neobundle#begin(expand($MY_VIMRUNTIME.'/bundle/'))
  " Let NeoBundle manage NeoBundle
  NeoBundleFetch 'Shougo/neobundle.vim'

  " My Bundles here:
  " Note: Do not set neobundle setting in .gvimrc!
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'vim-jp/autofmt'
  NeoBundle 'h1mesuke/vim-alignta'
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'justinmk/vim-dirvish'

  " syntax
  NeoBundle 'slim-template/vim-slim'
  NeoBundle 'othree/html5.vim'
  NeoBundle 'hail2u/vim-css3-syntax'
  NeoBundle 'rcmdnk/vim-markdown'
  NeoBundle 'derekwyatt/vim-scala'
  NeoBundle 'PProvost/vim-ps1'

  " color scheme
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'w0ng/vim-hybrid'
  NeoBundle 'chriskempson/vim-tomorrow-theme'
  NeoBundle 'cocopon/iceberg.vim'
  NeoBundle 'chriskempson/base16-vim'
call neobundle#end()

filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them:
NeoBundleCheck

"----- plugin settings -----

if neobundle#tap('ctrlp.vim')
  let g:ctrlp_cmd = 'CtrlPMRU'
  let g:ctrlp_show_hidden = 1
  let s:ignore_dir = '\.git|\.hg|\.svn|_darcs|\.bzr|\.Trash|\.rbenv|\.pyenv|Library|Applications|Music|vendor/bundle|AppData'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](' . s:ignore_dir . ')$',
    \ 'file': '\v\.(exe|so|dll|jpg)$',
    \ }
  " if mattn/files exists
  if getftype(expand('~/bin/files')) == 'file'
    let g:ctrlp_user_command = '~/bin/files -i ''^(' . s:ignore_dir . ')$'' -p %s'
  endif
endif

if neobundle#tap('vim-markdown')
  let g:vim_markdown_folding_disabled = 1
endif

if neobundle#tap('vim-dirvish')
  augroup dirvish-events
    autocmd!
    " t: open in new tab
    autocmd FileType dirvish nnoremap <buffer> t
        \ :tabnew <C-R>=fnameescape(getline('.'))<CR><CR>
  augroup END
  let g:dirvish_relative_paths = 1
  nnoremap ,f :<C-u>Dirvish %:p:h<CR>
endif

"----- various other settings -----

syntax on
set number    " show line numbers
set wrap
set display=lastline    " wholly show a long line

set list    " show invisible chars
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:%  ",eol:↲

" tabs
" http://peacepipe.toshiville.com/2006/05/vimrc-vim.html
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=2

set scrolloff=5    " line margin while scrolling

if isdirectory(expand($HOME.'/.vimbackup'))
  set backupdir=$HOME/.vimbackup
endif

if has('persistent_undo') && isdirectory(expand($HOME.'/.vimundo'))
  set undodir=$HOME/.vimundo
  set undofile
else
  set noundofile
endif

" move cursor as displayed (<C-n>,<C-p> instead for movement between physical lines)
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap ,b :<C-u>ls<CR>:buf 
" http://yuzuemon.hatenablog.com/entry/20110304/1299199079
inoremap <c-h> <LEFT>
inoremap <c-j> <DOWN>
inoremap <c-k> <UP>
inoremap <c-l> <Right>
" very magic - get rid of vim's obscure regexp
nnoremap /  /\v

if has('win32') || has('win32unix') || has('win64')
  nnoremap <C-F4> :<C-u>tabclose<CR>
  nnoremap <C-n> :<C-u>tabnew<CR>
  " http://stackoverflow.com/questions/94382/vim-with-powershell
  set shell=powershell.exe
  set shellcmdflag=-Command
  set shellquote=\"
  set shellxquote=
endif

" don't fold a line automatically (this will overwrite default 'textwidth' setting)
" http://d.hatena.ne.jp/WK6/20120606/1338993826
augroup dontfold
  autocmd!
  autocmd FileType text setlocal textwidth=0
augroup END

" .md as markdown, instead of modula2
" http://rcmdnk.github.io/blog/2013/11/17/computer-vim/
augroup md-extension
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} setlocal filetype=markdown
augroup END

" load machine-local settings
if filereadable(expand($HOME.'/.vimrc_local'))
  source $HOME/.vimrc_local
endif
if filereadable(expand($HOME.'/_vimrc_local'))
  source $HOME/_vimrc_local
endif

" load directory-local settings
" http://vim-jp.org/vim-users-jp/2009/12/27/Hack-112.html
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END
function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

" REMARKS
" - :<C-u>...  deletes range specification vim inserts
