Vimcfg
======

My private vim configuration including .vim/ directory and .vimrc file

###Hint: 
You should create a symbol link to ./.vimrc,</p> 
otherwise Vim can't read ~/.vim/ directory.</p>

eg: `ln -s ~/.vim/.vimrc ~/.vimrc`, or you can use the '$ sh create_vim_link.sh' to replace it. 

###Useful vim commands:
`:scriptnames  show the vim loading configure files`</p>
`:echo $VIM    show vim path`</p>
在Vim中直接进行转换文件编码,比如将一个文件转换成utf-8格式:
`:set fileencoding=utf-8`</p>

<Ctrl+w+o> 将当前分屏最大化

**tab** 多窗口

    :tabnew file 新窗口中打开一个文件
    :tabc       关闭当前的tab
    :tabo       关闭所有其他的tab
    :tabs       查看所有打开的tab
    :tabp      前一个
    :tabn      后一个
    标准模式下：
 
gt, gT 可以直接在tab之间切换。
    gt, gT 可以直接在tab之间切换。

####Jumps
`:tags` show records</p>
`:ptag function` show the function preview</p>
`:pclose` close preview
<Ctrl+]> jumps to the definiement</p>
<Ctrl+T> jumps backward</p>
<Ctrl+O> jumps forward</p>

###Ctrlp
<Ctrl+Y> 新建一个文件

<Ctrl+D> 切换到匹配文件名，而非路径名

<Ctrl+Z> 标注打开的文件，多文件同时打开时使用

<Ctrl+O> 同时打开多个文件
