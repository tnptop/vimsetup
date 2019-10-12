" => Vim UI
syntax on
set number
set t_Co=256
let mapleader=","

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" => Text, tab and indent
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 2 spaces per tab
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent, Smart indent, Wrap lines
set ai
set si
set wrap

" => Files, backups and undo
" Turn backup off, since most stuff is in SVN, git et.c anyway
set nobackup
set nowb
set noswapfile

" => Windows splitting
" Map keys > <Bar> = |
map <Tab> <C-W>w
map <Bar> <C-W>v<C-W><Right>
map _ <C-W>s<C-W><Down>

" => Others
" Toggle paste mode with F2
set pastetoggle=<F2>
nnoremap <F3> :noh<CR>

" Highlight stupid whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s+$/

" Change parenthesis color
highlight MatchParen cterm=bold ctermbg=yellow

" Change highlight color when goes to next search result
nnoremap <silent> n n:call HLNext(0,1)<CR>
nnoremap <silent> N N:call HLNext(0.1)<CR>
function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" Clipboard
set clipboard=unnamed

" => Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Vundle core
Plugin 'VundleVim/Vundle.vim'

" Plugin list, alphabetical ordered
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'ternjs/tern_for_vim'
Plugin 'tomlion/vim-solidity'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wakatime/vim-wakatime'

call vundle#end()
filetype plugin indent on

" => Plugin configs
" Airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'
set guifont=Sauce_Code_Powerline:h10
let g:airline#extensions#branch#enabled=1

" BufExplorer
nnoremap <C-B> :ToggleBufExplorer<CR>

" Colorscheme
colorscheme molokai

" CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_open_multiple_files = 'ij'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/flask,*/node_modules

" Fugitive
set diffopt+=vertical

" NERD commenter
filetype plugin on

" NERD tree
nmap <silent> <C-T> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$','\.o$']
let NERDTreeQuitOnOpen=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=${SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_python_checkers=['python3']

" Tmuxline
let g:tmuxline_preset = {
  \'a'      : '#S',
  \'win'    : '#W',
  \'cwin'   : '#W',
  \'y'      : '#(date)',
  \'z'      : ['#(whoami)'],
  \'options': {'status-justify': 'left'}
  \}

" YouCompleteMe
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

