" ----------------------------------------------------------------------------
" Autocommands
" ----------------------------------------------------------------------------

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on


" Called to create a directory if it doesn't exist.
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction


if has("autocmd")
	" Remember last location in a file
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

	" Save on lose focus
	" au FocusLost * :wa

	" Source .vimrc on save
    au BufWritePost .vimrc source $MYVIMRC

	" Keep splits sized properly
	au VimResized * exe "normal! \<cw>="

	" Syntax of these languages is fussy over tabs vs spaces
	au FileType make	   setlocal ts=4 sts=4 sw=4 noet
	au FileType yaml,haml  setlocal ts=2 sts=2 sw=2 et

	" Whitespace based on house-style (arbitrary)
	au FileType html	   setlocal ts=4 sts=4 sw=4 et
	au FileType css		setlocal ts=4 sts=4 sw=4 et
	au FileType ruby	   setlocal ts=2 sts=2 sw=2 et
	au FileType sass	   setlocal ts=2 sts=2 sw=2 et
	au FileType scss	   setlocal ts=4 sts=4 sw=4 et
	au FileType less	   setlocal ts=4 sts=4 sw=4 et
	au FileType javascript setlocal ts=4 sts=4 sw=4 et
	au FileType xml		setlocal ts=4 sts=4 sw=4 et

    "" Clojure
    au BufNewFile,BufRead *.{cloj,clj} setlocal ft=clojure      " Syntax highlighting for JSON files

	"" JavaScript
	au BufNewFile,BufRead *.{json,htc} setlocal ft=javascript   " Syntax highlighting for JSON files

	"" JSP
	au BufNewFile,BufRead *.jspf setlocal ft=jsp				" Syntax highlighting for JSPF files

	"" Python
	highlight OverLength ctermbg=red ctermfg=white guibg=#592929
        " PEP8 considered harmful at google (well, not harmful, but not the
        " style)
	" au FileType python setlocal ts=4 sts=4 sw=4 et			  " make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
	au FileType python match OverLength /\%79v.\+/

	"" PHP
	au BufNewFile,BufRead *.ctp setlocal ft=php				 " set .ctp files to edit like php for cakePHP

	"" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
	au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} setlocal ft=ruby

	"" Markdown -- markdown, md, mk, mkd, pdk, pandoc, and text are markdown and define buffer-local preview
	au FileType markdown,md,mk,mkd,pdk,pandoc,text nnoremap <buffer> <localleader>1 yypVr=
	au FileType markdown,md,mk,mkd,pdk,pandoc,text nnoremap <buffer> <localleader>2 yypVr-

	"" reStructuredText
	au FileType rst nnoremap <buffer> <localleader>1 yypVr=
	au FileType rst nnoremap <buffer> <localleader>2 yypVr-
	au FileType rst nnoremap <buffer> <localleader>3 yypVr~
	au FileType rst nnoremap <buffer> <localleader>4 yypVr`

	" Generally format text files, but if a long line has been created leave it alone when editing:
	au FileType markdown,md,mk,mkd,pdk,pandoc,rst,text setlocal fo+=tl

	"" Open help files in a vertical split
	au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif


	"-----------------------------------------------------------------------------
	" BY JOSH
	"-----------------------------------------------------------------------------
	"
	" Skeleton files -- Honestly, they need work
	autocmd BufNewFile *.plx TSkeletonSetup perl.pl
	autocmd BufNewFile *.pl TSkeletonSetup perl.pl
	autocmd BufNewFile *.cpp TSkeletonSetup c48.c
	autocmd BufNewFile *.c TSkeletonSetup /home/joshua/.vim/skeletons/c.c
	autocmd BufNewFile *.paper.tex   TSkeletonSetup template.essay.tex
	
	" Read certain files right, please!
	autocmd BufNewFile,BufRead *.page,*.md,*.md.txt set ft=markdown
	autocmd BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger

        augroup BWCCreateDir
          autocmd!
          autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
        augroup END
endif


