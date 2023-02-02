syntax on

set autochdir
set autoindent
set autowrite
set backspace=2
"set cursorline
"set colorcolumn=80
set expandtab
set incsearch
set ignorecase
set laststatus=2
set modelines=2
set nobackup
set nocompatible
set nowritebackup
"set number
"set mouse=a
set pastetoggle=<F7>
"set ruler
set shiftwidth=4
set showmatch
set smartcase
set splitright
set tabstop=4
set textwidth=0

set wildmode=longest,list,full
set wildmenu

let mapleader=","

" cindent setup - from ecrampton
" N-s: don't indent inside namespaces
" g0: don't indent C++ scope declarations
" :0: don't ident cases inside switch
set cindent
set cino=N-s,g0

" Plugin Configuration
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bufexplorer.zip'
Plugin 'bufkill.vim'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'
Plugin 'altercation/vim-colors-solarized'
Plugin 'arcticicestudio/nord-vim'
Plugin 'Lokaltog/vim-monotone'
"Plugin 'airblade/vim-gitgutter'
" Plugin 'derekwyatt/vim-fswitch'
" Plugin for .tmux.conf
Plugin 'tmux-plugins/vim-tmux'
Plugin 'rodjek/vim-puppet'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-easy-align'
Plugin 'pangloss/vim-javascript'
Plugin 'itchyny/lightline.vim'

" Racket
Plugin 'benknoble/vim-racket'
"Plugin 'tpope/vim-surround.git'
Plugin 'junegunn/rainbow_parentheses.vim'
"Plugin 'MicahElliott/vrod'
""Plugin 'guns/vim-sexp'
Plugin 'jpalardy/vim-slime'
Plugin 'benknoble/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

" Python
"Plugin 'vim-scripts/indentpython.vim'
Plugin 'Vimjas/vim-python-pep8-indent'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" filetype (required for Vundle)
filetype on
filetype plugin on
filetype indent on

" Color scheme
"set t_Co=256
set background=dark
"let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
"colorscheme solarized
colorscheme nord

"let g:ctrlp_extensions = ['switcher','changes','mixed']
let g:ctrlp_extensions = ['changes','mixed']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:lightline = { 'colorscheme' : 'solarized', }

" NERDTree
let NERDTreeWinSize=41
" Close vim if the only window left open is NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" I usually have a vertical split, so make sure the splits are even each time
" NERDTree appears and disappears
nmap <leader>e :NERDTreeToggle<cr><C-w>=

" bufexplorer
let g:bufExplorerShowRelativePath=1

" gitgutter
highlight clear SignColumn " better gutter coloring with solarized
set updatetime=750

" Key bindings
nmap <leader>t :TagbarToggle<cr>

" Other useful hacks

" Custom macros
map <F2> oprintf ("%s: %s (%d)\n", __FILE__, __PRETTY_FUNCTION__, __LINE__);<ESC>==
map <F3> ofprintf (stderr, "%s: %s (%d)\n", __FILE__, __PRETTY_FUNCTION__, __LINE__);<ESC>==

" Python syntax options
let python_highlight_all = 1

" Jump to last position when opening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
    au BufEnter *.rkt,*.rktl set filetype=racket
    au filetype racket set lisp
    au filetype racket set autoindent
endif

" I despise trailing whitespace. Show it to me so I can nuke it!
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

function! NukeTrailingWhiteSpace()
    %s/\s\+$//e
endfunction
nmap <leader>w :call NukeTrailingWhiteSpace()<CR>

let g:slime_target = "vimterminal"
let g:slime_vimterminal_cmd = "racket"
let g:slime_vimterminal_config = {"norestore": 1, "term_rows": "10", "term_finish": "close"}
set splitbelow

augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,racket RainbowParentheses
augroup END

" Python
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix
" 	\ set encoding=utf-8
