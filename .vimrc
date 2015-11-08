" no vi-compatible
set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" required for vundle
filetype off

execute pathogen#infect()
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles from GitHub repos:

" Python and PHP Debugger
Bundle 'fisadev/vim-debug.vim'
" Better file browser
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Bundle 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding
Bundle 'mattn/emmet-vim'
"Bundle 'emmet-vim'
" Git integration
Bundle 'motemen/git-vim'
" Tab list panel
Bundle 'kien/tabman.vim'
" Airline
Bundle 'bling/vim-airline'
" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Bundle 'rosenfeld/conque-term'
" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'
" Surround
Bundle 'tpope/vim-surround'
" Autoclose
Bundle 'Townk/vim-autoclose'
" Indent text object
Bundle 'michaeljsmith/vim-indent-object'
" Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

Bundle 'nose.vim'
" Git diff icons on the side of the file lines
Bundle 'airblade/vim-gitgutter'
" Better python indentation
Bundle 'vim-scripts/indentpython.vim--nianyang'
" PEP8 and python-flakes checker
Bundle 'nvie/vim-flake8'
" Search and read python documentation
"Bundle 'fs111/pydoc.vim'
Bundle 'pydoc.vim'
" Automatically sort python imports
Bundle 'fisadev/vim-isort'
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative 
" numbering every time you go to normal mode. Author refuses to add a setting 
" to avoid that)
" Bundle 'myusuf3/numbers.vim'

" Bundles from vim-scripts repos

"vimpress
Bundle "PotHix/Vimpress"

Bundle "wellle/targets.vim"

" Autocompletion
Bundle 'AutoComplPop'
" Python code checker
Bundle 'pyflakes.vim'
" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Gvim colorscheme
Bundle 'Wombat'
" Yank history navigation
Bundle 'YankRing.vim'

Bundle 'abolish.vim'

Bundle 'EasyMotion'

Plugin 'kana/vim-textobj-user'

Bundle 'textobj-line'

Bundle 'vim-textobj-quoted'

Bundle 'argtextobj.vim'

Bundle 'textmanip.vim'

Bundle 'delete-surround-html'

Bundle 'vim-python-virtualenv'

Bundle 'vimux'

Bundle 'ack.vim'

Bundle 'repeat.vim'

Bundle 'VimRepress'

Bundle 'Shougo/vimproc'

Bundle 'marijnh/tern_for_vim'

Bundle "tpope/vim-dispatch"

Bundle 'https://github.com/gorodinskiy/vim-coloresque.git'

Plugin 'amoffat/snake'

Plugin 'chrisbra/NrrwRgn'

Plugin 'whatyouhide/vim-textobj-xmlattr'

Plugin 'VisIncr'

Bundle 'justinmk/vim-sneak'

Bundle "tpope/vim-fugitive"


let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

set hidden

Bundle "vim-jade"

Bundle 'othree/html5.vim'
Bundle "reinh/vim-makegreen"
" Apply g:pythonworkon to statusline
let &statusline='%F%m%r%h%w [FORMAT=%{&ff}] [ENC=%{&fileencoding}] [TYPE=%Y] [ASCII=\%03.3b] [HEX=\%02.2B] [POS=%04l,%04v][%p%%] [LEN=%L] %= [WORKON=%{pythonworkon}]'


" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'lambdalisue/nodeunit.vim' , {'for': 'javascript'}
Plug 'nose.vim', {'for': 'javascript'}
Plug 'kchmck/vim-coffee-script' , {'for': 'coffee'}
Plug 'instant-markdown.vim'     , {'for': 'markdown'}

Plug 'pytest.vim', { 'for': 'python'}
Plug 'vim_django', { 'for': 'python'}
Plug 'chapa',      { 'for': 'python'}

Plug 'airblade/vim-gitgutter' " Git diff icons on the side of the file lines
Plug 'vim-scripts/indentpython.vim--nianyang', {'for': 'python'} " Better python indentation
Plug 'nvie/vim-flake8', {'for': 'python'} " PEP8 and python-flakes checker
Plug 'pydoc.vim', {'for': 'python'} " Search and read python documentation
Plug 'fisadev/vim-isort', {'for': 'python'} " Automatically sort python imports
Plug 'davidhalter/jedi-vim', {'for': 'python'} " Python autocompletion and documentation

Plug 'neovimhaskell/haskell-vim', {'for': 'hs'}

