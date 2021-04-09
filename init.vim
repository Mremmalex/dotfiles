filetype off
set t_co=256
set rnu
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smartindent
set nowrap
syntax on
set autochdir
set wildignore+=*.pyc
set encoding=UTF-8
set modifiable
set noswapfile
set enc=utf-8
set fileencodings=ucs-bom,utf8,prc
set fileencoding=utf-8
set hlsearch 
set incsearch 
set nofoldenable
filetype plugin indent on
set guifont=Hack\ Nerd\ Font\ 11

let mapleader = " " 
let g:airline_powerline_fonts = 1
hi normal guibg=NONE ctermbg=NONE

call plug#begin("~/AppData/Local/nvim/plugged")
" Plugin Section
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'whatyouhide/vim-gotham'
Plug 'voldikss/vim-floaterm'
"Python autocomplete
if has('nvim')
   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
endif
"formater
Plug 'Chiel92/vim-autoformat'"
"setting up ale 
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
"Plug 'jiangmiao/auto-pairs' 
Plug 'vim-airline/vim-airline'
Plug 'zchee/deoplete-jedi'
":Pl'mitt/taline.vim'Pl: 'ryanoasis/vim-eviconsi
" Git wrapper
Plug 'tpope/vim-fugitive'
" Directory sidebar tree view
Plug 'ryanoasis/vim-devicons'
" setting up golang
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plug 'fatih/vim-go'

"autocomplete
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-go'
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" Text search your project directory
Plug 'dyng/ctrlsf.vim'
Plug 'tomlion/vim-solidity'
" Fuzzy file finder
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"
" Root the project dir to folder w/ .git if applicable
Plug 'airblade/vim-rooter'
"vim pluggin to work with react typescript file .tsx
Plug 'ianks/vim-tsx'
Plug 'mxw/vim-jsx'
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
call plug#end()
  

"Config Section
if (has("termguicolors"))
	 set termguicolors
endif
"change the default mapping and command to invoke ctrlp
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

if filereadable(expand("~/.config/nvim/plugged/fzf.vim/plugin/fzf.vim"))
    let $FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{**/node_modules/**,.git/*,**/*.pem,**/venv/**}"'
    let $FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
    nnoremap <leader>ff :Files<CR>
    nnoremap <leader>fg :Rg<CR>
endif

 "'' VIM Keymaps ''"
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>

   
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-t': 'tabe'
      \ }
nnoremap <c-p> :FZF<cr>
nnoremap <c-f> :Rg<cr>
let g:go_fmt_command = "goimports"

" -------------------------------------------------------------------------------------------------
"  " coc.nvim default settings
"  "
"  -------------------------------------------------------------------------------------------------
"
"  " if hidden is not set, TextEdit might fail.
set hidden
"  " Better display for messages
set cmdheight=2
"  " Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
"  " don't give |ins-completion-menu| messages.
set shortmess+=c
"  " always show signcolumns
set signcolumn=yes
"Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"  

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction

    " Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <c-c> <esc> <CR>
    " " Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
    "
    "" Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)"
    " "

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>
"  Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
    " Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

"ale config
let g:ale_fixers ={'*':[], 'python': ['black']}
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
\ 'go': ['gopls'],
\ "python": ["flake8"],
\}

" coc config
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-tsserver',
\ 'coc-eslint', 
\ 'coc-prettier', 
\ 'coc-json', 
\ 'coc-emmet',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yank',
\ 'coc-python',
\ 'coc-markdownlint',
\ 'coc-go',
\ 'coc-yaml',
\ 'coc-docker',
\ 'coc-tailwindcss',
\ 'coc-marketplace',
\ 'coc-explorer',
\ 'coc-flutter',
\ ]


let g:gruvbox_contrast_dark ='hard'
let g:gruvbox_invert_selection = '0'
let g:netrw_banner = 0
set viminfo='100,<1000,s10,h
set number 
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
syntax enable
colorscheme gruvbox 

"setting up floaterm 
nmap <silent> <leader>z :FloatermNew <CR>
nmap <silent> <leader>tt :FloatermToggle <CR>
nmap <silent> <leader>tp :FloatermPrev <CR>
nmap <silent> <leader>tn :FloatermNext <CR>
nmap <silent> <leader>tc :FloatermKill <CR>

let g:floaterm_keymap_new = "<leader>z"
let g:floaterm_keymap_toggle = "<leader>tt"
let g:floaterm_keymap_prev = "<leader>tp"
let g:floaterm_keymap_next = "<leader>tn"
let g:floaterm_keymap_kill = "<leader>tc"

let g:floaterm_width = 90
let g:floaterm_height = 30


"setting auto import for go 
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
"setting up coc explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }
nmap <silent> <space>e :CocCommand explorer<CR>
nmap <silent> <space>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
" setting up netrw file explorer 
" nmap <space>e :wincmd v<bar> :Ex<Bar> vertical resize 25 <CR>
