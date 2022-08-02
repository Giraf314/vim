" System vimrc file for Mac OS X
" Author:  Benji Fisher <benji@member.AMS.org>
" Last update 2021-01-07 at 17:50 by GiRaf <raph17@gmail.com>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Diverses options 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Font par défaut Monaco en 12
set guifont=Monaco:h12

" Largeur de texte standard
set tw=80
" On surligne la colonne 81
set colorcolumn=+1
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
"
" Largeur et hauteur de la fenêtre
set columns=100
set lines=50
"
"  encodage des documents
set encoding=utf-8

" Afficher les lignes
set number
" Afficher la ruler (en bas)
set ruler

" on définit le dossier pour les swapfiles et pour les backups
set directory=~/.vim/vimswap/
set backupdir=~/.vim/vimbackup/

" Coloration syntaxique
syntax on

" On configure un <leader>
let mapleader=","

"  La langue est le français
set dict+=/usr/share/dict/french
set langmenu=$LANG
setlocal spell
setlocal spelllang=fr,en
setlocal spellfile=$HOME/.vim/spell/fr.utf-8.add,$HOME/.vim/spell/en.utf-8.add

" Raccourci pour la correction automatique
nnoremap <leader>z <esc>z=1<CR><CR>
" Raccourci pour avoir une définition d'un mot (macOS)
nnoremap <leader>zd "zyiw:execute ":silent !open dict://".@z.""<CR>

"  Les tabulations sont 2 espaces.
set ts=2
set sw=2
set expandtab
set autoindent

" Indentation automatique
set autoindent

" Lire :help sur cette commande
"hi Visual guibg=yellow
"
" le split se fait par en bas
set splitbelow
"
" Résulats de recherche non-colorés
set nohls
"
" Souris utilisable
set mouse=a

" Bon fonctionnement du backspace en mode insertion
set backspace=indent,eol,start
"
" Dossier du fichier comme dossier de travail
set acd
cab cwd cd %:h
"
" Recherche intelligemment sensible à la casse (ou pas)
set ignorecase
set smartcase
"
" Taille de l'historique
set history=200
"
" visual bell. Pas de son.
set vb 
"
" Délai raccourcis-clavier
set tm=500
"
" La date s'obtient avec <leader>D. Format YYYY-MM-DD HH:MM.
map <leader>D "=strftime('%Y-%m-%d at %H:%M')<CR>p 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pour accéder rapidement aux fichiers de configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Accès rapide à ~\.vimrc
map <leader>v <ESC>:tabnew<CR>:e $MYVIMRC<cr> 

" Accès rapide à Ultisnips/tex.snippets
map <leader>t <ESC>:tabnew<CR>:e ~/.vim/UltiSnips/tex.snippets<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pour les fichiers .tex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set nomodified

" Types de fichiers à ignorer... ou presque
set wildignore+=*.dvi,*.ps,*.pdf,*.fig,*.fig.bak
set suffixes+=*.aux,*.log,*.toc
set path+=.,./images/,./figures,~/texmf

" Définition du compiler et du viewer
let $PDFCOMPILER = "pdflatex --shell-escape -synctex=1"
let $PDFVIEWER = "open -a Preview.app"

" <C-l> pour compiler du LaTeX
map <leader>ll :w<CR>:!$PDFCOMPILER '%<.tex' ; $PDFVIEWER '%<.pdf' &<CR> 
map <C-l> <ESC><leader>ll<CR><CR>
map <leader>ls :w<CR>:!$PDFCOMPILER --jobname '%<-eleves' '%<.tex'; $PDFVIEWER '%<-eleves.pdf' &<CR><CR>

" <C-v> pour visualiser le résultat
map <leader>lv :!$PDFVIEWER '%<.pdf' & <CR><CR>
map <C-v> <ESC><leader>lv<CR><CR>

" Lire les logs d'un fichier .tex
nnoremap <leader>le <ESC>:15sp %<.log<CR>:set autoread<CR>

" Commentaire en LaTeX
map <leader>c :s/^ */&%/<CR>

" décommenter en LaTex.
map <leader>u :s/\(^ *\)%/\1/<CR>

" Nettoyage des fichiers (en ligne de commande, abréviation au lieu de
" raccourci pour avoir tout le temps de taper...  )
cab clean !rm -rf "%<.aux" "%<.dvi" "%<.log" "%<.out" "%<.ps" "%<.toc" "%<.synctex.gz" "%<.thm" "%<.pgf-plot.gnuplot" "%<.pgf-plot.table" "%<.xsim" "%<.fls" "%<.fdb_latexmk" "%<-eleves.aux" "%<-eleves.dvi" "%<-eleves.log" "%<-eleves.out" "%<-eleves.ps" "%<-eleves.toc" "%<-eleves.synctex.gz" "%<-eleves.thm" "%<-eleves.pgf-plot-eleves.gnuplot" "%<-eleves.pgf-plot-eleves.table" "%<-eleves.xsim" "%<-eleves.fls" "%<-eleves.fdb_latexmk" <CR>

" Multline (LaTex) est considéré comme des maths
call TexNewMathZone("D","multline",1)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Où se trouve Python ? 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set pythonhome=/usr/local/Cellar/python@3.10
"set pythonthreehome=/usr/local/Cellar/python@3.10
"if has('python3')
"    command! -nargs=1 Py py3 <args>
"    set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.7/Python
"    set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.7
"else
"    command! -nargs=1 Py py <args>
"    set pythondll=/usr/local/Frameworks/Python.framework/Versions/2.7/Python
"    set pythonhome=/usr/local/Frameworks/Python.framework/Versions/2.7
"endif
"
"set nocompatible              " be iMproved, required
"filetype off                  " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle, the vim bundle manager 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-LaTeX suite
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on

"helptags ~/.vim/doc

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
" set shellslash

"let g:tex_flavor='latex'
"let g:Tex_TreatMacViewerAsUNIX = 1
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode "$*"'
"let g:Tex_ViewRule_pdf = '!open -a /System/Applications/Preview.app "%<.pdf"'
"let s:viewer = '!open -a /System/Applications/Preview.app "%<.pdf"'
"let g:Tex_ViewRule_pdf = 'c:\Program Files\SumatraPDF\SumatraPDF -reuse-instance "%<.pdf"'
" Tous les environnements sont developpés.
"set foldlevelstart=99
"let g:Tex_FoldedMisc += 'programmes'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Vim-plug Manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen pour gerer les bundles
execute pathogen#infect()
filetype plugin indent on

call plug#begin('~/.vim/plugged')
" YouCompleteMe
" https://github.com/ycm-core/YouCompleteMe
"  Plug 'Valloric/YouCompleteMe'

" Use sniplet
" https://github.com/gillescastel/latex-snippets
Plug 'sirver/ultisnips'
    let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsExpandTrigger="<c-s>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"  
"  vimtex :
" Plug 'lervag/vimtex'
"
"  tex-conceal : pour que le code LaTeX apparaisse hors du curseur 
"
" Plug 'KeitaNakamura/tex-conceal.vim'
"    let g:tex_flavor='latex'
"    let g:vimtex_view_method='zathura'
"    let g:vimtex_quickfix_mode=0
"    let g:vimtex_view_enabled = 0
"    set conceallevel=1
"    let g:tex_conceal='abdmg'
"    hi Conceal ctermbg=none
"  Fin des plugs
call plug#end()
