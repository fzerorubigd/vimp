syntax on
" Put these lines at the very end of your vimrc file. put
"
" " Load all plugins now.
" " Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" " Load all of the helptags now, after plugins have been loaded.
" " All messages and errors will be ignored.
silent! helptags ALL
set mouse=a  		" Mouse is working inside terminal now
set hlsearch            " Highlight all matched search
set ignorecase          " Ignore the case in search 
set smartcase           " ... only for lower case search, it's case sensitive with upper
set incsearch
set gdefault 		" Do not set the g in replace :s/foo/bar/ <- No g
set magic

nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

set background=dark
colorscheme solarized8
let g:rainbow_active = 1

" Flash screen instead of beep sound
set visualbell

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

set number

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype go,make setlocal tabstop=2 shiftwidth=2 softtabstop=2

" ts - show existing tab with 4 spaces width
" sw - when indenting with '>', use 4 spaces width
" sts - control <tab> and <bs> keys to match tabstop

" Control all other files
set shiftwidth=4

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Hardcore mode, disable arrow keys.
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

filetype plugin indent on

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.

let g:ale_go_bingo_executable = 'gopls'
let g:ale_completion_enabled = 0
let g:ale_linters = { 'go': ['gofmt', 'golint', 'go vet', 'gopls']  }

" go-vim plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1

":nnoremap <C-d> :GoDeclsDir<CR>
autocmd FileType go map <buffer> <C-d> :GoDeclsDir<CR>
"autocmd FileType go map <buffer> <C-m><C-m> :GoDef<CR>
"autocmd FileType go map <buffer> <C-m> :GoDefPop<CR>

"au filetype go inoremap <buffer> . .<C-x><C-o>

" If you want to disable gofmt on save
" let g:go_fmt_autosave = 0

"fzf 
:nnoremap <C-f> :Files<CR>


" NERDTree plugin specific commands
:nnoremap <C-n> :NERDTreeTabsToggle<CR>
:nnoremap <F5> :NERDTreeFind<CR>
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" air-line plugin specific commands
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" My bindings 
"
:tnoremap <Esc> <C-\><C-n>
