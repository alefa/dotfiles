" vim: foldmethod=marker foldcolumn=2
" ---------------------------------------
" General settings {{{1
" ---------------------------------------

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" Use Vim-plug to manage plugins -------------------- {{{2

call plug#begin('~/.config/nvim/plugged')

" List plugins to be managed:
Plug 'cohama/lexima.vim'              " Automatically insert closing brackets, quotation marks etc.
Plug 'tpope/vim-surround'             " Surround text by pairs of delimiters
Plug 'tpope/vim-fugitive'             " Git integration
Plug 'vim-pandoc/vim-pandoc'          " Call Pandoc from Vim
Plug 'vim-pandoc/vim-pandoc-syntax'   " Syntax highlighting for Pandoc's Markdown variant
Plug 'jalvesaq/Nvim-R'                " Send commands to the R console from Vim and much more
Plug 'tpope/vim-repeat'               " Make more things repeatable with the dot command
Plug 'kshenoy/vim-signature'          " Show marks in the margin
Plug 'tpope/vim-unimpaired'           " Lots of useful key bindings
Plug 'tpope/vim-commentary'           " Comment and uncomment code
Plug 'SirVer/ultisnips'               " Easily insert often used snippets of text
Plug 'jeetsukumaran/vim-filebeagle'   " Simple file browser, less buggy than netrw
Plug 'junegunn/goyo.vim'              " Distraction-free writing mode
Plug 'kana/vim-textobj-user'          " Easy definition of additional text objects
Plug 'kana/vim-textobj-indent'        " Text objects based on indentation; requires vim-textobj-user
Plug 'kana/vim-textobj-line'          " Current-line text objects; requires vim-textobj-user
Plug 'kana/vim-textobj-fold'          " Text objects for folding
Plug 'b4winckler/vim-angry'           " Function argument text object
Plug 'sjl/gundo.vim'                  " Visualize the undo tree
Plug 'lervag/vimtex'                  " Edit and compile LaTeX files
Plug 'junegunn/vim-easy-align'        " Easily align columns
Plug 'dhruvasagar/vim-table-mode'     " Easily create plain-text tables
Plug 'qpkorr/vim-bufkill'             " Keep split windows open when closing buffers
Plug 'vim-airline/vim-airline'        " Pretty status line
Plug 'vim-airline/vim-airline-themes' " Airline color themes
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder
Plug 'junegunn/fzf.vim'               " Vim integration for fzf
Plug 'airblade/vim-rooter'            " Set Vim's working directory to git project root
Plug 'lifepillar/vim-solarized8'      " Truecolor version of the Solarized color scheme

call plug#end()

" Appearance --------------------------------- {{{2

if has('termguicolors')
	set termguicolors " Use true colors (only works in NeoVim and Vim >= 8.0)
endif

set background=light
colorscheme solarized8_light

