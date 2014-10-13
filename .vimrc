"        _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  _ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|

" vi互換にしない
set nocompatible

" ***
" ***  NeoBundle
" ***

if has('vim_starting')
   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
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
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'othree/html5.vim'

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


filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" ***
" ***  NeoBundle end
" ***



" 行番号を表示
set number

" 不可視文字を表示
" http://blog.remora.cx/2011/08/display-invisible-characters-on-vim.html
set list
"set listchars=tab:»\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:%

" タブ
" http://peacepipe.toshiville.com/2006/05/vimrc-vim.html
set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=2

" バックアップの作成先
set backupdir=~/.Trash

" スクロール時の余白確保
set scrolloff=5

" 長い行を自動改行しない
" デフォルトvimrc_exampleのtextwidth設定を上書き
" http://d.hatena.ne.jp/WK6/20120606/1338993826
autocmd FileType text setlocal textwidth=0

" カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
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

" For Unite
"let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200
nnoremap <space>ub  :Unite buffer<CR>
nnoremap <space>uu  :Unite file_mru<CR>
nnoremap <space>uj  :Unite bookmark<CR>
nnoremap <space>uy  :Unite history/yank<CR>

" For VimFiler
"autocmd VimEnter * if !argc() | VimFiler -split | endif
let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = ''  " make dotfiles visible
nnoremap <space>f  :VimFiler -buffer-name=vimfilersplit -find -force-quit -simple -split -toggle -winwidth=45<CR>
nnoremap <space>F  :VimFilerTab -buffer-name=vimfiler -no-quit -find -toggle<CR>

" md as markdown, instead of modula2
" http://rcmdnk.github.io/blog/2013/11/17/computer-vim/
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

" undofileを作成しない
" http://www.kaoriya.net/blog/2014/03/30/
set noundofile

" vimshell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'

"set t_Co=256
"syntax on
"colorscheme hybrid

