" http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean
" http://learnvimscriptthehardway.stevelosh.com/chapters/12.html
" http://learnvimscriptthehardway.stevelosh.com/chapters/02.html
" use ? to see the option value
" use ! to toggle the option value
"
" https://stackoverflow.com/a/12625504
" use ! on function! will replace previous function definition.
" autocmd is about adding commands into a command list, thus it accumulates!

setlocal noexpandtab
setlocal number
command! -bang A call go#alternate#Switch(<bang>0, 'edit')
command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang AS call go#alternate#Switch(<bang>0, 'split')
command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let b:ale_linters = ['golangci-lint']
let b:ale_fixers = ['goimports']
let b:ale_go_golangci_lint_options = '-E nakedret -E prealloc -E maligned
            \ -E goconst -E dupl -E unconvert -E stylecheck -E goimports
            \ -D deadcode -D structcheck'
