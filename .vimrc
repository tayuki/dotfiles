" .vimrc

if 0 | endif

"neobundle 
if has('vim_starting')
				if &compatible
								set nocompatible
				endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/.bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/Shougo/unite.vim'
NeoBundle 'git://github.com/tpope/vim-rails'
NeoBundle 'git://github.com/slim-template/vim-slim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'glidenote/serverspec-snippets'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'yuroyoro/vim-autoclose'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mrk21/yaml-vim'
NeoBundle 'moznion/hateblo.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'moznion/hateblo.vim'

call neobundle#end()

"Rubocop Setteing
let g:syntastic_ruby_checkers = ['rubocop']
		
" General
set nocompatible
set history=50
set ts=2
set laststatus=2
" set paste

" 「日本語入力固定モード」の動作モード
let IM_CtrlMode = 4
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>

" Search
set ignorecase
set smartcase
set wrapscan
set hlsearch

" View
colorscheme desert
syntax on
set number
set title
"set ruler
"set list

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = [
      \'~/.vim/snippets',
      \'~/.vim/bundle/serverspec-snippets',
      \]

" File system
set nobackup

" Filetype specific settings
" Set any other file type specific settings
" in ~/.vim and ~/.vim/after
" Type :set runtimepath to see you runtime path.
filetype plugin indent on

au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
" indent_guides
" "------------------------------------
" " インデントの深さに色を付ける
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=237

au FileType coffee,ruby,javascript,python IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle

" Other programming staffs
set showmatch
au FileType javascript set ts=2 sw=2 expandtab
au BufNewFile *.js set ft=javascript fenc=utf-8
autocmd FileType javascript let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/javascript.dict'


set autoindent

function! InsertTabWrapper()
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k'
          return "\<TAB>"
    else
              if pumvisible()
              return "\<C-N>"
    else
             return "\<C-N>\<C-P>"
    end
endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }



:set directory=/tmp

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

NeoBundleCheck
