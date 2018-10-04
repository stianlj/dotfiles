" PLUGIN LOADER
" -----------------------------------------------------------------------------

call g:plug#begin('~/.vim/plugged')

" More sensible Vim and project enhancement
Plug 'tpope/vim-sensible'
Plug 'airblade/vim-rooter'
Plug 'milkypostman/vim-togglelist'
Plug 'editorconfig/editorconfig-vim'
Plug 'ktonga/vim-follow-my-lead'
Plug 'terryma/vim-expand-region'
" Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'kaicataldo/material.vim'
Plug 'mhinz/vim-startify'

" Code enhancing plugins
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'ciaranm/detectindent'
" Plug 'terryma/vim-multiple-cursor'
Plug 'tomtom/tcomment_vim'
" Plug 'amirh/HTML-AutoCloseTag'
Plug 'alvan/vim-closetag'
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'
" Plug 'easymotion/vim-easymotion'
" Plug 'janko-m/vim-test'

" Utils and GUI
Plug 'itchyny/lightline.vim' | Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons'
" Plug 'bling/vim-airline' | Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-bufferline'
Plug 'Yggdroot/indentLine'
" Plug 'SirVer/ultisnips'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" Plug 'ervandew/supertab'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" CSV
Plug 'chrisbra/csv.vim'

" CtrlP plugins
" Plug 'kien/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'endel/ctrlp-filetype.vim'
Plug 'DavidEGx/ctrlp-smarttabs'
Plug 'tacahiroy/ctrlp-funky'
Plug 'sgur/ctrlp-extensions.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" General languages
Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/colorizer'
Plug 'trusktr/seti.vim'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'christophermca/meta5'
Plug 'zenorocha/dracula-theme'
" Plug 'scrooloose/syntastic' "
" Plug 'benekastah/neomake'
Plug 'w0rp/ale'
Plug 'keith/investigate.vim'
Plug 'KabbAmine/zeavim.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'smancill/conky-syntax.vim'
Plug 'mileszs/ack.vim'

" CSS frameworks
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'wavded/vim-stylus'
Plug 'cakebaker/scss-syntax.vim'

" HTML
Plug 'mattn/emmet-vim' " Emmet.io support in Vim

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'shime/vim-livedown'

" Javascript
Plug 'moll/vim-node'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'walm/jshint.vim'
Plug 'flowtype/vim-flow'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
" Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'

" Openhab
Plug 'cyberkov/openhab-vim'

" Scratchpad
Plug 'metakirby5/codi.vim'

" sxhkd
Plug 'kovetskiy/sxhkd-vim'

call g:plug#end()

" SETTINGS
" -----------------------------------------------------------------------------

scriptencoding utf-8
syntax on
let s:uname = system("echo -n \"$(uname)\"")
" if !v:shell_error && s:uname ==# 'Linux'
"   let g:base16colorspace=256
" endif
" if &term =~ '256color'
"   set t_ut=
" endif
" set termguicolors
set relativenumber
set number
set mouse=a
set list
set autowrite

set swapfile
set directory=/tmp

set colorcolumn=120
highlight ColorColumn guibg=#211818 ctermbg=235
set laststatus=2
set noshowmode
set lazyredraw
set softtabstop=2 " makes the spaces feel like real tabs
set background=dark
colorscheme nord

let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_comment_brightness = 15

let g:mapleader="\<Space>"

set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

let g:deoplete#enable_at_startup = 1

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
nmap <leader><Space> :w<cr>

" save read only files
cmap w!! w !sudo tee % >/dev/null

" shortcut for closing buffer
nmap <leader>, :bd<cr>

" shortcut for quit
nmap <leader>Q :qa!<cr>

" disable Ex mode
noremap Q <NOP>

" Split windows
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
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

nmap <Leader>lc :lclose<CR>

" PLUGINS
" -----------------------------------------------------------------------------

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" deoplete
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

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
" set omnifunc=syntaxcomplete#Complete
" " Remaping omni complete for convinience
" inoremap <C-@> <C-x><C-o>

" Tern completions
noremap <Leader>td :TernDef<CR>
noremap <Leader>trd :TernRefs<CR>
noremap <Leader>tdo :TernDoc<CR>
noremap <Leader>tt :TernType<CR>
noremap <Leader>tr :TernRename<CR>

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1

" Tagbar
map <Leader>t :TagbarToggle<CR>

" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#neomake#enabled = 1

" Lightline. Fonts:   
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&readonly?"":""}',
  \   'fugitive': '%{exists("*fugitive#head")?"  ".fugitive#head():""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
  \ }
  \ }

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
let g:ctrlp_use_caching = 0
noremap <leader>b :CtrlPBuffer<CR>
noremap <leader>. :CtrlPTag<CR>
let g:ctrlp_open_new_file = 'r'

" Ale
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_linters = {'javascript': ['eslint', 'flow', 'prettier']}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1

" let g:javascript_conceal_function             = "ƒ"
" let g:javascript_conceal_null                 = "ø"
" let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"
"
" set conceallevel=1

" Flow
let g:javascript_plugin_flow = 1

" Vim markdown
let g:vim_markdown_folding_disabled = 1

" Vim JSX
let g:jsx_ext_required = 0

" Investigate
let g:investigate_use_dash = 1
let g:investigate_dash_for_javascriptjsx = 'javascript'

" Zeavim
if !v:shell_error && s:uname ==# 'Linux'
  let g:zv_file_types = {
    \ 'javascript.jsx': 'javascript'
  \ }
  nmap gK <Plug>Zeavim
  vmap gK <Plug>ZVVisSelection
endif

" vim-json
" let g:vim_json_syntax_conceal = 0
" let g:indentLine_noConcealCursor=""
" set conceallevel=0

" AUTO GROUP
" -----------------------------------------------------------------------------

augroup configgroup
  autocmd BufNewFile,BufRead *.css set filetype=scss
  autocmd FileType make setlocal noexpandtab
  autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab
  autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

" FUNCTIONS
" -----------------------------------------------------------------------------

" NERDTrees File highlighting
function! s:NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call s:NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call s:NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call s:NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call s:NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call s:NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call s:NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call s:NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call s:NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call s:NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call s:NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call s:NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call s:NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call s:NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call s:NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call s:NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call s:NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call s:NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call s:NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

" Markdown mode
function! g:ToggleMarkdownMode()
  exec 'Goyo'
  exec 'Limelight!! 0.9'
endfunction
nmap <leader>m :call g:ToggleMarkdownMode()<CR>
