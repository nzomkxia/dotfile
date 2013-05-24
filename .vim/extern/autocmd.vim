function! LoadTemplate(extension)
    silent! :execute '0r $HOME/.vim/templates/'. a:extension. '.tpl'
    silent! execute 'source $HOME/.vim/templates/'.a:extension.'.abbr'
endfunction
function! LoadAbbr(extension)
    silent! execute 'source $HOME/.vim/templates/'.a:extension.'.abbr'
endfunction
if has("autocmd")
    " Load templates only when the file is NEW
    au BufNewFile * silent! call LoadTemplate('%:e')
    " Load abbreviation once one file is open via its extention
    au BufRead * silent! call LoadAbbr('%:e')
    map <C-j> <esc>/<^<cr>v/\^>/e<cr><C-g>
    imap <C-j> <esc>/<^<cr>v/\^>/e<cr><C-g>
    map <C-k> <esc>?<^<cr>v/\^>/e<cr><C-g>
    imap <C-k> <esc>?<^<cr>v/\^>/e<cr><C-g>
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
    " Automatically chmod +x Shell and Python scripts
    au BufWritePost *.sh silent! !chmod +x %
    au BufWritePost *.py silent! !chmod +x %
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    " Remove the space ending the lines when Write the Buffer
    au BufWrite * silent! :%s/[[:space:]]\+$//g
    au BufRead,BufNewFile Makefile silent! :set noexpandtab
endif
