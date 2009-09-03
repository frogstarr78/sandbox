let SessionLoad = 1
if &cp | set nocp | endif
map 	 
vmap  :call Toggle()
nmap  :call Toggle()
map ; :
map Q gq
map UU :call UnComment()
vmap [% [%m'gv``
map \e :call g:RubyDebugger.exit()
map \n :call g:RubyDebugger.next()
map \s :call g:RubyDebugger.step()
map \m :call g:RubyDebugger.open_breakpoints()
map \v :call g:RubyDebugger.open_variables()
map \b :call g:RubyDebugger.toggle_breakpoint()
map \t :TestMe
map \c :w!:CTagsRun
map \i :w!:Runme -i
map \rd :w!:Runme -d
map \ru :w!:Runme -u
map \rt :w!:Runme -t
map \r :w!:Runme
map \a :execute histget("cmd", -1)
map \ac :call Comment(";") " asterisk config comment
map \bc :call Comment("r") " batch file comment
map \vc :call Comment("\"") " vim comment
map \jc :call Comment("/") " javascript comment
map \sc :call Comment("-") " sql comment
map \mc :call Comment("*") " C-type multi-line comment
map \hc :call Comment("!") " html comment
map \pc :call Comment("#") " p* language comment
map \cc :call FComment()
vmap ]% ]%m'gv``
vmap a% [%v]%
map bn :bn
map bp :bp
map co :!gmcs %
let s:cpo_save=&cpo
set cpo&vim
map e <S-Right>
nmap gx <Plug>NetrwBrowseX
map mm :!mono %:r.exe
map qq :qa!
map q :wq!
map s :w
map sb :sb
map zz :w
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
imap 	   
imap  :call Toggle()
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set backspace=2
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1,default
set helplang=en
set hlsearch
set ruler
set runtimepath=~/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vimfiles/after,~/.vim/after,~/svn/devscripts/vim/.vim/
set shiftwidth=2
set softtabstop=4
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.info,.aux,.log,.dvi,.bbl,.out,.o,.lo
set tabstop=2
set tags=./tags,./TAGS,tags,TAGS,~/ctags/tags,~/ctags/java.tags
set timeoutlen=500
set wildmenu
set wildmode=list:longest,full
set window=74
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/git/sandbox/ruby
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +16 pegt.rb
badd +298 arithmetic.rb
badd +19 arithmetic.treetop
badd +1 sql.treetop
badd +1475 sql.rb
badd +13 sqlt.rb
badd +103 /usr/lib/ruby/1.8/test/unit/ui/gtk/testrunner.rb
badd +1 peg-example.treetop
badd +1 peg-example.rb
badd +11 sql_parser_test.rb
badd +78 ~/.vimrc
badd +96 ~/svn/devscripts/vim/Programming.vim
args peg-example.treetop peg-example.rb
edit sql_parser_test.rb
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 37 + 38) / 77)
exe '2resize ' . ((&lines * 37 + 38) / 77)
exe 'vert 2resize ' . ((&columns * 139 + 139) / 279)
exe '3resize ' . ((&lines * 37 + 38) / 77)
exe 'vert 3resize ' . ((&columns * 139 + 139) / 279)
argglobal
edit sql_parser_test.rb
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
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
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
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
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
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,/usr/lib/ruby/site_ruby/1.8,/usr/lib/ruby/site_ruby/1.8/i686-linux,/usr/lib/ruby/site_ruby,/usr/lib/ruby/vendor_ruby/1.8,/usr/lib/ruby/vendor_ruby/1.8/i686-linux,/usr/lib/ruby/vendor_ruby,/usr/lib/ruby/1.8,/usr/lib/ruby/1.8/i686-linux,,~/.gem/ruby/1.8/gems/actionmailer-2.1.2/lib,~/.gem/ruby/1.8/gems/actionpack-2.1.2/lib,~/.gem/ruby/1.8/gems/activerecord-2.1.2/lib,~/.gem/ruby/1.8/gems/activeresource-2.1.2/lib,~/.gem/ruby/1.8/gems/activesupport-2.1.2/lib,~/.gem/ruby/1.8/gems/aws-s3-0.5.1/lib,~/.gem/ruby/1.8/gems/colored-1.1/lib,~/.gem/ruby/1.8/gems/do_postgres-0.9.12/lib,~/.gem/ruby/1.8/gems/roodi-1.4.0/lib,~/.gem/ruby/1.8/gems/sparklines-0.5.2/lib,~/.gem/ruby/1.8/gems/sparklines_generator-0.2.2/lib,~/.gem/ruby/1.8/gems/xml-simple-1.0.12/lib,/usr/lib/ruby/gems/1.8/gems/Linguistics-1.0.5/lib,/usr/lib/ruby/gems/1.8/gems/ParseTree-3.0.3/lib,/usr/lib/ruby/gems/1.8/gems/ParseTree-3.0.3/test,/usr/lib/ruby/gems/1.8/gems/RubyInline-3.8.1/lib,/usr/lib/ruby/gems/1.8/gems/Text-1.1.2/lib,/usr/lib/ruby/gems/1.8/gems/ZenTest-4.0.0/lib,/usr/lib/ruby/gems/1.8/gems/abstract-1.0.0/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/acts_as_reportable-1.1.1/lib,/usr/lib/ruby/gems/1.8/gems/addressable-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/archive-tar-minitar-0.5.2/lib,/usr/lib/ruby/gems/1.8/gems/aws-s3-0.6.2/lib,/usr/lib/ruby/gems/1.8/gems/bluecloth-2.0.5/lib,/usr/lib/ruby/gems/1.8/gems/builder-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/cgi_multipart_eof_fix-2.5.0/lib,/usr/lib/ruby/gems/1.8/gems/chronic-0.2.3/lib,/usr/lib/ruby/gems/1.8/gems/color-1.4.0/lib,/usr/lib/ruby/gems/1.8/gems/colored-1.1/lib,/usr/lib/ruby/gems/1.8/gems/columnize-0.3.0/lib,/usr/lib/ruby/gems/1.8/gems/crack-0.1.2/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.1/lib,/usr/lib/ruby/gems/1.8/gems/daemons-1.0.10/lib,/usr/lib/ruby/gems/1.8/gems/data_objects-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/data_objects-0.9.12/lib,/usr/lib/ruby/gems/1.8/gems/datamapper-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/datamapper-dm-rest-adapter-0.9.12/lib,/usr/lib/ruby/gems/1.8/gems/date_time-duration-0.0.1/lib,/usr/lib/ruby/gems/1.8/gems/date_time-smart-0.0.3/lib,/usr/lib/ruby/gems/1.8/gems/diff-lcs-1.1.2/lib,/usr/lib/ruby/gems/1.8/gems/dm-adjust-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-aggregates-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-ar-finders-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-cli-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-constraints-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-core-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-ferret-adapter-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-list-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-nested_set-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-remixable-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-searchable-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-state_machine-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-tree-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-versioned-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-viewable-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-migrations-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-more-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-observer-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-querizer-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-rest-adapter-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-serializer-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-shorthand-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-sweatshop-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-tags-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-timestamps-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-types-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-validations-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
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
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
9
normal zo
10
normal zo
11
normal zo
15
normal zo
23
normal zo
27
normal zo
31
normal zo
37
normal zo
44
normal zo
52
normal zo
59
normal zo
67
normal zo
15
normal zo
72
normal zo
73
normal zo
74
normal zo
78
normal zo
73
normal zo
72
normal zo
84
normal zo
85
normal zo
89
normal zo
93
normal zo
84
normal zo
10
normal zo
9
normal zo
let s:l = 92 - ((29 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
92
normal! 0
wincmd w
argglobal
edit sql.rb
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
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
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
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
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
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,/usr/lib/ruby/site_ruby/1.8,/usr/lib/ruby/site_ruby/1.8/i686-linux,/usr/lib/ruby/site_ruby,/usr/lib/ruby/vendor_ruby/1.8,/usr/lib/ruby/vendor_ruby/1.8/i686-linux,/usr/lib/ruby/vendor_ruby,/usr/lib/ruby/1.8,/usr/lib/ruby/1.8/i686-linux,,~/.gem/ruby/1.8/gems/actionmailer-2.1.2/lib,~/.gem/ruby/1.8/gems/actionpack-2.1.2/lib,~/.gem/ruby/1.8/gems/activerecord-2.1.2/lib,~/.gem/ruby/1.8/gems/activeresource-2.1.2/lib,~/.gem/ruby/1.8/gems/activesupport-2.1.2/lib,~/.gem/ruby/1.8/gems/aws-s3-0.5.1/lib,~/.gem/ruby/1.8/gems/colored-1.1/lib,~/.gem/ruby/1.8/gems/do_postgres-0.9.12/lib,~/.gem/ruby/1.8/gems/roodi-1.4.0/lib,~/.gem/ruby/1.8/gems/sparklines-0.5.2/lib,~/.gem/ruby/1.8/gems/sparklines_generator-0.2.2/lib,~/.gem/ruby/1.8/gems/xml-simple-1.0.12/lib,/usr/lib/ruby/gems/1.8/gems/Linguistics-1.0.5/lib,/usr/lib/ruby/gems/1.8/gems/ParseTree-3.0.3/lib,/usr/lib/ruby/gems/1.8/gems/ParseTree-3.0.3/test,/usr/lib/ruby/gems/1.8/gems/RubyInline-3.8.1/lib,/usr/lib/ruby/gems/1.8/gems/Text-1.1.2/lib,/usr/lib/ruby/gems/1.8/gems/ZenTest-4.0.0/lib,/usr/lib/ruby/gems/1.8/gems/abstract-1.0.0/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/acts_as_reportable-1.1.1/lib,/usr/lib/ruby/gems/1.8/gems/addressable-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/archive-tar-minitar-0.5.2/lib,/usr/lib/ruby/gems/1.8/gems/aws-s3-0.6.2/lib,/usr/lib/ruby/gems/1.8/gems/bluecloth-2.0.5/lib,/usr/lib/ruby/gems/1.8/gems/builder-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/cgi_multipart_eof_fix-2.5.0/lib,/usr/lib/ruby/gems/1.8/gems/chronic-0.2.3/lib,/usr/lib/ruby/gems/1.8/gems/color-1.4.0/lib,/usr/lib/ruby/gems/1.8/gems/colored-1.1/lib,/usr/lib/ruby/gems/1.8/gems/columnize-0.3.0/lib,/usr/lib/ruby/gems/1.8/gems/crack-0.1.2/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.1/lib,/usr/lib/ruby/gems/1.8/gems/daemons-1.0.10/lib,/usr/lib/ruby/gems/1.8/gems/data_objects-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/data_objects-0.9.12/lib,/usr/lib/ruby/gems/1.8/gems/datamapper-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/datamapper-dm-rest-adapter-0.9.12/lib,/usr/lib/ruby/gems/1.8/gems/date_time-duration-0.0.1/lib,/usr/lib/ruby/gems/1.8/gems/date_time-smart-0.0.3/lib,/usr/lib/ruby/gems/1.8/gems/diff-lcs-1.1.2/lib,/usr/lib/ruby/gems/1.8/gems/dm-adjust-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-aggregates-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-ar-finders-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-cli-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-constraints-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-core-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-ferret-adapter-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-list-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-nested_set-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-remixable-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-searchable-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-state_machine-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-tree-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-versioned-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-is-viewable-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-migrations-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-more-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-observer-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-querizer-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-rest-adapter-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-serializer-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-shorthand-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-sweatshop-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-tags-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-timestamps-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-types-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-validations-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
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
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
1
normal zo
129
normal zo
130
normal zo
129
normal zo
200
normal zo
201
normal zo
200
normal zo
206
normal zo
209
normal zo
234
normal zo
236
normal zo
268
normal zo
236
normal zo
234
normal zo
289
normal zo
209
normal zo
302
normal zo
303
normal zo
307
normal zo
302
normal zo
312
normal zo
315
normal zo
317
normal zo
326
normal zo
330
normal zo
334
normal zo
335
normal zo
341
normal zo
334
normal zo
347
normal zo
353
normal zo
330
normal zo
326
normal zo
362
normal zo
364
normal zo
367
normal zo
373
normal zo
376
normal zo
378
normal zo
384
normal zo
376
normal zo
373
normal zo
390
normal zo
397
normal zo
364
normal zo
405
normal zo
407
normal zo
405
normal zo
362
normal zo
415
normal zo
315
normal zo
428
normal zc
431
normal zo
431
normal zc
441
normal zo
442
normal zo
446
normal zo
441
normal zc
1
normal zo
let s:l = 428 - ((36 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
428
normal! 06l
wincmd w
argglobal
edit sql.treetop
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
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
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
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
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
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 41 - ((19 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
41
normal! 070l
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 37 + 38) / 77)
exe '2resize ' . ((&lines * 37 + 38) / 77)
exe 'vert 2resize ' . ((&columns * 139 + 139) / 279)
exe '3resize ' . ((&lines * 37 + 38) / 77)
exe 'vert 3resize ' . ((&columns * 139 + 139) / 279)
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
