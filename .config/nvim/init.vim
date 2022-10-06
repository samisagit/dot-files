set encoding=UTF-8

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-vinegar'
Plug 'unblevable/quick-scope'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-test/vim-test'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-startify'
call plug#end()

" change highlighting of cursor line when entering/leaving Insert Mode
set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

" format .hs files on save
autocmd BufWritePre *.hs lua vim.lsp.buf.formatting_sync()

" colorscheme
set background=dark
colorscheme PaperColor

" set quick-scope colors
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" LSP configs
lua << EOF
lspconfig = require "lspconfig"
lspconfig.terraformls.setup{}
lspconfig.hls.setup{
	settings = {
		haskell = {
    			formattingProvider = "stylish-haskell"
  		}
	}
}

lspconfig.gopls.setup{}
EOF

let g:ale_linters = {'haskell': ['hlint']}

" set hybrid numbers
set nu rnu

set shell=/usr/bin/zsh

" set leader mappings
let mapleader=" "
nnoremap <leader>S :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>k :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>d :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>D :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>f :lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>r :lua vim.lsp.buf.references()<CR>
nnoremap <leader>p :Telescope find_files<CR>
nnoremap <leader>gc :Telescope git_bcommits<CR>
nnoremap <leader>s :Telescope live_grep<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :lua vim.diagnostic.open_float()<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>l :TestLast<CR>
