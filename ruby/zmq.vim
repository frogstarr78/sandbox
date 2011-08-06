let SessionLoad = 1
if &cp | set nocp | endif
map 	 
vmap  "0p
map ; :
map Q gq
map UU :call UnComment()
vmap [% [%m'gv``
map \s :call Spacify()
map \ac :call Comment(";") " asterisk config comment
map \rc :call Comment("r") " batch file comment
map \bc :call Comment("\'") " basic comment
map \vc :call Comment("\"") " vim comment
map \jc :call Comment("/") " javascript comment
map \sc :call Comment("-") " sql comment
map \mc :call Comment("*") " C-type multi-line comment
map \hc :call Comment("!") " html comment
map \pc :call Comment("#") " p* language comment
map \cc :call FComment()
vmap ]% ]%m'gv``
vmap a% [%v]%
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
map qq :w!
map q z
map s :w!
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=2
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set hlsearch
set ruler
set shiftwidth=2
set softtabstop=2
set spelllang=en_us
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.info,.aux,.log,.dvi,.bbl,.out,.o,.lo
set tabstop=2
set tags=./tags,./TAGS,tags,TAGS,~/ctags/tags,~/ctags/java.tags
set timeoutlen=500
set wildmenu
set wildmode=list:longest,full
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/vcs/git/sandbox/ruby
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 hwclient.rb
badd +1 hwserver.rb
args hwclient.rb
edit hwclient.rb
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 23 + 24) / 48)
exe '2resize ' . ((&lines * 22 + 24) / 48)
argglobal
nnoremap <buffer> <silent> g} :exe        "ptjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent> } :exe          "ptag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe      "stselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe        "stjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> ] :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe  v:count1."tag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe       "tselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe         "tjump =RubyCursorIdentifier()"
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*#\\s*define
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
set foldcolumn=3
setlocal foldcolumn=3
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetRubyIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri
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
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=.,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/site_ruby/1.9.1,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/site_ruby/1.9.1/x86_64-linux,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/site_ruby,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/vendor_ruby/1.9.1,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/vendor_ruby/1.9.1/x86_64-linux,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/vendor_ruby,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/1.9.1,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/1.9.1/x86_64-linux,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/abstract-1.0.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/addressable-2.2.5/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/archive-tar-minitar-0.5.2/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/bcrypt-ruby-2.1.4/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/colored-1.2/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/columnize-0.3.2/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/daemons-1.1.3/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/data_objects-0.10.3/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/datamapper-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-aggregates-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-constraints-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-core-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-do-adapter-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-migrations-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-serializer-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-sqlite-adapter-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-timestamps-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-transactions-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-types-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-validations-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/do_sqlite3-0.10.3/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/erubis-2.6.6/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/eventmachine-0.12.10/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/fastercsv-1.5.4/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/haml-3.1.1/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/hpricot-0.8.4/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/json-1.4.6/ext,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/json-1.4.6/ext/json/ext,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/json-1.4.6/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/linecache19-0.5.11/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/polyglot-0.3.1/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/rack-1.2.2/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/rake-0.8.7/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/ruby-debug-base19-0.11.24/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/ruby-debug19-0.11.6/cli,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/ruby_core_source-0.1.4/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/rvm-1.6.5/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/sinatra-1.2.3/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/sinatra-default-templates-1.0.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/stringex-1.2.1/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/thin-1.2.11/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/tilt-1.2.2/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/treetop-1.4.9/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/uuidtools-2.1.2/lib,/usr/local/rvm/gems/ruby-1.9.2-p180@global/gems/rake-0.8.7/lib
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en_us
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
11
normal zo
let s:l = 19 - ((18 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
19
normal! 0
wincmd w
argglobal
edit hwserver.rb
nnoremap <buffer> <silent> g} :exe        "ptjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent> } :exe          "ptag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe      "stselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe        "stjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> ] :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe  v:count1."tag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe       "tselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe         "tjump =RubyCursorIdentifier()"
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
set foldcolumn=3
setlocal foldcolumn=3
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetRubyIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri
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
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=.,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/site_ruby/1.9.1,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/site_ruby/1.9.1/x86_64-linux,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/site_ruby,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/vendor_ruby/1.9.1,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/vendor_ruby/1.9.1/x86_64-linux,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/vendor_ruby,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/1.9.1,/usr/local/rvm/rubies/ruby-1.9.2-p180/lib/ruby/1.9.1/x86_64-linux,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/abstract-1.0.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/addressable-2.2.5/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/archive-tar-minitar-0.5.2/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/bcrypt-ruby-2.1.4/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/colored-1.2/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/columnize-0.3.2/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/daemons-1.1.3/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/data_objects-0.10.3/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/datamapper-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-aggregates-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-constraints-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-core-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-do-adapter-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-migrations-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-serializer-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-sqlite-adapter-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-timestamps-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-transactions-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-types-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/dm-validations-1.1.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/do_sqlite3-0.10.3/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/erubis-2.6.6/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/eventmachine-0.12.10/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/fastercsv-1.5.4/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/haml-3.1.1/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/hpricot-0.8.4/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/json-1.4.6/ext,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/json-1.4.6/ext/json/ext,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/json-1.4.6/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/linecache19-0.5.11/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/polyglot-0.3.1/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/rack-1.2.2/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/rake-0.8.7/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/ruby-debug-base19-0.11.24/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/ruby-debug19-0.11.6/cli,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/ruby_core_source-0.1.4/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/rvm-1.6.5/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/sinatra-1.2.3/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/sinatra-default-templates-1.0.0/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/stringex-1.2.1/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/thin-1.2.11/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/tilt-1.2.2/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/treetop-1.4.9/lib,/usr/local/rvm/gems/ruby-1.9.2-p180/gems/uuidtools-2.1.2/lib,/usr/local/rvm/gems/ruby-1.9.2-p180@global/gems/rake-0.8.7/lib
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en_us
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
12
normal zo
let s:l = 26 - ((21 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
26
normal! 011l
wincmd w
exe '1resize ' . ((&lines * 23 + 24) / 48)
exe '2resize ' . ((&lines * 22 + 24) / 48)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
