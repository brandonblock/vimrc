set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree-git-plugin'
Plugin 'raimondi/delimitmate'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" gvim tweaks
set guioptions-=m
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Hack

" pixie-lang support
au BufNewFile,BufRead *.pxi set filetype=clojure

" 256-color mode
set t_Co=256

" .py Syntax Corrections
let python_highlight_all=1
syntax on

" PEP8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=80 |
    \ set expandtab |
    \ set autoindent |
    \ set smartindent |

" Go Indentation
au BufNewFile,BufRead *.go
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=80 |
    \ set expandtab |
    \ set autoindent |
    \ set smartindent |
    \ colorscheme muon_modified

"HTML indentation
au BufNewFile,BufRead *.html
    \set tabstop=4 |
    \set softtabstop=4 |
    \set shiftwidth=4 |
    \set expandtab |
    \set autoindent |
    \set smartindent |

" JS Indentation
au BufNewFile,BufRead *.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set smartindent |
    \ colorscheme hybrid |
    \ set background=dark |

" UTF-8 Encoding
set encoding=utf-8

" Line Numbers
set nu

" Column and row highlight
set cursorcolumn
set cursorline

" System clipboard integration
set clipboard=unnamed

" Set color scheme
colorscheme mustang

" Ignore case in search if term is all lowercase
set ignorecase
set smartcase

" Highlight and show search terms while typing
set hlsearch
set incsearch
set showmatch

" Enable folding
set foldmethod=indent
set foldlevel=99

" Undo buffers and history tweaks
set history=1000
set undolevels=1000
set title

" Disable audio bells, replace with screen flicker
set visualbell
set noerrorbells

" Disable text wrap
set nowrap

" Show statusline even when there are no window splits
set laststatus=2

" Speed up mode switching
set timeoutlen=1000 ttimeoutlen=0

" Mouse scroll wheel support
set mouse=a

" Remove underline from horizontal highlight
hi CursorLine cterm=NONE

" Delimitmate smart newline?
let delimitMate_expand_cr=0

" Hide .pyc files from nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Remap colon to semicolon for commands
nnoremap ; :

" map :NT to NERDTree
:command NT :NERDTree

" Remove double quote concealment (for JSON plugin)
let g:vim_json_syntax_conceal = 0

" YouCompleteMe Tweaks
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Lightline tweaks (vim-fugitive integration)

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': ' %{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },      
      \'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

let g:lightline.colorscheme = "default"

" Syntastic tweaks
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_rst_checkers = ['sphinx']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_quiet_messages = { 'regex': ['superfluous-parens', 'relative-import', 'E501'] }
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_style_error_symbol = ""
let g:syntastic_style_warning_symbol = ""
let g:syntastic_error_symbol = ""
let g:syntastic_warning_symbol = ""

" go tweaks
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" VimShell bindings
command TE :rightb vsp | VimShell
command TO :rightb sp | VimShell
:let g:vimshell_prompt = "VimShell ~ $ "
