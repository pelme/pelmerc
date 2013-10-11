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
    set colorcolumn=80
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

map <leader>u :wa<cr>:!clear;<test_cmd>
map <leader>t :NERDTreeToggle<cr>
" Prevent Vim from clobbering the scrollback buffer. See
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
endif
" vimrc editing helpers
map <leader>v :sp ~/.vimrc<cr> " edit my .vimrc file in a split
map <leader>e :e ~/.vimrc<cr>      " edit my .vimrc file
map <leader>u :source ~/.vimrc<cr> " update the system settings from my vimrc file

" Viewport Controls
" ie moving between split panes
map <silent>,h <C-w>h 
map <silent>,j <C-w>j
map <silent>,k <C-w>k
map <silent>,l <C-w>l




syntax on                 " syntax highlighing
set background=dark   " adapt colors for background
colorscheme molokai
