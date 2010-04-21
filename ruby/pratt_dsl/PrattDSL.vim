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
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/git/sandbox/ruby/pratt_dsl
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +35 pratt_dsl.rb
badd +2 pratt_dsl.treetop
badd +29 pratt_dsl_orm.rb
badd +11 pratt_dsl_test.rb
badd +24 example.treetop
badd +22 example_test.rb
badd +1464 ~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8/fileutils.rb
badd +0 link_parser.rb
args pratt_dsl.rb pratt_dsl.treetop pratt_dsl_example.sqlite3 pratt_dsl_orm.rb pratt_dsl_test.rb
edit link_parser.rb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 38 + 39) / 78)
exe 'vert 1resize ' . ((&columns * 93 + 139) / 279)
exe '2resize ' . ((&lines * 37 + 39) / 78)
exe 'vert 2resize ' . ((&columns * 93 + 139) / 279)
exe 'vert 3resize ' . ((&columns * 92 + 139) / 279)
exe '4resize ' . ((&lines * 38 + 39) / 78)
exe 'vert 4resize ' . ((&columns * 92 + 139) / 279)
exe '5resize ' . ((&lines * 37 + 39) / 78)
exe 'vert 5resize ' . ((&columns * 92 + 139) / 279)
argglobal
edit link_parser.rb
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
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/unindent-0.9/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/unindent-0.9/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/lib,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby/1.8/i686-linux,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby/1.8/i686-linux,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8/i686-linux,,~/.rvm/gems/ruby-1.8.7-p249/gems/MP4Info-0.3.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ParseTree-3.0.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ParseTree-3.0.5/test,~/.rvm/gems/ruby-1.8.7-p249/gems/Rack-2.0.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/RubyInline-3.8.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ZenTest-4.3.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/abstract-1.0.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionmailer-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionmailer-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activeresource-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activeresource-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/addressable-2.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/awesome_print-0.1.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bcrypt-ruby-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/builder-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.14/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.20/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/chronic-0.2.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/colored-1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/columnize-0.3.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/daemons-1.0.10/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/data_objects-0.10.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/diff-lcs-1.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-aggregates-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-constraints-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-core-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-migrations-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-serializer-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-sweatshop-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-timestamps-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-types-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-validations-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/do_sqlite3-0.10.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/erubis-2.6.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/eventmachine-0.12.10/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/extlib-0.9.14/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/fastercsv-1.5.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/flacinfo-rb-0.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/fxruby-1.6.20-x86-linux/ext/fox16,~/.rvm/gems/ruby-1.8.7-p249/gems/fxruby-1.6.20-x86-linux/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/git-1.2.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/haml-2.2.23/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/highline-1.5.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/hoe-2.6.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/i18n-0.3.6/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/jeweler-1.4.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/linecache-0.43/lib,~/.rvm/gems/ruby-1.8
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
let s:l = 25 - ((24 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
25
normal! 06l
wincmd w
argglobal
edit pratt_dsl.treetop
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
setlocal formatoptions=tcq
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
setlocal path=.,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/unindent-0.9/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/unindent-0.9/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/lib,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby/1.8/i686-linux,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby/1.8/i686-linux,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8/i686-linux,,~/.rvm/gems/ruby-1.8.7-p249/gems/MP4Info-0.3.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ParseTree-3.0.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ParseTree-3.0.5/test,~/.rvm/gems/ruby-1.8.7-p249/gems/Rack-2.0.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/RubyInline-3.8.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ZenTest-4.3.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/abstract-1.0.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionmailer-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionmailer-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activeresource-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activeresource-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/addressable-2.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/awesome_print-0.1.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bcrypt-ruby-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/builder-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.14/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.20/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/chronic-0.2.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/colored-1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/columnize-0.3.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/daemons-1.0.10/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/data_objects-0.10.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/diff-lcs-1.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-aggregates-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-constraints-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-core-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-migrations-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-serializer-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-sweatshop-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-timestamps-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-types-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-validations-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/do_sqlite3-0.10.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/erubis-2.6.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/eventmachine-0.12.10/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/extlib-0.9.14/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/fastercsv-1.5.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/flacinfo-rb-0.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/fxruby-1.6.20-x86-linux/ext/fox16,~/.rvm/gems/ruby-1.8.7-p249/gems/fxruby-1.6.20-x86-linux/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/git-1.2.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/haml-2.2.23/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/highline-1.5.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/hoe-2.6.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/i18n-0.3.6/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/jeweler-1.4.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/linecache-0.43/lib,~/.rvm/gems/ruby-1.8
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
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 16 - ((7 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 025l
wincmd w
argglobal
edit pratt_dsl_test.rb
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
setlocal formatoptions=tcq
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
setlocal path=.,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/unindent-0.9/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/unindent-0.9/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/lib,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby/1.8/i686-linux,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby/1.8/i686-linux,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8/i686-linux,,~/.rvm/gems/ruby-1.8.7-p249/gems/MP4Info-0.3.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ParseTree-3.0.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ParseTree-3.0.5/test,~/.rvm/gems/ruby-1.8.7-p249/gems/Rack-2.0.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/RubyInline-3.8.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ZenTest-4.3.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/abstract-1.0.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionmailer-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionmailer-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activeresource-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activeresource-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/addressable-2.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/awesome_print-0.1.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bcrypt-ruby-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/builder-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.14/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.20/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/chronic-0.2.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/colored-1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/columnize-0.3.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/daemons-1.0.10/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/data_objects-0.10.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/diff-lcs-1.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-aggregates-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-constraints-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-core-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-migrations-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-serializer-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-sweatshop-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-timestamps-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-types-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-validations-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/do_sqlite3-0.10.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/erubis-2.6.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/eventmachine-0.12.10/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/extlib-0.9.14/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/fastercsv-1.5.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/flacinfo-rb-0.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/fxruby-1.6.20-x86-linux/ext/fox16,~/.rvm/gems/ruby-1.8.7-p249/gems/fxruby-1.6.20-x86-linux/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/git-1.2.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/haml-2.2.23/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/highline-1.5.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/hoe-2.6.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/i18n-0.3.6/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/jeweler-1.4.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/linecache-0.43/lib,~/.rvm/gems/ruby-1.8
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
16
normal zo
17
normal zo
29
normal zo
17
normal zo
16
normal zo
37
normal zo
39
normal zo
44
normal zo
37
normal zo
45
normal zo
46
normal zo
52
normal zo
46
normal zo
45
normal zo
69
normal zo
70
normal zo
71
normal zo
77
normal zo
81
normal zo
88
normal zo
70
normal zo
95
normal zo
96
normal zo
102
normal zo
95
normal zo
10
normal zo
9
normal zo
let s:l = 38 - ((7 * winheight(0) + 38) / 76)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
38
normal! 010l
wincmd w
argglobal
edit pratt_dsl_orm.rb
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
setlocal formatoptions=tcq
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
setlocal path=.,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/unindent-0.9/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/unindent-0.9/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/lib,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby/1.8/i686-linux,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby/1.8/i686-linux,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8/i686-linux,,~/.rvm/gems/ruby-1.8.7-p249/gems/MP4Info-0.3.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ParseTree-3.0.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ParseTree-3.0.5/test,~/.rvm/gems/ruby-1.8.7-p249/gems/Rack-2.0.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/RubyInline-3.8.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ZenTest-4.3.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/abstract-1.0.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionmailer-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionmailer-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activeresource-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activeresource-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/addressable-2.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/awesome_print-0.1.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bcrypt-ruby-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/builder-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.14/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.20/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/chronic-0.2.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/colored-1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/columnize-0.3.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/daemons-1.0.10/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/data_objects-0.10.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/diff-lcs-1.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-aggregates-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-constraints-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-core-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-migrations-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-serializer-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-sweatshop-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-timestamps-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-types-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-validations-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/do_sqlite3-0.10.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/erubis-2.6.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/eventmachine-0.12.10/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/extlib-0.9.14/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/fastercsv-1.5.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/flacinfo-rb-0.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/fxruby-1.6.20-x86-linux/ext/fox16,~/.rvm/gems/ruby-1.8.7-p249/gems/fxruby-1.6.20-x86-linux/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/git-1.2.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/haml-2.2.23/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/highline-1.5.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/hoe-2.6.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/i18n-0.3.6/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/jeweler-1.4.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/linecache-0.43/lib,~/.rvm/gems/ruby-1.8
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
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
8
normal zo
16
normal zo
20
normal zo
24
normal zo
8
normal zo
29
normal zo
39
normal zo
29
normal zo
54
normal zo
55
normal zo
56
normal zo
55
normal zo
61
normal zo
62
normal zo
61
normal zo
67
normal zo
68
normal zo
67
normal zo
54
normal zo
let s:l = 67 - ((32 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
67
normal! 023l
wincmd w
argglobal
edit pratt_dsl.rb
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
setlocal noexpandtab
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
setlocal foldmethod=manual
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
setlocal path=.,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/unindent-0.9/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/unindent-0.9/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/bin,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/lib,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby/1.8/i686-linux,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/site_ruby,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby/1.8/i686-linux,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/vendor_ruby,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8,~/.rvm/rubies/ruby-1.8.7-p249/lib/ruby/1.8/i686-linux,,~/.rvm/gems/ruby-1.8.7-p249/gems/MP4Info-0.3.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ParseTree-3.0.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ParseTree-3.0.5/test,~/.rvm/gems/ruby-1.8.7-p249/gems/Rack-2.0.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/RubyInline-3.8.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/ZenTest-4.3.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/abstract-1.0.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionmailer-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionmailer-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activerecord-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activeresource-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activeresource-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.3.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/activesupport-2.3.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/addressable-2.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/awesome_print-0.1.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bcrypt-ruby-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/builder-2.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.14/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/bundler-0.9.20/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/chronic-0.2.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/colored-1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/columnize-0.3.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/crack-0.1.7/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/daemons-1.0.10/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/data_objects-0.10.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/diff-lcs-1.1.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-aggregates-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-constraints-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-core-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-migrations-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-serializer-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-sweatshop-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-timestamps-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-types-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/dm-validations-0.10.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/do_sqlite3-0.10.1.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/erubis-2.6.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/eventmachine-0.12.10/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/extlib-0.9.14/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/fastercsv-1.5.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/flacinfo-rb-0.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/fxruby-1.6.20-x86-linux/ext/fox16,~/.rvm/gems/ruby-1.8.7-p249/gems/fxruby-1.6.20-x86-linux/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemcutter-0.5.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/gemwhois-0.1/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/git-1.2.5/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/haml-2.2.23/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/highline-1.5.2/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/hoe-2.6.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/i18n-0.3.6/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/jeweler-1.4.0/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.3/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/json_pure-1.2.4/lib,~/.rvm/gems/ruby-1.8.7-p249/gems/linecache-0.43/lib,~/.rvm/gems/ruby-1.8
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
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
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 3 - ((2 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 0
wincmd w
exe '1resize ' . ((&lines * 38 + 39) / 78)
exe 'vert 1resize ' . ((&columns * 93 + 139) / 279)
exe '2resize ' . ((&lines * 37 + 39) / 78)
exe 'vert 2resize ' . ((&columns * 93 + 139) / 279)
exe 'vert 3resize ' . ((&columns * 92 + 139) / 279)
exe '4resize ' . ((&lines * 38 + 39) / 78)
exe 'vert 4resize ' . ((&columns * 92 + 139) / 279)
exe '5resize ' . ((&lines * 37 + 39) / 78)
exe 'vert 5resize ' . ((&columns * 92 + 139) / 279)
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
