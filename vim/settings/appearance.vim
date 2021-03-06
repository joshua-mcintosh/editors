" ----------------------------------------------------------------------------
" Appearance
" ----------------------------------------------------------------------------

set hidden                      " Handle multiple buffers better
set ruler                       " Show cursor position
set showcmd                     " Display incomplete commands
set showmode                    " Display the mode you're in
set lazyredraw                " Don't redraw while executing macros
set number                      " Show line numbers

set printoptions=paper:letter,duplex:long,number:y

set wildmenu                    " Enhanced command line completion: like a shell
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=_build                           " Sphinx build dir
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store
set wildignore+=*CACHE

set cmdheight=2                 " Command line height
set backspace=indent,eol,start  " Intuitive backspacing
set whichwrap+=<,>,h,l,[,]      " Backspace and cursor keys wrap to
set shortmess=aoOtAI            " Shorten messages
set report=0                    " Tell us about changes
set nostartofline               " Don't jump to start of line when scrolling
set scrolloff=5                 " Show 5 lines of context around the cursor

set visualbell                  " No beeping
set title                       " Set the terminal's title
set shellslash                  " Use forward slashes everwhere
set mousehide                   " Hide the mouse pointer while typing

set laststatus=2                " Always show status line
set showtabline=1

set list                        " Show whitespace chars
set listchars=tab:»\ ,eol:¬,trail:·

set showmatch                   " Show matching brackets
set hlsearch                    " Highlight search matches
set incsearch                   " Highlight matches as you type
set ignorecase                  " Case-insensitive searching
set smartcase                   " ...but case-sensitive if expression contains a capital letter
set wrapscan                    " Set the search scan to wrap around the file


syntax enable                   " Turn on syntax highlighting
set synmaxcol=2048              " Syntax coloring too-long lines is slow
let g:load_doxygen_syntax=1
"let g:Powerline_colorscheme="solarized256"
"
set background=dark
set t_Co=256
let base16colorspace=256

color zenburn
let g:airline_theme="zenburn"
let g:airline#extensions#tabline#enabled = 1
