" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·

set number
set relativenumber
set numberwidth=4
set ts=4 sts=4 sw=4 expandtab

" Fix powerline status on Arch
let g:pymcd_powerline="py3"

" Easily switch windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Manage plugins here
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'tomasr/molokai'
Plug 'tpope/vim-rails'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Lokaltog/powerline'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
call plug#end()

" set 256 colours
set t_Co=256
colorscheme seoul256

if has("autocmd")
    " Put file syntax preferences here
    filetype indent plugin on

    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

    autocmd BufWritePre *.py,*.js,*.rb :call <SID>StripWhitespace()
    nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
endif

function! <SID>StripWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")

    " Do the business:
    %s/\s\+$//e

    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
