set number                                  " enable line numbers
set nocompatible                            " cygwin cursor compatibility
set backspace=indent,eol,start              " allow backspaces
set ignorecase                              " ignore case-sensitive search
set pastetoggle=<leader>p                   " toggle paste mode

" begin vundle code
filetype plugin indent off
syntax off
set rtp+=~/.vim/bundle/Vundle.vim           " set the runtime path for vundle
call vundle#begin()                         " start vundle environment
  Plugin 'VundleVim/Vundle.vim'             " let Vundle manage Vundle (this is required)
  Plugin 'scrooloose/nerdtree'              " file tree
  Plugin 'scrooloose/syntastic'             " syntax checker
  Plugin 'bling/vim-airline'                " status bar
  Plugin 'vim-airline/vim-airline-themes'   " status bar themes
  Plugin 'bling/vim-bufferline'             " status bar plugin for buffer details
"  Plugin 'joonty/vdebug'                    " DBGP debugger for php, python, ruby, etc.
"  Plugin 'Valloric/YouCompleteMe'           " Intellisense plugin
  Plugin 'ctrlpvim/ctrlp.vim'               " Filename search
  Plugin 'tpope/vim-fugitive'               " git integration
  Plugin 'mileszs/ack.vim'                  " Full text search
"  Plugin 'Yggdroot/indentLine'              " Show line indents
"  Plugin 'ntpeters/vim-better-whitespace'   " Show trailing whitespaces
"  Plugin 'pangloss/vim-javascript'          " Javascript syntax highlighting
"  Plugin 'mxw/vim-jsx'                      " React JSX syntax highlighting
"  Plugin 'tpope/vim-sleuth'                 " Set spacing based on file
"  Plugin 'vim-ruby/vim-ruby'                " vim syntax
"  Plugin 'kana/vim-textobj-user'            " required for ruby blocks
"  Plugin 'nelstrom/vim-textobj-rubyblock'   " ruby blocks
"  Plugin 'godlygeek/tabular'                " required for vim-markdown
"  Plugin 'plasticboy/vim-markdown'          " github flavoured markdown syntax
  Plugin 'file:///Users/willvk/.vim/bundle/vgdb' " vgdb testing
  Plugin 'kchmck/vim-coffee-script'          " coffeescript support
  Plugin 'pangloss/vim-javascript'           " js formatting
  Plugin 'will133/vim-dirdiff'               " directory diff :Dirdiff
call vundle#end()                           " end of vundle environment

filetype plugin indent on
syntax on
" end vundle code

" begin nerdtree code
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

runtime macros/matchit.vim

if has("autocmd")
  filetype indent plugin on
endif

" close nerdtree if last vim window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"below only required on windows
"let g:NERDTreeDirArrows=1
"let g:NERDTreeDirArrowExpandable=">"
"let g:NERDTreeDirArrowCollapsible="~"
"scriptencoding utf-8
let g:NERDTreeShowHidden=1
" end nerdtree code

" begin syntastic code
" to check :help syntastic and revisit
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["html"] }
" end syntastic code

" begin airline mods
set guifont=Liberation_Mono_for_Powerline:h10
set encoding=utf-8
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
" end airline mods

" begin key mappings
let mapleader=","                           " set leader key as ','
" python debugging
nnoremap <leader>py :silent exec "!pdbgp_rep %:p"
" end key mappings

" begin window split modifications
set splitbelow                              " for horiz split, split below current windows
set splitright                              " for vert split, split to right of the current windows
" end window split modifications

" begin youcompleteme mods
let g:ycm_autoclose_preview_window_after_completion=1      " close preview window after finished
" shortcut for goto definition (,g)
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" end youcompleteme mods

" pasteboard fix for macos
set clipboard=unnamed

" Vdebug options
let g:vdebug_options = {}
let g:vdebug_options = { "debug_file": " ~/vdebug.log", "debug_file_level": 2 }

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" indentline settings
let g:indentLine_char = '·'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_first_char = '·'
let g:indentLine_indentLevel = 50

" Set tabs visible as (->)
"set list
"set listchars=tab:->

" Enable whitespace highlighting
"autocmd VimEnter * ToggleWhitespace

" tabbing fixes begin
filetype plugin indent on
set tabstop=2                               " show existing tab with 4 spaces width
set shiftwidth=2                            " when indenting with '>', use 4 spaces width
set expandtab
" tabbing fixes end

" filetype indent settings
filetype indent off
set autoindent
set nocindent

" no highlight for search
set nohlsearch

" key mapping to toggle syntastic ,stm
map <leader>ss :SyntasticToggleMode<CR>

" key mapping for clearing a buffer
nnoremap <silent> <leader>d :bp\|bd #<CR>

" replace tabs with spaces
map <leader>t :set tabstop=2 shiftwidth=2 expandtab <CR> :retab <CR>


" ide keys: https://delphi.fandom.com/wiki/Default_IDE_Shortcut_Keys
" start
nnoremap <F9> :VgRunConfigCommand run<cr>
" continue
nnoremap <F8> :VgRunConfigCommand continue<cr>
" step into
nnoremap <F7> :VgRunConfigCommand step<cr>
" toggle breakpoint
nnoremap <F5> :VgRunConfigCommand set_breakpoint<cr>

" set paste toggle F3 
set pastetoggle=<F3>

