let g:ale_completion_enabled = 0
let s:this_file=resolve(expand('<sfile>:p'))
let s:this_dir=fnamemodify(s:this_file, ':p:h')
let s:coc_key_binding=s:this_dir . '/coc-keybindings.vim'
:execute 'source ' . s:coc_key_binding


