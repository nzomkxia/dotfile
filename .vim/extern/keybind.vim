" escape for <ESC>
imap jj <esc>
" ' for `
map ' `
" save the file
" map <leader>w :w<cr>
map ,w :w<cr>
" quit
map ,q :q<cr>
" save and quit
map ,z ZZ
" yank from current line to the EOF
map ,yy "+yG
" paste from clipboard
map ,p "+p
" do substitution globally
map ,s :%s/
" do substitution in current line
map zs :s/
" roll up half screen
"map <tab> <C-u>
" roll down half screen
"map <space> <C-d>
" open the Calendar
map <F4> :Calendar<cr>
" open the NERDTree
map <F10> :NERDTree<cr>
" insert a \n
map ,<cr> i<cr><esc>
" Edit .vimrc
map ,,, :tabnew $HOME/.vimrc<cr>
" toggle btw. windows
map <C-H> <C-w>h
map <C-L> <C-w>l
" tabs operations
map tn :tabNext<CR>
map tp :tabprevious<CR>
map tc :tabclose<CR>
map tm :tabmove<CR>
map tf :tabfirst<CR>
map tl :tablast<CR>
"map gf :tabnew <cfile><cr>
