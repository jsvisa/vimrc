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
��Vim��ֱ�ӽ���ת���ļ�����,���罫һ���ļ�ת����utf-8��ʽ:
`:set fileencoding=utf-8`</p>

<Ctrl+w+o> ����ǰ�������

**tab** �ര��

    :tabnew file �´����д�һ���ļ�
    :tabc       �رյ�ǰ��tab
    :tabo       �ر�����������tab
    :tabs       �鿴���д򿪵�tab
    :tabp      ǰһ��
    :tabn      ��һ��
    ��׼ģʽ�£�
 
gt, gT ����ֱ����tab֮���л���
    gt, gT ����ֱ����tab֮���л���

####Jumps
`:tags` show records</p>
`:ptag function` show the function preview</p>
`:pclose` close preview
<Ctrl+]> jumps to the definiement</p>
<Ctrl+T> jumps backward</p>
<Ctrl+O> jumps forward</p>

###Ctrlp
<Ctrl+Y> �½�һ���ļ�

<Ctrl+D> �л���ƥ���ļ���������·����

<Ctrl+Z> ��ע�򿪵��ļ������ļ�ͬʱ��ʱʹ��

<Ctrl+O> ͬʱ�򿪶���ļ�
