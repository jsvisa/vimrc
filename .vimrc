syn on 

"paste keeping
"autocmd InsertEnter * setlocal paste
"autocmd InsertLeave * setlocal nopaste

"set nopaste
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

"auto run command on run vim
"autocmd VimEnter * NERDTree
"set guifont=Monaco:h10       " 适合Ruby开发的字体 && 字号
"set cindent shiftwidth=4     " 自动缩进4空格
"set smartindent              " 智能自动缩进
"set ai!                      " 设置自动缩进
"set nu!                      " 显示行号
"set mouse=a                  " 启用鼠标
"set nowrapscan               " 搜索到文件两端时不重新搜索
"set vb t_vb=                 " 关闭提示音
"set hidden                   " 允许在有未保存的修改时切换缓冲区
"set list                     " 显示Tab符，使用一高亮竖线代替
"set listchars=tab:\|\ ,

filetype on
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

set omnifunc=syntaxcomplete#Complete

"common conf 
set bs=2 
set laststatus=2 

"Personal shift width for Ruby html
" autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js set noexpandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js,*.erb,*.rb set tabstop=2 shiftwidth=2 softtabstop=2
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab 
"set cursorline "为光标所在行加下划线
set number "显示行号
"set nonumber "不显示行号
set autoread "文件在Vim之外修改过，自动重新读入
set autowriteall "使用tag跳转时先提示保存
set scrolloff=3
set autoindent
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

"nnoremap / /\v "add \v after key in /
vnoremap / /\v
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
set textwidth=80
set formatoptions=qrn1
"}

"Easy navigation{
inoremap jj <ESC>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :

au FocusLost * :wa "saving on losing focus
"}

"用户自定义快捷键{
let mapleader = ','
nnoremap <leader><space> :noh<cr> 
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"nnoremap <C-l> gt
"nnoremap <C-h> gT
"nnoremap <leader>t : tabe<CR>
"}

"conf for plugins {{ 插件相关的配置

"pathogen是Vim用来管理插件的插件
"pathogen{
call pathogen#infect()
"}

"状态栏的配置 
"powerline{
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
"let Tlist_Auto_Open = 0 "每次vim运行时自动打开taglist
nnoremap <leader>tl : Tlist<CR> 
"}

"Tags from delweng {
set tags=./tags
set tags+=~/tags/tags-ruby-2.0.0
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
" autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()
autocmd BufWritePost *.*rb call UpdateTags()
" }

"cscope{
 
    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

"    " add any exiting csope database from above directory
"    let db = findfile("cscope.out", ".;")
"    if (!empty(db))
"        let path = strpart(db, 0, match(db, "/cscope.out$"))
"        set nocscopeverbose " suppress 'duplicate connection' error
"        exe "cs add " . db . " " . path
"        set cscopeverbose
"    endif
"
"    " add any cscope database in current directory
"    if filereadable("cscope.out")
"        cs add cscope.out  
"    " else add the database pointed to by environment variable 
"    elseif $CSCOPE_DB != ""
"        cs add $CSCOPE_DB
"    endif

    " show msg when any other cscope db added
    "set cscopeverbose 

   " add user defined cscope db
    "cs add ~/workdir/dm365/dvsdk_2_10_01_18/qt/qt-everywhere-opensource-src-4.6.2/examples/cscope.out ~/workdir/dm365/dvsdk_2_10_01_18/qt/qt-everywhere-opensource-src-4.6.2/examples/

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

"}

"}}

