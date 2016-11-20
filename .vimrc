" prereqs:
" - vim-plug installed (see: https://github.com/junegunn/vim-plug )

" skip everything if vim-tiny or vim-small
if !1 | finish | endif

" 'set encoding' and then 'scriptencoding'
" http://rbtnn.hateblo.jp/entry/2014/12/28/010913
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932
set fileformats=unix,dos,mac

if !has('gui_running') | set t_Co=256 | endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'vim-jp/autofmt'
Plug 'h1mesuke/vim-alignta'
Plug 'justinmk/vim-dirvish'

" syntax
Plug 'slim-template/vim-slim'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'rcmdnk/vim-markdown'
Plug 'derekwyatt/vim-scala'
Plug 'PProvost/vim-ps1'

" color scheme
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'cocopon/iceberg.vim'
call plug#end()

" for vim-markdown
let g:vim_markdown_folding_disabled = 1

" for dirvish
augroup dirvish-events
  autocmd!
  " t: open in new tab
  autocmd FileType dirvish nnoremap <buffer> t
      \ :tabnew <C-R>=fnameescape(getline('.'))<CR><CR>
augroup END
let g:dirvish_relative_paths = 1
nnoremap ,f :<C-u>Dirvish %:p:h<CR>

set number    " show line numbers
set wrap
set list      " show invisible chars
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:%  ",eol:↲
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

nnoremap ,b :<C-u>ls<CR>:buf 
" move cursor as displayed (<C-n>,<C-p> instead for movement between physical lines)
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" http://yuzuemon.hatenablog.com/entry/20110304/1299199079
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
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
if filereadable(expand($HOME.'/.vimrc_local')) | source $HOME/.vimrc_local | endif
if filereadable(expand($HOME.'/_vimrc_local')) | source $HOME/_vimrc_local | endif
