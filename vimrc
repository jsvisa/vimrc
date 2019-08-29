" -*- mode: vim -*-
" vi: set shiftwidth=2 tabstop=2 softtabstop=2:

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" add https://github.com/junegunn/fzf
set rtp+=~/.fzf

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Global
Plugin 'sheerun/vim-polyglot'     " A solid language pack for Vim.
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'majutsushi/tagbar'
Plugin 'neomake/neomake'
Plugin 'luochen1990/rainbow'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'roxma/vim-tmux-clipboard'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'Valloric/YouCompleteMe' " $ ./install.py --clang-completer --clangd-completer --go-completer --rust-completer
Plugin 'tomtom/tcomment_vim'

Plugin 'tpope/vim-haml'
Plugin 'elixir-lang/vim-elixir'
Plugin 'groenewege/vim-less'
Plugin 'fatih/vim-go'
Plugin 'fatih/molokai'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'tpope/vim-rails'
Plugin 'derekwyatt/vim-scala'
Plugin 'vim-ruby/vim-ruby'
Plugin 'suan/vim-instant-markdown'
Plugin 'jsvisa/snipmate.vim'

Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'jsvisa/vim-erlang-skeleteons'
Plugin 'slashmili/alchemist.vim'

Plugin 'thoughtbot/vim-rspec'
Plugin 'kchmck/vim-coffee-script'

Plugin 'exu/pgsql.vim'
Plugin 'nathanielc/vim-tickscript'
Plugin 'chase/vim-ansible-yaml'
Plugin 'cespare/vim-toml'

Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'robertbraeutigam/vim-java-tags'
Plugin 'chr4/nginx.vim'

Plugin 'hashivim/vim-terraform'
Plugin 'juliosueiras/vim-terraform-completion'

Plugin 'tomlion/vim-solidity'

Plugin 'rust-lang/rust.vim'

Plugin 'ekalinin/Dockerfile.vim'

Plugin 'w0rp/ale'

Plugin 'spacewander/openresty-vim'

Plugin 'autozimu/LanguageClient-neovim'

Plugin 'alcesleo/vim-uppercase-sql'

Plugin 'junegunn/fzf.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required

" disable the error alarm and logo
set noerrorbells
set novisualbell
set t_vb=

set nobackup                 " no ~xxx files
syntax on
filetype on
filetype plugin on               " 针对不同的文件类型加载对应的插件
filetype plugin indent on        " 启用自动补全
set encoding=utf8
set expandtab                    " expandtab，用空格代替Tab键

let g:rehash256 = 1
colorscheme molokai
let g:molokai_original = 1

au InsertLeave *.* write    " 每次退出插入模式时自动保存
au FocusLost * :wa          " saving on losing focus
set ts=4 sw=4
set omnifunc=syntaxcomplete#Complete
au FileType java,vue,javascript,js,cc,ruby,elixir,scala,vim,coffee,yaml,toml,conf,cpp setlocal ts=2 sw=2 expandtab
au FileType nginx,sh,shell,lua,go,c,python,erlang,makefile setlocal ts=4 sw=4 expandtab
au FileType tick set commentstring=//%s
" au FileType json autocmd BufWritePre <buffer> %!python -m json.tool

au FileType java setlocal omnifunc=javacomplete#Complete
" set path=**
" set completeopt=longest,menuone

set grepprg=rg

" set cursorline " 为光标所在行加下划线
" set cursorcolumn
set number         " 显示行号
set cindent        " 自动缩进4空格
set smartindent    " 智能自动缩进
set autoindent     " 设置自动缩进
set autoread       " 文件在 Vim 之外修改过，自动重新读入
set autowriteall   " 提示保存
set wildmenu
set wildmode=list:longest
set backspace=indent,eol,start
hi Search term=standout ctermbg=11
set hidden

" fix: vim inside tmux slow scrolling, see more from
" https://unix.stackexchange.com/questions/49414/tmux-output-is-slower-when-vertical-splits-exist-why
set lazyredraw
set ttyfast

set ignorecase " 搜索小写正文时大小写不敏感，搜索正文包含大写时大小写敏感, 影响到 if 字符串相同性判断
set smartcase
set incsearch " 高亮搜索文本
set showmatch
set hlsearch

