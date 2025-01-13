"CKG's Vimrc"


set ts=4 sw=4  " set tab widths and the number of spaces to do for indentation to 4 spaces
set softtabstop=4  " how many spaces is a 'tab' or 'backspace' keypress worth? - https://vi.stackexchange.com/questions/4244/what-is-softtabstop-used-for
set tabstop=4  " how many spaces is a single tab (\t) worth? 
set shiftwidth=4  " how many spaces is a single code indentation worth? 
set expandtab " ~converts all tabs into equivalent number spaces -- never see a tab in a file again

set autoindent

syntax on  " Syntax highlighting

set showmatch  " Shows matching brackets
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta  " recoloring of brackets 


set ruler  " Always shows location in file (line#)
set smarttab  " Autotabs for certain code
set is hlsearch hls  " enable incremental & highlight search
set ignorecase  "ignore casing on word search (could also use "ic" instead of "ignorecase")
set smartindent  "magic to smartly indent files
set textwidth=0  "no newline insertion after N characters entered, taken from- https://stackoverflow.com/questions/40366496/how-to-stop-vim-from-putting-text-onto-a-new-line-after-80-characters
set wrap

set re=0  " updated REGEX engine, allows for opening typescript files without molasses


" when using netrw for viewing filesystems, use current dir as actual dir
" see- https://stackoverflow.com/questions/28216075/vim-file-explorer-make-browsing-directory-the-current-directory
let g:netrw_keepdir=0
" generally, when using vim -- set the currdir to the dir of the file being edited
" ref- https://stackoverflow.com/questions/2288756/how-to-set-working-current-directory-in-vim
set autochdir
" force netrw to open splits/new buffers in same window
let g:netrw_browse_split = 0
" turn off default split bindings (vertical & horizontal, v OR o keys respectively) in netrw
autocmd FileType netrw nmap <buffer> v <Nop>
autocmd FileType netrw nmap <buffer> o <Nop>



" Highlight the current match (under cursor) when searching in vim
" see answer in- https://stackoverflow.com/questions/45683303/how-to-have-vim-highlight-color-change-for-the-pattern-under-cursor
" + jump screen to next match in search results (centered vertically on screen) --> accomplished via 'zz' postfix in nnoremaps
nnoremap <silent> n nzz:call HLNext()<cr>
nnoremap <silent> N Nzz:call HLNext()<cr>

" Global variable to store the match ID
let g:current_match_id = -1

function! HLNext()
    " Clear previous highlight if it exists
    if g:current_match_id != -1
        call matchdelete(g:current_match_id)
        let g:current_match_id = -1
    endif
    " Create pattern for current search match under cursor
    let target_pat = '\c\%#'.@/

    " Create new highlight and store its ID
    let g:current_match_id = matchadd('ErrorMsg', target_pat, 101)

    " Force screen update
    redraw
endfunction

" Optional: Clear highlight when cursor moves
augroup ClearSearchHL
    autocmd!
    autocmd CursorMoved * if g:current_match_id != -1 | call matchdelete(g:current_match_id) | let g:current_match_id = -1 | endif
augroup END


"" Colorscheme
"colorscheme peachpuff "disgusting on normal (somehow theme didn't set bg correctly before Ventura update)

" custom colorscheme
" colorscheme CKG-VimColorScheme  "hack on the peachpuff colorscheme
colorscheme readability " custom theme made via online GUI

" set termguicolors
" comment out the above if `termguicolors` is set on my Intel Macbook, avoids the peachpuff background color issue
" for some reason setting termguicolors breaks colors in alacritty on M1 chips...



"" Status Bar- https://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
" items in status line (actual values)
set laststatus=2
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\                       "Spellanguage on
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

"colors to use in StatusLine
hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe


" Prevent Markdown Errors for Underscores, as per- https://stackoverflow.com/questions/19137601/turn-off-highlighting-a-certain-pattern-in-vim
autocmd Syntax markdown syn match markdownIgnore "_"


"" Bindings
" shortcut to go to "middle" of a line (as seen in- https://superuser.com/questions/216411/go-to-middle-of-line-in-vim)
map gm :call cursor(0, len(getline('.'))/2)<CR>
" remap ":W" to ":w" -- no more nonsensical saving mishaps
command! W write
" remap ":Q" to ":q" -- no more nonsensical quitting mishaps
command! Q quit

"" Follow the LEADER
" change leader key  from backslash \ to space
let mapleader = " "
" press 'fp' to print the filepath of current buffer's file
nnoremap <leader>fp :echo expand('%:p')<CR> 
" jump to file explorer
nnoremap <leader>e :Ex<CR> 
" quick issue of cmd in dir
nnoremap <leader>x :! 
" start a / search for string under cursor, that is we yank in word then search: '/WORD_YANKED'
nnoremap <leader>/ yiw:let @/=@0<CR>n
" open buffergator w leader b
nnoremap <leader>b :BuffergatorToggle<CR>



" Plug-Ins 
" currently using vim-plug, see- https://github.com/junegunn/vim-plug

" auto install -- when not already on system
" see- https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" see- https://stackoverflow.com/questions/69250609/global-vim-plugin-settings-with-vim-plug
call plug#begin('~/.vim/plugged') 

" plugins
" Goyo- https://github.com/junegunn/goyo.vim
Plug 'junegunn/goyo.vim'  "a great tool for writing in Vim

function! s:goyo_enter()
	set linebreak
	set spell spelllang=en_us
endfunction

function! s:goyo_leave()
	set nolinebreak
	set nospell
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter() 
autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | endif  "autoresize as per- https://github.com/junegunn/goyo.vim/issues/159

let g:goyo_height="100%"
let g:goyo_width="80%"

" Pear Tree- https://github.com/tmsvg/pear-tree
Plug 'tmsvg/pear-tree'  "autocomplete for all brackets, paranethesis and stuff

" Commentary- https://github.com/tpope/vim-commentary#installation
Plug 'tpope/vim-commentary'  " comment things in/out

" Buffergator- https://github.com/jeetsukumaran/vim-buffergator
Plug 'jeetsukumaran/vim-buffergator'


call plug#end()
" End PlugIn Section -- all plugins are loaded in on end()


