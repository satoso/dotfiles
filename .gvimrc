scriptencoding utf-8

" let g:solarized_visibility="low"
" colorscheme solarized
" set background=light

set cursorline        " mark the current line
set cursorcolumn      " mark the current column

if has('mac')

  set guioptions-=T   " don't show toolbars

  set guifont=DejaVu\ Sans\ Mono:h14
  set guifontwide=Ricty:h16
  " set guifont=Menlo:h14
  " set guifont=Migu\ 2M:h14

elseif has('win32') || has('win64')

  set guifont=BDF\ UM+\ OUTLINE:h10
  " set guifont=Consolas:h10
  " set guifont=MS_Gothic:h9

  set showtabline=2

  " fix mojibake on the menu bar
  " http://kaworu.jpn.org/kaworu/2013-05-08-1.php
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_jp.utf-8
  source $VIMRUNTIME/menu.vim

  set iminsert=0
  " keep IM-control (on insert mode) disabled
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

" save the size and position of the window on exit
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

" visible zenkaku-space
" http://vim-jp.org/vim-users-jp/2009/07/12/Hack-40.html
" (must be specified before :colorscheme command)
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

" colorscheme hybrid
" colorscheme wombat
" colorscheme jellybeans
colorscheme iceberg

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
