"let g:deoplete#enable_at_startup = 1

"设置Leder键为space
let mapleader=" "

"Shift + R 是重载.vimrc文件
map R :source $MYVIMRC<CR>

"适配文件
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"使用鼠标
set mouse=a

"设置编码
set encoding=utf-8

"设置字体
set guifont=Consolas

"使配色适合欣赏
let &t_ut=''

"使光标不沉底
set scrolloff=8

"显示行号
set number

"让字不会超出窗口大小
set wrap

"状态栏显示当前执行的命令
set showcmd	

"自动补全命令时候使用菜单式匹配列表
set wildmenu	

"TAB缩进以及统一缩进为4
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"高亮光标所在行
"set cursorline	

"标尺功能，显示当前光标所在行，列
set ruler

"继承前一行的缩进方式
"set autoindent	

"边输入边高亮
set incsearch	

"高亮被搜索的句子
set hlsearch	

"exec 为在运行时自动执行
exec "nohlsearch"

"搜索时忽略大小写
set ignorecase	

"语法高亮
syntax enable	

"更改键位
noremap a h
noremap w k
noremap s j
noremap d l

"i代替w
"noremap w i

"m是MarkdownPreview
"leader+m是取消MarkdownPreview
map m :MarkdownPreview<CR>
map <LEADER>m :MarkdownPreviewStop<CR>

"w是在筛选时进入下一个
noremap n w

"Shift + s 是保存
map S :w<CR>
"map s <nop>

"Shift + q 是退出
map Q :q<CR>

"向上(up)/下(below)/左(left)/右(right)分屏
map <LEADER><UP> :set nosplitbelow<CR>:split<CR>
map <LEADER><DOWN> :set splitbelow<CR>:split<CR>
map <LEADER><LEFT> :set nosplitright<CR>:vsplit<CR>
map <LEADER><RIGHT> :set splitright<CR>:vsplit<CR>

"切换分屏的快捷键
map <LEADER>w <C-w>k
map <LEADER>s <C-w>j
map <LEADER>a <C-w>h
map <LEADER>d <C-w>l

"改变分屏大小
map <UP> :res +5<CR>
map <DOWN> :res -5<CR>
map <LEFT> :vertical resize-5<CR>
map <RIGHT> :vertical resize+5<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-plug	安装包的管理器	github上下载
call plug#begin('~/.vim/plugged')

"状态栏vim-airline
Plug 'https://github.com/vim-airline/vim-airline'

"配色vim-snazzy
Plug 'https://github.com/connorholyday/vim-snazzy'

"配色vim-solarized
Plug 'https://github.com/altercation/vim-colors-solarized'

"nerdtree   文件资源管理器
Plug 'https://github.com/scrooloose/nerdtree'

"YouCompleteMe  代码自动补全工具
"Plug 'https://github.com/ycm-core/YouCompleteMe'

"ale    代码错误提示
Plug 'https://github.com/dense-analysis/ale'

"tagbar 显示函数列表
"Plug 'https://github.com/majutsushi/tagbar'

"undotree 浏览文件历史
Plug 'https://github.com/mbbill/undotree'

"markdown-preview   markdown浏览工具
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

"Plug 'https://github.com/Shougo/deoplete.nvim'

"completor.vim 国人制作的超方便的代码补全工具
"Plug 'maralla/completor.vim'

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"vim-snazyy的配置
"colorscheme snazzy
"let g:SnazzyTransparent = 1

"vim-solarized的配置
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

"let g:completor_clang_binary = '/path/to/clang'
