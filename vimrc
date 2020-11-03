set t_u7=
" Comments in Vimscript start with a `"`.
" Some inspirations
" https://github.com/jvns/vimconfig/blob/master/vimrc

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Enable ctrl-p plug-in
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Enable vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin()

" Enable polyglot
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" Enable vimripgrep
" https://github.com/jremmen/vim-ripgrep
" Disabled 2020-10-25 because Ack is still more featured
" Plug 'jremmen/vim-ripgrep'

" Enable ack.vim
" https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'

call plug#end()

" Turn on syntax highlighting.
syntax on

" Map ctrl-o to ripgrep
map <C-o> :Ack! 

" Enable ag over ack
" https://github.com/ggreer/the_silver_searcher
" Commented out on 2020-10-25 in favour of rg (ripgrep)
" if executable('ag')
" 	let g:ackprg = 'ag --nogroup --nocolor --column'
" 	" other option
" 	" let g:ackprg = 'ag --vimgrep'
" endif

" https://www.freecodecamp.org/news/how-to-search-project-wide-vim-ripgrep-ack/
" Use ripgrep for searching
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
if executable('rg')
	let g:ackprg = 'rg --vimgrep --no-heading --smart-case'
endif

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
" 2020-10-25 Still not entirely sure what this does
" cnoreabbrev Ack Ack!

" Enable rg (ripgrep) for ctrlp
" https://www.philipbradley.net/posts/2017-03-29-ripgrep-with-ctrlp-and-vim/
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_switch_buffer = 'et'
endif

" Enable theme solarized
" https://github.com/lifepillar/vim-solarized8
set background=dark
colorscheme solarized8

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" hi PythonVenvColor guifg=NavyBlue guibg=Grey ctermbg=16 ctermfg=17

" git branch in statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

function! PythonVenv()
  return system("basename $VIRTUAL_ENV 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineVenv()
  let l:venvname = PythonVenv()
  if strlen(l:venvname) > 0
    let l:venvname = "(" . l:venvname . ")"
  endif
  return strlen(l:venvname) > 0?'  '.l:venvname.' ':''
endfunction

" 2020-11-02 TR Calling the functions in the statusline caused some really
" odd issues with characters appearing on the screen e.g. j and k motion chars
let g:pyvenvname = StatuslineVenv()
let g:gitbranchname = StatuslineGit()

" build up the statusline
set statusline=
set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
set statusline+=%{gitbranchname}
set statusline+=%#CursorColumns#
" set statusline+=%{StatuslineVenv()}
set statusline+=%{g:pyvenvname}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
