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

if !has('gui_running')
  set t_Co=256
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

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
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'vim-jp/autofmt'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'gre/play2vim'

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

call neobundle#end()

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" ===  NeoBundle end  ===

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

" md as markdown, instead of modula2
" http://rcmdnk.github.io/blog/2013/11/17/computer-vim/
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

" undofileを作成しない
" http://www.kaoriya.net/blog/2014/03/30/
set noundofile

" set t_Co=256
" syntax on

" ***
" ***  Unite
" ***
call unite#custom#profile('default', 'context', {
 \   'start_insert': 1
 \ })
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,uk :<C-u>Unite bookmark<CR>

" ***
" ***  VimFiler
" ***
" autocmd VimEnter * if !argc() | VimFiler -split | endif
" call vimfiler#custom#profile('default', 'context', {
"   \   'edit_action' : 'tabopen'
"   \ })
" let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = ''  " make dotfiles visible
nnoremap ,f  :<C-u>VimFilerBufferDir -buffer-name=vimfilersplit -find -force-quit -simple -split -winwidth=45<CR>
nnoremap ,F  :<C-u>VimFiler -buffer-name=vimfiler -force-quit -find<CR>

" ***
" ***  VimShell
" ***
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
nnoremap <silent> ,vs :<C-u>VimShellBufferDir<CR>

" ***
" *** lightline.vim
" ***
let g:lightline = {
      \ 'colorscheme': 'normal',
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


" REMARKS
" - :<C-u>... により，Vimが挿入する範囲指定を削除
