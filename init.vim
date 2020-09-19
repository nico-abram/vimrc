language en_US.UTF-8

"call plug#begin('C:\Users\Nick\AppData\Local\nvim\plugged')
call plug#begin()
Plug 'cespare/vim-toml'
Plug 'airblade/vim-rooter'
Plug 'machakann/vim-highlightedyank'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'srstevenson/vim-picker'
Plug 'rust-lang/rust.vim'
Plug 'powerline/fonts'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"if has('win32')
"    Plug 'autozimu/LanguageClient-neovim', {
"        \ 'branch': 'next',
"        \ 'do': 'powershell -executionpolicy bypass -File install.ps1',
"        \ }
"else
"    Plug 'autozimu/LanguageClient-neovim', {
"        \ 'branch': 'next',
"        \ 'do': 'bash install.sh',
"        \ }
"endif
":Plug 'ycm-core/YouCompleteMe'
"Plug 'vim-syntastic/syntastic'
call plug#end()

set background=dark " or light
colorscheme deus
let g:airline_theme='deus'

" Settings
set relativenumber

set encoding=utf-8

set number
set undofile
set undodir=$HOME\.vimdid
syntax on
"set guifont=DejaVu\ Sans:s12
":execute 'GuiFont! DejaVu Sans Mono:h11'

" Mappings

" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()
nnoremap <silent> gd :call LanguageClient_textDocument_definition()
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()
nnoremap <leader>; :PickerBuffer<CR>

nnoremap á 'a
nnoremap à `a
nnoremap ç 'c
nnoremap ó 'o
nnoremap ò `o

"Ctrl+p for edit file picker
nmap <c-p> :PickerEdit<CR>

autocmd BufReadPost *.rs setlocal filetype=rust

" Required for operations modifying multiple buffers like rename.
set hidden

" vim-picker settings
let g:picker_selector_executable = 'fzf'
let g:picker_selector_flags = ''
let g:picker_custom_find_executable = 'rg' " ripgrep (windows <3)
let g:picker_custom_find_flags = '--color never --files'

let g:ycm_language_server =
\ [
\   {
\     'name': 'rust',
\     'cmdline': ['rust-analyzer'],
\     'filetypes': ['rust'],
\     'project_root_files': ['Cargo.toml']
\   }
\ ]

let g:ale_linters = {'rust': ['analyzer']}
let g:ale_completion_enabled = 1
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_avoid_whole_workspace = 0
let g:ale_rust_cargo_check_all_targets = 1
let b:ale_fixers = [
\   'rustfmt',
\   'trim_whitespace'
\]
let g:ale_sign_error = "✖"
let g:ale_sign_warning = "⚠"
let g:ale_sign_info = "i"
let g:ale_sign_hint = "➤"
let g:ale_rust_cargo_use_clippy = 1
set omnifunc=ale#completion#OmniFunc

" LanguageClient settings
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rust-analyzer'],
\ }
let g:LanguageClient_autoStart = 1

" For rust-lang/rust.vim
let g:rustfmt_autosave = 1

" air-line
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

