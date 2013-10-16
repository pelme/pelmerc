call pathogen#infect()

set nocompatible    " use vim defaults

" look/feel
set laststatus=2    " allways show status line
set hidden          " allow hidden buffers
set showcmd         " display incomplete commands
set number          " show line numbers
set numberwidth=4   " line numbering takes up 5 spaces
set title           " show title in console title bar
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]  
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
    au FileType py set textwidth=79  " PEP-8 friendly
    au FileType py inoremap # X#
    au FileType py set expandtab
    au FileType py set omnifunc=pythoncomplete#Complete

    let g:syntastic_python_checkers=['flake8', 'pyflakes']
    let g:syntastic_python_flake8_args="--ignore=E501"
    let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': [] }
    let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute "]
endif

" vimrc editing helpers
map <leader>v :sp ~/.vimrc<cr> " edit my .vimrc file in a split
map <leader>e :e ~/.vimrc<cr>      " edit my .vimrc file
map <leader>u :source ~/.vimrc<cr> " update the system settings from my vimrc file

" make it possible to easily create new files in the same directories as
" existing files
cabbr <expr> %% expand('%:p:h')


" buffer management
nmap <leader>l :ls<cr>
nmap <leader>n :bn<cr>
nmap <leader>p :bp<cr>
" close the current buffer without closing the windows
nmap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader><leader> <c-^>


" split management
map <ESC>[A <C-Up>
map <ESC>[B <C-Down>
map <ESC>[C <C-Right>
map <ESC>[D <C-Left>

nnoremap <C-Left> :vertical resize -4<cr>
nnoremap <C-Down> :resize +4<cr>
nnoremap <C-Up> :resize -4<cr>
nnoremap <C-Right> :vertical resize +4<cr>

" Move between splits with ctrl+[hjkl]
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

syntax on                 " syntax highlighing
match Todo /\s\+$/  
set background=dark   " adapt colors for background
set guifont=Consolas:h17
colorscheme molokai


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
