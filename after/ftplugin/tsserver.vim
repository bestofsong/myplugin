" javascript使用coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
nmap <silent> <leader>el :CocDiagnostics<CR>

" GoTo code navigation.
nmap <silent> <leader>] <Plug>(coc-definition)
nmap <silent> <leader>\ <Plug>(coc-type-definition)
" nmap <silent> <leader>0 <Plug>(coc-implementation)
nmap <silent> <leader>r <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" nnoremap <leader>] :ALEGoToDefinition<CR>
" nnoremap <leader>\ :ALEGoToDefinitionInVSplit<CR>
" nnoremap <leader>rf :ALEFindReferences<CR>
" nnoremap <leader>hv :ALEHover<CR>
" nnoremap <leader>fsm :ALESymbolSearch <cword><CR>
