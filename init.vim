let g:mapleader = "\<Space>"
set nocompatible


filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.
set nu rnu 


"Plugins
call plug#begin()
Plug 'vim-airline/vim-airline'                                  " Status Tabline
Plug 'preservim/nerdtree'                                       " Folder Tree structure 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             
Plug 'junegunn/fzf.vim'                                         " Fuzzy Finder
Plug 'neoclide/coc.nvim', {'branch': 'release'}                 " Completion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " Highlighting
call plug#end()



"Highlighting Settings
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", 
    highlight = {
        enable = true              
         },
    }
EOF

"Plugin Settings
let g:fzf_preview_window = 'right:50'
let g:fzf_layout = {'window' : { 'width' : 0.7, 'height' : 0.6 } }


"Plugin Mappins
nnoremap <silent> <leader>n   :NERDTreeToggle<CR>
nnoremap <silent> <leader><space> :Files<CR>
map <leader>r :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw <CR>
map <leader>c :cclose<CR>

"Coc Remappings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction



"Colors

:colorscheme jellybeans
"colorscheme 256_noir
"set cursorline
"highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
"autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
"autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

