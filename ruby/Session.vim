let SessionLoad = 1
if &cp | set nocp | endif
map 	 
map ; :
map Q gq
map UU :call UnComment()
vmap [% [%m'gv``
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
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
map s :w!
map zz 
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
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
set window=76
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/git/sandbox/ruby
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +5 ~/git/sandbox/cfml/index.cfm
badd +131 ~/git/sandbox/cfml/login.cfm
badd +26 ~/git/sandbox/cfml/Application.cfc
badd +1 ~/git/sandbox/cfml/components/User.cfc
badd +357 spacerize.rb
badd +7 html_attribute.treetop
badd +549 html_attribute.rb
badd +1 sql_parser_test.rb
badd +1582 sql.rb
badd +12 attribute_node_map.rb
badd +36 html_node_element.rb
badd +23 html_node_element.treetop
badd +239 html_node_element_test.rb
badd +1 html_parser.treetop
badd +88 html_parser.rb
args ~/git/sandbox/cfml/index.cfm ~/git/sandbox/cfml/login.cfm
edit html_attribute.treetop
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 139 + 139) / 279)
exe 'vert 2resize ' . ((&columns * 139 + 139) / 279)
argglobal
2argu
edit html_attribute.treetop
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
if &filetype != 'treetop'
setlocal filetype=treetop
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
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en_us
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'treetop'
setlocal syntax=treetop
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
let s:l = 21 - ((20 * winheight(0) + 37) / 75)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
21
normal! 012l
wincmd w
argglobal
2argu
edit spacerize.rb
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
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/unindent-0.9/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/unindent-0.9/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/lib,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby/1.8/i686-linux,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby/1.8/i686-linux,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8/i686-linux,,~/.rvm/gems/ruby-1.8.7-p249/gems/MP4Info-0.3.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ParseTree-3.0.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ParseTree-3.0.5/test,~/.rvm/gems/ruby-1.8.7-p249/gems/Rack-2.0.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/RubyInline-3.8.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ZenTest-4.3.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/abstract-1.0.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionmailer-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionmailer-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activeresource-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activeresource-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/addressable-2.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/addressable-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/arel-0.3.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/awesome_print-0.1.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bcrypt-ruby-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/builder-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.14/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.20/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.24/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/chronic-0.2.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/colored-1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/columnize-0.3.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/daemons-1.0.10/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/data_objects-0.10.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/diff-lcs-1.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-aggregates-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-constraints-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-core-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-migrations-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-serializer-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-sweatshop-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-timestamps-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-types-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-validations-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/do_sqlite3-0.10.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/erubis-2.6.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/eventmachine-0.12.10/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/extlib-0.9.14/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/fastercsv-1.5.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/flacinfo-rb-0.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/flexmock-0.8.6/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/fxruby-1.6.20-x86-linux/ext/fox16,~/.rvm/gems/ruby-1.8.7-p249/gems/fxruby-1.6.20-x86-linux/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gettext-2.1.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/git-1.2.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/haml-2.2.23/lib,~/.rv
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
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
7
normal zo
59
normal zo
73
normal zo
78
normal zo
79
normal zo
90
normal zo
92
normal zo
90
normal zo
96
normal zo
100
normal zo
78
normal zo
105
normal zo
108
normal zo
111
normal zo
119
normal zo
127
normal zo
128
normal zo
127
normal zo
133
normal zo
134
normal zo
135
normal zo
134
normal zo
133
normal zo
144
normal zo
147
normal zo
149
normal zo
147
normal zo
144
normal zo
156
normal zo
158
normal zo
156
normal zo
164
normal zo
166
normal zo
168
normal zo
166
normal zo
164
normal zo
176
normal zo
177
normal zo
176
normal zo
182
normal zo
183
normal zo
182
normal zo
108
normal zo
189
normal zo
327
normal zo
347
normal zo
370
normal zo
373
normal zo
59
normal zo
78
normal zo
79
normal zo
89
normal zo
89
normal zo
358
normal zo
378
normal zo
401
normal zo
404
normal zo
89
normal zo
79
normal zo
90
normal zo
92
normal zo
90
normal zo
96
normal zo
100
normal zo
113
normal zo
116
normal zo
117
normal zo
118
normal zo
117
normal zo
116
normal zo
113
normal zo
127
normal zo
130
normal zo
131
normal zo
132
normal zo
131
normal zo
130
normal zo
140
normal zo
142
normal zo
145
normal zo
148
normal zo
156
normal zo
166
normal zo
167
normal zo
166
normal zo
172
normal zo
173
normal zo
174
normal zo
173
normal zo
172
normal zo
183
normal zo
186
normal zo
188
normal zo
186
normal zo
183
normal zo
194
normal zo
195
normal zo
197
normal zo
195
normal zo
194
normal zo
205
normal zo
207
normal zo
205
normal zo
213
normal zo
215
normal zo
217
normal zo
215
normal zo
213
normal zo
225
normal zo
226
normal zo
225
normal zo
231
normal zo
233
normal zo
231
normal zo
238
normal zo
239
normal zo
238
normal zo
145
normal zo
245
normal zo
383
normal zo
403
normal zo
426
normal zo
429
normal zo
140
normal zo
127
normal zo
78
normal zo
142
normal zo
145
normal zo
148
normal zo
156
normal zo
166
normal zo
167
normal zo
166
normal zo
172
normal zo
173
normal zo
174
normal zo
173
normal zo
172
normal zo
183
normal zo
186
normal zo
188
normal zo
186
normal zo
183
normal zo
194
normal zo
195
normal zo
197
normal zo
195
normal zo
194
normal zo
205
normal zo
207
normal zo
205
normal zo
213
normal zo
215
normal zo
217
normal zo
215
normal zo
213
normal zo
225
normal zo
226
normal zo
225
normal zo
231
normal zo
233
normal zo
231
normal zo
238
normal zo
239
normal zo
238
normal zo
145
normal zo
245
normal zo
383
normal zo
403
normal zo
426
normal zo
429
normal zo
let s:l = 244 - ((47 * winheight(0) + 37) / 75)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
244
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 139 + 139) / 279)
exe 'vert 2resize ' . ((&columns * 139 + 139) / 279)
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
