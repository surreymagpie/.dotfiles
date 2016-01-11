" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

set number
set relativenumber
set numberwidth=4
set ts=4 sts=4 sw=4 expandtab

" Easily switch windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Manage plugins here
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'
Plug 'tpope/vim-rails'
call plug#end()


if has("autocmd")
    " Put file syntax preferences here
    filetype indent plugin on

    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
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

