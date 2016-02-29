" -*- mode: vim -*-
" vi: set shiftwidth=2 tabstop=2 softtabstop=2:

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'mileszs/ack.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'majutsushi/tagbar'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-haml'
Plugin 'groenewege/vim-less'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'         " $./install.py --clang-completer --gocode-completer
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'tpope/vim-rails'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'vim-ruby/vim-ruby'
Plugin 'suan/vim-instant-markdown'
Plugin 'jsvisa/snipmate.vim'

Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'jsvisa/vim-erlang-skeleteons'


" All of your Plugins must be added before the following line
call vundle#end()            " required

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

" au BufNewFile,BufRead *.c,*.py,*.erl,*.sh,*.go,*.lua,*.vim set tabstop=4 shiftwidth=4 softtabstop=4
set shiftwidth=4 tabstop=4 softtabstop=4
au BufNewFile,BufRead *.rb,*.ex,*.exs,*.scala set bs=2 sw=2 ts=2 st=2

" Pathogen {
" call pathogen#infect()
" call pathogen#helptags() " update all plugins help doc
" }

set omnifunc=syntaxcomplete#Complete
" set path=**
" set completeopt=longest,menuone

set grepprg=ack
map <F3> :cp<CR>
map <F4> :cn<CR>

" set cursorline " 为光标所在行加下划线
" set cursorcolumn
set number         " 显示行号
set cindent        " 自动缩进4空格
set smartindent    " 智能自动缩进
set autoindent     " 设置自动缩进
set autoread       " 文件在Vim之外修改过，自动重新读入
set autowriteall   " 提示保存
set wildmenu
set wildmode=list:longest
set backspace=indent,eol,start
hi Search term=standout ctermbg=11
set hidden

vnoremap / /\v "add \v after key in /
set ignorecase " 搜索小写正文时大小写不敏感，搜索正文包含大写时大小写敏感
set smartcase
set incsearch " 高亮搜索文本
set showmatch
set hlsearch

set fileencodings=utf-8 ",gbk  " 使用utf-8或gbk打开文件

" set wrap   "换行设置
set formatoptions=qrn1

" Settings of ctrlp {
  let g:ctrlp_open_new_file = 't'
  let g:ctrlp_open_multiple_files = 'v'

  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*.gz,*.o,*.beam,*.pyc
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](_build|rel|bin|coverage|\.(git|hg|svn))$',
    \ 'file': '\v\.(log|jpg|png|jpeg)$',
    \ }
" }

" Easy navigation {
  " 'noremap' means no recursive mapping
  inoremap jj <ESC>

  nnoremap gcc gcc<ESC>
  nnoremap <F8> :!

  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  nnoremap <C-l> gt
  nnoremap <C-h> gT

  inoremap <F1> <ESC>
  nnoremap <F1> <ESC>
  vnoremap <F1> <ESC>
  inoremap <F5> :CtrlPClearCache<CR>
  nnoremap <F5> :CtrlPClearCache<CR>
  vnoremap <F5> :CtrlPClearCache<CR>
  nnoremap ; :
" }

" <leader> hotkey {
  let mapleader = ','
  nnoremap <leader><space> :noh<CR>
  nnoremap <leader>a :Ack
  nnoremap <leader>w :%s/\s\+$//<CR>:let @/=''<CR>
  nnoremap <leader>t :tabe<CR>
  nnoremap <leader>c :tabc<CR>
  nnoremap <leader>e :e#<CR>
  " nnoremap <leader>,e  :e <CR>=expand("%:p:h") .  '/' <CR>
  nnoremap <leader>vm :e ~/.vim/vimrc<CR>
  nnoremap <leader>rb :e ~/.vim/bundle/vim-snipmate/snippets/<CR>
  nnoremap <leader>so :source ~/.vimrc<CR>
  nnoremap <leader>ne :NERDTree<CR>
  nnoremap <leader>nc :NERDTreeClose<CR>

  nnoremap <leader>r  :Rake!<CR>
  nnoremap <leader>rr :.Rake!<CR>
  nnoremap <leader>os :! open %:p -a Safari<CR><CR>
  nnoremap <leader>oc :! open %:p -a Firefox<CR><CR>
  nnoremap <leader>g :Dash<CR>
  nnoremap <leader>m :CtrlPClearCache<CR>

  " for quickfix
  nnoremap <leader>cn :cn<CR>
  nnoremap <leader>cp :cp<CR>
  nnoremap <leader>cl :ccl<CR>
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


  fun! StripTrailingWhitespace()
    retab
    %s/\s\+$//e
  endfun

