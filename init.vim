
filetype off
set t_co=256
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smartindent
set nowrap
syntax on
set wildignore+=*.pyc
autocmd Filetype html,ruby,javascript,yml,yaml,json,haskell,ejs,htmldjango setlocal ts=2 sts=2 sw=2
set nu
set autochdir
set noswapfile
set background=dark
"let g:ycm_autoclose_preview_window_after_completion=1
set enc=utf-8
set fileencodings=ucs-bom,utf8,prc
set fileencoding=utf-8
set hlsearch 
set incsearch 
set nofoldenable
filetype plugin indent on

let mapleader = " " 

call plug#begin("~/AppData/Local/nvim/plugged")
" Plugin Section
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'crusoexia/vim-monokai'
Plug 'whatyouhide/vim-gotham'
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
"Plug 'jiangmiao/auto-pairs' 
Plug 'vim-airline/vim-airline'
Plug 'zchee/deoplete-jedi'
":Pl'mitt/taline.vim'Pl: 'ryanoasis/vim-eviconsi
Plug 'neovim/nvim-lspconfig'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Directory sidebar tree view
Plug 'scrooloose/nerdtree'
" setting up golang
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'fatih/vim-go'
"autocomplete
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-go'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
"Snippets:
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
" Json plugin
"Plug 'elzr/vim-json'
" Text search your project directory
Plug 'dyng/ctrlsf.vim'
" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Root the project dir to folder w/ .git if applicable
Plug 'airblade/vim-rooter'
" Nice colorscheme based on Visual Studio dark
Plug 'tomasiser/vim-code-dark'
"vim pluggin to work with react typescript file .tsx
Plug 'ianks/vim-tsx'
Plug 'mxw/vim-jsx'
" typescript-vim will do all the coloring for typescript keywords
"Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

call plug#end()
  

"Config Section
if (has("termguicolors"))
	 set termguicolors
endif

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-t': 'tabe'
      \ }
nnoremap <c-p> :FZF<cr>
nnoremap <c-f> :Rg<cr>
let g:go_fmt_command = "goimports"
"settinf the Auto formater
"noremap <silent> <space>f :Autoformat<CR>

"FILE BROWSER:
""-------------
"allows NERDTree to open/close by typing 'n' then 't'
"nnoremap nt :NERDTreeTabsToggle<Enter>
""Start NERDtree when dir is selected (e.g. "vim .") and start NERDTreeTabs
"let g:nerdtree_tabs_open_on_console_startup=2
"Add a close button in the upper right for tabs
"let g:tablineclosebutton=1
""Automatically find and select currently opened file in NERDTree
"let g:nerdtree_tabs_autofind=1
"Add folder icon to directories
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:DevIconsEnableFoldersOpenClose = 1
""Hide expand/collapse arrows
"let g:NERDTreeDirArrowExpandable = "\u00a0"
" g:NERDTreeDirArrowCollapsible = "\u00a0"
"let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
"highlight! link NERDTreeFlags NERDTreeDir

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
    "
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
    "
    " " Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
    "
    "" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
    " Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " " Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " " Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " " Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " " Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " " Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " " Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"AUTOCOMPLETE:
"-------------
augroup ncm2
     au!
     autocmd BufEnter * call ncm2#enable_for_buffer()
     set completeopt=noinsert,menuone,noselect
     au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
     au User Ncm2PopupClose set completeopt=menuone
augroup END
        "Press Enter to select item in autocomplete popup
          "iinoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")
          "Cycle through completion entries with tab/shift+tab
          inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
          inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"
          "Allow getting out of pop with Down/Up arrow keys
          inoremap <expr> <down> pumvisible() ? "\<C-E>" : "\<down>"
          inoremap <expr> <up> pumvisible() ? "\<C-E>" : "\<up>"

"by default .ts file are not identified as typescript and .tsx files are not
" " identified as typescript react file, so add following
"au BufNewFile,BufRead *.ts setlocal filetype=typescript
"au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx"


"ale config
let g:ale_linters = {"python": ["flake8"]}
let g:ale_fixers ={'*':[], 'python': ['black']}
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1
" coc config
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
"\ 'coc-tsserver',
\ 'coc-eslint', 
\ 'coc-prettier', 
\ 'coc-json', 
\ 'coc-emmet',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yank',
"\ 'coc-deno',
\ 'coc-python',
\ 'coc-markdownlint'
\ ]

let g:gruvbox_contrast_dark ='hard'
let g:gruvbox_invert_selection = '0'
let g:netrw_banner = 0
set viminfo='100,<1000,s10,h
set number 
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
"let NERDTreeQuitOnOpen = 1
syntax enable
colorscheme gotham
" open new split panes to right and below
" set splitright
" set splitbelow
" " turn terminal to normal mode with escape
" tnoremap <Esc> <C-\><C-n>
" " start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" " open term,inal on ctrl+n
" function! OpenTerminal()
"   split term://bash
"     resize 10
"     endfunction
"     nnoremap <c-n> :call OpenTerminal()<CR>"


"setting up netrw file explorer 
nmap <space>e :wincmd v<bar> :Ex<Bar> vertical resize 25 <CR>
