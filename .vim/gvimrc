scriptencoding utf-8
set guioptions-=T     " don't show toolbars
set guioptions-=m     " don't show menubar

if has('mac')
  set guifont=DejaVu\ Sans\ Mono:h13,Menlo:h14
  set guifontwide=Ricty:h15,Migu\ 2M:h14
elseif has('win32') || has('win64')
  " bitmap fonts
  set guifont=Tamsyn8x16:h16,MS_Gothic:h11 ",BDF\ UM+\ OUTLINE:h10,BDF\ UM+:h9
  set guifontwide=MS_Gothic:h11
  " anti-aliased fonts
  "set guifont=Source\ Code\ Pro:h10.5,Consolas:h10.5,MS_Gothic:h11
  "set guifontwide=Migu\ 2M:h11,MS_Gothic:h11
  "set renderoptions=type:directx,renmode:5,gamma:1.9
  set linespace=0
  set showtabline=2
  " fix mojibake on the menu bar
  " http://kaworu.jpn.org/kaworu/2013-05-08-1.php
  "source $VIMRUNTIME/delmenu.vim
  "set langmenu=ja_jp.utf-8
  "source $VIMRUNTIME/menu.vim

  set iminsert=0
  " keep IM-control (on insert mode) disabled
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

set statusline=%<[%n]%m%r%h%w\ %F
set statusline+=%=  " left-right boundary
set statusline+=%{fugitive#statusline()}  " Git branch name
set statusline+=\ \ %1l/%L,%c%V\ %{(&fenc!=''?&fenc:&enc).':'.&ff}\ 0x%04B\ %y\ \ %P

" save the size and position of the window on exit
" http://vim-jp.org/vim-users-jp/2010/01/28/Hack-120.html
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
if has('vim_starting') && filereadable(g:save_window_file)
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

set background=dark
silent! colorscheme desert
silent! colorscheme hybrid
highlight SpecialKey guifg=DarkGreen

" load machine-local settings
if filereadable(expand($HOME.'/.gvimrc_local')) | source $HOME/.gvimrc_local | endif
if filereadable(expand($HOME.'/_gvimrc_local')) | source $HOME/_gvimrc_local | endif
