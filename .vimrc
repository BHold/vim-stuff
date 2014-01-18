" enable pathogen
call pathogen#infect()

" enable helptags for command-t
call pathogen#helptags()

" Auto Indent to same level as previos line
set ai

" Automatically indent when adding a curly bracket, etc. (extended via autocmd below)
set smartindent

" Indent 1 tab after any line that starts with 1 of the cinwords if in .py file
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Tabs should be converted to a group of 2 spaces.
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
set expandtab
set smarttab

" Use UTF-8.
set encoding=utf-8

" Show whitespace
" Must be inserted before colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Set color scheme
if has("gui_running")
    set background=light
else
    set background=dark
endif
colorscheme solarized

" Search as you type.
set incsearch

" Ignore case when searching.
set ignorecase

" Show autocomplete menus.
set wildmenu

" Sets F6 to toggle NerdTree
map <F6> :NERDTreeToggle<CR>

" Set default size of window for MacVim
if has("gui_running")
    set lines=94
    set columns=179
endif

" Set font and fontsize for MacVim
set guifont=Menlo:h12

" Sets ctrl + l, h, j, k to switch between splits
noremap <C-l> <C-W><C-J>
noremap <C-h> <C-W><C-H>
noremap <C-k> <C-W><C-K>
noremap <C-l> <C-W><C-L>

" jump between syntastic errors
map <F7> :lprev<CR>
map <F8> :lnext<CR>

" open Ack with Leader-a
map <leader>a :Ack!<Space>

" allows you to copy and paste to outside programs easily
set clipboard=unnamed

" sort function to a key
map <Leader>s :sort i<CR>

" delete buffer shortcut
map <Leader>d :bdelete<Space>

" easier horizontal movement of code blocks
map < <gv
map > >gv

" Show line numbers and length
set number " show line numbers

" show colored column at character 80 for pep8 help
set colorcolumn=80
highlight ColorColumn guibg=#eee8d5

" disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" prevent minibufexplorer from losing undo history
set hid

" settings for JSHint
let g:syntastic_javascript_checker="jshint"
let g:syntastic_javascript_jshint_conf="~/.jshintrc"

" Enter values if ever want to turn off filetypes in syntastic
"let g:syntastic_mode_map={'mode': 'active', 'active_filetypes': [],
"    \ 'passive_filetypes': []}

"ignore line too long and bad visual indent for too long lines in syntastic
"and indent not multiple of 4
let g:syntastic_python_flake8_args='--ignore=E501,E128,E111,E121,E125,E261'

" For syntax highlighting of jinja2
au BufRead,BufNewFile *.j2 set filetype=htmljinja

" Open with a vertical split
if has("gui_running")
  au VimEnter * vsplit
endif

filetype plugin indent on
syntax on

" Delete fugitive buffers after we move to a new active buffer
autocmd BufReadPost fugitive://* set bufhidden=delete
