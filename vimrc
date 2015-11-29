runtime! debian.vim
syntax on
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals
set clipboard=unnamed

"let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType='<C-X><C-U>'

syntax enable
syntax on

"lastest close
autocmd BufReadPost *
	\ if line("'\"")>0&&line("'\"")<=line("$")|
	\ exe "normal g'\""|
	\ endif



set ai
"set cindent
"set shiftwidth=8
"set tabstop=8
"set softtabstop=8
"set expandtab
"set expandtab
                                
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set showcmd
"set ai
set hls
set number
"set paste


set tags=./;../
filetype plugin indent on
"开启文件类型侦测
filetype on
""根据侦测到的不同类型加载对应的插件
filetype plugin on
"根据侦测到的不同类型采用不同的缩进格式
filetype indent on
""取消补全内容以分割子窗口形式出现，只显示补全列表
set completeopt=longest,menu


autocmd Filetype c set omnifunc=ccomplete#Complete
autocmd Filetype c++ set omnifunc=ccomplete#Complete
let g:winManagerWidth=20 " How wide should it be( pixels)
"let g:winManagerWindowLayout = ' FileExplorer, TagsExplorer | BufExplorer ' "What windows should it
let g:persistentBehaviour=0 
nmap wm :WMToggle<CR>
let winManager_Use_SinagleClick=1
let winManager_Use_Right_Window = 1 " split to the right side of the screen
"let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
let AutoOpenWinManager = 1

"let Tlist_Sort_Type = "name" " order by 
"let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Use_LEFT_Window=1
let Tlist_Compart_Format = 1 " show small meny
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_File_Fold_Auto_Close = 1 " Do not close tags for other files
let Tlist_Enable_Fold_Column = 1 " Do not show folding tree
let Tlist_Auto_Update = 1
"let Tlist_Use_SingleClick=1
let Tlist_Show_One_File = 0
let Tlist_Auto_Open = 0
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Process_File_Always=1 
let Tlist_Exit_OnlyWindow = 1
"let Tlist_WinHeight=10
let Tlist_WinWidth=27
nmap <F4> 	:cs find g <C-R>=expand("<cword>")<CR><CR>

nmap <F7> 	:set nonumber<CR>
nmap <F3> 	:Tlist<CR>
nmap <F6> 	:WMToggle<CR>
"nmap <F10> 	:cs find f <C-R>=expand("<cword>")<CR><CR>

nmap <F2> 	:cscope add ~/cscope/cscope.out<CR>

"nmap <F9> 	:%s/\([^\t][^\t][^\t][^\t][^\t][^t]\{-}[^{]\)\([{]\)/\1\r\2/g<<CR>
"nmap <F12> 	:%s/\([^\t][^\t][^\t][^\t][^\t][^\t][^\t][^\t][^\t][^\t][^\t][^\t][^\t][^t]\{-}[^{]\)\([{]\)/\1\r\2/g<CR>
"nmap <F10> 	:%s/}/}\r/g<CR>
"map  ff		:%!indent -gnu -bad -bls -bl -nbc -lp -l110 -nce -fca -bli0 -i8 -ut -npcs -npsl -sob -nprs -nsai -nsaw -nsaf -bap -sc -ncs -lp -nip;gg=G<CR><CR>;gg=G<CR>
"map  fm		:%!indent -gnu -bad -bls -bl -nbc -lp -l110 -nce -cdw  -bli0 -i8 -ut -npcs -npsl -sob -nprs -nsai -nsaw -nsaf -bap -sc -ncs -lp -nip -bbb -cdw -cdb <CR>;%!gg=G<CR>
"map ff :%!astyle --style=ansi --indent=spaces=8 <CR>
map ff :%!astyle --style=linux --indent=force-tab --brackets=linux<CR>
"map ff :%!/home/c00261379/work/cscope/astyle --style=kr --indent=tab<CR>
let &termencoding=&encoding
set fileencodings=utf-8,gbk

nmap <F5> :!gcc % -o %_o;./%_o<CR>
nmap <F8> :set mouse=<CR>
nmap <F9> :set mouse=a<CR>