set fileencodings=utf-8 ",gbk  " 使用utf-8或gbk打开文件

" set wrap   "换行设置
set formatoptions=qrn1

" autocmd! BufWritePost * Neomake
let g:neomake_enabled_makers = ['elixir']

" Settings of ctrlp {
  let g:ctrlp_open_new_file = 't'
  let g:ctrlp_open_multiple_files = 'v'

  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*.gz,*.o,*.beam,*.pyc
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](_build|build|rel|luajit|deps|bin|coverage|vendor|\.(git|hg|svn))$',
    \ 'file': '\v\.(log|jpg|png|jpeg)$',
    \ }
" }

" Easy navigation {
  " n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
  " i  Insert mode map. Defined using ':imap' or ':inoremap'.
  " v  Visual and select mode map. Defined using ':vmap' or ':vnoremap'.
  " x  Visual mode map. Defined using ':xmap' or ':xnoremap'.
  " s  Select mode map. Defined using ':smap' or ':snoremap'.
  " c  Command-line mode map. Defined using ':cmap' or ':cnoremap'.
  " o  Operator pending mode map. Defined using ':omap' or ':onoremap'.
  " 'noremap' means no recursive mapping
  "  除非递归是必须的，否则总是使用非递归映射

  inoremap jj <ESC>

  nnoremap <F8> :!

  " switch between splits
  nnoremap <C-h> <C-w><C-h>
  nnoremap <C-j> <C-w><C-j>
  nnoremap <C-k> <C-w><C-k>
  nnoremap <C-l> <C-w><C-l>

  " ack search the current word.
  " instead of :grep, the return of grep is printed in a small box, not in quickfix)
  nnoremap <silent> <C-f> :Ack '<cword>' .<CR>
  " nnoremap <C-f> :Ack <cWORD> .<CR> " for uppercase
  let g:ackprg = 'rg --vimgrep'

  noremap <F1> <ESC>
  noremap <F5> :CtrlPClearCache<CR>
  nnoremap ; :
"  }

" <leader> hotkey {
  let mapleader = ','
  nnoremap <leader>io :let g:indentLine_enabled=1<CR>
  nnoremap <leader>if :let g:indentLine_enabled=0<CR>
  nnoremap <leader><space> :noh<CR>
  nnoremap <leader>a :Ack
  nnoremap <leader>w :%s/\s\+$//<CR>:let @/=''<CR>
  nnoremap <leader>t :tabe<CR>
  nnoremap <leader>c :tabc<CR>
  nnoremap <leader>e :e#<CR>
  " nnoremap <leader>,e  :e <CR>=expand("%:p:h") .  '/' <CR>
  nnoremap <leader>vm :e $MYVIMRC<CR>
  nnoremap <leader>rb :e ~/.vim/bundle/vim-snipmate/snippets/<CR>
  nnoremap <leader>so :source $MYVIMRC<CR>
  nnoremap <leader>ne :NERDTree<CR>
  nnoremap <leader>nc :NERDTreeClose<CR>

  nnoremap <leader>m :CtrlPClearCache<CR>

  " for quickfix
  function! QuickfixToggle()
    let nr1 = winnr("$")
    cwindow
    let nr2 = winnr("$")
    if nr1 == nr2
      cclose
    endif
  endfunction
  nnoremap <leader>q :call QuickfixToggle()<cr>

  function! LocationToggle()
    let nr1 = winnr("$")
    lwindow
    let nr2 = winnr("$")
    if nr1 == nr2
      lclose
    endif
  endfunction
  nnoremap <leader>l :call QuickfixToggle()<cr>

  nnoremap <leader>cn :cn<CR>
  nnoremap <leader>cp :cp<CR>
  nnoremap <leader>cl :ccl<CR>

  nnoremap <left> <nop>
  nnoremap <right> <nop>
  nnoremap <up> <nop>
  nnoremap <down> <nop>
" }

" Set paste/nopaste mode {
  nnoremap <leader>b         :set invpaste paste?<CR>
  " inoremap <C-b> <C-O>   :set invpaste paste?<CR>
  set pastetoggle=<leader>b
  set clipboard=unnamed "share clipboard with system
  " copy selection to system clipboard in Mac Os X
  vnoremap <C-x> :!pbcopy<CR>
  vnoremap <C-c> :w !pbcopy<CR><CR>
