syn on
filetype on
filetype plugin on               " 针对不同的文件类型加载对应的插件
filetype plugin indent on        " 启用自动补全
set encoding=utf8
set expandtab                    " expandtab，用空格代替Tab键

autocmd InsertLeave *.* write    " 每次退出插入模式时自动保存
autocmd FocusLost * :wa          "saving on losing focus

" autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js,*.erb,*.rb,*.yml set tabstop=2 shiftwidth=2 softtabstop=2
" autocmd FileType c set tabstop=4 shiftwidth=4 softtabstop=4

" Pathogen {
  call pathogen#infect()
  call pathogen#helptags() "update all plugins help doc
" }

set omnifunc=syntaxcomplete#Complete
" set path=**
" set completeopt=longest,menuone

set bs=2
set shiftwidth=4
set tabstop=4
set softtabstop=4

set grepprg=ack
map <F3> :cp<cr>
map <F4> :cn<cr>

" set cursorline " 为光标所在行加下划线
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
set ignorecase "搜索小写正文时大小写不敏感，搜索正文包含大写时大小写敏感
set smartcase
set incsearch "高亮搜索文本
set showmatch
set hlsearch

set fileencodings=utf-8 ",gbk "使用utf-8或gbk打开文件

" set wrap   "换行设置
set formatoptions=qrn1

" Settings of ctrlp {
  let g:ctrlp_open_new_file = 't'
  let g:ctrlp_open_multiple_files = 'v'

  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git)$',
    \ 'file': '\v\.(log|jpg|png|jpeg)$',
    \ }
" }

" Easy navigation {
  " 'noremap' means no recursive mapping
  inoremap jj <ESC>

  nnoremap gcc gcc<ESC>
  nnoremap <F8> :!
  nnoremap <F10> :Ack
  nnoremap <F5> :!pry<CR>

  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  nnoremap <C-l> gt
  nnoremap <C-h> gT
  " nnoremap <C-r>      :tag<CR>

  inoremap <F1> <ESC>
  nnoremap <F1> <ESC>
  vnoremap <F1> <ESC>
  nnoremap ; :
" }

" <leader> hotkey {
  let mapleader = ','
  nnoremap <leader><space> :noh<cr>
  nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
  nnoremap <leader>t  :tabe<CR>
  nnoremap <leader>c  :tabc<CR>
  nnoremap <leader>e  :e#<CR>
  " nnoremap <leader>,e  :e <CR>=expand("%:p:h") .  '/' <CR>
  nnoremap <leader>vm :e ~/.vim/vimrc<CR>
  nnoremap <leader>rb :e ~/.vim/bundle/vim-snipmate/snippets/<CR>
  nnoremap <leader>so :source ~/.vimrc<CR>
  nnoremap <leader>ne :NERDTree<CR>
  nnoremap <leader>nc :NERDTreeClose<CR>

  nnoremap <leader>gs :GitStatus<cr>
  nnoremap <leader>gc :GitCommit<cr>
  nnoremap <leader>ga :GitAdd<cr>
  nnoremap <leader>gp :GitPush<cr>
  nnoremap <leader>gl :GitPull<cr>
  nnoremap <leader>r  :Rake!<cr>
  nnoremap <leader>rr :.Rake!<cr>
  inoremap (    ()<left>
  " inoremap [    []<left>
  inoremap "    ""<left>
  " inoremap '    ''<left>
" }

" Set paste/nopaste mode {
  nnoremap <F2>         :set invpaste paste?<CR>
  inoremap <F2> <C-O>   :set invpaste paste?<CR>
  set pastetoggle=<F2>
  " copy selection to system clipboard in Mac Os X
  vnoremap <C-x> :!pbcopy<CR>
  vnoremap <C-c> :w !pbcopy<CR><CR>
" }

" Display extra whitespace {
  set list listchars=tab:»·,trail:·

  fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'snippets'
        return
    endif
    %s/\s\+$//e
  endfun

  autocmd BufWritePre * call StripTrailingWhitespace()
  autocmd BufWritePre * retab
" }

" Powerline {
  set guifont=PowerlineSymbols\ for\ Powerline
  set nocompatible
  set laststatus=2
  " set statusline=%f:\ %l
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
  nnoremap <leader>tl : Tlist<CR>
" }

" My personal Tags  {
  " set autochdir
  set tags=tags
  set tags+=~/tags/tags
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

  autocmd BufWritePost *.*rb,*.c,*.cpp,*.h,*.erl call UpdateTags()
" }

" vimdiff color scheme
highlight DiffChange cterm=none ctermfg=black ctermbg=LightGreen gui=none guifg=bg guibg=LightGreen
highlight DiffText cterm=none ctermfg=black ctermbg=Red gui=none guifg=bg guibg=Red

" Git Gutter {
    nnoremap <leader>ggt :GitGutterToggle<cr>
    let g:gitgutter_enabled = 0
" }

" Markdown disable folding {
    let g:vim_markdown_folding_disabled=1
" }

map ,ch :call SetColorColumn()<CR>
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

" autocmd FileType cucumber compiler cucumber | setl makeprg=cucumber\ \"%:p\"
" autocmd FileType ruby
"   \ if expand('%') =~# '_test\.rb$' |
"   \   compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
"   \ elseif expand('%') =~# '_spec\.rb$' |
"   \   compiler rspec | setl makeprg=rspec\ \"%:p\" |
"   \ else |
"   \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
"   \ endif
" autocmd User Rake
"   \ if &makeprg !~# 'bundle' | setl makeprg^=bundle\ exec\  | endif

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

