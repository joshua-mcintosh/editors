" ----------------------------------------------------------------------------
" Stephen Tudor's vimrc
" https://github.com/smt/dotfiles/blob/master/vim/vim.symlink/vimrc.symlink
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Include local vim config
" ----------------------------------------------------------------------------

if filereadable(expand("~/.vimrc_local"))
    source ~/.vimrc_local
end
source ~/.vim/settings/general.vim
source ~/.vim/settings/bundles.vim
source ~/.vim/settings/appearance.vim
source ~/.vim/settings/editing.vim
source ~/.vim/settings/mappings.vim
source ~/.vim/settings/autocmd.vim
source ~/.vim/settings/gui.vim
source ~/.vim/settings/tagbar.vim

" ----------------------------------------------------------------------------
" Plugin Settings
" ----------------------------------------------------------------------------

" runtime macros/matchit.vim      " Load the matchit plugin

for f in split(glob('~/.vim/settings/plugin/*.vim'), '\n')
    exe 'source' f
endfor

" ----------------------------------------------------------------------------
" for powerline
" ----------------------------------------------------------------------------
let g:Powerline_symbols = 'fancy'