"yellow
"hi CursorLine    cterm=NONE ctermbg=white ctermbg=229
"blue
hi CursorLine    cterm=NONE ctermbg=white ctermbg=195
"hi CursorLine    cterm=NONE ctermbg=white ctermbg=232
"black
"hi CursorLine    cterm=NONE ctermbg=white ctermbg=236
"white
"hi CursorLine    cterm=NONE ctermbg=white ctermbg=253
"hi CursorLine    cterm=NONE ctermbg=white
"highlight LineNr cterm=NONE  ctermfg=DarkRed  ctermbg=LightGray
"highlight LineNr cterm=NONE  ctermfg=124
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=blue
set cursorline


set path=/home/c00261379/work/hikey/hikey-kernel,/usr/include

"set equalprg =prolog

map gs :nohlsearch<CR>
nmap m :Mark <C-R>=expand("<cword>")<CR><CR>
map gn :set nonumber<CR>
map gl :set number<CR>
map fy :Gtrans<CR>
map <F12> :tabnext<CR>
map <F10> 	:tabnew<CR>
"map <F9> 	:Explore<CR>
map <F11> :tabprevious<CR>
map <M-m> :set nonumber<CR>
map <C-q> <C-w>w
map z %
set guifont=WenQuanYi\ Micro\ Hei\ Mono\ 11
set t_Co=256
"map <F12> :ConqueTerm bash<CR>
"nmap <F7> :!gcc % -o %_o;./%_o<CR>

let g:tagbar_width = 27
let g:tagbar_left = 1
let g:tagbar_ctags_bin ="/usr/bin/ctags"
let g:tagbar_singleclick = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_foldlevel = 2
highlight TagbarScope guifg=Green ctermfg=Green

function Test()
	let name = expand("%")
	if name =~ "TransWindow"
		:q
	endif
	if name !~ "TransWindow"
		Gtrans
	endif
endfunction

"map \ :call Test()<CR>



"status bar
set statusline+=%#StatusLineNC#Git\ %#ErrorMsg#\%{GitBranchInfoTokens()[0]}\%#StatusLine#

set laststatus=2
set statusline+=\ \ \ \ \ 
set statusline+=lines:%03l/%L(%p%%)
set statusline+=\ \ \ \ \ 
set statusline+=%{strftime(\"date:%Y-%m-%d\ %H:%M\"\)}
set statusline+=\ \ \ \ \ 
set statusline+=format:%{&ff}:%{&fenc!=''?&fenc:&enc}\ 
set statusline+=\ \ \ \ \ 
set statusline+=%f

"set rulerformat=%15(%c%V\ %p%%%)

:match Ignore /\r$/

if exists("b:current_syntax")
        finish
endif

let g:neocomplcache_enable_at_startup = 1

syntax region dtsComment        start="/\*"  end="\*/"
syntax match  dtsReference      "&[[:alpha:][:digit:]_]\+"
syntax region dtsBinaryProperty start="\[" end="\]" 
syntax match  dtsStringProperty "\".*\""
syntax match  dtsKeyword        "/.*/"
syntax match  dtsLabel          "^[[:space:]]*[[:alpha:][:digit:]_]\+:"
syntax region dtsCellProperty   start="<" end=">" contains=dtsReference,dtsBinaryProperty,dtsStringProperty,dtsComment
syntax region dtsCommentInner   start="/\*"  end="\*/"

hi def link dtsCellProperty     Number
hi def link dtsBinaryProperty   Number
hi def link dtsStringProperty   String
hi def link dtsKeyword          Include
hi def link dtsLabel            Label
hi def link dtsReference        Macro
hi def link dtsComment          Comment
hi def link dtsCommentInner     Comment 


function Printkdebugmsg()
	let l:printk_str='printk(KERN_ERR "puck %s %d \n",__func__,__LINE__);'
	exec "normal o".l:printk_str
	startinsert
endfunction

map <F5> :call Printkdebugmsg()<CR>

"let g:rainbow_active = 1
"rainbow
    let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['blue', 'yellow', 'cyan', 'magenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}
