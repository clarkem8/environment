" leader mappings
"
let mapleader = " "

" toggle git gutter
nnoremap <leader>g :GitGutterToggle<cr>

" buffers
nnoremap <leader><leader> <c-^>             " Open last buffer.
nnoremap <leader>o :only<cr>
nnoremap <leader>d :echo expand('%')<cr>    " Show the path of the current file
nnoremap <leader>q :quit<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>e :xit<cr>

" goyo mapping
nnoremap <leader>g :Goyo<cr>

" new line stay in normal mode
nnoremap <cr> o<esc>
nnoremap <s-cr> <s-o><esc>

" toggle line numbers
nnoremap <leader>4 :call CycleNumbering()<cr>
" toggle paste
nnoremap <leader>3 :set paste<cr>i

" search and replace
nnoremap <leader>s :%s/\<<c-r><c-w>\>/<c-r><c-w>/g<left><left>

" save and run current file
nnoremap <leader>p :w<cr>:!python %<cr>
nnoremap <leader>q :w<cr>:!q %<cr>

" split settings/mappings
nnoremap <leader>\| :vsp<cr>
nnoremap <leader>\ :vsp<cr>
nnoremap <leader>- :sp<cr>

nnoremap <c-h> <c-w><c-h>   " move left
nnoremap <c-j> <c-w><c-j>   " move down
nnoremap <c-k> <c-w><c-k>   " move up
nnoremap <c-l> <c-w><c-l>   " move right

" edit/src vimrc
nnoremap <leader>q :e ~/.vimrc<cr>
nnoremap <leader>w :source ~/.vimrc<cr>
nnoremap <leader>e :PluginInstall<cr>

" zap whitespace
nnoremap <leader>zz :%s/\s\+$//g<cr>
nnoremap <leader>tt :%s/\t/    /g<cr>