" Display extra Tab except Golang {
  fun! DisplayTrailingWhitespace()
    " Don't strip on these filetypes
    let blacklist = ['snippets', 'go', 'py']
    if index(blacklist, &ft) < 0
      set list listchars=tab:»·,trail:·
    endif
  endfun

  autocmd BufWritePre * call StripTrailingWhitespace()
  autocmd BufReadPre * call DisplayTrailingWhitespace()
" }

" Powerline {
  set guifont=PowerlineSymbols\ for\ Powerline
  set nocompatible
  set laststatus=2
  set statusline=%f:\ %l
  set t_Co=256
  let g:Powerline_symbols = 'unicode'
  set rtp+={path_to_powerline}/powerline/bindings/vim
  set noshowmode
" }

" Taglist {
  let Tlist_Show_One_File = 1                 "只显示当前文件的taglist，默认是显示多个
  let Tlist_Exit_OnlyWindow = 1               "如果taglist是最后一个窗口，则退出vim
  let Tlist_Use_Right_Window = 1              "在右侧窗口中显示taglist
  let Tlist_GainFocus_On_ToggleOpen = 1       "打开taglist时，光标保留在taglist窗口
  let Tlist_Close_On_Select = 1               "选择了tag后自动关闭taglist窗口
  let Tlist_Ctags_Cmd='/usr/local/bin/ctags'  "设置ctags命令的位置
  let Tlist_Auto_Open = 0                     "每次vim运行时自动打开taglist
  let Tlist_WinWidth = 40
  nnoremap <leader>tl : Tlist<CR>
" }

" TagBar {
  nnoremap <leader>tb : TagbarOpenAutoClose<CR>
  nnoremap <leader>tbc : TagbarClose<CR>
" }

" My personal Tags  {

  function! LoadTagsByFileType()
    if &filetype == 'c'
        " set tags+=~/tags/tags-nginx
    elseif &filetype == 'rb'
        set tags+=~/tags/tags-gems
      endif
  endfunction

  " set autochdir
  set tags=tags
  autocmd FileType * call LoadTagsByFileType()
  " au FileType c,cpp set tags^=~/tags/tags-nginx
  " au FileType *.erb,*.rb set tags^=~/tags/tags-gems
" }

" Ctags auto update {
  function! DelTagOfFile(file)
    let fullpath = a:file
    let cwd = getcwd()
    let tagfilename = cwd . "/tags"
    let f = substitute(fullpath, cwd . "/", "", "")
    let f = escape(f, './')
    let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
    let resp = system(cmd)
  endfunction

  function! UpdateTags()
    let f = expand("%:p")
    let cwd = getcwd()
    let tagfilename = cwd . "/tags"
    let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
    call DelTagOfFile(f)
    let resp = system(cmd)
  endfunction

  autocmd BufWritePost *.*rb,*.c,*.cpp,*.h,*.erl,*.hrl,*.lua,*.ex,*.exs call UpdateTags()
" }

" Gotags auto update {
  function! UpdateGoTags()
    let f = expand("%:p")
    let cwd = getcwd()
    let tagfilename = cwd . "/tags"
    let cmd = 'gotags -R -silent=true -f ' . tagfilename . ' ./'
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
map <leader>ch :call SetColorColumn()<CR>
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


""""""""""""""""""""""""""""""
" Rainbow Parentheses
"""""""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:html_indent_tags = 'p\|li\|nav'

" au FileType go nmap <leader>r <Plug>(go-run)
" au FileType go nmap <leader>b <Plug>(go-build)
" au FileType go nmap <leader>t <Plug>(go-test)
" au FileType go nmap <leader>c <Plug>(go-coverage)
"
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" autocmd CompleteDone * pclose
