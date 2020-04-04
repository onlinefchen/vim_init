" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
Plugin 'gmarik/vundle'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'taglist.vim'
Plugin 'matrix.vim--Yang'
Plugin 'SuperTab'
Plugin 'EasyGrep'
Plugin 'Mark'
Plugin 'shougo/neocomplcache.vim'
Plugin 'tpope/vim-markdown'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'The-NERD-Commenter'
"=========================================================
set number
set ai
set ignorecase
map ff :%!cp ~/bin/linux-format ./.clang-format; clang-format -style=file; rm ./.clang-format<CR>
map fr :StripWhitespace<CR>
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
map gs :nohlsearch<CR>
map gn :set nonumber<CR>
map gl :set number<CR>
map fy :Gtrans<CR>
nmap <F7> 	:set nonumber<CR>
nmap <F3> 	:Tlist<CR>
nmap <F6> 	:WMToggle<CR>
map <F12> :tabnext<CR>
map <F10> 	:tabnew<CR>
"map <F9> 	:Explore<CR>
map <F11> :tabprevious<CR>
map <M-m> :set nonumber<CR>
map <C-q> <C-w>w
map z %
set laststatus=2
let g:neocomplcache_enable_at_startup = 1
function Printkdebugmsg()
	let l:printk_str='pr_err("puck %s %d\n", __func__, __LINE__);'
	exec "normal o".l:printk_str
	startinsert
endfunction
map <F5> :call Printkdebugmsg()<CR>
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set foldlevel=9999
set backspace=2
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
nmap m :Mark <C-R>=expand("<cword>")<CR><CR>
let python_highlight_all = 1
syntax on
set hls

if has("autocmd")
au BufReadPost * if line("`\"") > 1 && line("`\"") <= line("$") | exe "normal! g`\"" | endif
" for simplicity, "  au BufReadPost * exe "normal! g`\"", is Okay.
endif

nmap <F4>      :cs find g <C-R>=expand("<cword>")<CR><CR>

nmap <F7>      :set nonumber<CR>
nmap <F3>      :Tlist<CR>
nmap <F6>      :WMToggle<CR>
"nmap <F10>    :cs find f <C-R>=expand("<cword>")<CR><CR>

nmap <F2>      :cscope add ~/cscope/cscope.out<CR>

"lastest close
autocmd BufReadPost *
       \ if line("'\"")>0&&line("'\"")<=line("$")|
       \ exe "normal g'\""|
       \ endif