" Use italics in the terminal:
set t_ZH=[3m
set t_ZR=[23m

" Neovim-specific settings:
if has('nvim')
	" Terminal colors (Solarized light):
	let g:terminal_color_0  = '#073642'
	let g:terminal_color_1  = '#dc322f'
	let g:terminal_color_2  = '#859900'
	let g:terminal_color_3  = '#b58900'
	let g:terminal_color_4  = '#268bd2'
	let g:terminal_color_5  = '#d33682'
	let g:terminal_color_6  = '#2aa198'
	let g:terminal_color_7  = '#eee8d5'
	let g:terminal_color_8  = '#002b36'
	let g:terminal_color_9  = '#cb4b16'
	let g:terminal_color_10 = '#586e75'
	let g:terminal_color_11 = '#657b83'
	let g:terminal_color_12 = '#839496'
	let g:terminal_color_13 = '#6c71c4'
	let g:terminal_color_14 = '#93a1a1'
	let g:terminal_color_15 = '#fdf6e3'
	let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Change cursor shape in insert mode
endif


" Basic settings --------------------------- {{{2
set number                  " Absolute line numbers
set relativenumber          " Relative line numbers
set nowrap                  " Don't wrap lines by default
set linebreak               " If lines are wrapped, break them at white spaces
set breakindent             " Indent wrapped lines
set colorcolumn=100         " Show an indicator for long lines
set scrolloff=3             " Show at least three lines above or below the cursor
set showcmd                 " Show (partial) command in status line
set showmatch               " Show matching brackets
set ignorecase              " Do case insensitive matching when searching
set smartcase               " Do smart case matching when searching
set autowrite               " Automatically save before commands like :next and :make
set hidden                  " Hide buffers when they are abandoned
set gdefault                " Replace all occurences of a pattern, not just the first
set nohlsearch              " Don't highlight search results
set wildmode=full           " Tab completion: complete the next full match
set listchars=tab:▸\ ,eol:¬ " Use these characters to show tabs and end-of-line characters
set splitbelow              " Horizontal splits below the current one (default is above)
set splitright              " Vertical splits to the right of the current one (default is left)
set modeline                " For security reasons, modeline is off by default in Debian and Ubuntu
set lazyredraw              " Pause redrawing the screen when executing macros and functions
set virtualedit=block       " Allow moving the cursor outside of the text in visual block mode
set noshowmode              " Turn indicator for insert, visual and replace mode off
" set ruler                   " Show cursor position (line, column) at the bottom

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
	set mouse=a                    " Enable mouse usage (all modes)
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

" Always set working directory to the location of the currently edited file:
" augroup setwd
" 	autocmd!
" 	autocmd BufEnter * silent! lcd %:p:h
" augroup END

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
endif

" Use Ag (the Silver Searcher) as grep program if it is installed:
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif

" Status line ------------------------------ {{{2

" set statusline=                               " Clear the statusline
" set statusline+=\ %f\                         " File name
" set statusline+=%h%m%r%w\                     " Flags: help, modified, readonly, preview window
" set statusline+=[%{strlen(&ft)?&ft:'none'},\  " Filetype
" set statusline+=%{strlen(&fenc)?&fenc:&enc},\ " Encoding
" set statusline+=%{&fileformat}]               " File format
" set statusline+=%=                            " Right align
" set statusline+=%{fugitive#statusline()}\ \ \ " Git status
" set statusline+=line\ %l\/%L\                 " Line number and total no. lines

" File type-specific settings ------------------------------- {{{2

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

" Indentation rules for NetLogo files:
" (for consistency with the inbuilt NetLogo editor)
augroup netlogo
	autocmd!
	autocmd FileType netlogo setlocal expandtab shiftwidth=2 softtabstop=2 commentstring=;%s
augroup END

" ---------------------------------------
" Custom keyboard mappings and functions {{{1
" ---------------------------------------

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

nnoremap <silent> j :<c-u>call LineMotion("j")<cr>
nnoremap <silent> k :<c-u>call LineMotion("k")<cr>

" Edit .vimrc:
nnoremap <Leader>v :edit ~/dotfiles/nvim/.config/nvim/init.vim<CR>
" Reload .vimrc:
nnoremap <F8> :source $MYVIMRC<CR>

" Make Y yank until the end of the line:
nmap Y y$

" Easier shortcuts for copy and paste to/from system clipboard:
map <Leader>y "+y
map <Leader>Y "+Y
map <Leader>p "+p
map <Leader>P "+P
" Copy whole file:
nnoremap <Leader>c gg"+yG

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
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Easier buffer switching:
nnoremap <C-b> :ls<CR>:b<Space>
" This displays a list of buffers and lets me select one by number or (partial) name.
" Using the shortcut Leader-b creates a delay for some reason, so I changed it to
" Ctrl-b.

" Easier saving:
nnoremap <Leader>w :w<CR>

" Set the arglist to the content of the quickfix list (tip from "Practical Vim"):
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()

function! QuickfixFilenames()
	let buffer_numbers = {}
	for quickfix_item in getqflist()
		let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
	endfor
	return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Show a list of most recently used files and select one by number:
nnoremap <Leader>o :browse oldfiles<CR>

" Split line at cursor (the reverse operation to join lines [J])
" Modified from Steve Losh's vimrc at https://bitbucket.org/sjl/dotfiles/src/cbbbc897e9b3/vim/vimrc
nnoremap S i<CR><ESC>gk:silent! s/\v +$//<CR>gj^`.

" Remove the mapping of K to open the man page for the word under the cursor
" (because I keep hitting this key accidentally all the time)
nnoremap K <nop>

" Remove the mapping of F1 (help pages can easily be opened with ":help")
nnoremap <F1> <nop>

" Remove the mapping of Q (Ex mode)
nnoremap Q <nop>

" Use the Unix "find" command to find files by name and populate the quickfix list with them
" Tip from http://vim.wikia.com/wiki/Searching_for_files
function! FindFiles(filename)
	let error_file = tempname()
	silent exe '!find /home/gita -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
	set errorformat=%f:%l:%m
	exe "cfile ". error_file
	copen
	call delete(error_file)
endfunction

command! -nargs=1 Find call FindFiles(<q-args>)

" Switch from insert to normal mode in Neovim's terminal buffer:
if has('nvim')
	tnoremap <C-\> <C-\><C-n>
endif

" Compile the current file:
nnoremap <F9> :make %<<cr>
" Run the executable produced from this file:
nnoremap <F10> :! ./%:r<cr>

" ---------------------------------------
" Plugin settings {{{1
" ---------------------------------------

" NVim-R ------------------------ {{{2

" Misc options:
let R_in_buffer = 1 " Run R in a Neovim buffer
let R_vsplit = 1 " Open R console in a vertical split
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

" Fugitive ------------------------ {{{2
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>ga :Gcommit -a<CR>

" VimTeX ------------------------------ {{{2
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_envs = 0
let g:vimtex_latexmk_continuous = 0
let g:vimtex_latexmk_background = 1
let g:vimtex_quickfix_autojump = 1
let g:vimtex_quickfix_ignored_warnings = [
        \ 'Underfull',
        \ 'Overfull',
        \ 'specifier changed to',
      \ ]

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_latexmk_progname = 'nvr'


" UltiSnips ------------------------------- {{{2
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 

" Goyo ------------------------------- {{{2
let g:goyo_width=120
let g:goyo_linenr=0
let g:goyo_height=95

nnoremap <Leader>gg :Goyo<CR>

" Gundo ------------------------------ {{{2

nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_preview_height = 30
let g:gundo_preview_bottom = 1

" EasyAlign ------------------------------ {{{2

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Table-mode ------------------------------ {{{2

let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

" Buffkill ------------------------------ {{{2

nnoremap <Leader>k :BD<CR>

" Airline -------------------------------- {{{2

" Disable warning about trailing whitespaces:
let g:airline#extensions#whitespace#enabled = 0
" Use powerline fonts:
let g:airline_powerline_fonts = 1
" Enable the list of buffers/tabs at the top of the window:
let g:airline#extensions#tabline#enabled = 1
" Enable/disable displaying tabs, regardless of number:
let g:airline#extensions#tabline#show_tabs = 1
" Show just the filename, no path:
let g:airline#extensions#tabline#fnamemod = ':t'
" Enable/disable displaying buffers with a single tab:
let g:airline#extensions#tabline#show_buffers = 1
" Configure the minimum number of buffers needed to show the tabline:
let g:airline#extensions#tabline#buffer_min_count = 1
" Show buffer numbers in bufferline:
let g:airline#extensions#tabline#buffer_nr_show = 1
" Enable/disable word count:
let g:airline#extensions#wordcount#enabled = 1
" Specify file types for word count:
let g:airline#extensions#wordcount#filetypes = '\vhelp|markdown|pandoc|rst|org|text|asciidoc|tex|mail'

" fzf.vim -------------------------------- {{{2

nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>

" Vim-rooter -------------------------------- {{{2

" Change working directory to file's directory if it's not part of a git
" project:
let g:rooter_change_directory_for_non_project_files = 'current'
" Don't print a message when changing working directory:
let g:rooter_silent_chdir = 1
" Resolve symbolic links:
let g:rooter_resolve_links = 1

" Filebeagle -------------------------------- {{{2

let g:filebeagle_suppress_keymaps = 1
map <silent> -          <Plug>FileBeagleOpenCurrentBufferDir
