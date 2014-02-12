Vimcfg
======

My private vim configuration including *.vim/* directory and *.vimrc* file

###Hint:
You should create a symbol link to *./.vimrc*,

otherwise Vim can't read *~/.vim/* directory.

eg: `ln -snf ~/.vim/vimrc ~/.vimrc`

###Useful vim commands:
`:scriptnames  show the vim loading configure files`</p>
`:echo $VIM    show vim path`</p>

在Vim中直接进行转换文件编码,比如将一个文件转换成 utf-8 格式:

`:set fileencoding=utf-8`</p>

`<Ctrl+w+o>` 将当前分屏最大化

**tab** 多窗口

    :tabnew file 新窗口中打开一个文件
    :tabc       关闭当前的tab
    :tabo       关闭所有其他的tab
    :tabs       查看所有打开的tab
    :tabp      前一个
    :tabn      后一个
    标准模式下：

gt, gT 可以直接在tab之间切换。

####Jumps
`:tags` show records</p>
`:ptag function` show the function preview</p>
`:pclose` close preview
`<Ctrl+]>` jumps to the definiement</p>
`<Ctrl+T>` jumps backward</p>
`<Ctrl+O>` jumps forward</p>

###Ctrlp
`<Ctrl+p>` 启用CtrlP

`<Ctrl+Y>` 新建一个文件

`<Ctrl+D>` 切换到匹配文件名，而非路径名

`<Ctrl+Z>` 标注打开的文件，多文件同时打开时使用

`<Ctrl+O>` 同时打开多个文件

###Vimdiff
`]c` go to the next diff

`[c` go to the previous diff

`dp` diff put

`do` diff get

`:diffupdate` update a diff point

###Ack

`:Ack -Q "*file"` 纯文本方式查找 "*file"

###ctags

    $ ctags -R   --exclude=*.js ~/.rvm/gems/ruby-2.0.0-p247/gems/

###NerdTree
在nerdtree窗口常用操作：(小写当前，大写root)

* x.......Close the current nodes parent收起当前目录树
* R.......Recursively refresh the current root刷新根目录树
* r.......Recursively refresh the current directory刷新当前目录
* P.......Jump to the root node
* p.......Jump to current nodes parent
* K.......Jump up inside directories at the current tree depth  到同目录第一个节点
* J.......Jump down inside directories at the current tree depth 最后一个节点
* o.......Open files, directories and bookmarks
* i.......Open selected file in a split window上下分屏
* s.......Open selected file in a new vsplit左右分屏
