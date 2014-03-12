call pathogen#infect()

set nocompatible    " use vim defaults

" look/feel
set laststatus=2    " allways show status line
set hidden          " allow hidden buffers
set showcmd         " display incomplete commands
set number          " show line numbers
set numberwidth=4   " line numbering takes up 5 spaces
set title           " show title in console title bar
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.png,*.jpg,*.gif,*.DS_Store,*.egg-info/**,*.db,**/_build/**,**/external/**,**/CACHE/**,**/node_modules/**,**/bower_components/**,**/build/**,*.tar.gz,*.tar.bz2,**/venv/**,**/.tox/**
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" tabs/spaces
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=3     " keep 3 lines context when scrolling

if exists('+colorcolumn')
    set colorcolumn=100
endif

" searching
" make searches case-sensitive only if they contain upper-case characters
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ignorecase

" backup/saving
set nobackup        " do not keep a backup file

" allow modelines
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines

filetype plugin indent on " turn on the indent plugins

set noautoindent    " turn off by default, enable for specific filetypes
set nosmartindent   " turn off by default, enable for specific filetypes
set nocindent       " turn off by default, enable for specific filetypes

let mapleader = ","

set expandtab       " tabs are converted to spaces
set sm              " show matching braces, somewhat annoying...
set noswapfile      " make vim work with watchdog
set nowritebackup
set vb              " disable annoying audible bell in macvim

" Prevent Vim from clobbering the scrollback buffer. See
"
" " http://www.shallowsky.com/linux/noaltscreen.html
"set t_ti= t_te=
"
" remove ALL auto-commands so there are no dupes
autocmd!

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back

    au FileType cpp,c,java,sh,pl,php,py,asp  set autoindent
    au FileType cpp,c,java,sh,pl,php,py,asp  set smartindent
    au FileType cpp,c,java,sh,pl,php,py,asp  set cindent
    au FileType py set foldmethod=indent
    au FileType py set textwidth=99  " PEP-8 friendly
    au FileType py inoremap # X#
    au FileType py set expandtab
    au FileType py set omnifunc=pythoncomplete#Complete

    let g:syntastic_python_checkers=['flake8', 'pyflakes']
    let g:syntastic_python_flake8_args="--ignore=E501,E241"
    let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': [] }
    let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute "]
endif

" shortcuts
nnoremap ; :
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <silent> <leader>/ :nohlsearch<cr>
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "bottom"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#usages_command = ""

noremap <leader>jg :call jedi#goto_assignments()<cr>
noremap <leader>jd :call jedi#goto_definitions()<cr>
noremap <leader>jn :call jedi#usages()<cr>


" vimrc editing helpers
map <leader>e :e ~/.vimrc<cr>      " edit my .vimrc file
map <leader>u :source ~/.vimrc<cr> " update the system settings from my vimrc file

" make it possible to easily create new files in the same directories as
" existing files
cabbr <expr> %% expand('%:p:h')

nmap <leader>t :CtrlP<cr>
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>f :CtrlPClearAllCaches<cr>

nnoremap <leader>a :Ack<space>

" buffer management
nmap <leader>l :ls<cr>
nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader><leader> :b#<cr>

nnoremap <C-Left> :vertical resize -3<cr>
nnoremap <C-Down> :resize +3<cr>
nnoremap <C-Up> :resize -3<cr>
nnoremap <C-Right> :vertical resize +3<cr>
nnoremap <leader>v :vertical size 105<cr>

nnoremap <silent> <leader>h :TmuxNavigateLeft<cr>
nnoremap <silent> <leader>j :TmuxNavigateDown<cr>
nnoremap <silent> <leader>k :TmuxNavigateUp<cr>
nnoremap <silent> <leader>l :TmuxNavigateRight<cr>

nnoremap <silent> <space> :AV<cr>


" 'stamp' the word under the cursor
nnoremap S diw"0P

" better show available buffers when pressing tab on :b
set wildchar=<Tab> wildmenu wildmode=full

set splitright

" Move between splits with ctrl+[hjkl]
let g:tmux_navigator_no_mappings = 0

syntax on                 " syntax highlighing
match Todo /\s\+$/
set background=light   " adapt colors for background
set guifont=Source\ Code\ Pro:h14
" remove scrollbars and toolbars
set guioptions-=T
set guioptions-=L
set guioptions-=r

colorscheme lucius
let g:lucius_style='light'
let g:lucius_contrast='normal'
let g:lucius_contrast_bg='high'

set t_Co=256

" force putty to use colors
if &term =~ "xterm"
  "256 color --
  let &t_Co=256
  if has("terminfo")
    let &t_Sf="\ESC[3%p1%dm"
    let &t_Sb="\ESC[4%p1%dm"
  else
    let &t_Sf="\ESC[3%dm"
    let &t_Sb="\ESC[4%dm"
  endif
endif

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
