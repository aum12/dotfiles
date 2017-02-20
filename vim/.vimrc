" Summit Bhalla vimrc
" Plugins {{{
set nocompatible					" Required for Vundle
filetype off						" Required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'		" let Vundle manage Vundle, required

" utilities
Plugin 'scrooloose/nerdtree'		" file drawer
Plugin 'ctrlpvim/ctrlp.vim' 		" fuzzy file finder
Plugin 'tpope/vim-surround'			" mapping to CRUD surroundings such as parentheses, brackets etc.
Plugin 'tpope/vim-fugitive'				" git wrapper for vim
Plugin 'vim-syntastic/syntastic'	" syntax checking and linter
Plugin 'vim-airline/vim-airline'	" status/tabline bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/gundo.vim'				" visualize the vim undo tree
Plugin 'Valloric/YouCompleteMe'     " autocomplete
Plugin 'chiphogg/vim-prototxt'      " syntax highlighting for proto files
Plugin 'tell-k/vim-autopep8'        " automatic application of PEP 8 style guide to python files

" colorschemes
Plugin 'altercation/vim-colors-solarized'

" markdown
Plugin 'tpope/vim-markdown'			" markdown support

call vundle#end()					" Required for Vundle
filetype plugin indent on			" Required for Vundle

" }}}

" Colors {{{
syntax enable
" let g:solarized_termtrans=1
set background=dark
set t_Co=16
colorscheme solarized
"set t_Co=256
" }}}

" Misc {{{
set ttyfast							" faster redraw
set backspace=indent,eol,start		" make backspace behave as one expects
set clipboard=unnamed
set splitright                      " default to open split on right of current buffer
" }}}

" Spaces, Wraps & Tabs {{{
set tabstop=4     			" 4 space tab
set expandtab     			" use spaces for tabs
set softtabstop=4     		" 4 space tab
set shiftwidth=4
set modelines=1

filetype indent on
filetype plugin on
set autoindent				" automatically set indent of new line
set smartindent

set wrap                    " turn on line wrapping
set wrapmargin=8            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak="\u21aa"      " show ellipsis at breaking
" }}}

" UI layout {{{
set number					" show line numbers
set relativenumber          " show relative line numbers
set cursorline				" highlight current line
set wildmenu				" visual autocomplete for command menu
set showmatch				" highlight matching parenthesis
set laststatus=2            " show the status line all the time
set wildmode=list:longest   " complete files like a shell
set shell=$SHELL
set cmdheight=1             " command bar height

set magic                   " Set magic on, for regex

" }}}

" Searching {{{
set ignorecase				" ignore case when searching
set smartcase				" only match uppercase letter when seached in uppercase
set incsearch				" search as characters are entered
set hlsearch				" highlight all matches

" }}}

" Folding {{{
set foldmethod=syntax   	" fold based on indent level
set foldnestmax=10      	" max 10 depth
set foldenable          	" don't fold files by default on open
set foldlevelstart=10    	" start with fold level of 1
" }}}

" Mappings {{{
" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

vnoremap . :normal .<cr>	" enable . command in visual mode
inoremap jk <esc>			" jk is escape
" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>
" run python script from buffer
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>
" }}}

" Leader Shortcuts {{{
let mapleader = ','			" map leader to comma
nmap <leader>, :w<cr>		" shortcut to save
noremap <leader>s :mksession<cr> " save session and can reopen with vim -S
nnoremap <leader>u :GundoToggle<cr> " toggle gundo
nnoremap <leader>n :call ToggleNumber()<cr> " toggle between absolute and relative line numbers
nnoremap <leader>1 :set number!<cr> " remove line numbers (mainly for terminal copying)

nmap <leader>o o<Esc>            " enter blank line below current line in normal mode
nmap <leader>O O<Esc>j            " enter blank line above current line in normal mode
nnoremap <leader>/ "fyiw :/<c-r>f<cr>  " search for word under the cursor
set pastetoggle=<leader>v	" set past toggle

nnoremap <leader>x :let g:ycm_auto_trigger=0<CR>    " turn off YCM
nnoremap <leader>X :let g:ycm_auto_trigger=1<CR>    "turn on YCM

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.vimrc<cr>
nnoremap <leader>ez :vsp ~/.zshrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" CtrlP Config {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" }}}

" NERDTree Config {{{
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'

" }}}

"Fugitive Config {{{
"nmap <silent> <leader>gs :Gstatus<cr>
"nmap <leader>ge :Gedit<cr>
"nmap <silent><leader>gr :Gread<cr>
"nmap <silent><leader>gb :Gblame<cr>
"
"nmap <leader>m :MarkedOpen!<cr>
"nmap <leader>mq :MarkedQuit<cr>
"nmap <leader>* *<c-o>:%s///gn<cr>
" }}}

"Airline Config {{{
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
" }}}

" Syntastic Config {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" On by default, turn it off for html
"let g:syntastic_mode_map = { 'mode': 'active',
"                           \ 'active_filetypes': [],
"                           \ 'passive_filetypes': ['html'] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" Use flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,E121,W801"'
"}}}

" Custom Functions {{{
function! ToggleNumber()
	if(&relativenumber == 1)
		set norelativenumber
		set number
	else
		set relativenumber
	endif
endfunc

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" }}}

" YouCompleteMe Config {{{
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:airline_exclude_preview = 1
let g:loaded_youcompleteme = 1

"}}}
" vim:foldmethod=marker:foldlevel=0
