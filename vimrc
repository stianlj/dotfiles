" PLUGIN LOADER
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" More sensible Vim and project enhancement
Plug 'tpope/vim-sensible'
Plug 'airblade/vim-rooter'
Plug 'milkypostman/vim-togglelist'
Plug 'editorconfig/editorconfig-vim'
Plug 'ktonga/vim-follow-my-lead'
Plug 'terryma/vim-expand-region'
Plug 'chriskempson/base16-vim'

" Code enhancing plugins
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'ciaranm/detectindent'
" Plug 'terryma/vim-multiple-cursor'
Plug 'tomtom/tcomment_vim'
Plug 'amirh/HTML-AutoCloseTag'
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'
" Plug 'easymotion/vim-easymotion'
" Plug 'janko-m/vim-test'

" Utils and GUI
Plug 'bling/vim-airline' | Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-bufferline'
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips'
Plug 'rking/ag.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'ervandew/supertab'

" CtrlP plugins
Plug 'kien/ctrlp.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'endel/ctrlp-filetype.vim'
Plug 'DavidEGx/ctrlp-smarttabs'
Plug 'tacahiroy/ctrlp-funky'
Plug 'sgur/ctrlp-extensions.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" General languages
Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/colorizer'
Plug 'trusktr/seti.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'christophermca/meta5'
Plug 'zenorocha/dracula-theme'
" Plug 'scrooloose/syntastic' "
Plug 'benekastah/neomake'

" CSS frameworks
Plug 'groenewege/vim-less'
Plug 'wavded/vim-stylus'

" HTML
Plug 'mattn/emmet-vim' " Emmet.io support in Vim

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Javascript
Plug 'moll/vim-node'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'walm/jshint.vim'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
" Plug 'jelera/vim-javascript-syntax'
" Plug 'mxw/vim-jsx'

call plug#end()

" SETTINGS
" -----------------------------------------------------------------------------

syntax on
" let base16colorspace=256
" set t_Co=256
color base16-monokai
set background=dark
set relativenumber
set number
set mouse=a
set list

set swapfile
set dir=/tmp

set colorcolumn=80
highlight ColorColumn guibg=#211818 ctermbg=235
set laststatus=2
set noshowmode
set lazyredraw
set softtabstop=2 " makes the spaces feel like real tabs

let mapleader="\<Space>"

set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

let g:indentLine_color_term = 239

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.pyc,__pycache__

" KEY MAPPINGS
" -----------------------------------------------------------------------------

" Stop using arrows!
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" shortcut to save
nmap <leader>, :w<cr>

" disable Ex mode
noremap Q <NOP>

" Split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" For convenience (and shitty workflow at work)
noremap <C-a> :%y+<CR>

" Easily copy to and from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" PLUGINS
" -----------------------------------------------------------------------------

" Vim-expand-plugin
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Map Gundo to F5
nnoremap <F5> :GundoToggle<CR>

" CtrlP funky (function search)
let g:ctrlp_extensions = ['funky']

" CtrlP for filetype
let g:ctrlp_extensions = ['filetype']

" Tern autocomplete
set omnifunc=syntaxcomplete#Complete
" Remaping omni complete for convinience
inoremap <C-@> <C-x><C-o>

" Tern completions
" noremap <M-.> :TernDef<CR>
" noremap <M-Space> :TernRefs<CR>

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" Tagbar
map <Leader>t :TagbarToggle<CR>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#neomake#enabled = 1

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_open_new_file = 'r'

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" Vim markdown
let g:vim_markdown_folding_disabled=1

" AUTO GROUP
" -----------------------------------------------------------------------------

augroup configgroup
  autocmd FileType make setlocal expandtab
  autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab
  autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
  autocmd! BufWritePost * Neomake
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

" FUNCTIONS
" -----------------------------------------------------------------------------

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

" Markdown mode
function! ToggleMarkdownMode()
  exec 'Goyo'
  exec 'Limelight!! 0.8'
endfunction
nmap <leader>m :call ToggleMarkdownMode()<CR>
