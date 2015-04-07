" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" JOSH'S mappings
" ----------------------------------------------------------------------------
" Mappings
"
" Map leader to ;
let mapleader=";"
"
" buffer navigation in normal mode
" http://bit.ly/1CgDcyV
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
nnoremap <leader>wq :bdelete<CR>

"Shortcut for NERDTreeToggle
" (NERDTree -- Love it)
nmap <leader>nt :NERDTreeTabsToggle <CR>

" This replugs the jumpforward feature for
" text wrapped in <+ these +> .
nnoremap <C-E> <Plug>IMAP_JumpForward

" shortcut for sudo editing a file -- PLEASE NOTE, if you have
" a filename with spaces, this doesn't work out. I'll try quoting
" it later :) --JM
cmap w!! %!sudo tee > /dev/null %

"Shortcut for editing .vimrc file in a new tab
nmap <leader>ev :edit $MYVIMRC<cr>

" plugin for keeping track of structured files
nmap <leader>tt :TagbarToggle<CR>

" fold HTML tags
nnoremap <leader>ft Vatzf

" vertical split
nnoremap <leader>v <C-w>v<C-w>

" ----------------------------------------------------------------------------


" Source .vimrc
nmap <Leader>S :so $MYVIMRC<CR>

" Quicker Ex commands
" (commented to preserve default behavior: repetition of `f` searches)
"nnoremap ; :

" Quicker shell commands
" (commented to preserve default behavior: !{motion}{filter})
"nmap ! :!

" Go to last edit location more easily
nnoremap <Leader>. '.

" Fix Y so it behaves like D
nnoremap Y y$

" Remap <f1> to <esc> to accommodate my fat-fingering ways
imap <f1> <esc>
vmap <f1> <esc>


" Sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
" inoremap <Down> <C-o>gj
" inoremap <Up> <C-o>gk

" Unimpaired -- bubble single and multiple lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Press space bar to turn off search highlighting and clear any message displayed
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

" Substitute
nnoremap <Leader>s :%s//g<left><left>

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX files.
function! AppendModeline()
    let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
        \ &tabstop, &shiftwidth, &textwidth)
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    silent! call append(line("$"), l:modeline)
endfunction

nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Uppercase
nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea

" Reflow paragraph with Q in normal and visual mode
nnoremap Q gqap
vnoremap Q gq

" Retab a source file
nmap <Leader>rr :retab!<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>mm mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Toggle whitespace characters
nmap <Leader>l :set list!<CR>

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
nmap <Leader>md :!mkdir -p %:p:h

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Resize vertical windows by hitting plus and minus
nnoremap <silent> + <C-w>+
nnoremap <silent> - <C-w>-

" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-K> <%=   %><Esc>3hi

" create <%= foo %> erb tags using Ctrl-j in edit mode
imap <silent> <C-J> <%  %><Esc>2hi


