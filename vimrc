
" Install Pathogen so we can load other plugins from the ~/.vim/bundle
" directory
execute pathogen#infect()

" Standard options for Vim
" Turn on syntax highlighting, plugins for filetypes, replace tabs with 4
" spaces, show the current character position (ruler), and highlight the
" current search matches

set guifont=Anonymous\ Pro:h24
syntax on
filetype plugin indent on
set nu
syntax on
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set ruler
set hlsearch
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class

au BufNewFile,BufRead *.pyt set filetype=python

" Highlight whitespace at the ends of lines.
" Whitespace after backslashes breaks line continuation
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


"Better highlighting
highlight Search cterm=NONE ctermfg=grey ctermbg=blue


" Function Key bindings

" F1 - help

" F2 - paste in code
set pastetoggle=<F2>

" F3 - execute the current file as a script
nnoremap <F3> :!chmod +x %; %:p<CR>

" F4 - activate the NERDTree file explorer
map <F4> :NERDTreeToggle<CR>

" F5 unbound
" F6 unbound
" F7 - Flake8

" F8  - tag list explorer for the current file
nmap <F8> :TagbarToggle<CR>

" F9 Fix behave generated step_impls
nmap <F9> :%s/step_impl\d*/step_impl@@/g<CR>:%Inc i1 s1 p@@<CR>
" F10 unbound

nmap <F6> :!autopep8 --max-line-length 160 -i %<CR>

" F11 unbound
" F12 unbound


let mapleader = ","
nmap <silent> <leader>d <Plug>DashSearch

set tags=./tags,tags;

"autocmd BufEnter * silent! lcd %:p:h

au BufRead,BufNewFile *.pyde setfiletype python
au BufRead,BufNewFile *.pyt setfiletype python
au BufRead,BufNewFile *.template setfiletype jinja
au BufRead,BufNewFile *.tmpl setfiletype mako
au BufRead,BufNewFile *.jst setfiletype javascript
nnoremap <leader>p :setfiletype python<cr>
nnoremap <leader>j :setfiletype jinja<cr>
nnoremap <leader>m :setfiletype mako<cr>
nnoremap <leader>r :setfiletype ruby<cr>
nnoremap <leader>h :setfiletype html<cr>
set foldmethod=indent
set foldlevelstart=20
