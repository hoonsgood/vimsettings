" vundle configuration

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'                " NERDTree
Plugin 'kien/ctrlp.vim'	                    " ctrlp	
Plugin 'Shougo/neocomplcache.vim'           " neocomplcache
Plugin 'scrooloose/syntastic'               " Syntactic
Plugin 'mileszs/ack.vim'                    " Ack.vim
Plugin 'majutsushi/tagbar'                  " Tagbar
Plugin 'bling/vim-airline'                  " Airline
Plugin 'altercation/vim-colors-solarized'   " Solarized colorscheme
Plugin 'Shougo/neosnippet'                  
Plugin 'Shougo/neosnippet-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" CtrlP configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links'
  \ }

" neocomplcache configuration
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
let g:neocomplcache_force_overwrite_completefunc = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns._ = '\h\w*'

" Plugin key-mappings {
    imap <silent><expr><C-k> neosnippet#expandable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
    smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

    inoremap <expr><C-g> neocomplcache#undo_completion()
    inoremap <expr><C-l> neocomplcache#complete_common_string()
    "inoremap <expr><CR> neocomplcache#complete_common_string()

    function! CleverCr()
        if pumvisible()
            if neosnippet#expandable()
                let exp = "\<Plug>(neosnippet_expand)"
                return exp . neocomplcache#close_popup()
            else
                return neocomplcache#close_popup()
            endif
        else
            return "\<CR>"
        endif
    endfunction

    " <CR> close popup and save indent or expand snippet 
    imap <expr> <CR> CleverCr()

    " <CR>: close popup
    " <s-CR>: close popup and save indent.
    inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
    "inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplcache#close_popup()

    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
" }

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'

" Syntactic configuration
" gcc for C
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_errorformat = '%f:%l:%c: %trror: %m'
" gcc for C++
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_errorformat = '%f:%l:%c: %trror: %m'

" Ack.vim configuration
let g:ackprg = "ack-grep"
let g:ackhighlight = 1

" vim-airline configuration
let g:airline_theme = 'solarized'

" javascript-libraries-syntax.vim configuration
let g:used_javasscript_libs = 'jquery,angularjs,requirejs,jasmine'

" VIM configuration
" General
set background=dark
filetype plugin indent on
syntax on
scriptencoding=utf-8

set history=1000

set nobackup
if has('persistent_undo')
	set undofile
	set undolevels=1000
	set undoreload=10000
endif

set t_Co=256
if has("win32")
	set term=xterm
else
	set term=xterm-256color
endif
set showmode

set cursorline

highlight clear SignColumn
highlight clear LineNr

if has('cmdline_info')
	set ruler " Show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
	set showcmd " Show partial commands in status line and
	" Selected characters/lines in visual mode
endif

if has('statusline')
	set laststatus=2

	" Broken down into easily includeable segments
	set statusline=%<%f\ 	" Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=%{fugitive#statusline()} " Git Hotness
	set statusline+=\[%{&ff}/%Y] " Filetype
	set statusline+=\[%{getcwd()}] " Current dir
	set statusline+=%=%-14.(%l,%c%V%)\%p%% " Right aligned file nav info
endif

set backspace=indent,eol,start
set linespace=0
set nu
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=longest,full
set noswapfile

set wrap
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4

set foldcolumn=1

set mouse=a
let mapleader = ','

if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    color solarized                     " Load a colorscheme
endif

" shortcuts
nmap <C-E> :NERDTreeToggle<CR>
nmap <Leader>tt :Tagbar<CR>
nmap <C-\> :Ack <C-R>=expand("<cword>")<CR><CR>

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

if has("gui_running")
    if has("gui_win32")
        set guifont=Consolas:h11:cANSI
    endif
endif
