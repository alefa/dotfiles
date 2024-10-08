" Plugins -------------------- {{{1

" Use Vim-plug as plugin manager:
call plug#begin('~/.config/nvim/plugged')

" List plugins to be managed:

" General:
Plug 'tpope/vim-surround'             " Surround text by pairs of delimiters
Plug 'tpope/vim-repeat'               " Make more things repeatable with the dot command
Plug 'tpope/vim-unimpaired'           " Lots of useful key bindings
Plug 'tpope/vim-commentary'           " Comment and uncomment code
Plug 'tpope/vim-fugitive'             " Git integration
Plug 'cohama/lexima.vim'              " Automatically insert closing brackets, quotation marks etc.
Plug 'SirVer/ultisnips'               " Easily insert often used snippets of text
Plug 'jeetsukumaran/vim-filebeagle'   " Simple file browser, less buggy than netrw
Plug 'junegunn/goyo.vim'              " Distraction-free writing mode
Plug 'kana/vim-textobj-user'          " Easy definition of additional text objects
Plug 'kana/vim-textobj-indent'        " Text objects based on indentation; requires vim-textobj-user
Plug 'kana/vim-textobj-line'          " Current-line text objects; requires vim-textobj-user
Plug 'b4winckler/vim-angry'           " Function argument text object
Plug 'tommcdo/vim-exchange'           " Exchange two regions of text
Plug 'qpkorr/vim-bufkill'             " Keep split windows open when closing buffers
Plug 'Valloric/ListToggle'            " Key bindings for toggling the quickfix and location list
Plug 'rakr/vim-one'                   " Atom's default color scheme for Vim
Plug 'ap/vim-buftabline'              " Show buffers in the tabline
Plug 'w0rp/ale'                       " Syntax checking for various languages

" Filetype-specific:
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim'  " Todo.txt filetype plugin and mappings
Plug 'vim-pandoc/vim-pandoc'            " Call Pandoc from Vim
Plug 'vim-pandoc/vim-pandoc-syntax'     " Syntax highlighting for Pandoc's Markdown variant
Plug 'jalvesaq/Nvim-R'                  " Send commands to the R console from Vim and much more
Plug 'lervag/vimtex'                    " Edit and compile LaTeX files
Plug 'octol/vim-cpp-enhanced-highlight' " Better syntax highlighting for C++
Plug 'Rip-Rip/clang_complete'           " Clang-based completion for C++
Plug 'junegunn/vim-easy-align'          " Align text around specified symbols
Plug 'jalvesaq/vimcmdline'              " Send code to a REPL (e.g. IPython)
Plug 'davidhalter/jedi-vim'             " Python code completion


call plug#end()

" Appearance --------------------------------- {{{1

" Enable syntax highlighting:
syntax on

" Use true colors (only works in NeoVim and Vim >= 8.0):
if has('termguicolors')
	set termguicolors
endif

" Colour scheme:
set background=dark
colorscheme one

" Neovim terminal colors (One dark, One light):
if has('nvim')

	" " Light:
	" let g:terminal_color_0  = '#000000'
	" let g:terminal_color_1  = '#E45649'
	" let g:terminal_color_2  = '#50A14F'
	" let g:terminal_color_3  = '#986801'
	" let g:terminal_color_4  = '#4078F2'
	" let g:terminal_color_5  = '#A626A4'
	" let g:terminal_color_6  = '#0184BC'
	" let g:terminal_color_7  = '#A0A1A7'
	" let g:terminal_color_8  = '#5c6370'
	" let g:terminal_color_9  = '#e06c75'
	" let g:terminal_color_10 = '#50A14F'
	" let g:terminal_color_11 = '#986801'
	" let g:terminal_color_12 = '#4078F2'
	" let g:terminal_color_13 = '#A626A4'
	" let g:terminal_color_14 = '#0184BC'
	" let g:terminal_color_15 = '#ffffff'

	" Dark:
	let g:terminal_color_0  = '#000000'
	let g:terminal_color_1  = '#E06C75'
	let g:terminal_color_2  = '#98c379'
	let g:terminal_color_3  = '#d19a66'
	let g:terminal_color_4  = '#61aeee'
	let g:terminal_color_5  = '#c678dd'
	let g:terminal_color_6  = '#56b6c2'
	let g:terminal_color_7  = '#abb2bf'
	let g:terminal_color_8  = '#5c6370'
	let g:terminal_color_9  = '#e06c75'
	let g:terminal_color_10 = '#98c379'
	let g:terminal_color_11 = '#d19a66'
	let g:terminal_color_12 = '#62afee'
	let g:terminal_color_13 = '#c678dd'
	let g:terminal_color_14 = '#56b6c2'
	let g:terminal_color_15 = '#ffffff'

