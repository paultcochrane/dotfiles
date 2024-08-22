" my .vimrc file: Paul Cochrane
" originally from Bram Moolenaar <Bram@vim.org> as part of vim

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

if !has("gui_running")
    " colorscheme elflord
    " colorscheme pablo
    if v:version < 900
        colorscheme ron
    else
        " requires Debian vim-scripts package to be installed
        colorscheme neon
    endif
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup              " keep a backup file
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set softtabstop=4
set shiftwidth=4
set textwidth=76
set scrolloff=10        " always see the top or bottom 10 lines in the window
set number              " use line numbers
set relativenumber      " show line numbers as relative to current
set winheight=40        " focussed windows in splits have this height
set encoding=utf-8

" stop folds from occuring
set nofoldenable

" map the leader key to comma (copied from Gary Bernhardt's .vimrc)
let mapleader=","

" ,f => open file using command-t plugin
" map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
" increase number of files to search for in command-t
" this allows all files to be found in large projects
let g:CommandTMaxFiles=50000
" ignore files under the blib/ and venv/ directories
set wildignore+=blib/**,*/venv*/**,*/node_modules/**,*/coverage/**,*~,data/**,*/htmlcov/**,*/__pycache__/**

" use ctrlp plugin for fuzzy file search
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=10
map <leader>f <c-p>

" Don't use Ex mode, use Q for formatting
map Q gq

execute pathogen#infect()

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" cursor highlighting
set cursorline          " highlight current line
" highlight the background with a dark grey
" used the xterm256 colour chart to work out which number to use:
" https://en.wikipedia.org/wiki/File%3aXterm_256color_chart.svg
highlight CursorLine ctermbg=236 cterm=none

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

    " html files shouldn't use tabs; they should use a 2-space indent
    autocmd BufRead,BufNewFile *.html set expandtab shiftwidth=2 softtabstop=2
    " django template files shouldn't use tabs; they should use a 2-space indent
    autocmd BufRead,BufNewFile *.djt set expandtab shiftwidth=2 softtabstop=2 ft=htmldjango
    " tmpl files are also html files
    autocmd BufRead,BufNewFile *.tmpl set expandtab shiftwidth=2 softtabstop=2 ft=html
    " tt files are also html files
    autocmd BufRead,BufNewFile *.tt set expandtab shiftwidth=2 softtabstop=2 ft=html

    " Haskell files shouldn't use tabs
    autocmd BufRead,BufNewFile *.hs set expandtab shiftwidth=4 softtabstop=4 ft=haskell

    " ruby files shouldn't use tabs; they use a 2-space indent
    autocmd BufRead,BufNewFile *.rb set expandtab shiftwidth=2 softtabstop=2
    autocmd BufRead,BufNewFile *.gemspec set expandtab shiftwidth=2 softtabstop=2
    autocmd BufRead,BufNewFile Vagrantfile set expandtab shiftwidth=2 softtabstop=2

    " This makes sure that .part files are treated as if they were html
    autocmd BufRead,BufNewFile *.part set ft=html

    " recognise .t as being perl files
    autocmd BufRead,BufNewFile *.t set ft=perl expandtab shiftwidth=4 softtabstop=4
    " make perl files use my editing options in absence of other settings
    autocmd BufRead,BufNewFile *.pl set ft=perl expandtab shiftwidth=4 softtabstop=4
    autocmd BufRead,BufNewFile *.pm set ft=perl expandtab shiftwidth=4 softtabstop=4
    " make C files use my editing options in absence of other settings
    autocmd BufRead,BufNewFile *.c set ft=c expandtab shiftwidth=4 softtabstop=4
    " recognise .inc as being Fortran files
    autocmd BufRead,BufNewFile *.i set ft=fortran
    autocmd BufRead,BufNewFile *.inc set ft=fortran
    " recognise .runfile as being ini files
    autocmd BufRead,BufNewFile *.runfile set ft=dosini
    " recognise .cls as being TeX files
    autocmd BufRead,BufNewFile *.cls set ft=tex
    " recognise .md as being MarkDown format
    autocmd BufRead,BufNewFile *.md set ft=markdown expandtab shiftwidth=4 softtabstop=4
    " make sql files use my editing options in absence of other settings
    autocmd BufRead,BufNewFile *.sql set ft=sql expandtab shiftwidth=2 softtabstop=2
    " make javascript files use my editing options in absence of other settings
    autocmd BufRead,BufNewFile *.js set ft=javascript expandtab shiftwidth=4 softtabstop=4
    " make typescript files use my editing options in absence of other settings
    autocmd BufRead,BufNewFile *.ts set ft=typescript expandtab shiftwidth=4 softtabstop=4
    " Jenkinsfiles are Groovy-formatted
    autocmd BufRead,BufNewFile Jenkinsfile set ft=groovy expandtab shiftwidth=4 softtabstop=4
    " recognise any file matching "Dockerfile" as a Dockerfile
    autocmd BufRead,BufNewFile *Dockerfile* set ft=dockerfile expandtab shiftwidth=4 softtabstop=4

else

    set autoindent              " always set autoindenting on

endif " has("autocmd")

let s:extfname = expand("%:e")
if s:extfname ==? "f90"
    let fortran_free_source=1
    unlet! fortran_fixed_source
else
    let fortran_free_source=1
    unlet! fortran_fixed_source
endif

" running make
map <leader>m :call RunMake('')<cr>
map <leader>M :call RunMake('clean')<cr>

function! RunMake(cleanoption)
    if a:cleanoption == 'clean'
        exec ":!make clean && make"
    else
        exec ":!make"
    endif
endfunction

" run the unit"t"ests
map <leader>t :call RunTests()<cr>

function! RunTests()
    let current_filetype = &filetype
    " run Perl5 tests
    if current_filetype == "perl"
        if filereadable("t/harness")
            exec ":!perl t/harness"
        else
            exec ":!prove -lr t"
        endif
    " run Perl6 tests
    elseif current_filetype == "perl6"
        exec ":!PERL6LIB=lib prove --exec=perl6 -r t"
    " run Python tests
    elseif current_filetype == "python"
        exec ":!clear; make test"
    " run Ruby tests
    elseif current_filetype == "ruby"
        exec ":!ruby -Ilib test/test*.rb"
    " run JavaScript tests
    elseif current_filetype == "javascript" || current_filetype == "typescript"
        exec ":!make test"
    endif
endfunction

" run unit tests just for 'T'his file
map <leader>T :call RunTestsForThisFile()<cr>

function! RunTestsForThisFile()
    let file_and_path = expand("%:p")
    let current_filetype = &filetype
    if current_filetype == "perl"
        exec ":!perl -Ilib " . file_and_path
    elseif current_filetype == "perl6"
        exec ":!perl6 -Ilib " . file_and_path
    elseif current_filetype == "python"
        let filename = expand("%:t")
        if match(filename, 'test_.*.py$') != -1
            exec ":!nosetests --rednose %"
        elseif match(filename, '.*.py$') != -1
            :echo filename
            exec ":!find ./ -name test_" . filename . "| xargs nosetests --rednose"
        else
            :echo filename
        endif
    endif
endfunction

" run the 'a'cceptance tests
map <leader>a :call RunAcceptanceTests()<cr>

function! RunAcceptanceTests()
    let current_filetype = &filetype
    if current_filetype == "python"
        " run Python 'behave' tests
        if isdirectory('features/steps')
            exec ":!behave --tags ~@wip"
        elseif isdirectory('features/step_definitions')
            exec ":!pherkin -l -t ~@wip"
        else
            echo "features/steps directory doesn't exist"
        endif
    elseif current_filetype == "javascript"
        exec ":!make accept"
    endif
endfunction

" add vim coda (and if necessary encoding) depending on filetype
function! AddCodaAndEncoding()
    let current_filetype = &filetype
    if current_filetype == "perl"
        :execute "normal! 1GIuse strict;\<CR>use warnings;\<CR>\<CR>"
        normal! Go# vim: expandtab shiftwidth=4
    elseif current_filetype == "perl6"
        :execute "normal! 1GIuse v6;\<CR>\<CR>"
        normal! Go# vim: expandtab shiftwidth=4
    elseif current_filetype == "python"
        :execute "normal! ggI# -*- coding: utf-8 -*-\<CR>\<CR>"
        normal! Go# vim: expandtab shiftwidth=4 softtabstop=4
    elseif current_filetype == "javascript"
        normal! Go// vim: expandtab shiftwidth=4 softtabstop=4
    elseif current_filetype == "sh"
        :execute "normal! ggI#!/bin/bash\<CR>\<CR>"
        normal! Go# vim: expandtab shiftwidth=4 softtabstop=4
    elseif current_filetype == "markdown"
        let markdown_frontmatter = "normal! 1GI---\<CR>title:\<CR>header:\<CR>
          \  teaser: \"\"\<CR>  og_image: \"\"\<CR>categories:\<CR>---\<CR>\<CR>
          \{% include figure \<CR>
          \  image_path=\"/assets/images/\" \<CR>
          \  alt=\"\" \<CR>
          \  caption=\"\" \<CR>
          \  class=\"feature-figure\" \<CR>
          \%}\<CR>\<CR>"

        :execute markdown_frontmatter
    endif
endfunction

map <leader>C :call AddCodaAndEncoding()<cr>

" add pdb set_trace via ,p
nnoremap <leader>p oimport pdb; pdb.set_trace()<cr><esc>

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

" use "par" as the external formatter (aptitude install par)
if filereadable("/usr/bin/par")
    set formatprg=par
endif

" toggle spell checking with ,s
nmap <silent> <leader>s :set spell!<CR>

" swap two words (from
" http://www.reddit.com/r/vim/comments/2772n9/nonprogrammers_your_best_tips_tricks/)
nnoremap <leader>xp dawwP

" indent a paragraph
nnoremap <leader>q gqip

" use New Zealand English and German by default
set spelllang=en_nz,de

" expand %% to path of active buffer (i.e. %:h<Tab>)
" from Practical Vim; Drew Neil
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" extend dot command to visual mode
" from Drew Neil
xnoremap . :norm.<CR>

" multipurpose tab key
" indent if we're at the beginning of a line. else, do completion.
" adapted from Gary Bernhardt's .vimrc
function! InsertTabWrapper()
    let col = col('.') - 1
    " if we're at the start of a line or there is only whitespace up until
    " the column just before the cursor position, add a tab
    if !col || getline('.')[0:col-1] !~ '\w'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" syntastic settings
setlocal omnifunc=necoghc#omnifunc
let g:syntastic_debug = 0
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_javascript_eslint_generic = 1
" let g:syntastic_javascript_eslint_exec = '/bin/ls'
" let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
" let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_rst_checkers = ['Sphinx']

" coverage settings
let g:coverage_json_report_path = 'coverage/jest/coverage-final.json'
let g:coverage_show_uncovered = 1

" map indent the entire file with <leader>I
nnoremap <leader>I gg<C-V>G=

" run `git ci -p`
nnoremap <leader>c :exec "!git ci -p"<CR>

set visualbell

filetype off
set runtimepath+=/home/cochrane/lilypond/usr/share/lilypond/current/vim/
filetype on
set runtimepath^=~/.vim/bundle/ctrlp.vim

" don't indent text inside these environments
let g:tex_noindent_env='document\|verbatim\|lstlisting\|letter'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
let g:airline_symbols.branch = '⭠'

" vim: expandtab shiftwidth=4
