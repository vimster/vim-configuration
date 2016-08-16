set nocompatible
" set encoding=utf-8
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

call pathogen#infect()

" bind leader key to ","
:let mapleader = ","

" easy motion
let g:EasyMotion_leader_key = ','

" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" neo autocomplete startup
let g:neocomplcache_enable_at_startup = 1

" personal mappings
imap jj <esc>
imap kk <esc>
map ö }
map ä {
set ignorecase
set smartcase
set incsearch
map <Space> @q
noremap L $
noremap H ^
noremap M %
nnoremap <c-b> <c-v>

" sync tree with current buffer
map <leader>r :NERDTreeFind<cr>

" Backup path for swap files
set backupdir=~/vimfiles/tmp,.
set directory=~/vimfiles/tmp,.

"
" Use ctrl-[hjkl] to select the active split!
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" set size of window
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=900 columns=900
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" indent
set expandtab
set shiftwidth=2
set softtabstop=2




autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
nmap <leader>r :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.aux$', '\.bbl$', '\.blg$', '\.fdb_latexmk$', '\.fls$', '\.pdf$', '\.latexmain$', '\.toc$', '\.cls$']


"plugins
syntax enable
filetype plugin indent on

" line numbers: not in nerdtree, ...
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
set number

" map control-backspace to delete the previous word
:imap <C-BS> <C-W>


" latexbox
map <leader>lm :Latexmk<cr>
map <leader>lv :LatexView<cr>


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map={"mode":"passive", "active_filetypes": [], "passive_filetypes": []}

" syntastic haskell
let g:syntastic_haskell_checkers = ['hlint', 'ghc_mod']
au FileType haskell nnoremap <buffer> <F5> :SyntasticCheck<CR>

" haskellmode
au BufEnter *.hs compiler ghc
:let g:haddock_browser="C:/Program Files (x86)/Mozilla Firefox/firefox.exe"
:let g:haddock_docdir="C:/Program Files/Haskell Platform/2014.2.0.0/doc/html"
:let g:haskellmode_completion_haddock=0

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)