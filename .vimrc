"" New Dev Environment

"" Install: ohmyzsh: https://github.com/ohmyzsh/ohmyzsh
" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
" put the line below inside ~/.zshrc
" ZSH_THEME="robbyrussell"

"" Install: pathogen (vim package manager) -- there is a native one, but i'm too lazy to learn it rn
" https://github.com/tpope/vim-pathogen
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

execute pathogen#infect()

syntax enable                    " syntax highlighting
filetype plugin indent on        " load file type, plugins, indentation
set showcmd                      " display incomplete commands

set nocompatible                 " choose no compatibility with legacy vi
set encoding=utf-8

"" Vim Theme
set background=dark              " syntax colors will show better if using a dark theme

"" Install: Better White Space: https://github.com/ntpeters/vim-better-whitespace
" git clone git://github.com/ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace
let g:strip_whitespace_on_save=1  " check for whitespace on save
let g:strip_whitespace_confirm=0  " remove having to press Y to confirm
let g:strip_only_modified_lines=1 " only remove on lines modified
"" Whitespace
set nowrap                     " don't wrap lines
set tabstop=2 shiftwidth=2     " tab is two sapces
set expandtab                  " use spaces, not tabs (optional)
set backspace=indent,eol,start " backspace through everything in insert mode
set autoindent

set pastetoggle=<f2>  " allows pasting of code without indentations

"" cmdline
set history=1000

"" Searching
set hlsearch   " highlight matches
set incsearch  " incremental searching
set ignorecase " case insensitive search
set smartcase  " ... unless they contain at least one capital letter

set laststatus=2  " set status line always

"" Pane Splitting
set splitright    " splits pane to right
  " Pane Movement
nnoremap <C-J> <C-W><C-J>           " ctrl + J navigates to the pane below
nnoremap <C-K> <C-W><C-K>           " ctrl + K navigates to the pane above
nnoremap <C-L> <C-W><C-L>           " ctrl + L navigates to the pane right
nnoremap <C-H> <C-W><C-H>           " ctrl + H navigates to the pane left

"" Line Numbers
set nu!     " set line numbers
set rnu!    " set relative numbers

function! NumberToggle()   " toggle between relative and absolute number lines
  if(&nu == 1)
    set nu!
    set rnu
  else
    set nornu
    set nu
  endif
endfunction
nnoremap <C-n> :call NumberToggle()<CR>  " Ctrl + n toggles between Relative and Absolute number lines

"" Install: Solarized colorscheme: https://github.com/altercation/vim-colors-solarized
" cd ~/.vim/bundle
" git clone git://github.com/altercation/vim-colors-solarized.git
let g:solarized_termcolors = 256 | 16
let g:solarized_termtrans  = 1
let g:solarized_degrade    = 0
colorscheme solarized             " use this colorscheme (theme)

set colorcolumn=80  " highlights column at breakpoint 80
highlight ColorColumn ctermbg=235

"" Key Remaps
  " FN Key Remaps
nnoremap <f1> :BufExplorer<cr>       " fn + f1 will bring up the plugin Buff Explorer

"" Install: NerdTree: https://vimawesome.com/plugin/nerdtree-red
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree
"" NerdTree Settings
let g:NERDTreeWinSize = 60    " NerdTree default window width
let NERDTreeShowLineNumbers=1 " enable line numbers

  " Ctrl Key Remaps
nnoremap <C-\> :NERDTreeToggle<cr>   " ctrl + \ will bring up the plugin NerdTree

"" Install: Syntastic: https://github.com/vim-syntastic/syntastic#installpathogen
" cd ~/.vim/bundle && \
" git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
"" Linter Toggle
nnoremap <C-w>F :SyntasticCheck<CR> :SyntasticToggleMode<CR>  " C+w then Shift + F for Toggling Syntastic Linter

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"" File Searching
"" Install: CtrlP: https://github.com/kien/ctrlp.vim
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
set runtimepath^=~/.vim/bundle/ctrlp.vim   " Ctrl + p
let g:ctrlp_by_filename=0    " search by filename as default
let g:ctrlp_regexp=0         " search by regex as default

"" Install: Ack: https://github.com/mileszs/ack.vim#can-i-use-ag-the-silver-searcher-with-this
" git clone https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
nmap <C-f> :Ack<space>  " ctrl + f to use :Ack
"" Install: Silver Searcher: https://github.com/ggreer/the_silver_searcher
" brew install the_silver_searcher

" Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in ctrlp for listing files, fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag fast enough that ctrlp does not need to cache
  let g:ctrlp_use_caching=0
endif
let g:ackprg = 'ag --nogroup --nocolor --column'

nnoremap <CR> :noh<CR><CR> " unsets last search pattern register by hitting return