endif

" Basic settings --------------------------- {{{1

set number                         " Absolute line numbers
set relativenumber                 " Relative line numbers
set nowrap                         " Don't wrap lines by default
set linebreak                      " If lines are wrapped, break them at white spaces
set breakindent                    " Indent wrapped lines
set colorcolumn=100                " Show an indicator for long lines
set scrolloff=3                    " Show at least three lines above or below the cursor
set showcmd                        " Show (partial) command in status line
set showmatch                      " Show matching brackets
set ignorecase                     " Do case insensitive matching when searching
set smartcase                      " Do smart case matching when searching
set autowrite                      " Automatically save before commands like :next and :make
set hidden                         " Hide buffers when they are abandoned
set gdefault                       " Replace all occurences of a pattern, not just the first
set nohlsearch                     " Don't highlight search results
set wildignorecase                 " Make tab completion case-insensitive
set wildmode=longest:full          " Tab completion: complete to longest common string and show menu
set listchars=tab:▸\ ,eol:↵,trail:·,extends:↷,precedes:↶ " Use these characters to show invisible characters
set splitbelow                     " Horizontal splits below the current one (default is above)
set splitright                     " Vertical splits to the right of the current one (default is left)
set modeline                       " For security reasons, modeline is off by default in Debian and Ubuntu
set lazyredraw                     " Pause redrawing the screen when executing macros and functions
set virtualedit=block              " Allow moving the cursor outside of the text in visual block mode
set path=.,**                      " Search path for :find and friends
set clipboard^=unnamedplus,unnamed " Use the system clipboard
set mouse=a                        " Enable mouse usage (all modes)

" Ignored patterns when completing file names:
set wildignore+=*.o,*.tar.gz,*.synctex.gz,*.aux,*.fff,*.fls,*.ttt,*.out,*.bbl,*.blg,*.fdb_latexmk

" Jump to the last position when reopening a file:
augroup last_pos
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" Settings set by default in Neovim:
if !has('nvim')
	" Load indentation rules and plugins according to the detected filetype:
	if has("autocmd")
		filetype plugin indent on
	endif
	set backspace=indent,eol,start " Don't stop backspace at these points
	set autoindent                 " Automatic indentation
	set history=1000               " Longer command history (default is 50 in Vim, 10000 in Neovim)
	set incsearch                  " Incremental search
	set laststatus=2               " Always show status line
	set sessionoptions-=options    " Do not save options and mappings in sessions
	set wildmenu                   " Show menu for command completion
endif

" Indentation rules:
set noexpandtab   " Do not insert spaces for tabs
set tabstop=4     " Width of a tab character
set shiftwidth=4  " Indentation width
set softtabstop=0 " Number of spaces a tab counts for in editing operations
set smartindent

" Disable beeping and flashing window when entering a wrong command:
set noerrorbells visualbell t_vb=
augroup novsbell
	autocmd!
	autocmd GUIEnter * set visualbell t_vb=
augroup END

" Don't use backup and swap files:
set nobackup
set nowritebackup
set noswapfile

" Set default language for spell checking:
set spelllang=en_gb

" Persistent undo
set undofile
set undodir=~/.vim_undo
set undolevels=1000
set undoreload=1000

" Set handler for opening files and urls with appropriate program:
" (Use gx for file path / url under the cursor)
let g:netrw_browsex_viewer= "xdg-open"

" Neovim-specific settings:
if has('nvim')
	set inccommand="nosplit"            " Show effects of substitution while typing
	let g:python3_host_prog = '/usr/bin/python3'
endif

" Use Ag (the Silver Searcher) as grep program if it is installed:
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif

