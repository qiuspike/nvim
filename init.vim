" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
" no compatiable to vi
set nocompatible
" copy from system clipboard
set clipboard=unnamed
" let the color compatiable to terminal
let &t_ut=' '

" enable mouse scroll
" set mouse=nv

" ===
" === Editor behavior
" ===
" show corsor line
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

" ===
" === Basic Mappings
" ===
" Set <LEADER>
let mapleader=' '

" Reload config file
map R :source ~/.config/nvim/init.vim<CR>

" Open the init.vim file anytime
map <LEADER>R :e ~/.config/nvim/init.vim<CR>

" Open config.fish
map <LEADER>F :e ~/.config/fish/config.fish<CR>

" Make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

" Clear all search high light
noremap <LEADER><CR> :nohlsearch<CR>

" line number
noremap <C-L><C-L> :set invnumber<CR>
inoremap <C-L><C-L> <C-O>:set invnumber<CR>

" ===
" === Cursor Movement
" ===
"
" cursor movement in emacs style
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
" C-a C-e for line move
noremap <C-a> 0
noremap <C-e> $

inoremap <C-a> <home>
inoremap <C-e> <end>
inoremap <C-d> <del>

" ===
" === Window management
" ===
" Use <LEADER> + new arrow keys for moving the cursor around windows
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize+5<CR>
noremap <right> :vertical resize-5<CR>

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
" Using esc in term mode
tnoremap <ESC> <C-\><C-n>

" ===
" === Autocmd
" ===
augroup EditVim
  autocmd!
  autocmd BufNewFile,BufRead fish_funced set ft=fish
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
  " using q to quit help doc
  autocmd FileType help noremap <buffer> q :q<cr>
  " open the fiel cursor at hte last edited position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" =====================
" === Plugins Setup ===
" =====================

" ===
" === Install Plugins with Vim-Plug
" === In normal mode type "PlugInstall" to install plugs
" ===
"vim-plug begin
call plug#begin('~/.config/nvim/plugged')

" color theme
Plug 'doums/darcula'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'

" coc and fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" editor and git
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'

" useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip it
Plug 'scrooloose/nerdcommenter' " in <LEADER>cc to comment a line; <LEADER>ci

" on demand utilities
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'voldikss/vim-floaterm', { 'on': 'FloatermToggle' }

" gist.github.com
Plug 'mattn/webapi-vim', { 'on': 'Gist' }
Plug 'mattn/vim-gist', { 'on': 'Gist' }

" language specific
Plug 'luochen1990/rainbow', { 'for': 'clojure' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'chr4/nginx.vim', {'for': ['nginx']}

" Initialize plugin system
call plug#end()


" ===
" === Color theme
" ===
" enable true colors support
set termguicolors
colorscheme darcula
let g:lightline = { 'colorscheme': 'darculaOriginal' }

" ===
" === airline
" ===
let g:airline_highlighting_cache = 1

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

let g:coc_global_extensions = ['coc-html', 'coc-yaml', 'coc-json', 'coc-css', 'coc-tailwindcss', 'coc-yank', 'coc-stylelint',  'coc-floaterm', 'coc-lists', 'coc-tsserver', 'coc-vimlsp', 'coc-sh', 'coc-go', 'coc-rust-analyzer', 'coc-clangd', 'coc-lua', 'coc-pyright', 'coc-sql']

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
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
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
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

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
nnoremap   <silent>   <C-x>    :FloatermNext<CR>
tnoremap   <silent>   <C-x>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <C-c>    :FloatermNew<CR>

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
nnoremap <LEADER>b :Buffers<CR>
nnoremap <LEADER>a :Ag<CR>
nnoremap <LEADER>r :Rg<CR>
nnoremap <LEADER>w :Windows<CR>
nnoremap <LEADER>i :BCommits<CR>
nnoremap <LEADER>I :Commits<CR>
nnoremap <LEADER>d :Commands<CR>
nnoremap <LEADER>m :Gblame<CR>

" ===
" === coc.fzf
" ===
nnoremap <silent> <LEADER>;       :<C-u>CocFzfList<CR>
nnoremap <silent> <LEADER>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <LEADER>o       :<C-u>CocFzfList outline<CR>

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
exec 'nohlsearch'
