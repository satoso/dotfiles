scriptencoding utf-8

set cursorline        " mark the current line
set cursorcolumn      " mark the current column
set guioptions-=T     " don't show toolbars

if has('mac')
  set guifont=DejaVu\ Sans\ Mono:h14
  set guifontwide=Ricty:h16
  " set guifont=Menlo:h14
  " set guifont=Migu\ 2M:h14
elseif has('win32') || has('win64')
  set guifont=BDF\ UM+\ OUTLINE:h10
  " set guifont=Consolas:h10
  " set guifont=MS_Gothic:h9
  " set guifontwide=Migu\ 2M:h10.5
  " set renderoptions=type:directx,renmode:5,gamma:1.9

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

colorscheme hybrid

" let g:solarized_visibility="low"
" colorscheme solarized
" set background=light

" read local settings
if filereadable(expand($HOME.'/.gvimrc_local'))
  source $HOME/.gvimrc_local
endif
if filereadable(expand($HOME.'/_gvimrc_local'))
  source $HOME/_gvimrc_local
endif
