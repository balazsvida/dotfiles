"
" Theme
"

"let g:solarized_termcolors=256

"set termguicolors
set background=dark
"colorscheme one

set relativenumber
set number
set colorcolumn=120 " draw a vertical axis at 120
set mouse=a

"
" Behaviours
"
set wildignore+=*.o,*.a,*.swp,*.class
set noswapfile nobackup
set nofixeol noeol
set ignorecase smartcase
set fileformats=unix,dos,mac
set breakindent
set autowriteall
set splitright
set hlsearch "<C-l> turns off see:vim-sensible

let mapleader = ","

nnoremap <leader>, :
nnoremap <leader>s :w<CR>

"
" Fuzzy Search everywhere
"
set rtp+=/usr/local/opt/fzf " needs to be installed see https://github.com/junegunn/fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <leader>t :Ag!<Space>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :BLines<CR>

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

"
" Go Language
"
let g:go_fmt_command = "goimports"

nnoremap <leader>gt :w<CR>:GoTestFunc<CR>
nnoremap <leader>gT :w<CR>:GoTest<CR>
nnoremap <leader>gb :w<CR>:GoBuild<CR>
nnoremap <leader>gi :w<CR>:GoInstall<CR>
nnoremap <leader>d  :w<CR>:GoDoc<CR>
nnoremap <leader>gr :w<CR>:GoRun<CR>

"let g:go_fmt_autosave = 0 " Testing gofmt

"
" Terraform
"
let g:terraform_align=1
let g:terraform_fmt_on_save=0

"
" Crontab
"
autocmd filetype crontab setlocal nobackup nowritebackup " avoid issues: crontab: temp file must be edited in place

"
"set wildignore=*.o,*.a,*.swp,*.egg-info,*.pyc,*.class,Session.vim
"set noswapfile nobackup
"set noeol binary "do not leave an empty line at the end of file"
"set previewheight=20
"set ignorecase smartcase
""set fileformats=unix,dos,mac
"set hidden visualbell
"set linebreak
"let g:auto_save=0
"set hlsearch
"set splitright
"set nowrap breakindent
"set tags=./tags;$HOME
"
"set mouse=a
""set termguicolors
"filetype plugin on
"let g:go_fmt_command = "goimports"
"let g:go_list_type = "quickfix"
"autocmd FileType go nmap <leader>r  <Plug>(go-run)
"autocmd FileType go nmap <Leader>i <Plug>(go-info)
"au FileType crontab setlocal bkc=yes
"let g:CommandTTagIncludeFilenames = 1
"let g:CommandTFileScanner = "git"
"let g:CommandTGitScanSubmodules = 1
"
"nmap <silent> <leader>f <Plug>(CommandT)
"
"let g:ackprg = 'ag --nogroup --nocolor --column'
"cnoreabbrev Ack Ack!
"nnoremap <Leader>a :Ack!<Space>

