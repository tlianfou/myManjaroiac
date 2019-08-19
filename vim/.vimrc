"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/
"                                   --by taifu
""""""""""""""""""""""""""""""""""""""""""""""""""


"打开英语单词的拼写检查
set spell spelllang=en_us

"Shift + R 是重载.vimrc文件
map R :source $MYVIMRC<CR>

"适配文件
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"显示行尾多余的空格
set listchars=tab:▸\ ,trail:▫
set list

"出错时别bb
set noerrorbells

"使用鼠标
set mouse=a

"设置编码
set encoding=utf-8

"使配色适合欣赏
let &t_ut=''

"启用256色
set t_Co=256

"使光标不沉底
set scrolloff=8

"显示行号
set number

"让字不会超出窗口大小,自动折行
set wrap
set linebreak

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
set autoindent
set smartindent

"搜索时边输入边高亮
set incsearch

"高亮被搜索的句子
set hlsearch

"exec 为在运行时自动执行
exec "nohlsearch"
"exec "highlight SpellBad term=underline cterm=underline gui=underline"

"搜索时忽略大小写
set ignorecase

"语法高亮
syntax enable

"设置Leder键为space
let mapleader=","

"更改键位
map ; :
noremap <SPACE><UP> 5<UP>
noremap <SPACE><DOWN> 5<DOWN>
imap <C-z> <Esc>ui

"Shift + s 是保存
map S :w<CR>
map s <nop>

"Shift + q 是退出
map Q :q<CR>

"改变光标样式
"let &t_SI = "\<ESC>]50;CursorShape=1\x7"
"let &t_SR = "\<ESC>]50;CursorShape=2\x7"
"let &t_EI = "\<ESC>]50;CursorShape=0\x7"



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-plug   安装包的管理器  github上下载
call plug#begin('~/.vim/plugged')

"状态栏vim-airline
Plug 'https://github.com/vim-airline/vim-airline'

"nerdtree   文件资源管理器
"Plug 'https://github.com/scrooloose/nerdtree'

"YouCompleteMe  代码自动补全工具
"Plug 'https://github.com/ycm-core/YouCompleteMe'

"ale    代码错误提示
"Plug 'https://github.com/dense-analysis/ale'

"tagbar 显示函数列表
"Plug 'https://github.com/majutsushi/tagbar'

"undotree 浏览文件历史
"Plug 'https://github.com/mbbill/undotree'

"markdown-preview   markdown浏览工具
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

"vim-table-mode markdown表格生成工具
Plug 'https://github.com/dhruvasagar/vim-table-mode'

"vim-markdown-toc目录生成工具
Plug 'https://github.com/mzlogin/vim-markdown-toc'

"配色vim-snazzy
Plug 'https://github.com/connorholyday/vim-snazzy'

"配色vim-solarized
Plug 'https://github.com/altercation/vim-colors-solarized'

"配色vim-hybrid
Plug 'https://github.com/w0ng/vim-hybrid'

"配色vim-papercolor
Plug 'https://github.com/NLKNguyen/papercolor-theme'

"配色vim-monokai
Plug 'https://github.com/sickill/vim-monokai'

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"markdownpreview的配置
"设置markdownpreview的默认打开浏览器
let g:mkdp_browser = 'chromium'
"m是MarkdownPreview
"leader+m是取消MarkdownPreview
map m :MarkdownPreview<CR>
map <LEADER>m :MarkdownPreviewStop<CR>
source ~/.vim/_markdown_preview.vim

"vim-table-mode的配置
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"vim-markdown-toc的设置
let g:vmt_cycle_list_item_markers = 1

"vim-snazyy的配置
"colorscheme snazzy
"let g:SnazzyTransparent = 1

"vim-solarized的配置
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

"vim-hybrid的配置
"set background=dark
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
"colorscheme hybrid

"vim-papercolor的配置
"set background=dark
"let g:PaperColor_Theme_Options = {
"  \   'theme': {
"  \     'default': {
"  \       'transparent_background': 1
"  \     }
"  \   }
"  \ }
"colorscheme PaperColor

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:completor_clang_binary = '/path/to/clang'

""""""""""""""""""""""""分屏，基本永不到""""""""""""""""""
"向上(up)/下(below)/左(left)/右(right)分屏
"map <LEADER><UP> :set nosplitbelow<CR>:split<CR>
"map <LEADER><DOWN> :set splitbelow<CR>:split<CR>
"map <LEADER><LEFT> :set nosplitright<CR>:vsplit<CR>
"map <LEADER><RIGHT> :set splitright<CR>:vsplit<CR>

"切换分屏的快捷键
"map <LEADER>w <C-w>k
"map <LEADER>s <C-w>j
"map <LEADER>a <C-w>h
"map <LEADER>d <C-w>l

"改变分屏大小
"map <UP> :res +5<CR>
"map <DOWN> :res -5<CR>
"map <LEFT> :vertical resize-5<CR>
"map <RIGHT> :vertical resize+5<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

