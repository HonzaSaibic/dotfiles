"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"                                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                                           "
"                        \ V /| | | | | | | | | (__                                            "
"                         \_/ |_|_| |_| |_|_|  \___|                                           "
"                                                                                              "
"                                                                                              "
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "VUNDLE
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set nocompatible                                                                               "
filetype off                                                                                   "
set rtp+=~/.vim/bundle/Vundle.vim                                                              "
call vundle#begin()                             " :PluginInstall to install plugins from Vundle
                                                " :PluginClean to clean unwanted plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'luochen1990/rainbow'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-startify'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'hdima/python-syntax'
Plugin 'fisadev/vim-isort'                      " pip install isort
Plugin 'tpope/vim-commentary'
Plugin 'tell-k/vim-autoflake'
Plugin 'editorconfig/editorconfig-vim'          " https://editorconfig.org/ doc.
Plugin 'mbbill/undotree'

Plugin 'davidhalter/jedi-vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'sjl/badwolf'
Plugin 'nanotech/jellybeans.vim'
Plugin 'rubickcz/my-jellybeans.vim'

call vundle#end()                                                                              "
filetype plugin indent on
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "GENERAL SETTINGS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
syntax enable                       " set syntax highlighting
set nocompatible                    " Use Vi Improved
set ttyfast                         " better performance for Xterm
set showcmd                         " show commandline in the bottom
set autoindent                      " automaticly indent new line as previous one
set clipboard=unnamed               " let registers point to system clipboard
set nu rnu                          " set hybrid numbers
set lazyredraw                      " don't update the display while executing macros
set cmdheight=2                     " height of the bottom command line
set noswapfile                      " do not write annoying intermediate swap files
set nobackup                        " do not keep backup files, it's 70's style cluttering
set title                           " change the terminal's title
set visualbell                      " don't beep
set noerrorbells                    " don't beep
set undolevels=1000                 " use many muchos levels of undo
set hidden                          " won't close file when new one is open in buffer
set shortmess+=c                    " won't show matches when autocompleting
set signcolumn=yes                  " show column on the most left side for signs and stuff
set undofile                        " Remember undo tree even after unloading a buffer
set undodir=$HOME/.vim/undo         " where to save undo tree
set autoread                        " Auto reload of file if changed outside of Vim

"VIM command line menu options
set wildmenu                        " allows you to use left right in the menu
set wildmode=longest:full,full      " expands the command line menu
set wildignore=*.swp,*.bak,*.pyc,*.class " don't show those types of file

"Encoding settings
set encoding=utf-8                  " the encoding displayed
set fileencoding=utf-8              " the encoding written to file

"Search settings
set incsearch                       " automatically jump to the next found pattern
set hlsearch                        " highlight searched pattern
set ignorecase                      " search is case-insensitive
set smartcase                       " Turn on case when upper is in search
set history=1000                    " Command history size

"Tab settings
set expandtab                       " use spaces intead of tab char
set tabstop=4                       " use 4 spaces for tab
set shiftwidth=4                    " use 4 spaces for line shifting

"Scrolling settings
set scrolloff=1                     " Always keep one line below/above the cursor
set sidescrolloff=5                 " Always keep five characters to the left/right of the cursor

"Color schemes settings
colorscheme badwolf

"Completeopt
set completeopt-=menu
set completeopt+=menuone            " Show the completions UI even with only 1 item
"set completeopt-=longest           " Don't insert the longest common text
set completeopt+=preview            " Show the documentation preview window
set completeopt+=popup              " Show preview window next to complete popup
"set completeopt+=noinsert          " Don't insert text automatically
set completeopt-=noselect           " Highlight the first completion automatically

"Current line number is colored
highlight CursorLineNR cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




           "MAP
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
map <Space>ff :set filetype=
map <Space>fx :set filetype=xml<CR>
map <Space>fj :set filetype=json<CR>
map <Space>fxx :'<,'>!xmllint --format -<CR>
map <Space>fjj :<C-U>call FormatJSON(v:count)<CR>
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




           "LEADER KEY SETTINGS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let mapleader = '['
nnoremap <leader>b :Buffers<Return>
nnoremap <leader>l :ls<Return>
nnoremap <leader>j :bnext<Return>
nnoremap <leader>k :bprevious<Return>
nnoremap <leader>ew :EraseBadWhitespace<Return>
nnoremap <leader>u :UndotreeToggle<Return>
"FZF search
nnoremap <leader>f :Files<Return>
nnoremap <leader>c :Commits<Return>
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "MOVE BETWEEN SPLIT WINDOWS JUST WITH CTRL
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <up> :sb
map <down> :bel sb
map <left> :vert sb
map <right> :vert bel sb
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "PYTHON SETUP
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=99
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

"Highlight 'long' lines (>= 101 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%101v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=100
augroup END

"Let code look pretty
let python_highlight_all=1

"Python with virtualenv support
autocmd BufNewFile,BufRead *.py let g:virtualenv_directory = '.'
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "FULLSTACK SETUP
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
au BufNewFile,BufRead *.js,*.html,*.css set tabstop=2
au BufNewFile,BufRead *.js,*.html,*.css set softtabstop=2
au BufNewFile,BufRead *.js,*.html,*.css set shiftwidth=2
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "MARKDOWN SETUP
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
au BufNewFile,BufRead *.md set colorcolumn=80
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.md set spell
au BufNewFile,BufRead *.md set textwidth=80
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "JEDI SETTINGS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:jedi#completions_enabled = 1
let g:jedi#show_call_signatures = "2"

function! UpwardCompleteByTab()
    if pumvisible()
        return "\<C-p>"
    else
        return "\<Tab>"
    endif
endfunction

function! DownwardCompleteByTab()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<Tab>"
    endif
endfunction

imap <C-c> <C-x><C-o>
inoremap <silent><S-Tab> <c-r>=UpwardCompleteByTab()<CR>
inoremap <silent><Tab> <c-r>=DownwardCompleteByTab()<CR>
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "RAINBOW - COLORFUL PARENTHESES
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set termguicolors

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
    \ 'guifgs': ['dodgerblue', 'deeppink', 'springgreen', 'yellow'],
    \ 'operators': '_,_',
    \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \ }
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "LIGHTLINE SETTINGS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "NERDTREE SETTINGS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
nnoremap <F5> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$','__pycache__$']
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "STARTIFY SETTINGS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, {'z': '~/.zshrc'} ]
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ ]
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "INDENTLINE SETTINGS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"Change color of indent
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#767676'

"Change indent character
let g:indentLine_char = '➤'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "FZF SETTINGS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"Ignore gitingore files in fzf search
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "ISORT SETTINGS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:vim_isort_map = '<C-i>'
let g:vim_isort_python_version = 'python3'
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "COMMENTARY SETTINGS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "AUTOFLAKE SETTINGS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:autoflake_remove_all_unused_imports=1
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "ALE SETTINGS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:ale_enabled = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = 'W'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




            "FORMAT JSON FILE FUNCTION CALLED IN MAPING SECTION
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function FormatJSON(...)
  let code="\"
        \ var i = process.stdin, d = '';
        \ i.resume();
        \ i.setEncoding('utf8');
        \ i.on('data', function(data) { d += data; });
        \ i.on('end', function() {
        \     console.log(JSON.stringify(JSON.parse(d), null,
        \ " . (a:0 ? a:1 ? a:1 : 2 : 2) . "));
        \ });\""
  execute "%! node -e " . code
endfunction
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
