"               _
"              (_)
"    __ ___   ___ _ __ ___  _ __ ___
"   / _` \ \ / / | '_ ` _ \| '__/ __|
"  _ (_| |\ V /| | | | | | | | | (__
" (_)__, | \_/ |_|_| |_| |_|_|  \___|
"    __/ |
"   |___/

"configuration for MacVim
if has('gui_macvim')

    " カラースキーム
    " カスタムカラースキーム -> ~/.vim/colors
    " colorscheme desert
    "
    "let g:solarized_visibility="low"   " colorschemeより前に宣言すること
    "colorscheme solarized
    "set background=light
    "
    " colorscheme wombat
    " colorscheme jellybeans
    colorscheme hybrid
    " colorscheme pyte
    " colorscheme iceberg

    " 透明度
    "set transparency=5
    " ツールバー非表示
    set guioptions-=T
    " フォント設定
    " set guifont=Ricty:h16
    " set guifont=BDF\ UM+\ OUTLINE:h13
    " set guifont=Menlo:h14
    set guifont=DejaVu\ Sans\ Mono:h14
    set guifontwide=Ricty:h16
    " set guifont=Migu\ 2M:h14
    "
    " " http://blog.ruedap.com/entry/20110712/vim_statusline_git_branch_name
    " " ステータスラインの表示
    " set statusline=%<     " 行が長すぎるときに切り詰める位置
    " set statusline+=[%n]  " バッファ番号
    " set statusline+=%m    " %m 修正フラグ
    " set statusline+=%r    " %r 読み込み専用フラグ
    " set statusline+=%h    " %h ヘルプバッファフラグ
    " set statusline+=%w    " %w プレビューウィンドウフラグ
    " set statusline+=\     " 空白スペース
    " "if winwidth(0) >= 130
    "   set statusline+=%F    " バッファ内のファイルのフルパス
    " "else
    " "  set statusline+=%t    " ファイル名のみ
    " "endif
    " set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
    " set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
    " set statusline+=\ \   " 空白スペース2個
    " set statusline+=%1l   " 何行目にカーソルがあるか
    " set statusline+=/
    " set statusline+=%L    " バッファ内の総行数
    " set statusline+=,
    " set statusline+=%c    " 何列目にカーソルがあるか
    " set statusline+=%V    " 画面上の何列目にカーソルがあるか
    " set statusline+=\     " 空白スペース
    " set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
    " set statusline+=[0x%04B]    " カーソル位置の文字のUnicode code point
    " set statusline+=%y    " バッファ内のファイルのタイプ
    " set statusline+=\ \   " 空白スペース2個
    " set statusline+=%P    " ファイル内の何％の位置にあるか

    "set visualbell        " ビープ音の代わりに画面フラッシュ

    set cursorline        " 行を強調表示
    set cursorcolumn      " 列を強調表示

endif

"終了時にウィンドウサイズと位置を保存
" http://vim-users.jp/2010/01/hack120/  
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif

