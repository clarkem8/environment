" color scheme
set background=dark
colorscheme gruvbox
set t_Co=256

" lightline config
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" split settings/mappings
set splitbelow
set splitright

" current buffer settings
au BufEnter * setlocal cursorline relativenumber
au BufLeave * setlocal nocursorline number
au WinLeave * setlocal nocursorline number

" misc
set showmatch           " show matching brackets

" search settings
set incsearch           " higlight search as you type
set hlsearch            " higlight all search hits

" tab settings
set autoindent                    " Indent according to previous line.
set expandtab                     " Use spaces instead of tabs.
set tabstop=4                     " Tabs show as 4 spaces
set softtabstop=4                 " Tab key indents by 4 spaces.
set shiftwidth=4                  " indents by 4 spaces.
set shiftround                    " indents to next multiple of 'shiftwidth'.
set backspace=indent,eol,start    " Make backspace work as you would expect.

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set autoindent |
    \ set fileformat=unix |
    \ nnoremap <leader>c <home>i#<down><esc>

" undo settings
set nobackup noswapfile nowritebackup            " disable backup/swap files
set undofile undodir=~/.vim/undo undolevels=9999 " undo options