" Completion settings:
set completeopt-=preview " Do not show completion options in a preview window
set completeopt+=menuone " Show completion menu even if it has only one entry
" set completeopt+=noinsert " Do not automatically insert the first match
" set completeopt+=noselect " Do not automatically select the first match


" Status line ------------------------------ {{{1

set statusline=                                " Clear the statusline
set statusline+=\ %f\                          " Path relative to current directory
set statusline+=%h%m%r%w\                      " Flags: help, modified, readonly, preview window
set statusline+=[%{strlen(&ft)?&ft:'none'},\   " Filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},\  " Encoding
set statusline+=%{&fileformat}]                " File format
set statusline+=%=                             " Right align
set statusline+=%{b:gitbranch}\ \ \            " Git branch
set statusline+=line\ %l\/%L\                  " Line number and total no. lines

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      lcd %:p:h
    catch
      return
    endtry
    let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
    lcd -
    if l:gitrevparse!~"fatal: not a git repository"
      let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
    endif
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

" File type-specific settings ------------------------------- {{{1

" Soft-wrap lines of certain file types and do not show a long-line indicator
" for these files (everything that is prose, not code):
augroup prose_settings
	autocmd!
	autocmd FileType tex,markdown,pandoc,dokuwiki,text,vimwiki,rmd,rnoweb setlocal wrap colorcolumn=""
augroup END

" Use dokuwiki syntax highlighting for files with "*.dokuwiki" extension:
augroup dokuwiki
	autocmd!
	autocmd BufRead,BufNewFile *.dokuwiki set filetype=dokuwiki
augroup END

" Use maxima syntax highlighting for files with "*.mac" extension:
augroup maxima
	autocmd!
	autocmd BufRead,BufNewFile *.mac set filetype=maxima
augroup END

" Set filetype of files with *.conf extension to conf(iguration)
" with # as comment string:
augroup configs
	autocmd!
	autocmd BufRead,BufNewFile *.conf set filetype=conf
augroup END

" Settings for email:
augroup mail
	autocmd!
	autocmd FileType mail setlocal textwidth=0 wrap colorcolumn=""
augroup END

" Use Free Pascal syntax highlighting for Pascal files:
let pascal_fpc=1

" Set filetype of .tex files to LaTeX:
let g:tex_flavor="latex"

" Indentation rules and other settings for NetLogo files:
" (for consistency with the inbuilt NetLogo editor)
augroup netlogo
	autocmd!
	autocmd FileType netlogo setlocal expandtab shiftwidth=2 softtabstop=2 commentstring=;%s foldmethod=marker
augroup END

" Indentation rules for Python files
augroup python
	autocmd!
	autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
augroup END

" Settings for Vimscript:
augroup vimscript
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker foldcolumn=2 keywordprg=:help
augroup END

" Settings for quickfix window:
augroup quickfix
	autocmd!
	autocmd FileType qf setlocal colorcolumn=""
augroup END

