" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set softtabstop=4
set shiftwidth=4
set textwidth=76
set scrolloff=10        " always see the top or bottom 10 lines in the window

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

  " This makes sure that .part files are treated as if they were html
  autocmd BufRead,BufNewFile *.part set ft=html
  
else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

:command Svkdiff !svk diff | less

fun! ShowFuncName()
    let lnum = line(".")
    let col = col(".")
    echohl ModeMsg
    echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
    echohl None
    call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR> 

" recognise .t as being perl files
:autocmd BufRead,BufNewFile *.t set ft=perl
" recognise .pmc and .ops as being C files
:autocmd BufRead,BufNewFile *.pmc set ft=c
:autocmd BufRead,BufNewFile *.ops set ft=c

function InsertFunctionStub()
    :execute "normal I//! Brief description of function\n\<Esc>"
    :execute "normal I/*\!\n\<Esc>"
    :execute "normal I* More expansive description of function\n\<Esc>"
    :execute "normal I*\n\<Esc>"
    :execute "normal I* \\param parameter_name description of the parameter\n\<Esc>"
    :execute "normal I*\n\<Esc>"
    :execute "normal I* \\return description of the return value\n\<Esc>"
    :execute "normal I*/\n\<Esc>"
    :execute "normal Ivoid function_name(void parameter_name)\n\<Esc>"
    :execute "normal I{\n\<Esc>"
    :execute "normal I\n\<Esc>"
    :execute "normal I\n\<Esc>"
    :execute "normal I    return;\n\<Esc>"
    :execute "normal I}\n\<Esc>"
endfunction
