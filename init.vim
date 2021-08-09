" ====================
" === Editor Setup ===
" ====================

" ===
" === system
" ===
" no compatiable to vi
set nocompatible
" copy from system clipboard
set clipboard=unnamed
" let the color compatiable to terminal
let &t_ut=' '
" autowrite buffer to file
set autowriteall

let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/local/bin/python'

" ===
" === display
" ===
" show the hidden char like tab
set list
set showcmd
set wrap
set cursorline
set listchars=tab:▸\ ,trail:▫

" ===
" === tab
" ===
set expandtab
set tabstop=2
" for autoindent
set shiftwidth=2
set softtabstop=2

" ===
" === search
" ===
set ignorecase
set smartcase
set hlsearch
set incsearch

" ===
" === fold
" ===
" the kind of folding used for the current window
set foldmethod=indent
set foldlevel=99
set foldenable

" ===
" === editor behavior
" ===
" apply the indentation of the current line to the next
set autoindent

set splitright
set splitbelow

set backspace=indent,eol,start
set formatoptions-=tc
set textwidth=0
set inccommand=split
set lazyredraw
set visualbell

" corsor distance form buffer edge some lines
set scrolloff=2
" allow for mappings includes 'Esc', while preserving zero timeout after pressing it manually
set ttimeoutlen=0
set notimeout
" rember the cursor positon and other status when reopen file
set viewoptions=cursor,folds
" expression whis is evaluated to obtain the proper indent for a line
set indentexpr=
" if in insert, replace  or visual mode put a message on the last lie swith to not show this lie
set noshowmode
" open command line comletion in enhanced mode
set wildmenu


" ===
" === Basic Mappings
" ===
" Set <LEADER>
let mapleader=' '

" for quick quit
nnoremap <LEADER>q :q<CR>
nnoremap <LEADER>! :q!<CR>

" Make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

" Clear all search high light
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

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
nnoremap <C-a> 0
nnoremap <C-e> $
inoremap <C-a> <home>
inoremap <C-e> <end>
cnoremap <C-a> <home>
cnoremap <C-e> <end>
inoremap <C-d> <del>
" for insert quick word move
inoremap <M-f> <C-o>w
inoremap <M-b> <C-o>b

" ===
" === Window management
" ===
" using native <C-w>h/j/k/l and <C-w>v/s/c/q
" Resize splits with arrow keys
nnoremap <up> :res +5<CR>
nnoremap <down> :res -5<CR>
nnoremap <left> :vertical resize+5<CR>
nnoremap <right> :vertical resize-5<CR>

" ===
" === Tab management
" ===
nnoremap <silent> <LEADER>tc :tabnew<CR>
nnoremap <silent> <LEADER>tq :tabclose<CR>
nnoremap <silent> <LEADER>tn :tabnext<CR>
nnoremap <silent> <LEADER>tp :tabprev<CR>
nnoremap <silent> <LEADER>to :tabonly<CR>
nnoremap <silent> <LEADER>tl :-tabmove<CR>
nnoremap <silent> <LEADER>tr :+tabmove<CR>

" <Leader>[1-9] move to tab [1-9]
nnoremap <silent><LEADER>1 1gt<CR>
nnoremap <silent><LEADER>2 2gt<CR>
nnoremap <silent><LEADER>3 3gt<CR>
nnoremap <silent><LEADER>4 4gt<CR>
nnoremap <silent><LEADER>5 5gt<CR>
nnoremap <silent><LEADER>6 6gt<CR>
nnoremap <silent><LEADER>7 7gt<CR>
nnoremap <silent><LEADER>8 8gt<CR>
nnoremap <silent><LEADER>9 9gt<CR>

" ===
" === Terminal
" ===
" Using esc in term mode
tnoremap <ESC> <C-\><C-n>

" ===
" === Autocmd
" ===
if has("autocmd")
  augroup EditVim
    autocmd!
    autocmd BufNewFile,BufRead fish_funced set ft=fish
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
    " open the fiel cursor at hte last edited position
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  augroup END
endif

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
Plug 'itchyny/lightline.vim'

" coc and fzf
" note: fzf quit with <C-g> ( <C-q> <C-c> ) and move with <C-n/p> or <C-j/k>
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
Plug 'tpope/vim-surround' " S{x} to add x to selected text, and `cs{x}{y}` `ds{x}` `ysiw<em>`
Plug 'easymotion/vim-easymotion'

" on demand utilities
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'voldikss/vim-floaterm', { 'on': ['FloatermToggle', 'FloatermNew'] }

" gist.github.com
Plug 'mattn/webapi-vim', { 'on': 'Gist' }
Plug 'mattn/vim-gist', { 'on': 'Gist' }

" language specific
Plug 'luochen1990/rainbow', { 'for': 'clojure' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'chr4/nginx.vim', {'for': ['nginx']}
Plug 'fladson/vim-kitty', { 'for': 'kitty' }

" Initialize plugin system
call plug#end()


" ===
" === Color theme
" ===
" enable true colors support
set termguicolors
colorscheme darcula

" ===
" === lightline
" ===
" colorscheme wombat, darcula, darculaOriginal
let g:lightline = {
      \ 'colorscheme': 'darculaOriginal',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" ===
" === Rainbow
" ===
let g:rainbow_active = 1

" ===
" === easymotion
" ===
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <LEADER>s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <LEADER>vv <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <LEADER>j <Plug>(easymotion-j)
map <lEADER>k <Plug>(easymotion-k)

" ===
" === NERDTree
" ===
nnoremap <LEADER>tt :NERDTreeToggle<CR>
nnoremap <LEADER>l :NERDTreeFind<CR>
nnoremap <LEADER>c :NERDTreeFocus<CR>

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
nnoremap <silent> <LEADER>f :Files<CR>
nnoremap <silent> <LEADER>g :GFiles?<CR>
nnoremap <silent> <LEADER>b :Buffers<CR>
nnoremap <silent> <Leader>r :Rg <C-R><C-W><CR>
xnoremap <silent> <Leader>r y:Rg <C-R>"<CR>
nnoremap <silent> <LEADER>R :Rg<CR>
nnoremap <silent> <LEADER>w :Windows<CR>
nnoremap <silent> <LEADER>i :BCommits<CR>
nnoremap <silent> <LEADER>I :Commits<CR>
nnoremap <silent> <LEADER>d :Commands<CR>
nnoremap <silent> <LEADER>a :Git blame<CR>
nnoremap <silent> <LEADER>m :Marks<CR>

" ===
" === coc.fzf
" ===
nnoremap <silent> <LEADER>;       :CocFzfList<CR>
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
" === coc
" ===
" TextEdit might fail if hidden is not set.
set hidden
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" set cmdheight=2
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
