set nocompatible " Must be the first line

" Vundle plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'


" Auto reload
autocmd! bufwritepost .vimrc source %

" === Global Settings ===
set modeline
set encoding=utf-8
set ignorecase
set smartcase
set t_Co=256
set backspace=indent,eol,start
set incsearch
set lazyredraw
set showmatch
set nowrap
set pastetoggle=<F11>
set mouse=a
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set showcmd
set relativenumber
set number
set clipboard=unnamed
set ruler


" === Syntax Highlighting & auto-indent ===
set hlsearch
set incsearch
set ignorecase
set smartcase
set smarttab
let python_highlight_all=1
syntax on
syntax enable
set ofu=syntaxcomplete#Complete
set antialias
filetype on
filetype plugin on
filetype indent on
set autoindent

" === Colour Scheme ===
if has('gui_running')
    set background=light
else
    set background=dark
endif
"colorscheme solarized


" === Wildmenu ===
set wildmenu
set wildmode=longest,list,full
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif


" === Mappings ===
" Unmap the arrow keys
no <down> ddp
no <left> <Nop>
no <right> <Nop>
no <up> ddkP
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" better split window control
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" change the mapleader from \ to ,
let mapleader=","

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-N> :nohl<CR><C-L>

" Auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i


" === Other Settings ===
" Show < or > when characters are not displayed on the left or right.
set list
set list listchars=nbsp:¬,tab:>-,precedes:<,extends:>

" Set to auto read when a file is changed from the outside
set autoread

" Show More Info in the statusline, without going overboard
set laststatus=2
set statusline=%<%f\ %m%r%y%=%-35.(Line:\ %l/%L\ [%p%%][Format=%{&ff}]%)

" === Coding tweaks ===
" All setting are protected by 'au' ('autocmd') statements.  Only files ending
" in .py or .pyw will trigger the Python settings while files ending in *.c or
" *.h will trigger the C settings.

au BufRead,BufNewFile *py,*pyw,*.java set tabstop=4
au BufRead,BufNewFile *py,*pyw,*.java set softtabstop=4
au BufRead,BufNewFile *.py,*pyw,*.java set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw,*.java set expandtab

au BufRead,BufNewFile Makefile* set noexpandtab

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.xml match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed, C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
" Only used for new files so existing files aren't forced to change line endings
au BufNewFile *.py,*.pyw,*.c,*.h,*.vim,*.pl,*.sh set fileformat=unix

" Turn on line numbering for certain files
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.vim,*.pl,*.sh set nu


" ------------------------------------------------------------
"  Python IDE setup
"  -----------------------------------------------------------

" NERDTree
map <F2> :NERDTreeToggle<CR>
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 0
let g:NERDTreeWinPos = "left"
"let NERDTreeWinSize = 20
let NERDTreeIgnore=['\.pyc$', '\~$']

" vim-jedi

" Syntactic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_enable_highlighting = 0
"let g:syntastic_echo_current_error = 0

" Python folding
set nofoldenable
set foldmethod=indent
set foldlevel=20
nnoremap <space> za
