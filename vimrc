" Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
" Version:      1.2.0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Must Do First Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FOR DEBUGGING: when bigger than zero, Vim will give messages about what it is doing
set verbose=0

" Use Vim settings, rather then Vi settings
" By default Vim starts in Vi compatibility mode. This means that most of the good features are turned off.
" This must be first, because it changes other options as a side effect.
set nocompatible    " make vim incompatible to vi



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" time in milliseconds that is waited for a key code or mapped key sequence to complete
set timeoutlen=1000

" default leader is '\', but I prefer ','
" The mapleader has to be set before starts loading any of the plugins
let mapleader = ","
let g:mapleader = ","

" indicates a fast terminal connect and gives smoother changes
set ttyfast

" automatic reload of .vimrc after it's saved, but note that this will not unmap keys
" great for when your editing .vimrc itself - http://www.bestofvim.com/tip/auto-reload-your-vimrc/
" this particular method watches for the many variations of Vim config filenames
" so that it's compatible with Terminal Vim, GUI Vim, Windows Vim, etc.
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc source $MYVIMRC | if has('gui_running') | source $MYGVIMRC | endif
augroup END

" Set behavior for mouse and selection.  Valid arguments are mswin and xterm
if has('win32') || has('win64')
    source $VIMRUNTIME/vimrc_example.vim    " contains example settings that may be useful
    source $VIMRUNTIME/mswin.vim            " map a few keys to the MS-Windows cut/copy/paste commands
    behave mswin                            " MS-Windows behavior (work more or less like a typical Windows editor)
else
    behave xterm                            " Xterm behavior
endif

set bs=2			" allow backspacing over everything in insert mode
set autoread		" auto read when file is changed from outside
set hidden			" buffers can exist in background - http://items.sjbach.com/319/configuring-vim-right

set history=200		" sets how many command line history VIM has to remember
set undolevels=200  " use many muchos levels of undo



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To select a font, do ':set guifont=*' and select the font you want to use.
" Once you're happy with it, do ':set guifont?' and it will output the current
" setting of the value. Put the the font into your .vimrc via 'set guifont=foo"'

" Set extra options when running in GUI mode
if has("gui_running")               " settings for GUI Vim (i.e. gvim)
	set t_Co=256                    " tells Vim the number of colors available
	set guitablabel=%M\ %t
    set guioptions-=T               " remove the tool bar (for Win32)
    set guioptions-=r               " no right-hand scrollbar
    set guioptions-=L               " no left-hand scrollbar is present when there is a vertically split window
    set guioptions+=a               " autoselect for the modeless selection
	set guioptions+=e               " add tab page
    set guioptions-=m               " no menu bar
    colorscheme jellybeans          " load color scheme {name} by searches 'runtimepath' for the file 'colors/{name}.vim'
    set guifont=Inconsolata\ 10     " set fonts to be used
else                                " settings for Terminal Vim (i.e. vim)
	set t_Co=256                    " tells Vim the number of colors available
    colorscheme jellybeans          " load color scheme {name} by searches 'runtimepath' for the file 'colors/{name}.vim'
    set guifont=Consolas:h10:cANSI  " set fonts to be used
endif

" Change font size quickly without changing the font
if has("gui_gtk2")
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction
else
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction
endif

" map keys to iuse for change the font size
if has("gui_running")
    map <leader>+ :call FontSizePlus()<CR>
    map <leader>- :call FontSizeMinus()<CR>
endif

"execute 'set colorcolumn=' . join(range(81,335), ',')  " set all lines after columns 80 to another color
set colorcolumn=80          	" puts a single color line at the column given
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	File Type Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enables Vim to show parts of the text in another font or color
syntax on			" Enable syntax highlighting

" filetype enable type-specific configuration, such as knowledge of syntax and indentation
filetype on			" Enable filetype detection
filetype plugin on  " enable loading the plugin files for specific file types
filetype indent on	" Enable filetype-specific indenting



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" to see the file names of all scripts/plugins loaded (sourced) by Vim,
" including those loaded implicitly at startup, enter:
"
"   :scriptnames
"
" This list does not include scripts that Vim tried to open but which failed without warning.
" To see these scripts, use the -V option when starting Vim:
"
"   vim -V

"---------------------------------- Pathogen -----------------------------------
" to install Pathogen for managing your plugins
"       mkdir -p ~/.vim/autoload ~/.vim/bundle
"       curl -Sso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you install all your plugins into a .vim/bundle/<plugin-name> folder
"
" call pathogen to install the remaining plugins
filetype off                " do not detect the type of file that is edited
call pathogen#infect()		" this pulls in the plugins
call pathogen#helptags()	" generate helptags for everything in 'runtimepath'
filetype plugin indent on   " must be enabled to use python-mode (and others)
syntax on                   " set syntax highlighting and color highlighting for a file type

"---------------------------------- NERDTree -----------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone https://github.com/scrooloose/nerdtree.git

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" close vim if the only window left open is a NERDTree
augroup VimNERDTree
    autocmd!
    "autocmd VimEnter * NERDTree    " open a NERDTree automatically when vim starts up
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

