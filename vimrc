"========================== Visual Style ==========================
" Set theme
set bg=dark

" Turn on syntax highlighting
syntax enable

" Turn on line numbers
set number

" Match my brackets
set showmatch
" Match angle brackets too
set matchpairs+=<:>

" Display the mode
set showmode

" Display commands as they're typed
set showcmd

" Scroll when 3 lines from top/bottom
set scrolloff=3

" Show cursor location info on status line
set ruler

" autocomplete methods for :edit and :write.  List possibilities and expand to longest common prefix
set wildmode=list:longest

"=========================== Indenting ============================
" Tabs are 4 spaces
set tabstop=4
" Use 4 spaces for indents
set shiftwidth=4
" Repalce tabs with spaces
set expandtab
" ensure indents are rounded to a multiple of shitwidth
set shiftround

" Retain indentation on next line
set autoindent
" Turn on autoindenting of blocks
set smartindent     

"======================= Cursor Behaviour =======================
" Backspace past autoindents, line boundaries, and even the start of insertion
set backspace=indent,eol,start

" Enable the mouse in all modes
set mouse=a

" Allow <LEFT> and <RIGHT> to for past the end of line in all mode
set whichwrap=<,>,[,]

"======================== Search Behaviour ========================
" Highlight all search matches
set hlsearch
" Show matches as search pattern is typed
set incsearch
" Ignore case in all searches...
set ignorecase
" ...unless an uppercase letter is used first
set smartcase

"======================== Key Mappings ========================
" Highlight the column containing the cursor
highlight CursorColumn term=bold ctermfg=black ctermbg=green cterm=bold

map <C-o> :tabedit<space>
map <C-l> :tabnext<CR>

"======================== Normal Mode Key Mappings ========================

" Setup a search and replace
nmap ss :%s///gc<LEFT><LEFT><LEFT><LEFT>

" whoops, force save a file open in read-only that you don't have permissions
" for.
" Be careful with this one.
nmap sw :w !sudo tee %

" Toggle folds
nnoremap <space> zA
" Create fold
vnoremap <space> zf

" Turn off the highlighted search and/or the highlighted column
nmap <silent> <BS> :nohlsearch <BAR> set nocursorcolumn<CR>

" Delete all the whitespace at the end of a line
" TODO: Maintain cursor poition - Maybe with ``
nmap <silent> ;l :s/\s\+$//e <BAR> :nohlsearch<CR>

" map some shortcuts to indent or unindent an entire block
nnoremap <silent> %% $>i}``
nnoremap <silent> $$ $<i}``

" Active graphical undo history (gundo plugin)
nnoremap <silent> U :GundoToggle<CR>

"TODO doesn't seem to work but maybe key combo isn't right
" Navigate tabs
" Next Tab
"nnoremap <silent> <C-Right> :tabnext<CR>
" Previous Tab
"nnoremap <silent> <C-Left> :tabprevious<CR>
" New Tab
nnoremap <C-t> :tabnew<CR>
" New Tab
"nnoremap <silent> <C-w> :q<CR>

"======================== Operational Mode Key Mappings ========================
" Automatically delete/yank entire word
omap w aw

" Set the dictionary
set dictionary+=/usr/share/dict/words

" Set the spelling language
set spelllang=en_au

" Turn spellcheck on and off
" TODO fix
nmap <silent> ;s :setlocal spell! spell?<CR>

"======================= Help customisations ======================
" Show help files in new tab
augroup HelpInTabs
    au!
    au BufEnter  *.txt   call HelpInNewTab()
augroup END

function! HelpInNewTab ()
    if &buftype == 'help'
        normal T
    endif
endfunction

"======================= Filetype handling =========================
" Highlight SConstruct and  SConscript using python syntax
au BufReadPost SCons* set syntax=python

"TODO find a better place for these:
" Use Python syntax for Scons files
autocmd BufReadPre,BufNewFile SConstruct set filetype=python
autocmd BufReadPre,BufNewFile SConscript set filetype=python
"

filetype on
filetype plugin on
filetype indent on
set nocp

set completeopt=longest,menuone

au FileType python set omnifunc=pythoncomplete#Complete 
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags 
au FileType css set omnifunc=csscomplete#CompleteCSS 
au FileType xml set omnifunc=xmlcomplete#CompleteTags 
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType c set omnifunc=ccomplete#Complete 

function! WordTabAsCompletion()
    let col = col('.') - 1
    echo ""
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction

function! DotCompletion()
    let col = col('.') - 1
    echo ""
    if !col || getline('.')[col - 1] !~ '\k'
        return "."
    else
        return ".\<c-x>\<c-o>"
    endif
endfunction

function! ArrowComplete()
    return "->\<c-x>\<c-o>"
endfunction


inoremap <tab> <c-r>=WordTabAsCompletion()<cr>

au FileType python inoremap . <c-r>=DotCompletion()<cr>

au FileType c inoremap . <c-r>=DotCompletion()<cr>
au FileType c inoremap -> <c-r>=ArrowComplete()<cr>

"call pathogen#infect()
"call pathogen#helptags()
