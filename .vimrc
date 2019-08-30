" Colors
syntax enable           " Use syntax highlighting

" Tabs & Spacing
set autoindent          " Automatic indentation
set smartindent         " Be smarter about indentation
set smarttab            " Better backspace with space indents
set shiftwidth=2        " Each level of indentation is two spaces
set tabstop=2           " Number of visual spaces per TAB
set softtabstop=2       " Number of spaces in a TAB during edit
set expandtab           " Spaces are used in place of tabs
set backspace=indent,eol,start  " Allow backsapce over indent, linebrake, and start insert action

" UI Config
set number              " Show line numbers
set showcmd             " Show command in bottomr bar
set showmode            " Show mode in bottom bar
set cursorline          " Highlight current line
filetype indent on      " Load filetype-specific indent files
set wildmenu            " Graphical autocomplet for command menu
set lazyredraw          " Only redraw when needed
set showmatch           " Highlight matching brackets
set autoread            " Reload files changed outside vim
set nostartofline       " Stops always going to beginning of line

" Searching
set incsearch           " Search as characters are entered
set hlsearch            " Highlight matchesi
set ignorecase          " Ignores case when searching
set smartcase           " Don't ignore case if it starts with capital
" Clear search highlights with \<space>
nnoremap <leader><space>  :nohlsearch<CR>