" controlling NERDTree
map <leader>e :NERDTreeFind<cr>         " command to invoke NERDTreeFind
nmap <leader>nt :NERDTreeToggle<cr>     " toggle NERDTree on or off

"--------------------------------- Python-Mode ---------------------------------
"" to install
""       cd ~/.vim/bundle
""       git clone git://github.com/klen/python-mode.git
"
"" Python-Mode Keys:
""   K             Show python docs
""   <Ctrl-Space>  Rope autocomplete
""   <Ctrl-c>g     Rope goto definition
""   <Ctrl-c>d     Rope show documentation
""   <Ctrl-c>f     Rope find occurrences
""   <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
""   [[            Jump on previous class or function (normal, visual, operator modes)
""   ]]            Jump on next class or function (normal, visual, operator modes)
""   [M            Jump on previous class or method (normal, visual, operator modes)
""   ]M            Jump on next class or method (normal, visual, operator modes)
"
"let g:pymode_rope = 1
"
"" Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'                  " allows lookup of Python docs by pressing K
"
"" automatically check code on each save, but only use PyLint or PyFlakes
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
"
"let g:pymode_lint_write = 1                 " Auto check on save
"let g:pymode_virtualenv = 1                 " Support virtualenv
"let g:pymode_folding = 0                    " Don't autofold code
"
"" Enable breakpoints plugin
"" use <leader>b to add a pdb shortcut (inserts import pdb; pdb.set_trace() ### XXX BREAKPOINT into code
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_key = '<leader>b'
"
"" syntax highlighting and formatting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
"" turn on all the high lighting feature (see file /usr/share/vim/vim73/syntax/python.vim)
"let g:python_highlight_all = 1

"-------------------------------- ScrollColors ---------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone git://github.com/vim-scripts/ScrollColors.git

map <silent><F12> :NEXTCOLOR<cr>
map <silent><F11> :PREVCOLOR<cr>

"-------------------------------- vim-markdown --------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone git://github.com/plasticboy/vim-markdown.git

let g:vim_markdown_folding_disabled=1       " disable folding
au BufNewFile,BufRead *.md setf markdown    " if extention is md, set file type to markdown

"-------------------------------- Ansible-Vim ----------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone https://github.com/pearofducks/ansible-vim ~/.vim/bundle/ansible-vim

let g:ansible_unindent_after_newline = 1    " when set, indentation will unindent after two newlines in insert-mode

"------------------------------ vim-openscad.vim -------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone git://github.com/sirtaj/vim-openscad.git

"------------------------------ conky-syntax.vim -------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone git://github.com/smancill/conky-syntax.vim.git

"--------------------------- vim-arduino-syntax.vim ----------------------------
" to install
"       cd ~/.vim/bundle
"       git clone https://github.com/sudar/vim-arduino-syntax.git

"-------------------------------- NERDCommenter --------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone git://github.com/scrooloose/nerdcommenter.git
"
" [count]<leader>cc     Comment out the current line or text selected in visual mode.
" [count]<leader>cu     Uncomments the selected line(s).

"----------------------------------- matchit -----------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone https://github.com/tmhedberg/matchit.git

"---------------------------------- SuperTab -----------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone https://github.com/ervandew/supertab.git

" Supertab keys:
"   <Tab>         for all your insert completion needs
"   <Ctrl><Tab>   to insert a tab (must set expandtab)
"   >>            to insert a tab at the begining of the line

" Native word complete still works
" just type the first couple of characters of a word, then press:
"   Ctrl-N      to insert the next matching word; or
"   Ctrl-P      to insert the previous matching word

"let g:SuperTabDefaultCompletionType = "<c-n>"        " navigate the completion menu from bottom to top
let g:SuperTabContextDefaultCompletionType = "<c-n>"  " navigate the completion menu from top to bottom

"---------------------------------- SnipMate -----------------------------------
" NOT INSTALLED YET    NOT INSTALLED YET    NOT INSTALLED YET    NOT INSTALLED YET
" http://code.tutsplus.com/tutorials/vim-essential-plugin-snipmate--net-19356
" https://github.com/ervandew/supertab

"---------------------------------- Surround -----------------------------------
" NOT INSTALLED YET    NOT INSTALLED YET    NOT INSTALLED YET    NOT INSTALLED YET
" http://code.tutsplus.com/tutorials/vim-essential-plugin-surround--net-19253

"------------------------------- YouCompleteMe ---------------------------------
" NOT INSTALLED YET    NOT INSTALLED YET    NOT INSTALLED YET    NOT INSTALLED YET
" http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/
" http://tilvim.com/2013/08/21/js-autocomplete.html



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Text Scrolling and Paging Controls
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" text scrolling behaver
set scrolloff=8         " minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=15    " minimal number of screen columns left & right of the cursor if 'nowrap' is set
set sidescroll=1        " minimal number of columns to scroll horizontally.

" the default paging behavior for vim
" <Ctrl>b - Move back one full screen
" <Ctrl>f - Move forward one full screen
" <Ctrl>d - Move forward 1/2 screen
" <Ctrl>u - Move back (up) 1/2 screen

" map Alt-Arrow-Keys as they would be used in a Chromebook
map  <A-Up> <c-b>
map  <A-Down> <c-f>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Cursor Color and Shape
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gVim allows the cursor shape, blink rate, and color to be customized
" see http://vim.wikia.com/wiki/Configuring_the_cursor
if has("gui_running")           " settings for GUI Vim (i.e. gvim)
    " highlight current line and column to contrast with background color
    " Could make screen redrawing slower.
    set cursorline
    highlight cursorline guibg=black
    highlight cursorcolumn guibg=black

    " Vim will use a block cursor in normal, command-line and visual mode
    " n-v-c = normal mode, or visual selection mode, or command mode (colon command)
    highlight Cursor guifg=black guibg=white
    set guicursor=n-v-c:block-Cursor-blinkwait700-blinkon400-blinkoff250

    " Vim will use a line cursor (30% of character width) insert mode
    " i-ci = insert mode, command line insert mode (colon command)
    highlight iCursor guifg=white guibg=red
    set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
endif

" for Vim, it is possible to change the cursor color and style in the terminal
" if it understands the following escape sequences.
if &term =~ "xterm\\|rxvt"
    let &t_SI = "\<Esc>]12;red\x7"          " use an red cursor in insert mode
    let &t_EI = "\<Esc>]12;white\x7"        " use a white cursor otherwise
    silent !echo -ne "\033]12;white\007"

    " reset cursor when vim exits
    " use \003]12;gray\007 for gnome-terminal
    autocmd VimLeave * silent !echo -ne "\033]112\007"
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Cursor Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim 101: Quick Movement - http://usevim.com/2012/03/09/quick-movement/
" Vim Movements - http://nerd-hacking.blogspot.com/2006/05/vim-movements.html
" EsayMotion - https://github.com/easymotion/vim-easymotion
" Vim Plugins You Should Know About, Part III: matchit.vim - http://www.catonmat.net/blog/vim-plugins-matchit-vim/



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Window Splits and Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commands to turn one vim session (inside one xterm) into multiple windows
" :e filename      - edit another file
" :split filename  - split window and load another file
" ctrl-w up arrow  - move cursor up a window
" ctrl-w ctrl-w    - move cursor to another window (cycle)
" ctrl-w_          - maximize current window
" ctrl-w=          - make all equal size
" 10 ctrl-w+       - increase window size by 10 lines
" :vsplit file     - vertical split
" :sview file      - same as split, but readonly
" :hide            - close current window
" :only            - keep only this window open

" bind Ctrl+<movement> keys to move around windows, instead of using Ctrl+w+<movement>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" bind Ctrl+<arrowkey> keys to move around windows
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" here are the commands you need to know for folding
"   zi      toggle folding feature on/off
"   zf#j    creates a fold from the cursor down # lines.
"   zf      (VISUAL Mode) creates a fold over highlighted area
"   zj      moves the cursor to the next fold.
"   zk      moves the cursor to the previous fold.
"   zo      opens a fold at the cursor.
"   zO      opens all folds at the cursor.
"   zm      increases the foldlevel by one.
"   zM      closes all open folds.
"   zr      decreases the foldlevel by one.
"   zR      decreases the foldlevel to zero -- all folds will be open.
"   zd      deletes the fold at the cursor.
"   zE      deletes all folds.
"   [z      move to start of open fold.
"   ]z      move to end of open fold.
set foldcolumn=2        " Add a bit extra margin to the left when folding
set foldmethod=indent   " fold based on indent
set foldnestmax=3       " deepest fold is 3 levels
set nofoldenable        " don't fold by default

"augroup VimFolding
"    " delete any old autocommands in this group
"    autocmd!
"    " save/restore the view of the file (saves the folding)
"    autocmd BufWinLeave * mkview             " write the view of the current file
"    autocmd BufWinEnter * silent loadview    " load the view of the current file
"augroup END



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Window Menu Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *** Check if this works the same way in both gVim and Vim ***
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" color the tabs
highlight TabLineFill ctermfg=Black ctermbg=Gray
highlight TabLine ctermfg=Black ctermbg=Gray
highlight TabLineSel ctermfg=DarkGreen ctermbg=Gray



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Spell Checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" here are the minimal commands you need to know for spell
"   ]s    move to the next misspelled word
"   [s    move to the previous misspelled word
"   zg    add a word to the dictionary
"   zug   undo the addition of a word to the dictionary
"   z=    view spelling suggestions for a misspelled word
if has("spell")
    setlocal spell spelllang=en_us   " use USA English spelling dictionary
    setlocal nospell                 " disable inline spell check at startup

    " file used when you add words you don't want flagged by spell
    set spellfile=$HOME/.vim/spell/en.utf-8.add

    " toggle and toggle spell checking
    map <leader>sp :setlocal spell!<cr>

    " Shortcuts using <leader>
    map <leader>sd ]s       " move to the next misspelled word
    map <leader>su [s       " move to the previous misspelled word
    map <leader>sa zg       " add a word to the dictionary
    map <leader>sua zug     " undo the addition of a word to the dictionary
    map <leader>s? z=       " view spelling suggestions for a misspelled word
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	VIM User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a         " Enable mouse usage; to paste, press shift while selecting with the mouse

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set lazyredraw	    " Don't redraw while executing macros
set magic			" For regular expressions turn magic on
set showcmd			" Show (partial) commands in status line
set showmode        " Show current mode down the bottom
set showmatch		" Show matching brackets when text indicator is over them
set mat=2			" tenths of a second to blink when matching brackets



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Set Terminal Title
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set title		    "Show info in the window title

" execute after entering a buffer and set the title of the terminal
augroup VimUI
    " delete any old autocommands in this group
    autocmd!
    " format the string that "set title" will display at top of window
    autocmd BufEnter * let &titlestring = hostname() . " Vim Editor: " . expand("%:p")
augroup END



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Sound and Other Effects for Errors / Warnings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set errorbells          " ring bell on error
set visualbell          " see a brief window flash on error
" set noerrorbells		" turn of beeping when errors occure
" set novisualbell		" turn off screen flashing when errors occure
" set t_vb=				" If 't_vb' is cleared, Vim will never flash the screen
" set tm=500



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Clipboard, Copy & Paste
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim lets us access the system clipboard using the quoteplus register, "+.
"
" Sources: http://vimcasts.org/episodes/accessing-the-system-clipboard-from-vim/
"          http://vim.wikia.com/wiki/Accessing_the_system_clipboard
"          http://vim.wikia.com/wiki/Cut/copy_and_paste_using_visual_selection

" "+y - if you want to yank text from a Vim buffer into the system clipboard
" "+dd - if you want to cut text from a Vim buffer into the system clipboard
" "+p - paste text from the system clipboard into your Vim buffer

" use th system clipboard for all yank, delete, change, put operations that don't have  a register

set clipboard=unnamed

" This will make <F10> start paste mode and <F11> stop paste mode.
" Note that typing <F10> in paste mode inserts '<F10>', since in paste
" mode everything is inserted literally, except the 'pastetoggle' key sequence.
"map <F10> :set paste<CR>
"map <F11> :set nopaste<CR>
"imap <F10> <C-O>:set paste<CR>
"imap <F11> <nop>

" to stop indenting when pasting with the mouse, hitting the F11 key
" while in insert mode (or just :set paste)
set pastetoggle=<F11>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Text Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source: http://www.fprintf.net/vimCheatSheet.html
"
" /{pattern}[/]             Search forward for the [count]'th occurrence of {pattern}
" /{pattern}/{offset}	    Search forward for the [count]'th occurrence of {pattern} and go {offset} lines up or down.
" /<CR>                     Search forward for the [count]'th latest used pattern
" //{offset}<CR>            Search forward for the [count]'th latest used pattern with new.
"                           If {offset} is empty no offset is used.
" ?{pattern}[?]<CR>         Search backward for the [count]'th previous occurrence of {pattern}
" ?{pattern}?{offset}<CR>   Search backward for the [count]'th previous occurrence of {pattern}
"                           and go {offset} lines up or down
" ?<CR>                     backward for the [count]'th latest used pattern
" ??{offset}<CR>            Search backward for the [count]'th latest used pattern with new {offset}.
"                           If {offset} is empty no offset is used.
" n                         Repeat the latest "/" or "?" [count] times.
" N                         Repeat the latest "/" or "?" [count] times in opposite direction.

set incsearch       " find the next match as we type the search
set ignorecase      " ignore case when searching...
set smartcase       " ...unless you type a capital
set hlsearch        " highlight searches by default

" set the highlight color for search
highlight Search guifg=Black guibg=Pink gui=none ctermfg=White ctermbg=Blue

" if the search term highlighting gets annoying, set a key to switch it off temporarily
" clears the search highlights
nmap <silent> <leader>n :silent :nohlsearch<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Text Markers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use markers to set places you want to quickly get back to,
" or to specify a block of text you want to copy or cut.
" from http://www.fprintf.net/vimCheatSheet.html
" m{a-zA-Z}                 Set mark {a-zA-Z} at cursor position (does not move the cursor, this is not a motion command).
" m' or m`                  Set the previous context mark. This can be jumped to with the "''" or "``" command
"                           (does not move the cursor, this is not a motion command).
" :[range]ma[rk] {a-zA-Z}   Set mark {a-zA-Z} at last line number in [range], column 0. Default is cursor line.
" :[range]k{a-zA-Z}         Same as :mark, but the space before the mark name can be omitted.
" '{a-z}                    To the first non-blank character on the line with mark {a-z} (linewise).
" '{A-Z0-9}                 To the first non-blank character on the line with mark {A-Z0-9} in the correct file
" `{a-z}                    To the mark {a-z}
" `{A-Z0-9}                 To the mark {A-Z0-9} in the correct file
" :marks                    List all the current marks (not a motion command).
" :marks {arg}              List the marks that are mentioned in {arg} (not a motion command).



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Text Indentation / Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source: http://vim.wikia.com/wiki/Indenting_source_code
"
" auto-indentation rules are just the defaults and will most-likely will be
" overridden by plugins you use for common programming languages
set autoindent      " always set autoindenting on
set copyindent		" copy previous indent on enter
set expandtab		" Use spaces instead of tabs
set smarttab		" Be smart when using tabs
set shiftwidth=4	" 1 tab equals 4 spaces
set tabstop=4		" set tab stops ever 4 character spaces

"Indent only if the file is of type cpp,c,java,sh,pl,php,asp
augroup VimIndent
    " delete any old autocommands in this group
    autocmd!
    autocmd FileType py set autoindent
    autocmd FileType py set smartindent
    autocmd FileType py set textwidth=79						" PEP-8 friendly
    autocmd FileType cpp,c,java,sh,pl,php,asp  set autoindent
    autocmd FileType cpp,c,java,sh,pl,php,asp  set smartindent
    autocmd FileType cpp,c,java,sh,pl,php,asp  set cindent		" C type indentation
augroup END



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Hidden Text
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle between showing and hiding hidden characters
nmap <leader>hc :set list!<cr>

" enumerates which hidden characters to display and which character to display them with
set listchars=tab:>-,trail:.,extends:#,nbsp:.



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Line Wrapping and Breaking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Improve the display of line wraps
"
" Source: http://www.bestofvim.com/tip/better-line-wraps/
"         http://www.tagwith.com/question_1169785_vim-change-lines-font-color-based-upon-first-character-in-the-line

"set nowrap
set wrap			" wrap lines when they are larger than the window size
set wrapmargin=4	" number of characters from right window border when wrapping starts

" put string at the start of lines that have been wrapped
set showbreak=↪
syntax match mysyntaxXLine /^↪.*$/
highlight link mysyntaxXLine Error

set linebreak
set textwidth=500	" Line break on 500 characters
set formatoptions=1	" to stop unexpected effects, use :set paste and leave this mode via :set nopaste



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Special Syntax-Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Force the syntax-highlight based on the nature of the file name
augroup VimSyntax
    " delete any old autocommands in this group
    autocmd!
    autocmd BufReadPost *bash* set syntax=sh
augroup END



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable backup and swap files (they trigger too many events)
set nobackup
set nowritebackup
set noswapfile

" keep temporary and backup files (make sure to create these directories first)
set backup
if has('win32') || has('win64')
    set backupdir=C:\\Users\jeffrey.c.irland\Temp\backup    " for MS-Windows
    set directory=C:\\Users\jeffrey.c.irland\Temp\tmp       " for MS-Windows
else
    set backupdir=~/.vim/backup                             " for Linux
    set directory=~/.vim/tmp                                " for Linux
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Persistent Undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" from http://www.fprintf.net/vimCheatSheet.html
" u         Undo [count] changes.
" :u[ndo]	Undo one change.
" CTRL-R	Redo [count] changes which were undone.
" :red[o]	Redo one change which was undone.
" U         Undo all latest changes on one line. {Vi: while not moved off of it}
" .         Repeat last change, with count replaced with [count].

" Once you quit Vim, the undo history for that file is gone.
" Keep undo history across sessions by storing it in a file
" Make sure ~/.vim/backup has been created
if has('persistent_undo')
    set undodir=~/.vim/backup   " location of undo history
    set undofile                " maintain undo history between sessions
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Special Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map sort function to key
vnoremap <leader>s :sort<cr>

" TiddlyWiki uses the Esc key
" Avoid the escape key - http://vim.wikia.com/wiki/Avoid_the_escape_key
" the defaults exit from insert mode mapping for vim
" <Ctrl>[ - equivalent to <Esc>
"imap <C-I> <Esc>        " press i to enter and <Ctrl>i to exit from insert mode
" doesn't work for some reason, can't insert tab for some reason

" edit my .vimrc file in a new window (so you can update .vimrc on the fly)
nnoremap <leader>ev :split $MYVIMRC<cr>

" source my .vimrc file so it takes effect immedately
nnoremap <leader>sv :source $MYVIMRC<cr>

" surround a word with double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" use these mapping to establish the muscle memory to become a Vim power user
"    - map <esc> to 'jk' and turn off <esc>
"    - disable the arrow keys
"inoremap jk <esc>
"inoremap <esc> <nop>
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   White Space
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" do not display tabs, ends of lines, or other hidden characters
set nolist

" toggle on/off tabs and trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<cr>

" automatically highlight trailing whitespace
match ErrorMsg '\s\+$'

" Removes trailing spaces from the file - http://www.bestofvim.com/tip/trailing-whitespace/
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
nnoremap <silent> <Leader>tws :call TrimWhiteSpace()<cr>

" function to delete trailing white space
function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

" delete trailing white space for C, Python, Markdown, Lua, etc.
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.sh :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.md :call DeleteTrailingWS()
autocmd BufWrite *.lua :call DeleteTrailingWS()
autocmd BufWrite *.ino :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Command Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pressing <TAB> in command mode will choose the first possible completion



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Word Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In insert mode, type the first couple of characters of a word, then press:
"   Ctrl-N  to insert the next matching word; or
"   Ctrl-P  to insert the previous matching word
"
" http://usevim.com/2012/07/06/vim101-completion/

set wildmenu        " enable ctrl-n and ctrl-p to scroll thru matches

" have the completion behave similarly to a shell (i.e. complete only up to the point of ambiguity)
set wildmode=list:longest,full

set wildignore+=.hg,.git,.svn                       " Version Controls
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg      " Binary Imgs
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest    " Compiled Object files
set wildignore+=*.sw?                               " Vim swap files
set wildignore+=*.pyc                               " Python Object codes
set wildignore+=*.orig                              " Merge resolution files

" longest - only insert the longest common text of the matches
" menu - use a popup menu to show the possible completions
" preview - show extra information about the currently selected
set completeopt=longest,menu,preview

" look for matches in . = The current buffer, w = Buffers in other windows,
" b = Other loaded buffers, u = Unloaded buffers, t = Tags, i = Included files
"set complete=.,w,b,u,t,i,k
set complete=.      " the current buffer
set complete+=w     " Buffers in other windows
set complete+=b     " Other loaded buffers
set complete+=u     " Unloaded buffers
set complete+=t     " Tags
set complete+=i     " Included files
set complete+=k     " scan dictionary

" dictionary used
set dictionary=/usr/share/dict/words



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Code Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Example - http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/
" you can get word completion through CTRL+N & CTRL+P and
" code completion through omnifunc with CTRL+X  CTRL+O



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Line Numbering
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number			" enable line numbers
set numberwidth=4	" space provided for line numbering

" show the line and column number of the cursor position
if has('cmdline_info')
    set ruler                   " always show the current position
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and selected characters/lines in visual mode
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" consider replacing with with Vim Airline - http://jchain.github.io/blog/2013/07/17/fly-with-vim-airline/
" status line broken down into easily include-able segments of information
if has('statusline')
    set laststatus=2                                    " Always show the status line
    set statusline=%<File:\ %f                          " Filename
    set statusline+=\ \ CWD:\ %{getcwd()}               " current working directory
    set statusline+=\ [%{&ff}/%Y]                       " file format and type
    set statusline+=\ \ Buffer:\ %n\ of\ %N             " Number of buffers
    set statusline+=\ \ %w%h%m%r                        " Options
    set statusline+=\ \ \ \ \ \ \ \ \ \                 " spacing
    set statusline+=(ASCII=\%03.3b/Hex=\%02.2B)         " ASCII / Hexadecimal value of character under cursor
    set statusline+=\ \ (Line:\ %l/%L,\ Column:\ %c)    " current line number, total lines, and current column
endif

" format the status line at the bottom of the Vim window and line number based on vim's mode
" http://stackoverflow.com/questions/15561132/run-command-when-vim-enters-visual-mode
if has("gui_running")           " settings for GUI Vim (i.e. gvim)
    " colorize the status line and line number for insert mode
    function! InsertStatusLineColor(mode)
        if a:mode == 'i'        " insert mode
            highlight statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
            highlight CursorLineNr ctermfg=4 guifg=Cyan
        elseif a:mode == "r"    " replace mode
            highlight statusline guibg=Orange ctermfg=6 guifg=Black ctermbg=0
            highlight CursorLineNr ctermfg=4 guifg=Orange
        else
            highlight statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
            highlight CursorLineNr ctermfg=4 guifg=Red
        endif
    endfunction

    " colorize the status line and line number for visual mode
    function! VisualStatusLineColor()
        set updatetime=0        " for CursorHold event
        highlight statusline guibg=Yellow ctermfg=6 guifg=Black ctermbg=0
        highlight CursorLineNr ctermfg=4 guifg=Yellow
    endfunction

    " colorize the status line and line number for for normal mode
    function! ResetStatusLineColor()
        set updatetime=4000     " for CursorHold event
        highlight statusline guibg=DarkGreen ctermfg=6 guifg=White ctermbg=0
        highlight CursorLineNr cterm=none ctermfg=0 guifg=White
    endfunction

    " remap relevant visual mode key bindings to call the enter visual function
    vnoremap <silent> <expr> <SID>VisualStatusLineColor VisualStatusLineColor()
    nnoremap <silent> <script> v v<SID>VisualStatusLineColor
    nnoremap <silent> <script> V V<SID>VisualStatusLineColor
    nnoremap <silent> <script> <C-v> <C-v><SID>VisualStatusLineColor

    augroup VimStatusLine
        " delete any old autocommands in this group
        autocmd!
        autocmd InsertEnter * call InsertStatusLineColor(v:insertmode)
        autocmd InsertLeave * call ResetStatusLineColor()
        autocmd CursorHold * call ResetStatusLineColor()
    augroup END

    " default the statusline to dark green when you first entering gVim
    highlight statusline guibg=DarkGreen ctermfg=8 guifg=White ctermbg=15
    highlight CursorLineNr ctermfg=4 guifg=White
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Vim Start-Up Size and Position
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To see or to set the current window position on the screen, you can use ':winpos'
" or ':winpos x y' but this will only work in the GUI (i.e. gvim).
" This is useful if you always want Vim to startup in the same location and
" size as the time you exit it (works for vim and gvim).
"
" http://vim.wikia.com/wiki/Restore_screen_size_and_position

" Function to increase the size of the terminal window for Vim editing
function! SizeUpFunc()
    if exists("g:oldColumns")
        return
    endif
    let g:oldColumns = &columns     " Save the current width
    let g:oldLines = &lines         " Save the current length
    winpos 900 25	                " location of window when Vim opens, only works for gVim
    set lines=75                    " number of lines in  the terminal window when Vim opens
    set columns=130                 " number of columns in the terminal window when Vim opens
endfunction
command! SizeUp call SizeUpFunc()

" Function to restore the terminal window to its orginal size
function! SizeDownFunc()
    if !exists("g:oldColumns")
        return
    endif
    let &columns = g:oldColumns     " restore the orginal width
    let &lines = g:oldLines         " restore the orginal length
    unlet g:oldColumns              " remove the variable
    unlet g:oldLines                " remove the variable
endfunction
command! SizeDown call SizeDownFunc()

augroup VimStartUp
    " delete any old autocommands in this group
    autocmd!

    " save/restore the size of the terminal window
    autocmd VimEnter * SizeUp           " increase the size of the terminal window
    autocmd VimLeavePre * SizeDown      " restore terminal size when Vim quits

    " make Vim returns to the same line when we reopen a file
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

" remember info about open buffers on close
set viminfo^=%



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Open in Browser URL Under Cursor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When the cursor is on a URL, open the URL in your defined browser
"
" Source: http://vim.wikia.com/wiki/Open_a_web-browser_with_the_URL_in_the_current_line
"         http://stackoverflow.com/questions/9458294/open-url-under-cursor-in-vim-with-browser
"
function! HandleURL()
    " ** Configurable settings start here **
    let MARKDOWN_COMMAND = 'markdown'

    if has('win32') || has('win64')
        " note important extra pair of double-quotes
        let BROWSER_COMMAND = 'cmd.exe /c start ""'
    else
        "let BROWSER_COMMAND = 'xdg-open'
        "let BROWSER_COMMAND = 'chromium-browser'
        let BROWSER_COMMAND = 'google-chrome --enable-plugins'
    endif
    " ** End of configurable settings **

    let s:url = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
    "let s:url = matchstr (getline('.'), '\%(http://\|www\.\)[^ ,;\t]*')
    echo s:url

    if s:url != ""
        silent exec '!' . BROWSER_COMMAND . ' "' . s:url . '"'
    else
        echo "No URL found in line."
    endif
endfunction

" Map this feature to the key sequence <leader>u or '\u'
map <leader>u :call HandleURL()<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Markdown Preview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" While editing a Markdown document in Vim, preview it in the default browser.
"
" Author: Nate Silva
" Source: Markdown Preview in Vim - http://blog.cykerway.com/post/468
"
" To use: While editing a Markdown file, press <leader>a
"
" Requires the `markdown` command to be on the system path. If you
" do not have the `markdown` command, install one of the following:
"       sudo apt-get install markdown
"       http://www.pell.portland.or.us/~orc/Code/discount/
"       http://www.freewisdom.org/projects/python-markdown/
"
" An alternative to the markdown command could be to install Markdown Preview
" extention in your browser (Chrome). You can get the extention here:
"       https://chrome.google.com/webstore/search/markdown%20preview?hl=en
"
function!PreviewMarkdown()
    " ** Configurable settings start here **
    let MARKDOWN_COMMAND = 'markdown'

    if has('win32') || has('win64')
        " note important extra pair of double-quotes
        let BROWSER_COMMAND = 'cmd.exe /c start ""'
    else
        "let BROWSER_COMMAND = 'xdg-open'
        "let BROWSER_COMMAND = 'chromium-browser'
        let BROWSER_COMMAND = 'google-chrome --enable-plugins'
    endif
    " ** End of configurable settings **

    silent update
    let output_name = tempname() . '.html'

    " Some Markdown implementations, especially the Python one,
    " work best with UTF-8. If our buffer is not in UTF-8, convert
    " it before running Markdown, then convert it back.
    let original_encoding = &fileencoding
    let original_bomb = &bomb
    if original_encoding != 'utf-8' || original_bomb == 1
        set nobomb
        set fileencoding=utf-8
        silent update
    endif

    " Write the HTML header. Do a CSS reset, followed by setting up
    " some basic styles from YUI, so the output looks nice.
    let file_header = ['<html>', '<head>',
        \ '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">',
        \ '<title>Markdown Preview</title>',
        \ '<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.3.0/build/cssreset/reset-min.css">',
        \ '<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.3.0/build/cssbase/base-min.css">',
        \ '<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.3.0/build/cssfonts/fonts-min.css">',
        \ '<style>body{padding:20px;}div#container{background-color:#F2F2F2;padding:0 20px;margin:0px;border:solid #D0D0D0 1px;}</style>',
        \ '</head>', '<body>', '<div id="container">']
    call writefile(file_header, output_name)

    let md_command = '!' . MARKDOWN_COMMAND . ' "' . expand('%:p') . '" >> "' .
        \ output_name . '"'
    silent exec md_command

    if has('win32') || has('win64')
        let footer_name = tempname()
        call writefile(['</div></body></html>'], footer_name)
        silent exec '!type "' . footer_name . '" >> "' . output_name . '"'
        exec delete(footer_name)
    else
        silent exec '!echo "</div></body></html>" >> "' .
            \ output_name . '"'
    endif

    " If we changed the encoding, change it back.
    if original_encoding != 'utf-8' || original_bomb == 1
        if original_bomb == 1
            set bomb
        endif
        silent exec 'set fileencoding=' . original_encoding
        silent update
    endif

    silent exec '!' . BROWSER_COMMAND . ' "' . output_name . '"'

    "exec input('Markdown file with be formated in browser.  Press ENTER to continue...')
    "echo
    sleep 500m                  " sleep for 500 miliseconds
    exec delete(output_name)
    redraw!

endfunction

" Map this feature to the key sequence <leader>a or '\a'
map <leader>a :call PreviewMarkdown()<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Exit Vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" from http://www.fprintf.net/vimCheatSheet.html
" :q[uit]           Quit Vim. This fails when changes have been made.
" :q[uit]!          Quit without writing.
" :cq[uit]          Quit always, without writing.
" :wq               Write the current file and exit.
" :wq!              Write the current file and exit always.
" :wq {file}        Write to {file}. Exit if not editing the last
" :wq! {file}       Write to {file} and exit always.
" :[range]wq[!]     [file] Same as above, but only write the lines in [range].
" ZZ                Write current file, if modified, and exit.
" ZQ                Quit current file and exit (same as ":q!").



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Shell Specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   C++ Specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Python Specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"augroup VimPython
"    " delete any old autocommands in this group
"    autocmd!
"    " comment out a line
"    autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
"augroup END



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Makefiles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim can run the makefile without leaving the editing session:
"
" :map <f9> :make    - map the F9 key to run make
" :set makeprg       - change what :make does
"
" :make will compile if you are using a Makefile. Use these to examine the compile errors:
"
" :copen    - open a mini-window with list of errors - hit enter on an error to jump to line
" :cclose   - closes the mini-window
" :cw       - toggles the mini-window (if errors exist)



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" when in INPUT mode and hit space after typing the abbreviation, Vim will replace it
iabbrev #c /****************************************************************************/
iabbrev #v """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev #s #-----------------------------------------------------------------------------
iabbrev @@ jeff.irland@gmail.net
iabbrev ccopy Copyright 2015 Jeffrey C. Irland, all rights reserved.



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Writing of Files with Root Permissions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" source: http://vim.wikia.com/wiki/Su-write
" Using sudo from within Vim so you can successfullly write the file with root privileges.
cmap W w !sudo tee % > /dev/null
cmap w!! w !sudo tee % > /dev/null



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Edit of Files in the Same Directory
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" source: http://vim.wikia.com/wiki/Easy_edit_of_files_in_the_same_directory

" %% expands to the full path of the directory that contains the current file
cabbr <expr> %% expand('%:p:h')



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Helper Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

" This is a function that defines Vim's behavior when used for diffing two or more buffers.
" It checks if your environment is able to do the diff itself and, if not, use the builtin diff.
if has('win32') || has('win64')
    set diffexpr=MyDiff()
    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
                let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Tester Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" a test to show if Vim can in fact output 256 colors
" execute the script by typing ':VimColorTest'
" https://emerg3nc3.wordpress.com/2012/07/28/full-256-color-support-for-vim-andor-xterm-on-ubuntu-12-04/
function! VimColorTest(outfile, fgend, bgend)
  let result = []
  for fg in range(a:fgend)
    for bg in range(a:bgend)
      let kw = printf('%-7s', printf('c_%d_%d', fg, bg))
      let h = printf('hi %s ctermfg=%d ctermbg=%d', kw, fg, bg)
      let s = printf('syn keyword %s %s', kw, kw)
      call add(result, printf('%-32s | %s', h, s))
    endfor
  endfor
  call writefile(result, a:outfile)
  execute 'edit '.a:outfile
  source %
endfunction
command! VimColorTest call VimColorTest('vim-color-test.tmp', 1, 256)
