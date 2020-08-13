call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'preservim/nerdtree'
Plug 'yuezk/vim-js'
Plug 'leafgarland/typescript-vim'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'ianks/vim-tsx'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set number
set tabstop=2
set shiftwidth=2
set softtabstop=2

let g:javascript_plugin_jsdoc = 1

set cindent

map <C-n> :NERDTreeToggle<CR>

" Dracula config
colorscheme dracula

" Ale config
let g:ale_fixers = { 'javascript': ['eslint'], 'css': ['prettier'], }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" Prettier config
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'true'

" coc config
let g:coc_global_extensions = [
        \ 'coc-snippets',
        \ 'coc-pairs',
        \ 'coc-tsserver',
        \ 'coc-eslint',
        \ 'coc-prettier',
        \ 'coc-json'
        \ ]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)

" FZF
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" Ctrl-P uses fzf
nnoremap <C-p> :Files<Cr>
" Crtl-S greps all files in root
nnoremap <C-s> :Rg<Cr>
