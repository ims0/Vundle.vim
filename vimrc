:if version >100
let maplocalleader = " "
set nocompatible
let g:vundle_default_github_url="github.com"
"Vundle{{{
"Set up Vundle:
"git clone https://github.com/ims0/Vundle.vim.git ~/.vim/bundle/Vundle.vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'ims0/Vundle.vim'
Plugin 'Yggdroot/LeaderF'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive' "Git blame
Plugin 'inkarkat/vim-ingo-library' "common autoload functions
Plugin 'ims0/vim-mark'  "Requires the ingo-library.vim plugin
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'godlygeek/tabular'
Plugin 'mbbill/code_complete'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'tpope/vim-rhubarb' "open GitHub URLs
"Plugin 'vim-scripts/cscope.vim'
"{lua
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-lua-ftplugin'
"Plugin 'vim-scripts/luainspect.vim'
"}
"{markdown
"Plugin 'plasticboy/vim-markdown'
"Plugin 'suan/vim-instant-markdown'
"}
"Plugin 'mattn/emmet-vim'
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
nnoremap  <localleader>in :PluginInstall    <cr>
nnoremap  <localleader>li :PluginList      <cr>
"}}}

""let &t_ti.="\e[1 q"
""let &t_SI.="\e[5 q"
""let &t_EI.="\e[1 q"
""let &t_te.="\e[0 q"
"sysdiff"{
""let sys_type = system("uname")
""if sys_type =~? "Darwin*"
""endif
if has("clipboard")
    if has("macunix")
        nnoremap  yy "*yy
        nnoremap  yw "*yw
        vnoremap  y  "*y
        vnoremap  p  "*p
        nnoremap  yf :let @*=expand("%:t")<CR>
        nnoremap  yp :let @*=expand("%:p")<CR>
    elseif has('unix')
        nnoremap  yy "+yy
        nnoremap  yw "+yw
        vnoremap  y  "+y
        vnoremap  p  "+p
        nnoremap  yf :let @+=expand("%:t")<CR>
        nnoremap  yp :let @+=expand("%:p")<CR>
    endif
else
        vnoremap  y  "1y
        vnoremap  p  "1p
        nnoremap  yf :let @"=expand("%:t")<CR>
        nnoremap  yp :let @"=expand("%:p")<CR>
endif
"}"

"my shortcut key{{{
inoremap  jk <esc>
nnoremap  <c-s>  :update<cr>:%s/\t/    /g<cr>
inoremap  <c-s>  <esc>:update<cr>:%s/\t/    /g<cr>
vnoremap  <c-s>  <esc>:update<cr>:%s/\t/    /g<cr>
nnoremap  <localleader>q  :q<cr>
nnoremap  <localleader>qq :q!<cr>
nnoremap  <localleader>wq :wq<cr>
nnoremap  <localleader>wa :wa<cr>
nnoremap  <localleader>qa :qa<cr>
nnoremap  <localleader>s  :%s/
nnoremap  <localleader>sw :%s/<c-r><c-w>/
nnoremap  <localleader><Space> :%s/ *$//g<cr>
nnoremap  <localleader>sh  :bot term ++rows=8 bash<cr>
nnoremap  <localleader>b :<C-u>call gitblame#echo()<CR>
nnoremap  <localleader>y  byw
nnoremap  <localleader>/ :/\<\>
nnoremap  <localleader>? :?\<\>
nnoremap  <localleader>ev :vsplit$MYVIMRC<cr>
nnoremap  <localleader>sv :source$MYVIMRC<cr>
nnoremap  <localleader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap  <localleader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap  <localleader>e :!echo <c-r>"
nnoremap  <localleader>*  bi*<esc>ea*<esc>
nnoremap  <localleader>ma  :set mouse=a<cr>
nnoremap  <localleader>mv  :set mouse=v<cr>
nnoremap  <c-g>  G
cnoremap  <c-a> <home>
cnoremap  <c-e> <end>

"{{{ map ctags,NerdTree:F10,F12
nnoremap <F10>  :TrinityToggleTagList<CR>
nnoremap <localleader>9  :TrinityToggleTagList<CR>
nnoremap <F12>  :TrinityToggleNERDTree<CR>
nnoremap <localleader>0  :TrinityToggleNERDTree<CR>
"}}}

autocmd FileType cpp nnoremap <buffer> <localleader>/ I//<esc>
autocmd FileType c nnoremap <buffer> <localleader>/ I//<esc>
autocmd FileType sh nnoremap <buffer> <localleader>/ I#<esc>
autocmd bufwritepost $HOME/.vim/vimrc source %
"}}}
"设置切换Buffer快捷键"
nnoremap <C-left> :bp<CR>
nnoremap <C-right> :bn<CR>
"选择当前行，不包含前置空格"
nnoremap vv ^vg_

function! Leader_r()
    if &filetype == 'sh'
        :set noautochdir<cr>
        :!bash %
    elseif &filetype == 'vim'
        :%y"
        :@"
    elseif &filetype == 'lua'
        :!lua %
    elseif &filetype == 'python'
        :!python %
    else
        return
    endif
endfunction

nnoremap  <localleader>r :call Leader_r()<cr>

"LeaderF cfg"{
nnoremap  <localleader>f :LeaderfFile<cr>
nnoremap  <localleader>g :Leaderf rg 
nnoremap  <localleader>gg :Leaderf rg <c-r><c-w><cr>
nnoremap  <localleader>bu :LeaderfBuffer<cr>
let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','CMakeFiles','tools'],
        \ 'file': ['*.sw?','~$*','*.ba*','*.exe','*.o','*.a','*.so','*.py[co]']
        \}
"}
"Ycm Config{
" install
" git clone https://github.com/ycm-core/YouCompleteMe.git  ~/.vim/bundle/
" 初始化本地配置文件
" git submodule init
" 检出父仓库列出的commit
" git submodule update

let g:ycm_log_level = 'error'
let g:ycm_max_diagnostics_to_display = 10
nmap <localleader>yfw <Plug>(YCMFindSymbolInWorkspace)
let g:ycm_show_diagnostics_ui = 1  "switch of symtax diagnostic
"default close ycm hover
let g:ycm_auto_hover = "" 
"manually trigger ycm hover
nmap <localleader>y <plug>(YCMHover)
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=0
let g:ycm_error_symbol='E'
let g:ycm_warning_symbol = 'W'
let g:ycm_semantic_triggers = { 'c' : ['->', '.']}
let g:ycm_key_list_select_completion = ['<TAB>','<Down>','<C-j>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>','<C-k>']
set completeopt=preview
"YcmCompleter cmd
"https://github.com/ycm-core/YouCompleteMe#goto-commands"
nnoremap  gf :YcmCompleter GoToDefinitionElseDeclaration<cr>
nnoremap  gr :YcmCompleter GoToReferences<cr>
nnoremap  <localleader>dc :YcmCompleter GoToDeclaration<cr>
nnoremap  <localleader>df :YcmCompleter GoToDefinition<cr>
nnoremap  <localleader>go :YcmCompleter GoTo<cr>
nnoremap  <localleader>gp :YcmCompleter GetParent<cr>
nnoremap  <localleader>ix :YcmCompleter FixIt<cr>
nnoremap  <localleader>= :YcmC Format<cr>
vnoremap  <localleader>=  ggvG=
"}
"NERDtree{
    nnoremap  <localleader>nf :NERDTreeFind<cr>
    " 改变nerdtree的箭头
    ""let g:NERDTreeDirArrowExpandable = '▸'
    ""let g:NERDTreeDirArrowCollapsible = '▾'
    " 设置宽度
    let NERDTreeWinSize=30
    " 在终端启动vim时，共享NERDTree
    let g:nerdtree_tabs_open_on_console_startup=1
    " 忽略文件
    let NERDTreeIgnore=['\.pyc','\~$','\.swp']
    " 显示书签列表
    let NERDTreeShowBookmarks=1
"}

"cscope setting{
if has("cscope")
    set csprg=cscope
    set cscopetag
    set nocscopeverbose
    if filereadable("cscope.out")
        cs add cscope.out ./ -C
    endif
    set cscopeverbose
    "The default value is "" (don't use quickfix anyway)
    set cscopequickfix=""
    nnoremap  <c-@> :cs f 
    nnoremap  <localleader>2c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nnoremap  <localleader>2s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap  <localleader>2t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nnoremap  <localleader>2g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nnoremap  <localleader>2f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nnoremap  <localleader>2i :cs find i <C-R>=expand("<cfile>")<CR><CR>
endif
"}


"设置文件的代码形式
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

let g:win_colorscheme_path=$VIMRUNTIME."/colors/Tomorrow-Night.vim"
let g:colorscheme_path=$HOME."/.vim/bundle/vim-mark/plugin/imscolo.vim"

if has("gui_running")
    "vim的菜单乱码解决：
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "vim提示信息乱码的解决
    language messages zh_CN.utf-8
    set guioptions-=T
    set guioptions-=m
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
    if filereadable(glob(win_colorscheme_path))
        nnoremap <localleader>ms :exec "vsplit".win_colorscheme_path<cr>
        set guifont=Consolas:h13:cANSI
        colorscheme Tomorrow-Night
    endif
else
    if filereadable(glob(colorscheme_path))
        nnoremap <localleader>ms :exec "vsplit".colorscheme_path<cr>
        "colorscheme imscolo
    endif
endif
if has("syntax")
    syntax on
endif

"paste mode{
    :map <F6> :set paste<CR>
    :map <F7> :set nopaste<CR>
    :imap <F6> <C-O>:set paste<CR>
    :imap <F7> <nop>
    :set pastetoggle=<F6>
"}

"fold{
    set foldcolumn=0
    setlocal foldlevel=0
"}
"diff setting{
set diffopt=vertical,context:4
nnoremap  <localleader>df :bufdo diffthis<cr>
"}

set showmatch           " Show matching brackets.
"set ignorecase     " Do case insensitive matching
"set smartcase      " Do smart case matching
set mouse=a
set t_Co=256        "number of colors"
set noswapfile
set nobackup        "no backup
set autoread
set autowrite       " Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set number
set ruler           "show cursor site in right below
set tabstop=4
set shiftwidth=4
set incsearch       " The screen will be updated often,with typing pattern
set hlsearch        " highlight all its matches.
set autoindent
set cindent
set completeopt=longest,menu
set wildmode=list:longest
set laststatus=2

"{
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
       return "\<Right>"
    else
       return a:char
    endif
endfunction

inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
"}



"
"term gdb debug{
function! TermdebugAdd()
    exe "packadd termdebug"
    :Termdebug
endfunction
nnoremap  <localleader>d :call TermdebugAdd()<cr>
"}

"{
    nnoremap > V>
    nnoremap <s-tab> V<
    vnoremap > >gv
    vnoremap <s-tab> <gv
"}

"minibufexplore settings{
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapWindowNavArrows = 2
    let g:miniBufExplMapCTabSwitchBufs = 1
    let g:miniBufExplModSelTarget = 1
    let g:bufExplorerMaxHeight=3
    ""let g:miniBufExplUseSingleClick = 1
"}
"sdvc{
set keywordprg=sdcv\ -u\ 朗道英汉字典5.0
function! Mydict()
    let retstr=system('sdcv '.expand("<cword>"))
    windo if expand("%")=="dict-win" |q!|endif
    30vsp dict-win
    setlocal buftype=nofile bufhidden=hide noswapfile
    1s/^/\=retstr/
    1
endfunction
nnoremap F :call Mydict()<CR>
"use sdcv instead man
set keywordprg=sdcv
"}
"
"sys ls{
function! Sysls()
    let retstr=system('ls')
    bufdo if expand("%")=="_sys_ls" |bd _sys_ls|endif
    30vsp _sys_ls
    setlocal buftype=nofile bufhidden=hide noswapfile
    1s/^/\=retstr/
    1
endfunction
    :nnoremap  <localleader>ls :call Sysls()<cr>
"}

"create job{
func! BuildcsEcho(channel, msg)
    echo a:msg
endfunc

func! RefreshCscope()
    call job_start([ './buildcs.sh'], {'callback': 'BuildcsEcho'})
endfunc
nnoremap <F3> :call RefreshCscope()<cr>
"}

"show run result{
function! ExecProm(onlyCompile)
    "let l:currFile=expand("%")
    "echomsg "cursor buffer:".l:currFile
    if empty(expand("%"))
        redraw | echo "fileName is empty"
        return
    endif
    exec "w"
    let headtitle  = system("echo -e '------------compile result--------------'")
    let runResLine = system("echo -e '--------------run result----------------'")
    if &filetype == 'c'
        let compileResu = system('gcc '.expand('%').' -lrt -o '.expand('%<'))
        if ! a:onlyCompile 
            let runResu=headtitle.compileResu.runResLine .system('./'.expand('%<'))
        endif
    elseif &filetype == 'cpp'
        let compileResu = system('g++ -std=c++11 '.expand('%').' -lpthread -lrt -o '.expand('%<'))
        if ! a:onlyCompile 
             let runResu=headtitle.compileResu.runResLine .system('./'.expand('%<'))
        endif
    elseif &filetype == 'python'
        let runResu=runResLine .system('python3 '.expand('%'))
    elseif &filetype == 'lua'
        let runResu=runResLine .system('lua '.expand('%'))
    elseif &filetype == 'sh'
        let runResu=runResLine .system('sh '.expand('%'))
    else
        return
    endif

    if a:onlyCompile && empty(compileResu)
        redraw | echo "Compile OK"
        return
    endif
    bufdo if expand("%")=="resultBuff" |bd resultBuff|endif
    bot 9sp resultBuff
    setlocal buftype=nofile bufhidden=hide noswapfile
    if a:onlyCompile
        1s/^/\=headtitle.compileResu/
    else
        1s/^/\=runResu/
    endif
    1
endfunction
nnoremap  <localleader>ll :call ExecProm(0)<cr>
nnoremap  <localleader>l :call ExecProm(1)<cr> 
autocmd BufNewFile,BufWrite * :syntax match operators "\<compile result\>"
autocmd BufNewFile,BufWrite * :syntax match operators "\<run result\>"
hi operators ctermfg = DarkCyan
"}

"{
au BufNewFile,BufRead *.h set filetype=h
autocmd BufNewFile *.cpp,*.c,*.h,*.sh,  exec ":call SetTitle()"
func! SetTitle()
    if &filetype == 'sh'
        call setline(1,          "\#!/bin/bash")
        call append(line("."),   "\##########################################################")
        call append(line(".")+1, "\# File Name: ".expand("%"))
        call append(line(".")+2, "\# Author: ims")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\##########################################################")
        call append(line(".")+5, "")
    else
        call setline(1,          "/*********************************************************")
        call append(line("."),   "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: ims")
        call append(line(".")+2, "    > Created Time: ".strftime("%c"))
        call append(line(".")+3, " *********************************************************/")
        call append(line(".")+4, "")
    endif

    if &filetype == 'c'
        call append(line(".")+5, "#include <stdio.h>")
        call append(line(".")+6, "#include <string.h>")
        call append(line(".")+7, "#include <stdlib.h>")
        call append(line(".")+8, "#include <unistd.h>")
        call append(line(".")+9, "")
    endif

    if &filetype == 'cpp'
        call append(line(".")+5, "#include <iostream>")
        call append(line(".")+6, "#include <string>")
        call append(line(".")+7, "#include <vector>")
        call append(line(".")+8, "using namespace std;")
        call append(line(".")+9, "")
    endif

    if &filetype == 'cpp' || &filetype == 'c'
        call append(line(".")+10, "int main()")
        call append(line(".")+11, "{")
        call append(line(".")+12, "\t")
        call append(line(".")+13, "\treturn 0;")
        call append(line(".")+14, "}")
    endif
    if &filetype == 'h'
        let fileName = strpart(expand("%"),0,strlen(expand("%"))-2)
        let headFileMacro = toupper(fileName).'_H'
        call append(line(".")+5, '#ifndef '.headFileMacro)
        call append(line(".")+6, '#define '.headFileMacro)
        call append(line(".")+7, "")
        call append(line(".")+8, " ")
        call append(line(".")+9, "#endif")
        set filetype=cpp
    endif

    normal 14G"
endfunc
autocmd BufRead *.h set filetype=cpp
"}
function! Show(start, ...)
    echohl Title
    echomsg "start is ". a:start
    echohl None
    let index=1
     while index <= a:0
        echo " arg ".index." is ". a:{index}
        let index = index+1
    endwhile
endfunction
:endif
