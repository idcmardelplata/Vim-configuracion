filetype plugin indent on
syntax enable

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'https://github.com/ryanoasis/vim-devicons'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
Plug 'https://github.com/scrooloose/syntastic'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-fugitive.git'
"Plug 'https://github.com/SirVer/ultisnips.git'
"Ejecuta test en distintos lenguajes y frameworks.
Plug 'janko-m/vim-test'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/mattn/emmet-vim.git'
Plug 'https://github.com/digitaltoad/vim-pug.git'
Plug 'https://github.com/AndrewRadev/sideways.vim.git' "Permite hacer swapping de argumentos
Plug 'https://github.com/tpope/vim-unimpaired.git'

"Plugin que contiene configuraciones y otros plugins ya preparados para varios lenguajes.
Plug 'https://github.com/sheerun/vim-polyglot'

"Plugins especificos para javascript
Plug 'pangloss/vim-javascript', {'for' : 'javascript'}
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'https://github.com/othree/javascript-libraries-syntax.vim', {'for' : 'javascript'}
Plug 'https://github.com/heavenshell/vim-jsdoc', {'for' : 'javascript'}
Plug 'moll/vim-node', {'for' : 'javascript'}
Plug 'https://github.com/scrooloose/syntastic'
Plug 'posva/vim-vue'
"Plugins especificos del editor
" Add plugins to &runtimepath
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'othree/jspc.vim', {'for' : 'javascript'}
Plug 'fatih/vim-go', {'for': 'go'}

"Elixir!!!
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
call plug#end()

"let g:deoplete#enable_at_startup = 1
"if !exists('g:deoplete#omni#input_patterns')
"  let g:deoplete#omni#input_patterns = {}
"endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>



let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']

"Configura syntastic.
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_aggregate_errors=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_ballons=has('ballon_eval')
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=3
let g:syntastic_ignore_files = ['^/usr/', '*node_modules*', '*vendor*', '*build*', '*LOCAL*', '*BASE', '*REMOTE*']
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_javascript_checkers=['jshint', 'jscs']
let g:syntastic_json_checkers=['jsonlint', 'jsonval']
let g:syntastic_ruby_checkers=['rubocop','mri']
let g:syntastic_perl_checkers=['perl','perlcritic','podchecker']
let g:syntastic_python_checkers=['pylint','pep8','python']
let g:syntastic_cpp_checkers=['gcc','cppcheck','cpplint','ycm','clang_tidy','clang_check']
let g:syntastic_c_checkers=['gcc','make','cppcheck','clang_tidy','clang_check']
let g:syntastic_haml_checkers=['haml_lint', 'haml']
let g:syntastic_html_checkers=['jshint']
let g:syntastic_yaml_checkers=['jsyaml']
let g:syntastic_sh_checkers=['sh','shellcheck','checkbashisms']
let g:syntastic_vim_checkers=['vimlint']
let g:syntastic_enable_perl_checker=1
let g:syntastic_c_clang_tidy_sort=1
let g:syntastic_c_clang_check_sort=1
let g:syntastic_c_remove_include_errors=1
let g:syntastic_quiet_messages = { "level": "[]", "file": ['*_LOCAL_*', '*_BASE_*', '*_REMOTE_*']  }
let g:syntastic_stl_format = '[%E{E: %fe #%e}%B{, }%W{W: %fw #%w}]'
let g:syntastic_java_javac_options = "-g:none -source 8 -Xmaxerrs 5 -Xmaswarns 5"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


"Algunas configuraciones pertinentes...

let mapleader=","

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.



" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif


" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>



 "Open file menu
nnoremap <Leader>o :CtrlP<CR>
 "Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
 "Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'jellybeans'
let g:airline_powerline_fonts = 1
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set guifont=Space\ Mono\ Italic\ 12
"
"Configura vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>v :TestVisit<CR>
let test#strategy = "neovim"

"Configura ultisnipts
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
 " If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsSnippetDirectories="~/.vim/plugged/ultisnipts/snipts"


nnoremap <C-Space> :set hlsearch!<CR>

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
imap <C-J> <C-X><C-O>



" CtrlP (new fuzzy finder)
let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
nmap ,c :CtrlPCmdPalette<CR>
" "to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
"" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
"" Don't change working directory
let g:ctrlp_working_path_mode = 0
"" Ignore files on fuzzy finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
\ }


nmap <Space> :<Esc><Esc>:

vmap <Enter> <Plug>(LiveEasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)
nnoremap <C-Space> :set hlsearch!<CR>
inoremap jk <esc>
inoremap kj <esc>

"Configuración de emmet.
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,jade EmmetInstall
"autocmd FileTYpe vue EmmetInstall
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
let g:user_emmet_leader_key='<C-Z>'


"Configura neerdtree
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
if !has("nvim")
  set encoding=utf-8
endif



nnoremap <c-Left> :SidewaysLeft<cr>
nnoremap <c-Right> :SidewaysRight<cr>
nnoremap <S-Left> :SidewaysJumpLeft<cr>
nnoremap <S-Right> :SidewaysJumpRight<cr>


omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

"Configuraciones para javascript de diversos plugins 
let g:javscript_plugin_jsdoc = 1
set foldmethod=syntax
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

let g:used_javascript_libs = 'ramda,jquery'

"Algunas configuraciones para jsdoc
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_enable_es6=1
let g:jsdoc_input_description=1


"Autocompletado para javascript
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
let g:tern#is_show_argument_hints_enabled=1

"Configuracion para syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
iabbrev jquerycdn "http://code.jquery.com/jquery-3.1.1.min.js"
iabbrev baconcdn "https://cdnjs.cloudflare.com/ajax/libs/bacon.js/0.7.88/Bacon.min.js"
iabbrev ramdacdn "https://cdnjs.cloudflare.com/ajax/libs/ramda/0.22.1/ramda.min.js"
runtime :colorscheme=koehler