call plug#end()


" allow plugins by file type
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tablength exceptions
autocmd FileType html,swig setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

"Configura emmet
let g:user_emmet_install_global = 0
autocmd FileType html,swig,css,scss EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

" always show status bar
set ls=2

" incremental search
set incsearch

" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" line numbers
set nu

" toggle Tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

"Mapea la tecla <leader> \ a la ,
let mapleader=","

"Plugin chapa.
let g:chapa_default_mappings = 1

" NERDTree (better file browser) toggle
map <F3> :NERDTreeToggle<CR>

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

imap <C-d> <Esc>wciw
map -w :wq
map -q :qa!
map -e :q<CR>

nmap ,t :ConqueTermSplit zsh <CR>

" fix some problems with gitgutter and jedi-vim
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" show pending tasks list
map <F2> :TaskList<CR>

" removes trailing spaces of python files
" (and restores cursor position)
autocmd BufWritePre *.py mark z | %s/\s\+$//e | 'z

" store yankring history file hidden
let g:yankring_history_file = '.yankring_history'

let g:EasyMotion_leader_key = ',,'

" save as sudo
ca w!! w !sudo tee "%"

" colors and settings of autocompletion
highlight Pmenu ctermbg=4 guibg=LightGray
" highlight PmenuSel ctermbg=8 guibg=DarkBlue guifg=Red
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black

" debugger keyboard shortcuts
let g:vim_debug_disable_mappings = 1
map <F5> :Dbg over<CR>
map <F6> :Dbg into<CR>
map <F7> :Dbg out<CR>
map <F8> :Dbg here<CR>
map <F9> :Dbg break<CR>
map <F10> :Dbg watch<CR>
map <F11> :Dbg down<CR>
map <F12> :Dbg up<CR>

" insert ipdb breakpoint with \b
nmap <leader>b Oimport ipdb;ipdb.set_trace()<ESC>

" CtrlP (new fuzzy finder)
let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" Don't change working directory
let g:ctrlp_working_path_mode = 0
" Ignore files on fuzzy finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" simple recursive grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
nmap ,R :RecurGrep 
nmap ,r :RecurGrepFast 
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>

" run pep8+pyflakes validator
autocmd FileType python map <buffer> <leader>8 :call Flake8()<CR>
" rules to ignore (example: "E501,W293")
let g:flake8_ignore=""

" jedi-vim customizations
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#goto_assignments_command = ",a"
let g:jedi#goto_definitions_command = ",d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ",o"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
nmap ,D :tab split<CR>,d

" Change snipmate binding, to avoid problems with jedi-vim
"imap <C-i> <Plug>snipMateNextOrTrigger

" don't let pyflakes allways override the quickfix list
let g:pyflakes_use_quickfix = 0

" tabman shortcuts
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
	let &t_Co = 256
    " color
    colorscheme fisa
else
    " color
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
    "set guifont=Neep\ 18
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 13.
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" vim-airline settings
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
"if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

"corre un comando usando vimux.
map rp :VimuxPromptCommand
"
""Corre el ultimo comando ejecutado con VimuxPromptCommand
map rl :VimuxRunLastCommand

"Inspecciona el panel de vimux.
map ri :VimuxInspectRunner
"
""Cierra todos los otros paneles de tmux en la ventana actual.
map rx :VimuxCloseRunner

"Interrumpe cualquier comando que este corriendo en el panel actual.
map rs :VimuxInterruptRunner

" Acelerar la tecla ESC (quita el retraso molesto de la tecla).
set timeoutlen=500
set textwidth=80
set keywordprg=pman
nmap <Space> :<Esc><Esc>:


"Configura ultisnipts
let g:UltinipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"set term=screen-256color
let g:tern_map_keys = 1
let g:tern_show_argument_hints='on_hold'

au BufNewFile,BufRead *.i set filetype=swig
au BufNewFile,BufRead *.swig set filetype=swig
 
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(LiveEasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)


"map <leader>a :tab split<CR>:Ack ""<Left>
map <leader>a :Ack ""<Left>
map <leader>A :tab split<CR>:Ack <C-r><C-w><CR>
set ww=<,>,[,],h,l



autocmd BufNewFile  *.jade	0r ~/.vim/templates/skeleton.jade
set hlsearch!
nnoremap <C-Space> :set hlsearch!<CR>

"Configuracion para syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
