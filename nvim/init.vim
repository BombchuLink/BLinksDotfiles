
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
	Plug 'Valloric/YouCompleteMe'
	Plug 'tpope/vim-surround'
	Plug 'scrooloose/nerdtree'
	Plug 'junegunn/goyo.vim'
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'jreybert/vimagit'
	Plug 'vimwiki/vimwiki'
	Plug 'bling/vim-airline'
	Plug 'tpope/vim-commentary'
	Plug 'kovetskiy/sxhkd-vim'
	Plug 'mbbill/undotree'
	Plug 'lyuts/vim-rtags'
	Plug 'rdnetto/YCM-Generator'
	Plug 'ThePrimeagen/vim-be-good'
call plug#end()

set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus

" Some basics:
	"nnoremap c "_c
	set nocompatible
	set tabstop=4 softtabstop=4
	set shiftwidth=4
	set smartindent
	"set nowrap
	set smartcase
	set noswapfile
	set nobackup
	set undodir=~/.config/nvim/undodir
	set undofile
	set incsearch
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"set YCM colours
	highlight SpellBad ctermbg=5
	highlight SpellCap ctermbg=1
	highlight DiffAdd ctermbg=1
	highlight DiffChange ctermbg=5
	"To see more, type the command :highlight

"ripGrep setup stuffs
if executable('rg')
	let g:rg_derive_root='true'
endif

let g:netrw_brose_split=2
let g:netrw_banner=0
let g:netrw_winsize=25
let g:ctrlp_use_caching=0


" general leader maps
let mapleader =" "


" typing these things every time is so dumb
" make commenting stuff easy
nnoremap <leader>c I//<Esc>
nnoremap <leader>C 0f/xx<Esc>
" typing -> is painful
nnoremap <leader>n anpc->
nnoremap <leader>N onpc->
" printf godmode
nnoremap <leader>P oprintf("$\n");<Esc>F$xi
" I can't remember how the KEYS thing goes half the time
nnoremap <leader>K ikeys[KEY_$].<Esc>F$xi<CR>
" Make adding .html links easy
nnoremap <leader>L i<a/href="../$/$.html">Q</a><esc>F$<CR>

" better window movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 55<CR>
nnoremap Y :vertical resize +15<CR>
nnoremap <leader>Y :vertical resize -15<CR>

" YMC stuff
let g:ycm_extra_conf_globalist = ['/home/blink/drives/tco/*']
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent> <Leader>gc :YcmGenerateConfig<CR>


" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	" set splitbelow splitright
	set splitbelow

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Copy selected text to system clipboard:
	vnoremap <C-c> "+y
	map <C-p> "+P

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
