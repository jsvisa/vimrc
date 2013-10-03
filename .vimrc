syn on 

"set paste/nopaste mode {
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
" }

"set ai!                      " 设置自动缩进
"set list                     " 显示Tab符，使用一高亮竖线代替
"set listchars=tab:\|\ ,

filetype on
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全
set encoding=utf8
set expandtab                    " expandtab，用空格代替Tab键
retab                            " 打开vim时把已有的Tab全部转换成空格

autocmd InsertLeave *.* write         " 每次退出插入模式时自动保存
autocmd FocusLost * :wa               "saving on losing focus

" autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js,*.erb,*.rb,*.yml set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType c set tabstop=4 shiftwidth=4 softtabstop=4

set omnifunc=syntaxcomplete#Complete

set bs=2 
set laststatus=2 

"Personal shift width for Ruby html
set shiftwidth=2
set tabstop=2
set softtabstop=2

set cursorline "为光标所在行加下划线
set number "显示行号
set cindent " 自动缩进4空格
set smartindent    " 智能自动缩进
set autoindent
set autoread       "文件在Vim之外修改过，自动重新读入
set autowriteall   "提示保存
set scrolloff=3
set showmode
set showcmd
"set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
hi Search term=standout ctermbg=11 

vnoremap / /\v "add \v after key in /
set ignorecase "搜索小写正文时大小写不敏感，搜索正文包含大写时大小写敏感
set smartcase
"set gdefault
set incsearch "高亮搜索文本
set showmatch
set hlsearch

set fileencodings=uft-8,gbk "使用utf-8或gbk打开文件
"set helplang=cn "帮助系统设置为中文

"set foldmethod=syntax "代码折叠
"set foldmethod=indent "代码折叠

" set wrap "换行设置 {
set nowrap "不换行设置
set formatoptions=qrn1
"}

" set ctrlp {
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 'v'
 
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }
"}

"Easy navigation{
" "noremap" means no recursive mapping
inoremap jj <ESC>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

nnoremap <C-r> :tag<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :
"}

" <leader> hotkey {
let mapleader = ','
nnoremap <leader><space> :noh<cr> 
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t : tabe<CR>
nnoremap <leader>c : tabc<CR>
nnoremap <leader>e : e#<CR>
"}

" Configure for plugins {{ 

    " pathogen{
    call pathogen#infect()
    call pathogen#helptags() "update all plugins help doc
    "}

    " powerline{
    set guifont=PowerlineSymbols\ for\ Powerline
    set nocompatible " 关闭兼容模式
    set t_Co=256
    let g:Powerline_symbols = 'fancy'
    "}

    " CommandT setting {
    let g:CommandTCancelMap='<C-x>'
    let g:CommandTHighlightColor = 'PmenuSel'
    "}

    " Taglist{ 
    let Tlist_Show_One_File = 1 "只显示当前文件的taglist，默认是显示多个
    let Tlist_Exit_OnlyWindow = 1 "如果taglist是最后一个窗口，则退出vim
    let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist
    let Tlist_GainFocus_On_ToggleOpen = 1 "打开taglist时，光标保留在taglist窗口
    let Tlist_Ctags_Cmd='/usr/local/bin/ctags' "设置ctags命令的位置
    " let Tlist_Auto_Open = 0 "每次vim运行时自动打开taglist
    nnoremap <leader>tl : Tlist<CR> 
    " "}

    " My personal Tags  {
    set tags=tags;
    set autochdir
    set tags+=~/tags/tags-ruby-2.0.0
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

    autocmd BufWritePost *.*rb,*.c,*.cpp,*.h call UpdateTags()

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