" }

" 没有作用域限制的 Vimscript 函数必须以一个大写字母开头！
" 函数通过 :call StripTrailingWhitespace() 调用
" 如果一个 Vimscript 函数不返回一个值，它隐式返回 0
" a function with argument ex: 'a:' to retrive the function arguments
" fun Farg(name)
"   echo a:name
" endfun
"
" and a function with varlist:
" fun Farglist(name, ...)
"   echo a:name
"   echo a.0
"   echo a.1
" endfun
  fun! StripTrailingWhitespace()
    Neomake
    if index(['make', 'go'], &ft) < 0
      setlocal expandtab
      retab
    endif
    %s/\s\+$//e
  endfun


" Display extra Tab except Golang {
  fun! DisplayTrailingWhitespace()
    setlocal list listchars=tab:»·,trail:·
  endfun

  autocmd FileType c,python,erlang,elixir,ruby,shell call DisplayTrailingWhitespace()
  autocmd BufWritePost * call StripTrailingWhitespace()

" }

" TagBar {
  nnoremap <silent> <leader>tl : TagbarToggle<CR>
  nnoremap <silent> <leader>tb : TagbarOpenAutoClose<CR>
  nnoremap <silent> <leader>tbc : TagbarClose<CR>
" }

" " My personal Tags  {
"
"   function! LoadTagsByFileType()
"     " if ==? ignore case; and ==# case senstive
"     if &filetype ==? 'c'
"       set tags+=~/tags/tags-nginx
"     elseif &filetype ==? 'rb'
"       set tags+=~/tags/tags-gems
"     elseif &filetype ==? 'go'
"       set tags+=~/.go/tags
"     endif
"   endfunction
"
"   " set autochdir
"   set tags=./.tags;,.tags
"   " autocmd FileType * call LoadTagsByFileType()
"   " au FileType c,cpp set tags^=~/tags/tags-nginx
"   " au FileType *.erb,*.rb set tags^=~/tags/tags-gems
" " }


""""""""""""""""""""""""""""""
" Start gtags
"""""""""""""""""""""""""""""""""
" from https://www.zhihu.com/question/47691414/answer/373700711
  let g:gutentags_enabled = 0
  " :messages to show gutentags messages
  let g:gutentags_trace = 0
  let g:gutentags_define_advanced_commands = 1
  let $GTAGSLABEL = 'native-pygments'
  let $GTAGSCONF = '/root/.config/gtags/gtags.conf'

  " gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
  let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

  " 所生成的数据文件的名称
  let g:gutentags_ctags_tagfile = '.tags'

  " 同时开启 ctags 和 gtags 支持：
  let g:gutentags_modules = []
  if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
  elseif executable('ctags')
    let g:gutentags_modules += ['ctags']
    " 配置 ctags 的参数
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " 如果使用 universal ctags 需要增加下面一行
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
  endif

  " 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
  let g:gutentags_cache_dir = expand('~/.cache/tags')

  " 禁用 gutentags 自动加载 gtags 数据库的行为
  let g:gutentags_auto_add_gtags_cscope = 0

  let g:gutentags_ctags_exclude = ['node_modules', 'build']
  " let g:gutentags_ctags_exclude_filetypes = ['markdown', 'json', 'vim']
  " debug gtags from https://github.com/hanxi/blog/issues/19
""""""""""""""""""""""""""""""
" End ctags
"""""""""""""""""""""""""""""""""


" Gotags auto update {
  function! UpdateGoTags()
    " %     -> current file(relative path)
    " %:p   -> current file(absolute path)
    let cfp = expand("%:p")
    let cwd = getcwd()
    let tagfilename = cwd . "/tags"
    let cmd = 'gotags -silent=true -f ' . tagfilename . cfp
    let resp = system(cmd)
  endfunction

  autocmd BufWritePost *.go call UpdateGoTags()
" }

" vimdiff color scheme
highlight DiffChange cterm=none ctermfg=black ctermbg=LightGreen gui=none guifg=bg guibg=LightGreen
highlight DiffText cterm=none ctermfg=black ctermbg=Red gui=none guifg=bg guibg=Red

" Markdown disable folding {
  let g:vim_markdown_folding_disabled=1
