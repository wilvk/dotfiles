" This is my .vimrc file. There are many like it but this one is mine.
"
" Overview:
"
" I have layed out this file with the following sections:
" - set vim variables
" - load plugins
" - set variables and highlights
" - set keyboard mappings
" - define commands and actions
"
" Prerequisites:
"
" ag - https://github.com/ggreer/the_silver_searcher
"   required for text search
"   macos: brew install the_silver_searcher
" vim dev icons - https://github.com/ryanoasis/vim-devicons
"   preferably the Hack Nerd font
"   macos: clone the icons repo and run ./install.sh Hack. Select the Hack
"   Nerd font in iterm
"   Look here for brew install if still stuck: https://github.com/wilvk/dotfiles
" dotnet - for dotnet development - https://dotnet.microsoft.com/download
"
" Reasoning:
"   I find it easier to manage the .vimrc file this way. It is also a logical
"   flow from less complex to more complex commands and has all like commands
"   grouped, then sub-grouped by plugin. This is most useful for quickly
"   checking keybindings, but is also useful for other things like checking
"   highlighting or variables all in one place.
"   An alternative would be to group by:
"   - plugins
"   - plugin group
"  Hoewver. this IMHO, is a lot harder to manage as there can be conflicts
"  between variables, highlights, etc. that are harder to identify.
"  Maybe one day I'll write a blog post about it.
"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set number
set nocompatible
set backspace=indent,eol,start
set ignorecase
set pastetoggle=<leader>p
set guifont=Hack:h13
set encoding=utf-8
set t_Co=256
set t_ut=
set splitbelow
set splitright
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set nocindent
set nohlsearch
set pastetoggle=<F3>
set completeopt=longest,menuone,preview
set timeoutlen=500
set noshowmode
set tags=tags
set cmdheight=1
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()
  Plug 'tpope/vim-sensible'
  Plug 'scrooloose/nerdtree'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'mileszs/ack.vim'
  Plug 'will133/vim-dirdiff'
  Plug 'udalov/kotlin-vim'
  Plug 'nickspoons/vim-sharpenup'
  Plug 'dense-analysis/ale'
  Plug 'RRethy/vim-illuminate'
  Plug 'inside/vim-search-pulse'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'tpope/vim-dispatch'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'tpope/vim-sensible'
  Plug 'OrangeT/vim-csharp'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tomasiser/vim-code-dark'
  Plug 'Shougo/echodoc.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf'
  Plug 'ddrscott/vim-side-search'
  Plug 'vim-scripts/taglist.vim'
  Plug 'tomtom/tlib_vim'
  Plug 'honza/vim-snippets'
  Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
  Plug 'SirVer/ultisnips'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'airblade/vim-gitgutter'
  Plug 'liuchengxu/vim-which-key'
  Plug 'bling/vim-bufferline'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-startify'
  Plug 'pprovost/vim-ps1'
  Plug 'ycm-core/YouCompleteMe'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
filetype plugin indent on
syntax on
colorscheme codedark
highlight csUserMethod ctermfg=85
highlight link EchoDocPopup Visual
highlight ExtraWhitespace ctermbg=236
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
match ExtraWhitespace /\s\+$/
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=30
let NERDTreeMinimalUI = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_diagnostic_showid = 1
let g:OmniSharp_lookup_metadata = 1
let g:OmniSharp_server_display_loading = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_typeLookupInPreview = 1
let g:OmniSharp_want_snippet = 1
let g:omnicomplete_fetch_full_documentation = 1
let g:sharpenup_codeactions=1
let g:sharpenup_codeactions_autocmd='CursorHold'
let g:sharpenup_codeactions_glyph='💡'
let g:sharpenup_codeactions_set_signcolumn=1
let g:sharpenup_map_prefix = ','
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:OmniSharp_highlight_debug=1
let g:OmniSharp_highlight_groups = {
\     'csUserIdentifier': [
\       'constant name', 'enum member name', 'field name', 'identifier',
\       'property name', 'static symbol'
\     ],
\     'csUserInterface': ['interface name'],
\     'csUserMethod': ['extension method name', 'method name'],
\     'csUserType': ['enum name', 'namespace name'],
\     'csGeneric': ['local name', 'parameter name'],
\     'csStruct': ['struct name', 'class name'],
\     'csType': ['keyword - control']}
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'popup'
let g:side_search_prg = "ag --word-regexp --ignore='*.js.map' --heading --stats -B 2 -A 4"
let g:side_search_splitter = 'new'
let g:side_search_split_pct = 0.4
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeIndicatorMapCustom = {
\     "Modified"  : "✹",
\     "Staged"    : "✚",
\     "Untracked" : "✭",
\     "Renamed"   : "➜",
\     "Unmerged"  : "═",
\     "Deleted"   : "✖",
\     "Dirty"     : "✗",
\     "Clean"     : "✔︎",
\     'Ignored'   : '☒',
\     "Unknown"   : "?"}
let g:NERDTreeColorMapCustom = {
\     "Modified"  : ["#528AB3", "12", "NONE", "NONE"],
\     "Staged"    : ["#538B54", "12", "NONE", "NONE"],
\     "Untracked" : ["#BE5849", "1", "NONE", "NONE"],
\     "Dirty"     : ["#299999", "6", "NONE", "NONE"],
\     "Clean"     : ["#87939A", "7", "NONE", "NONE"],
\     "Ignored"   : ["#808080", "5", "NONE", "NONE"]}
let g:which_key_vertical=1
let g:bufferline_rotate=1
let g:bufferline_fixed_index=0
map <leader>r :NERDTreeFind<cr>
map <leader>tab :set tabstop=2 shiftwidth=2 expandtab <CR> :retab <CR>
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
nnoremap <Leader>ofu :OmniSharpFixUsings<CR>
nnoremap <Leader>ou :OmniSharpFindUsages<CR>
nnoremap <Leader>od :OmniSharpGotoDefinition<CR>
nnoremap <Leader>of :OmniSharpCodeFormat<CR>
nnoremap <Leader>oi :OmniSharpFindImplementations<CR>
nnoremap <Leader>dr :!dotnet restore && dotnet build && dotnet run<CR>
nnoremap <Leader>db :!dotnet build<CR>
nnoremap <Leader>dt :!dotnet restore && dotnet build && dotnet test<CR>
nnoremap <Leader>de :!dotnet restore <CR>
nnoremap <Leader>fo :Colors<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fc :Commits<CR>
nnoremap <Leader>fa :Ag<CR>
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>
nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>
nnoremap <silent> <leader>      :<c-u>WhichKey '\'<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
command! -complete=file -nargs=+ SS execute 'SideSearch <args>'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
execute 'highlight csStruct cterm=bold ctermfg=' . synIDattr(hlID('Statement'),'fg')
call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
if executable('ag') | let g:ackprg = 'ag --vimgrep' | endif
