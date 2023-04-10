colorscheme elflord
highlight Visual cterm=reverse ctermbg=NONE
" set autochdir
set tags=tags;

set nocompatible
set noswapfile
set nobackup
set nowritebackup
set undolevels=10000
set history=10000


set wildmode=list:full

set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags,cscope.out
set wildignore+=*.tar.*


set wildcharm=<C-z>
nnoremap <Leader>b :buffer <C-z><S-Tab>



""""""""""""" Standard cscope/vim boilerplate

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")
   " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
   set cscopetag
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
      " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb


   " show msg when any other cscope db added
   set cscopeverbose  


   """"""""""""" My cscope/vim key mappings
   "
   " The following maps all invoke one of the following cscope search types:
   "
   "   's'   symbol: find all references to the token under cursor
   "   'g'   global: find global definition(s) of the token under cursor
   "   'c'   calls:  find all calls to the function name under cursor
   "   't'   text:   find all instances of the text under cursor
   "   'e'   egrep:  egrep search for the word under cursor
   "   'f'   file:   open the filename under cursor
   "   'i'   includes: find files that include the filename under cursor
   "   'd'   called: find functions that function under cursor calls

   "
   " Below are three sets of the maps: one set that just jumps to your
   " search result, one that splits the existing vim window horizontally and
   " diplays your search result in the new window, and one that does the same
   " thing, but does a vertical split instead (vim 6 only).
   "
   " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
   " unlikely that you need their default mappings (CTRL-\'s default use is
   " as part of CTRL-\ CTRL-N typemap, which basically just does the same
   " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
   " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
   " of these maps to use other keys.  One likely candidate is 'CTRL-_'
   " (which also maps to CTRL-/, which is easier to type).  By default it is
   " used to switch between Hebrew and English keyboard mode.
   "
   " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
   " that searches over '#include <time.h>" return only references to
   " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
   " files that contain 'time.h' as part of their name).


   " To do the first type of search, hit 'CTRL-\', followed by one of the
   " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
   " search will be displayed in the current window.  You can use CTRL-T to
   " go back to where you were before the search.  
   "

   nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
   nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
   nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
   nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
   nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
   nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
   nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
   nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


   " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
   " makes the vim window split horizontally, with search result displayed in
   " the new window.
   "
   " (Note: earlier versions of vim may not have the :scs command, but it
   " can be simulated roughly via:
   "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

   nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
   nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
   nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
   nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
   nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
   nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
   nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
   nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


   " Hitting CTRL-space *twice* before the search type does a vertical 
   " split instead of a horizontal one (vim 6 and up only)
   "
   " (Note: you may wish to put a 'set splitright' in your .vimrc
   " if you prefer the new window on the right instead of the left

   nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
   nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
   nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


   """"""""""""" key map timeouts
   "
   " By default Vim will only wait 1 second for each keystroke in a mapping.
   " You may find that too short with the above typemaps.  If so, you should
   " either turn off mapping timeouts via 'notimeout'.
   "
   "set notimeout 
   "
   " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
   " with your own personal favorite value (in milliseconds):
   "
   "set timeoutlen=4000
   "
   " Either way, since mapping timeout settings by default also set the
   " timeouts for multicharacter 'keys codes' (like <F1>), you should also
   " set ttimeout and ttimeoutlen: otherwise, you will experience strange
   " delays as vim waits for a keystroke after you hit ESC (it will be
   " waiting to see if the ESC is actually part of a key code like <F1>).
   "
   "set ttimeout 
   "
   " personally, I find a tenth of a second to work well for key code
   " timeouts. If you experience problems and have a slow terminal or network
   " connection, set it higher.  If you don't set ttimeoutlen, the value for
   " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
   "
   "set ttimeoutlen=100


   "map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
   "map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
   "map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

   "nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>

   "nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
   "nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
   "nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
   "nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
   "nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
   "nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
   "nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>


   " ctags can only check for declarations
   " cscope can only check for function calls / definitions
   function! ToggleCscope()
      " check if vim is checking ctags file, first
      if &csto == 1
         " check cscope database, first
         set csto=0
      else
         " check ctags database, first
         set csto=1
      endif
   endfunc


   map <leader>yc :call ToggleCscope()<CR><CR>

endif


function! ToggleMouse()
   " check if mouse is enabled
   if &mouse == 'a'
      " disable mouse
      set mouse=
   else
      " enable mouse everywhere
      set mouse=a
   endif
endfunc


map <leader>ym :call ToggleMouse()<CR><CR>


" Enable highlighting matching parenthesis
let loaded_matchparen = 1

" Autocompletion
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" Line numbers
set number

" Disable mouse. Takes over clipboard and can't copy to local machine over ssh
set ttymouse=xterm2
set mouse=a

" Show the current static always.
set laststatus=2

set path+=.,**

" Prevent new line when wrapping
set textwidth=0

" Break by word instead of character. This automatically adds a newline when
" it adds a linebreak.
set linebreak

" Syntax highlighting
syntax enable
syntax on

" To use system clipboard for cut and paste (works, but not the way I want it)
" set clipboard+=unnamedplus
set clipboard^=unnamed

" For autoindent
set autoindent smartindent

set breakindent " set every wrapped line will continue visually indented     
" Set where vim places new panes by default
set splitbelow
set splitright

set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos
set tabstop=8
set smarttab
set softtabstop=3
set shiftwidth=3
set shiftround
set expandtab
set nofixeol



nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>S :sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>V :vert sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>T :tabfind <C-R>=expand('%:h').'/*'<CR>



" Remove match highlight
nnoremap <silent> zh :noh<CR> 


" Make it easy to navigate panes
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" remap gf to open file below cursor in vert split. Good for explor proj deps.
nnoremap gf :vertical wincmd f<CR>

nnoremap <leader>]b :bnext<CR>
nnoremap <leader>[b :bprevious<CR>
nnoremap <leader>]B :blast<CR>
nnoremap <leader>[B :bfirst<CR>
nnoremap <leader>!b :ls!<CR>

nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>B :sbuffer <C-z><S-Tab>o

nnoremap gb :ls<CR>:b<Space>


nnoremap <leader>j :tjump /

" Quickly switch to buffer by its number. [bufnum]<leader>gb
nnoremap <leader>gb :<C-U>exe ":buffer " . v:count1<CR>

" Toggle relative numbering
nnoremap yr :set<Space>relativenumber!<CR>

" Toggle numbering
nnoremap yn :set<Space>number!<CR>

" " Alternative binding for <C-R> so I can have the functionality in terminal
" " without colliding with the reverse-i-search mapping the terminal brings.
" tnoremap <leader>r <Cmd>:put =getreg(nr2char(getchar()))<CR>
" inoremap <leader>r <Cmd>:put =getreg(nr2char(getchar()))<CR>

" Toggle Pastemode (paste! toggles paste option. 
" :paste? echoes the current state of paste mode
nnoremap <F2> :set paste! paste?<CR>
