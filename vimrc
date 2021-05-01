" General Configuration

" Start VIM in no compatibility mode with older VI versions
set nocp

" Turn filetype settings off here and turn them on selectively later
filetype off

" Enforce UTF-8
set encoding=utf-8

" Line numbers
set number

" Relative numbers
set relativenumber

" Match parentheses
set showmatch

" Enable splitting
set splitright
set splitbelow

" Highlight current line
set cursorline

" Make backspace behaviour consistent and not let it insert random characters in I mode
set backspace=indent,eol,start

" Command history
set history=9999

" Autocomplete commands
set showcmd

" Display the current mode we are in right now
set showmode

" Don't wrap lines
set nowrap

" Set tab to 2 spaces by default
set tabstop=2

" Delete 2 spaces when using backspace
set softtabstop=2

" Autoindent width
set shiftwidth=2

" Use spaces instead of tabs
set expandtab

" Automatically reload the file if it was changed outside vim
set autoread

" Automatically cd into the current working directory
set acd

" Enable paste mode
set paste

" Force fileformats to unix like line endings
set fileformats=unix

" Set a colored line at column 100
set colorcolumn=101

" Show the last status in the status bar
set laststatus=2

" Autoindent
set autoindent

" Copy the previous indent on newline
set copyindent

" Suppress error bells
set novisualbell
set noerrorbells
set vb

" Force mouse enable if the terminal supports it
set mouse=a

" Hide the buffer
set hidden

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Expand the undo history
set undolevels=1000

" If supported, keep an undofile
if v:version >= 730
	set undofile
	set undodir=~/.vim/.undo,~/tmp,/tmp
endif

if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif


" Set the terminal title
set title

set pyxversion=3

set wildmode=list:longest,list:full
set wildmenu
set wildignore+=*.o,*.a,*.obj,.git,*.class,*.rbc,*.pyc

syntax on
filetype plugin on
filetype indent on

let mapleader=','
let &showbreak='↪ '

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
let g:NERDTreeShowHidden = 1
map <C-e> :NERDTreeToggle<CR>

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-surround'

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#init#vim_async = 1
let g:airline_powerline_fonts = 1

Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'minimalist'

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
nmap s <Plug>(easymotion-s)
omap t <Plug>(easymotion-bd-tl)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

Plug 'tpope/vim-repeat'

Plug 'prettier/vim-prettier', {
	\ 'do': 'yarn install',
	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
let g:prettier#config#single_quote = 'true'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
let g:fzf_colors =
	\ { 'fg':		 ['fg', 'Normal'],
	\ 'bg':			 ['bg', 'Normal'],
	\ 'hl':			 ['fg', 'Comment'],
	\ 'fg+':		 ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':		 ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':		 ['fg', 'Statement'],
	\ 'info':		 ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Ignore'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment']
	\ }

Plug 'junegunn/fzf.vim'
let g:fzf_action = {
  \ 'ctrl-s': 'vsplit',
  \ 'ctrl-v': 'split'
  \ }

nnoremap <C-p> :Files<cr>
nnoremap <C-g> :Rg<cr>

augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END


Plug 'flazz/vim-colorschemes'

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

Plug 'tpope/vim-unimpaired'
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

Plug 'w0rp/ale'
let g:ale_fix_on_save = 0
let g:ale_fixers = {
	\	'*':  ['remove_trailing_lines', 'trim_whitespace'],
	\ 'javascript': ['eslint', 'prettier'],
	\ 'python': ['autopep8', 'yapf']
	\	}

Plug 'mxw/vim-jsx'

Plug 'sheerun/vim-polyglot'

Plug 'jeetsukumaran/vim-buffergator'

Plug 'ryanoasis/vim-devicons'

Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>"
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>": "\<C-n>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

if exists('complete-info')
	inoremap <expr> <cr> complete_info()["selected"] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
	autocmd VimEnter * PlugInstall | q
endif

call plug#end()

augroup auto_reload " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

au FocusLost,WinLeave * :silent! wa
au FocusGained,BufEnter * :silent! !

colorscheme materialbox
set background=dark
highlight Normal ctermbg=None

command! W w
command! Wq wq
command! Bd bd
cnoremap w!! w !sudo tee > /dev/null %
