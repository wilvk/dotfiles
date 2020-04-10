" This is my .vimrc file. There are many like it but this one is mine.
"
" Overview:
"
" I have layed out this file with the following sections:
" - set statements
" - plugins
" - variable and highlight declarations
" - keyboard mappings
" - commands
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
set cmdheight=3
set tags=tags
filetype plugin indent off
syntax off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'tpope/vim-fugitive'
  Plugin 'mileszs/ack.vim'
  Plugin 'will133/vim-dirdiff'
  Plugin 'udalov/kotlin-vim'
  Bundle 'nickspoons/vim-sharpenup'
  Bundle 'dense-analysis/ale'
  Bundle 'RRethy/vim-illuminate'
  Bundle 'inside/vim-search-pulse'
  Bundle 'OmniSharp/omnisharp-vim'
  Bundle 'tpope/vim-dispatch'
  Bundle 'prabirshrestha/asyncomplete.vim'
  Bundle 'tpope/vim-sensible'
  Plugin 'OrangeT/vim-csharp'
  Bundle 'editorconfig/editorconfig-vim'
  Plugin 'tomasiser/vim-code-dark'
  Plugin 'Shougo/echodoc.vim'
  Plugin 'junegunn/fzf.vim'
  Plugin 'junegunn/fzf'
  Plugin 'ddrscott/vim-side-search'
  Plugin 'vim-scripts/taglist.vim'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  Plugin 'honza/vim-snippets'
  Plugin 'prabirshrestha/asyncomplete-ultisnips.vim'
  Plugin 'SirVer/ultisnips'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'tsony-tsonev/nerdtree-git-plugin'
  Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'ryanoasis/vim-devicons'
call vundle#end()
filetype plugin on
syntax on
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
\     'csType': ['keyword - control']
\}
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'popup'
let g:echodoc_enable_at_startup = 1
let g:side_search_prg = "ag --word-regexp --ignore='*.js.map' --heading --stats -B 2 -A 4"
let g:side_search_splitter = 'new'
let g:side_search_split_pct = 0.4
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeColorMapCustom = {
\     "Modified"  : ["#528AB3", "12", "NONE", "NONE"],
\     "Staged"    : ["#538B54", "12", "NONE", "NONE"],
\     "Untracked" : ["#BE5849", "1", "NONE", "NONE"],
\     "Dirty"     : ["#299999", "6", "NONE", "NONE"],
\     "Clean"     : ["#87939A", "7", "NONE", "NONE"],
\     "Ignored"   : ["#808080", "5", "NONE", "NONE"]
\ }
colorscheme codedark
highlight csUserMethod ctermfg=85
highlight link EchoDocPopup Pmenu
highlight ExtraWhitespace ctermbg=236
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
match ExtraWhitespace /\s\+$/
map <leader>r :NERDTreeFind<cr>
nnoremap <silent> <leader>d :bp\|bd #<CR>
map <leader>t :set tabstop=2 shiftwidth=2 expandtab <CR> :retab <CR>
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p
"inoremap <expr> <Tab> pumvisible() ? '<C-n>' : getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
nnoremap <Leader>ofu :OmniSharpFixUsings<CR>
nnoremap <Leader>ou :OmniSharpFindUsages<CR>
nnoremap <Leader>od :OmniSharpGotoDefinition<CR>
nnoremap <Leader>oi :OmniSharpFindImplementations<CR>
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>
nnoremap <C-o><C-u> :OmniSharpFindUsages<CR>
nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>
nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>
nnoremap <C-o><C-r> :!dotnet run
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
command! -complete=file -nargs=+ SS execute 'SideSearch <args>'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
execute 'highlight csStruct cterm=bold ctermfg=' . synIDattr(hlID('Statement'),'fg')
call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
if executable('ag') | let g:ackprg = 'ag --vimgrep' | endif
