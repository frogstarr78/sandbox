if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <C-Tab> w
cnoremap <C-Tab> w
map! <xHome> <Home>
map! <xEnd> <End>
map! <S-xF4> <S-F4>
map! <S-xF3> <S-F3>
map! <S-xF2> <S-F2>
map! <S-xF1> <S-F1>
map! <xF4> <F4>
map! <xF3> <F3>
map! <xF2> <F2>
map! <xF1> <F1>
map! <S-Insert> *
imap <C-PageDown> L$
imap <C-PageUp> H
map 	 
map  "+gP
vmap  "*d
map ; :
map UU :call UnComment()
map \vc :call Comment("\"")
map \sc :call Comment("-")
map \pc :call Comment("#")
map \mc :call Comment("*")
map \jc :call Comment("/")
map \hc :call Comment("!")
map \bc :call Comment("\"")
map \ac :call Comment("r")
map \r :!"%:p:r.exe"
map \c :!cl %
map s :w
map zz 
nmap <C-PageUp> H
nmap <C-PageDown> L$
noremap <C-Tab> w
map <xHome> <Home>
map <xEnd> <End>
map <S-xF4> <S-F4>
map <S-xF3> <S-F3>
map <S-xF2> <S-F2>
map <S-xF1> <S-F1>
map <xF4> <F4>
map <xF3> <F3>
map <xF2> <F2>
map <xF1> <F1>
vmap <C-Del> "*d
vnoremap <S-Del> "+x
vnoremap <C-Insert> "+y
map <S-Insert> "+gP
vmap <C-PageDown> L$
vmap <C-PageUp> H
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set guioptions=
set noguipty
set helplang=En
set hlsearch
set iminsert=0
set imsearch=0
set shiftwidth=4
set softtabstop=4
set tabstop=4
set tags=./tags,tags,C:\\Documents\\\ and\\\ Settings\\smithy\\ctags
set whichwrap=b,s,<,>,[,]
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd C:\Documents\ and\ Settings\smithy\public_html\CT131
set shortmess=aoO
badd +30 PokerGame.cpp
badd +57 StudentGradeIO.cpp
badd +62 Eggs6.cpp
badd +27 StandardFunctions.h
badd +293 DeckOCards.h
args PokerGame.cpp
edit PokerGame.cpp
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal noarabic
setlocal autoindent
setlocal autoread
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal nocopyindent
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != ''
setlocal filetype=
endif
set foldcolumn=3
setlocal foldcolumn=3
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatoptions=tcq
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,128-167,224-235
setlocal keymap=
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal suffixesadd=
setlocal swapfile
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
14,30fold
32,154fold
156,165fold
167,177fold
192,245fold
247,252fold
254,272fold
274,298fold
300,318fold
320,324fold
326,359fold
361,388fold
390,407fold
409,412fold
14
normal zc
32
normal zc
156
normal zc
167
normal zc
192
normal zc
247
normal zc
254
normal zc
274
normal zc
300
normal zc
320
normal zc
326
normal zc
361
normal zc
390
normal zc
409
normal zc
let s:l = 409 - ((224 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
409
normal! 0
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . s:sx
endif
let &so = s:so_save | let &siso = s:siso_save
