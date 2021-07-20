" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
" copy from system clipboard
set clipboard=unnamed
" let the color compatiable to terminal
let &t_ut=' '
" automatic change working dir at now edit file's path
" default, vim working dir is always the start dir
" set autochdir
" autocmd BufEnter * silent! lcd %:p:h

" enable mouse scroll
" set mouse=nv
filetype plugin indent on

" ===
" === Editor behavior
" ===
" show line number
" set number
" show relative line number
" set relativenumber
"show corsor line
set cursorline
" expand tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" apply the indentation of the current line to the next
set autoindent
" show the space at the end of line
set list
" show the tab
set listchars=tab:▸\ ,trail:▫
" corsor distance form buffer edge some lines
set scrolloff=2
" allow for mappings includes 'Esc', while preserving zero timeout after pressing it manually
set ttimeoutlen=0
set notimeout
" rember the cursor positon and other status when reopen file
set viewoptions=cursor,folds,slash,unix
" automatic line break
set wrap
" set text width
set tw=0
" expression whis is evaluated to obtain the proper indent for a line
set indentexpr=
" the kind of folding used for the current window
set foldmethod=indent
"
set foldlevel=99
set foldenable
set formatoptions-=tc
"
set splitright
set splitbelow
" enable mouse in vim
" set mouse=a
" if in insert, replace  or visual mode put a message on the last lie swith to not show this lie
set noshowmode
"show type command
set showcmd
" open command line comletion in enhanced mode
set wildmenu
"ignore case the word during the search
set ignorecase
set smartcase
" Some testing features
set shortmess+=c
"
set inccommand=split
"should make scrolling faster
set ttyfast
set lazyredraw
"
set visualbell
"
"high light search
set hlsearch
"charter by charter high light the entered words during the search
set incsearch

" set python
let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/local/bin/python'

" open the fiel cursor at hte last edited position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Terminal Behavior
" ===
"
let g:neoterm_autoscroll = 1
"
" autocmd TermOpen term://* startinsert
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

" ===
" === Basic Mappings
" ===
" Set <LEADER>
let mapleader=" "

" use q to exit help window
" autocmd FileType help noremap <buffer> q :q<cr>

" Save & quit
map S :w<CR>
map Q :q<CR>
map ! :q!<CR>

" Reload config file
map R :source ~/.config/nvim/init.vim<CR>

" Open the init.vim file anytime
map <LEADER>R :e ~/.config/nvim/init.vim<CR>

" Open zshrc
map <LEADER>Z :e ~/.zshrc<CR>

" Open config.fish
map <LEADER>F :e ~/.config/fish/config.fish<CR>

" Make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

" delete a word, like <C-w> but with delete
" <C-o> for normal command in insert mode
inoremap <C-d> <C-o>daw

" Clear all search high light
noremap <LEADER><CR> :nohlsearch<CR>

" line number
" noremap <C-N><C-N> :set invnumber<CR>
" inoremap <C-N><C-N> <C-O>:set invnumber<CR>

" Disabling the r key
noremap r <nop>

" ===
" === Cursor Movement
" ===
"
" cursor movement in emacs style
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
" J/K keys for 5 times j/k (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j
" J/L keys for 5 times j/l (faster navigation)
noremap <silent> H 5h
noremap <silent> L 5l
" C-a C-e for line move
noremap <C-a> 0
noremap <C-e> $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" ===
" === Window management
" ===
" Use <LEADER> + new arrow keys for moving the cursor around windows
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

" Place the two screens up and down
map ss <C-w>t<C-w>K
" Place the two screens side by side
map sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <LEADER> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

" ===
" === Tab management
" ===
" Create a new tab with tu
map tu :tabe<CR>
" Move around tabs with th and tl
map th :-tabnext<CR>
map tl :+tabnext<CR>
" Move the tabs with tmh and tml
map tmh :-tabmove<CR>
map tml :+tabmove<CR>

" <Leader>[1-9] move to tab [1-9]
for s:i in range(1, 9)
  execute 'nnoremap <Leader>' . s:i . ' ' . s:i . 'gt'
endfor

" ===
" === Terminal
" ===
" Opening a terminal window
noremap <LEADER>/ :term<CR>
" Using esc in term mode
:tnoremap <ESC> <C-\><C-n>
" No line number
:autocmd TermOpen * setlocal nonumber
" Term title
" :autocmd TermOpen * setlocal statusline=%{b:term_title}

