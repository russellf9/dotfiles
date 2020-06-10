" Keep lots of items in history"
set history=1000
:
" Show the cursor position"
set ruler

" Show incomplete commands"
set showcmd
	
" Shows a menu when using tab completion"
set wildmenu

set scrolloff=5

" Search options"
set hlsearch
set incsearch
set ignorecase
set smartcase

" Turn on line numbering by default"
set number

"set backup"

" Better line break"
set lbr

" Auto / Smart ident"
set ai
set si

set bg=dark
color slate

" clear search (todo)
" :let @/ = ""

map <leader>w :w!<CR>

" Settings for Spelling 
set spelllang=en
set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add


func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  setlocal spell spelllang=en_us
  set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
com! WP call WordProcessor()

call plug#begin('~/.vim/plugged')

" keys 
noremap <Up> <Esc>


" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Goyo - :Goyo to toggle
Plug 'junegunn/goyo.vim'

" Pencil...
Plug 'reedes/vim-pencil'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'junegunn/limelight.vim'

Plug 'preservim/nerdtree'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

Plug 'nelstrom/vim-markdown-folding'

Plug 'jonhiggs/MacDict.vim'


" Initialize plugin system
call plug#end()

" .............................................................................
" plasticboy/vim-markdown"
" .............................................................................

autocmd FileType markdown normal zR

" .............................................................................
" persevim/nerdtree
" .............................................................................

" (need to work something out for this
" call pathogen#infect()
" syntax on
" filetype plugin indent on

" .............................................................................
" junegunn/limelight.vim
" .............................................................................
" Settings for Limelight (See: https://github.com/junegunn/limelight.vim)
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" .............................................................................
" iamcco/markdown-preview.nvim
" .............................................................................
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/home/nick/.local/lib/github-markdown-css/github-markdown.css'

let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='~/.local/lib/github-markdown-css/github-markdown.css'

let g:markdown_folding=1
