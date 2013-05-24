"===================================================================
" Author:       Dutor@dutor.net.
" Email:        Xdutor@gmail.com
" Last Edited:  Dec 12 2009

"===================================================================

" General {
    " default file encoding
    set encoding=utf-8
    " recognizable encoding
    set fileencodings=utf-8,chinese,ucs-bom
    set ambiwidth=double
    " varied EOLs
    set fileformats=unix,dos,mac
    set fileformat=unix
    set directory=$HOME/.vim/tmp
    " Vim, but not Vi
    set nocompatible
    set tm=333
" }

" Text {
    set isk+=$,#
    set tabstop=4       " numbers of spaces of tab character
    set shiftwidth=4    " numbers of spaces of (auto)indent
    set shiftround
    set scrolloff=1     " keep 1 lines when scrolling
    set incsearch       " do incremental searching
    set ignorecase      " ignore case when searching
    set nobackup        " do not keep a backup file
    set shortmess=atI   " Abbreviate messages
    " Code {
        syntax on       " syntax highlighing
        set autoindent  " always set autoindenting on
        set smartindent " smart indent
        set cindent     " cindent
        set cino=g0     " less indent access specifier e.g. public, private
        set expandtab   " tabs are converted to spaces, use only when required
        set wrap        " don't wrap lines
        set nosm        " do not show matching braces.
        " Fold {
            function! FoldIndent()
                set foldenable
                set foldmethod=indent
                set foldlevel=0
            endfunction

            function! FoldMarker()
                set foldenable
                set foldmarker={,}
                set foldmethod=marker
                set foldlevel=2
            endfunction
        "}
        " Others {
            function! AppendToLastLine()
                exe "normal! d$k$p"
            endfunction
        " }

    " }
" }

" GUI {
    if has("gui_running")
        set guifont=Monospace:\ 12  " use this font
        set lines=30       " height = 50 lines
        set columns=100        " width = 100 columns
        set background=dark   " adapt colors for background
        set guioptions-=m       " remove the menu
        set guioptions-=T       " remove the Toolbar
        set cul                 " set CursorLine
        colorscheme darkblue    " use this color scheme
    else
        colorscheme default    " use this color scheme
        "set background=dark        " adapt colors for background
    endif

" }

" UI/Layout {
    set ls=2            " allways show status line
    set wildmenu        " Turn on wild menu
    set wildmode=full   " Set the completion mode to "full"
    set showcmd         " display incomplete commands in Last Line
    set number          " show line numbers
    set title           " show title in console title bar
    set ttyfast         " smoother changes
    set modeline        " last lines in document sets vim mode
    set modelines=3     " number lines checked for modelines
    set ruler           " show the cursor position all the time
    set novisualbell    " turn off visual bell
    set statusline=%<%F%m%r\ [%Y]\ [ASCII=\%.3b]\ [HEX=0x\%.2B]%=[POS=%l,%v]\ [LEN=%L]\ %p%%
    set whichwrap=b,s,h,l,<,>,[,]   " move freely in files
    hi Comment ctermfg=green
    :hi StatusLine ctermbg=black
    set formatoptions+=mM

" }