" =====================
" === Plugins Setup ===
" =====================

" ===
" === Install Plugins with Vim-Plug
" === In normal mode type "PlugInstall" to install plugs
" ===
"vim-plug begin
call plug#begin('~/.config/nvim/plugged')

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Coc and FZF
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" Terminal
Plug 'voldikss/vim-floaterm'

" Other visual enhancement
Plug 'mhinz/vim-startify'
" displaying thin vertical lines
" Plug 'lukas-reineke/indent-blankline.nvim'

" Rainbow parentheses
Plug 'luochen1990/rainbow', { 'for': 'clojure' }

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" wakatime
Plug 'wakatime/vim-wakatime'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" tsx
Plug 'leafgarland/typescript-vim', {'for': 'tsx'}
Plug 'peitalin/vim-jsx-typescript', {'for': 'tsx'}

" CoffeeScript
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

" fish
Plug 'dag/vim-fish', {'for': 'fish'}

" gist.github.com
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'

" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <LEADER>cc to comment a line; <LEADER>ci

" Color theme
Plug 'doums/darcula'

" Initialize plugin system
call plug#end()


" ===
" === Color theme
" ===
" enable true colors support
set termguicolors
" darcula
colorscheme darcula
let g:lightline = { 'colorscheme': 'darculaOriginal' }

" ===
" === coc
" ===
" TextEdit might fail if hidden is not set.
set hidden
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set cmdheight=2
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"
let g:coc_global_extensions = ['coc-python', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint']
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> for confirm completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Useful commands
" nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)
" Change completion windows background
hi Pmenu ctermfg=0 ctermbg=6 guibg=#444444
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use M to show documentation in preview window.
nnoremap <silent> M :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" ===
" === Rainbow
" ===
let g:rainbow_active = 1

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>

" ===
" === floaterm
" ===
nnoremap   <silent>   <C-t>    :FloatermToggle<CR>
tnoremap   <silent>   <C-t>    <C-\><C-n>:FloatermToggle<CR>

let g:floaterm_width = 0.5
let g:floaterm_height = 0.5
" 'top', 'bottom', 'left', 'right', 'topleft', 'topright', 'bottomleft', 'bottomright', 'center', 'auto'
let g:floaterm_position = 'bottomright'
let g:floaterm_winblend = 0
let g:floaterm_opener = 'vsplit'

" ===
" === fzf.vim
" ===
" use `<LEADER>` as fzf.vim prefix key
nnoremap <LEADER>f :Files<CR>
nnoremap <LEADER>g :GFiles?<CR>
nnoremap <LEADER>G :GFiles<CR>
nnoremap <LEADER>b :Buffers<CR>
nnoremap <LEADER>a :Ag<CR>
nnoremap <LEADER>r :Rg<CR>
nnoremap <LEADER>w :Windows<CR>
nnoremap <LEADER>n :BLines<CR>
nnoremap <LEADER>N :Lines<CR>
nnoremap <LEADER>i :BCommits<CR>
nnoremap <LEADER>I :Commits<CR>
nnoremap <LEADER>s :History:<CR>
nnoremap <LEADER>S :History<CR>
nnoremap <LEADER>d :Commands<CR>
nnoremap <LEADER>m :Gblame<CR>


" ===
" === coc.fzf
" ===
nnoremap <silent> <LEADER>;       :<C-u>CocFzfList<CR>
nnoremap <silent> <LEADER>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <LEADER>o       :<C-u>CocFzfList outline<CR>

" ===
" === Goyo
" ===
map <LEADER>y :Goyo<CR>
let g:goyo_width = 100
let g:goyo_linenr = 0

" ===
" === nerdcommenter
" ===
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

" ===
" === Startify
" ===
let g:startify_lists = [
     \ { 'type': 'files',     'header': ['   MRU']            },
     \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
     \ { 'type': 'commands',  'header': ['   Commands']       },
     \ ]

" ===
" === indent-blankline
" ===
" let g:indent_blankline_char = '┊'

" ===
" === tsx
" ===
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" ===
" === fish
" ===
au BufNewFile,BufRead fish_funced set ft=fish

" ===
" === Gist
" ===
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1

" ===
" === Necessary Commands to Execute
" ===
"clear search high light whem use vim or nvim open a file
exec "nohlsearch"