" Settings for Neovim's terminal mode
augroup term
	autocmd!
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Custom keyboard mappings and functions --------------- {{{1

" Remap leader and local leader:
let mapleader = "\<Space>"
let maplocalleader = ","
" Use underscore instead of comma to repeat character search in the opposite
" direction:
noremap _ ,

" Move by display lines with j/k, but not if these are preceded by a count.
" If they are preceded by a count, add these movements to the jumplist.
function! LineMotion(dir)
    execute "normal! " . (v:count1 > 1 ? "m'" . v:count1 : "g") . a:dir
endfunction

nnoremap <silent> j :<C-u>call LineMotion("j")<CR>
nnoremap <silent> k :<C-u>call LineMotion("k")<CR>

" Edit .vimrc:
nnoremap <Leader>v :edit ~/dotfiles/nvim/.config/nvim/init.vim<CR>
" Reload .vimrc:
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Make Y yank until the end of the line:
nmap Y y$

" Copy the whole file:
nnoremap <Leader>y ggyG``

" Visually select last-pasted text:
noremap gV `[v`]

" Search for visual selection with the star symbol (tip from "Practical Vim"):
function! s:VSetSearch()
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

" Easier window switching:
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Faster window resizing:
nnoremap <C-w>+ 10<C-w>+
nnoremap <C-w>- 10<C-w>-
nnoremap <C-w>> 10<C-w>>
nnoremap <C-w>< 10<C-w><

" Easier saving:
nnoremap <Leader>w :w<CR>

" Split line at cursor (the reverse operation to join lines [J])
" Modified from Steve Losh's vimrc at https://bitbucket.org/sjl/dotfiles/src/cbbbc897e9b3/vim/vimrc
nnoremap S i<CR><ESC>gk:silent! s/\v +$//<CR>gj^`.

" Remove the mapping of F1 (help pages can easily be opened with ":help")
nnoremap <F1> <nop>

" Remove the mapping of Q (Ex mode)
nnoremap Q <nop>

" Easier completion:
inoremap <silent> <C-o> <C-x><C-o>
inoremap <silent> <C-f> <C-x><C-f>
inoremap <silent> <C-l> <C-x><C-l>

" Mappings for Neovim's terminal buffer:
if has('nvim')
	tnoremap <C-\> <C-\><C-n>
	nnoremap <Leader>ts :sp<CR>:term<CR>
	nnoremap <Leader>tv :vsp<CR>:term<CR>
endif

" Compile the project:
nnoremap <Leader>mm :make<CR>
" Compile the current file:
nnoremap <Leader>mc :make %<<CR>
" Run the executable produced from this file:
nnoremap <Leader>mr :! ./%:r<CR>

" Insert current date:
inoremap <silent> <C-d> <C-r>=strftime('%F')<CR>

" Insert current time:
inoremap <silent> <C-t> <C-r>=strftime('%H:%M')<CR>

" Set the working directory to the location of the current file:
nnoremap <Leader>cd :cd %:h<CR>

" Open files:
nnoremap <Leader>f :find<Space>
" List open buffers and select one:
nnoremap <Leader>b :ls<CR>:b<Space>
" Jump to a tag:
nnoremap <Leader>tt :tag<Space>


" Plugin settings ------------------- {{{1

" NVim-R ------------------------ {{{2
" Misc options:
let R_in_buffer = 1 " Run R in a Neovim buffer
let R_hl_term = 0 " Use syntax highlighting in the R console
let R_esc_term = 0 " Use Escape to switch to normal model in the terminal buffer
" Disabled because it interferes with the terminal's vi mode.
let R_notmuxconf = 1 " Don't use a specially built tmux configuration file
let R_assign = 0 " Don't replace underscore by assign arrow
let R_nvimpager = "horizontal" " Open R help in a horizontal or vertical split
let R_source_args = "max.deparse.length = 300, echo = TRUE" " Arguments to R's source() function
let R_objbr_w = 30 " Default width of object browser window
let R_rconsole_height = 30 " Default height of R console window
let R_objbr_opendf = 0 " Unfold names of data frame columns in the object browser
let R_objbr_openlist = 0 " Unfold list components in the object browser
let R_openpdf = 1 " Open PDF after knitting
let R_openhtml = 1 " Open HTML after knitting
let R_pdfviewer = "okular" " PDF viewer to use
let R_nvim_wd = 1 " Start R in Vim's working directory

" Custom shortcuts for frequently used R commands:
map <silent> <LocalLeader>mh :call RAction("head")<CR>
map <silent> <LocalLeader>mt :call RAction("tail")<CR>
map <silent> <LocalLeader>md :call RAction("dim")<CR>
map <silent> <LocalLeader>mc :call RAction("class")<CR>
map <silent> <LocalLeader>ml :call RAction("length")<CR>

" Vim-Pandoc ------------------------ {{{2
let g:pandoc#spell#enabled = 0 " Toggle spell-checking
let g:pandoc#command#latex_engine = "pdflatex" " Compile pdf using pdflatex
let g:pandoc#syntax#conceal#use = 0 " Toggle WYSIWYG-style formatting in the markdown document
let g:pandoc#syntax#style#emphases = 1 " Toggle italics and bold fonts
let g:pandoc#folding#level = 6 " Level of folding when opening a document
let g:pandoc#keyboard#sections#header_style = "s"
" Markdown header style; "a" (atx) or "s" (setext, for level 1 and 2)
let g:pandoc#folding#fdc = 0 " Number of columns used by the fold indicator
let g:pandoc#keyboard#display_motions = 0 " Don't remap j and k to gj and gk (since I'd rather do that myself)
let g:pandoc#modules#disabled = ["chdir", "hypertext", "spell"] " Module blacklist

" Fugitive ------------------------ {{{2
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>ga :Gcommit -a<CR>

" VimTeX ------------------------------ {{{2
let g:vimtex_fold_enabled = 1
let g:vimtex_quickfix_autojump = 0
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique' " Apparently
" deprecated. Check if there is a different option with similar functionality!
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_latexmk = {
			\ 'backend' : 'nvim',
			\ 'background' : 1,
			\ 'build_dir' : '',
			\ 'callback' : 0,
			\ 'continuous' : 0,
			\ 'executable' : 'latexmk',
			\ 'options' : [
			\   '-pdf',
			\   '-verbose',
			\   '-file-line-error',
			\   '-synctex=1',
			\   '-interaction=nonstopmode',
			\ ],
			\}

" UltiSnips ------------------------------- {{{2
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<c-j>"                                       
let g:UltiSnipsJumpBackwardTrigger="<c-k>" 
let g:UltiSnipsSnippetsDir="~/dotfiles/nvim/.config/nvim/UltiSnips"

" Goyo ------------------------------- {{{2
let g:goyo_width=120
let g:goyo_linenr=0
let g:goyo_height=95

nnoremap <Leader>gg :Goyo<CR>

function! s:goyo_enter()
	let g:buftabline_show=0
	call buftabline#update(0)
	set showtabline=0
endfunction

function! s:goyo_leave()
	set showtabline=1
	let g:buftabline_show=2
	call buftabline#update(0)
	set background=dark
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Buffkill ------------------------------ {{{2
let g:BufKillCreateMappings = 0 " Disable default mappings
nnoremap <Leader>k :BD<CR>

" Filebeagle -------------------------------- {{{2
let g:filebeagle_suppress_keymaps = 1
map <silent> -          <Plug>FileBeagleOpenCurrentBufferDir
" Buftabline -------------------------------- {{{2
let g:buftabline_numbers=1

" Colors
hi link BufTabLineCurrent TabLineSel
hi link BufTabLineActive  PmenuSel
hi link BufTabLineHidden  StatusLine
hi link BufTabLineFill    TabLineFill

" Clang-complete -------------------------------- {{{2
let g:clang_library_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:clang_complete_macros = 1

" ALE -------------------------------- {{{2
let g:ale_enabled = 0 " Disable ALE by default
nnoremap <Leader>at :ALEToggle<CR>
let g:ale_lint_on_text_changed = 'never' " Only lint when saving a file

" Vim-easy-align -------------------------------- {{{2

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Vimcmdline -------------------------------- {{{2

" Mappings
let cmdline_map_start          = '<LocalLeader>rf'
let cmdline_map_send           = '<LocalLeader>d'
let cmdline_map_send_and_stay  = '<LocalLeader>l'
let cmdline_map_source_fun     = '<LocalLeader>fd'
let cmdline_map_send_paragraph = '<LocalLeader>pd'
let cmdline_map_send_block     = '<LocalLeader>bd'
let cmdline_map_quit           = '<LocalLeader>rq'

" Options
let cmdline_vsplit      = 1      " Split the window vertically
let cmdline_esc_term    = 0      " Remap <Esc> to :stopinsert in Neovim's terminal
let cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
let cmdline_term_height = 15     " Initial height of interpreter window or pane
let cmdline_term_width  = 100    " Initial width of interpreter window or pane
let cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
let cmdline_outhl       = 1      " Syntax highlight the output
let cmdline_follow_colorscheme = 1 " Use current color scheme for highlighting

" Interpreters
let cmdline_app           = {}
let cmdline_app['python'] = '/home/gita/anaconda3/bin/ipython'
let cmdline_app['sh']     = 'bash'

" Todo.txt-Vim -------------------------------- {{{2

au filetype todo setlocal omnifunc=todo#Complete " Autocompletion for projects and contexts
