" book reference: http://learnvimscriptthehardway.stevelosh.com/
" vimdoc: http://vimdoc.sourceforge.net/htmldoc/
" install plug manager
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


" create a list of directories under $VIMHOME/layer
" if directory under layer starts with '_' will not be used.
" http://learnvimscriptthehardway.stevelosh.com/chapters/19.html
let &wig = "_*"  " set wig option to _*
let layers = globpath("~/.vim/layer", "*", 0, 1)
let &wig = ""  " clear wig option

" disable ale autocomplete
let g:ale_completion_enabled = 0

call plug#begin('~/.vim/plugged')
  for l in layers
    " Install vim plugins with 'plug' through package.vim under each directory.
    let s:package = l . '/package.vim'
    if filereadable(s:package)
    " use 'exe' due to s:package is a variable can only be evaluated at runtime.
      exe "source" s:package
    endif

    " add path to runtime path
    let s:after = l . '/after'
    if !empty(glob(s:after))
        " https://stackoverflow.com/a/35617827
        " use 'exe' due to s:after is a variable can only be evaluated at runtime.
        exe "set rtp+=" . s:after
    endif

  endfor
call plug#end()


" Post-processing feature.
" Adding every /after sub-dir into 'runtimepath' aka. 'rtp'
for l in layers
    " Load each layer's config
    let s:config = l . '/config.vim'
    if filereadable(s:config)
        exe "source" s:config
    endif
endfor
