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

####Jumps
`:tags` show records/p>
`:ptag function` show the function preview</p>
`:pclose` close preview
<Ctrl+]> jumps to the definiement</p>
<Ctrl+T> jumps backward</p>
<Ctrl+O> jumps forward</p>