" }

set cc=100
noremap <leader>ch :call SetColorColumn()<CR>
function! SetColorColumn()
  let col_num = virtcol(".")
  let cc_list = split(&cc, ',')
  if count(cc_list, string(col_num)) <= 0
    execute "set cc+=".col_num
  else
    execute "set cc-=".col_num
  endif
endfunction

" let g:indentLine_char = '┆'

""""""""""""""""""""""""""""""
" BufExplorer
"""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
" let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize=30    " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

let g:rainbow_active = 1

let g:html_indent_tags = 'p\|li\|nav'

" au FileType go nmap <leader>r <Plug>(go-run)
" au FileType go nmap <leader>b <Plug>(go-build)
" au FileType go nmap <leader>t <Plug>(go-test)
" au FileType go nmap <leader>c <Plug>(go-coverage)
"
" append the triggers to the default one
  " \   'go,python': ['re!\w{4}'],
let g:ycm_semantic_triggers =  {
  \   'python': ['re!from\s+\S+\s+import\s'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }
let g:ycm_add_preview_to_completeopt = 0  " don't show the preview pane
" let g:ycm_show_diagnostics_ui = 0 " don't show the diagnostics UI
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-'> :YcmCompleter GoToReferences<CR>
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" autocmd CompleteDone * pclose
"
set runtimepath^=~/.vim/bundle/vim-erlang-runtime/

let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.swp', '\.beam$', '\.so$', '\.tar.gz$']

""""""""""""""""""""""""""""""
" Start polyglot
"""""""""""""""""""""""""""""""""
let g:polyglot_disabled = ['markdown']
""""""""""""""""""""""""""""""
" End polyglot
"""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Start Golang
"""""""""""""""""""""""""""""""""

" auto import packages when saving the file
let g:go_fmt_command = "goimports"

" the default DefMode is guru, which is slow for my vagrant,
" so switch to godef.
" see more from https://github.com/fatih/vim-go/issues/887
let g:go_def_mode = "godef"
set nocursorcolumn
syntax sync minlines=256
set re=1

" the same to ethereum's ci
let g:neomake_go_gometalinter_args = [
  \ "--vendor",
  \ "--tests",
  \ "--disable-all",
  \ "--enable=goimports",
  \ "--enable=varcheck",
  \ "--enable=vet",
  \ "--enable=gofmt",
  \ "--enable=misspell",
  \ "--enable=goconst",
  \ "--min-occurrences=6",
  \ ]

let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_solidity = {
  \ 'ctagstype': 'solidity',
  \ 'kinds' : [
    \ 'c:contracts',
    \ 'e:events',
    \ 'f:functions',
    \ 'm:mappings',
    \ 'v:varialbes',
  \ ]
  \ }

""""""""""""""""""""""""""""""
" End Golang
"""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Start Rust
"""""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1
""""""""""""""""""""""""""""""
" End Rust
"""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Start ale
"""""""""""""""""""""""""""""""""
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['black'],
\   'go': ['gofmt', 'goimports'],
\   'json': ['fixjson'],
\}

let g:ale_linters = {
\   'python': ['flake8'],
\   'lua': ['luacheck'],
\}

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_linters_explicit = 1            " Only run linters named in ale_linters settings.
let g:ale_lint_on_text_changed = 'never'
let g:ale_go_gofmt_options = '-s'

let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

nnoremap <silent> <leader>n :ALENext<CR>
nnoremap <silent> <leader>m :ALEPrevious<CR>
""""""""""""""""""""""""""""""
" End ale
"""""""""""""""""""""""""""""""""

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


""""""""""""""""""""""""""""""
" Start Java
"""""""""""""""""""""""""""""""""
let g:JaveComplete_AutoStartServer = 1
""""""""""""""""""""""""""""""
" End Java
"""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Start LSP-Client
"""""""""""""""""""""""""""""""""
" \ 'python': ['/root/.pyenv/shims/pyls'],
let g:LanguageClient_serverCommands = {
\   'c': ['/usr/local/bin/ccls'],
\   'go': ['/root/.go/bin/go-langserver'],
\ }

nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
""""""""""""""""""""""""""""""
" End LSP-Client
"""""""""""""""""""""""""""""""""

nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Rg<Cr>