" Mappings {
    " [I display all lines containing the current variable.
    " yiw then viwp to replace a second word for the first.
    " C-Y, insert character above, in insert mode.
    "let mapleader=","
    " escape for <ESC>
    inoremap jj <esc>
    " when press ESC without cursor moving
    inoremap <esc> <esc>`^
    inoremap <C-h> <Left>
    inoremap <C-j> <Down>
    inoremap <C-k> <Up>
    inoremap <C-l> <Right>
    " ' for `
    nnoremap ' `
    " save the file
    nnoremap ,w :w<cr>
    " quit
    nnoremap ,q :q<cr>
    " save and quit
    nnoremap ,z ZZ
    " yank to the EOF
    nmap ,yy "+yG
    " yank in Visual Mode
    vmap ,yy "+y
    " paste from clipboard
    nnoremap ,p "+p
    nnoremap ,a "ap
    nnoremap ya "ayy
    " do substitution globally
    nnoremap ,sg :%s/
    " do substitution in current line
    nnoremap ,ss :s/
    " add comment EOL
    nmap ,cl A //~
    " mark curpos, then goto include directives
    nmap ,i mn?#include<cr>o
    " insert Blank Line below without curosr moving
    nmap <cr> m`o<esc>``
    " insert a \n
    nnoremap ,<cr> i<cr><esc>
    " roll up half screen
    noremap <tab> <C-u>
    " roll down half screen
    noremap <space> <C-d>
    " roll down by line without cursor moving
    nmap <c-j> <c-e>j
    " roll up by line without cursor moving
    nmap <c-k> <c-y>k
    " to first char of line
    nmap <c-h> ^
    " to first char of line
    nmap <c-l> $
    " open the Calendar
    nnoremap <F4> :Calendar<cr>
    " Fold with Marker
    nnoremap <F5> :call FoldMarker()<cr>
    " Fold with Indent
    nnoremap <F6> :call FoldIndent()<cr>
    " Capitalize a word
    nmap <F7> guiw~l
    " Uppercase a word or vice.
    inoremap <F8> <esc>g~iwea
    " Uppercase a word or vice.
    nnoremap <F8> g~iw
    " open the NERDTree
    nnoremap <F10> :NERDTree<cr>
    " Edit .vimrc
    nnoremap ,,, :tabnew $HOME/.vimrc<cr>
    " toggle btw. windows
    nnoremap <left> <C-w>h
    nnoremap <right> <C-w>l
    nnoremap <down> <C-w>j
    nnoremap <up> <C-w>k
    nnoremap ,k <C-w>q
    nnoremap ,sp :sp<cr>
    " Tabs operations
    nnoremap tn :tabNext<CR>
    nnoremap tp :tabprevious<CR>
    nnoremap tc :tabclose<CR>
    nnoremap tm :tabmove<CR>
    nnoremap tf :tabfirst<CR>
    nnoremap tl :tablast<CR>
    " For forgeting sudo on RO
    nmap <leader>w :w !sudo tee %<cr>
    imap <leader> \
    map de !!date<cr>

" }
" Autocmds {
    if has("autocmd")
        " nnoremap <C-j> <esc>/<^<cr>v/\^>/e<cr><C-g>
        " inoremap <C-j> <esc>/<^<cr>v/\^>/e<cr><C-g>
        " nnoremap <C-k> <esc>?<^<cr>v/\^>/e<cr><C-g>
        " inoremap <C-k> <esc>?<^<cr>v/\^>/e<cr><C-g>
        " Automatically chmod +x Shell and Python scripts
        au BufWritePost *.{sh,py} silent! !chmod +x %
        au BufWritePost .vimrc silent! :source %
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
        " Keep TABs original in Makefiles
        au Filetype make silent! :set noexpandtab
        " Remove the space ending the lines when Write the Buffer
        au BufWrite * silent! :%s/[[:space:]]\+$//g
    endif
    " Templates {
        " Load templates only when the file is NEW
        au BufNewFile * silent! call LoadTemplate('%:e')
        " Load abbreviation according to Filetype
        au BufRead * silent! call LoadAbbr('%:e')
        function! LoadTemplate(extension)
            silent! :execute '0r $HOME/.vim/templates/'. a:extension. '.tpl'
            silent! execute 'source $HOME/.vim/templates/'.a:extension.'.abbr'
        endfunction
        function! LoadAbbr(extension)
            silent! execute 'source $HOME/.vim/templates/'.a:extension.'.abbr'
        endfunction
    " }
" }
let Tlist_Auto_Open=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
set tags+=/usr/share/cpp_src/tags
set tags+=~/glibc-2.16.0/tags
set tags+=~/leveldb/tags
let g:lisp_rainbow=2

augroup filetype
au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
