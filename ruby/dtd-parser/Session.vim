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
set fileencodings=ucs-bom,utf-8,default,latin1,default
set helplang=en
set hlsearch
set ruler
set shiftwidth=2
set softtabstop=4
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
cd ~/git/sandbox/ruby/dtd-parser
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 lib/dtd-parser.rb
badd +4 spec/dtd_element_spec.rb
badd +1 spec/dtd_base_spec.rb
badd +4 spec/dtd_attribute_spec.rb
badd +0 lib/dtd/base.rb
badd +27 lib//dtd/base.treetop
badd +2 lib/dtd/element.treetop
badd +0 lib/dtd/attribute.treetop
badd +0 lib/dtd/attribute.rb
args spec/dtd-parser_spec.rb
edit lib/dtd/base.rb
set splitbelow splitright
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
5wincmd k
wincmd w
wincmd w
wincmd w
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 12 + 39) / 78)
exe '2resize ' . ((&lines * 12 + 39) / 78)
exe '3resize ' . ((&lines * 12 + 39) / 78)
exe '4resize ' . ((&lines * 12 + 39) / 78)
exe '5resize ' . ((&lines * 12 + 39) / 78)
exe '6resize ' . ((&lines * 11 + 39) / 78)
argglobal
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
setlocal path=.,/usr/lib/ruby/gems/1.8/gems/gemcutter-0.2.1/lib,~/.gem/ruby/1.8/gems/bundler-0.8.1/bin,~/.gem/ruby/1.8/gems/bundler-0.8.1/lib,/usr/lib/ruby/site_ruby/1.8,/usr/lib/ruby/site_ruby/1.8/i686-linux,/usr/lib/ruby/site_ruby,/usr/lib/ruby/vendor_ruby/1.8,/usr/lib/ruby/vendor_ruby/1.8/i686-linux,/usr/lib/ruby/vendor_ruby,/usr/lib/ruby/1.8,/usr/lib/ruby/1.8/i686-linux,,~/.gem/ruby/1.8/gems/Linguistics-1.0.5/lib,~/.gem/ruby/1.8/gems/ParseTree-3.0.4/lib,~/.gem/ruby/1.8/gems/RedCloth-4.2.2/lib,~/.gem/ruby/1.8/gems/RubyInline-3.8.4/lib,~/.gem/ruby/1.8/gems/ZenTest-4.2.1/lib,~/.gem/ruby/1.8/gems/abstract-1.0.0/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.3/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.4/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.5/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.3/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.4/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.5/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.3/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.4/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.5/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.3/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.4/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.5/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.3/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.4/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.5/lib,~/.gem/ruby/1.8/gems/addressable-2.1.1/lib,~/.gem/ruby/1.8/gems/appengine-apis-0.0.12/lib,~/.gem/ruby/1.8/gems/appengine-jruby-jars-0.0.6/lib,~/.gem/ruby/1.8/gems/appengine-rack-0.0.6/lib,~/.gem/ruby/1.8/gems/appengine-sdk-1.3.0/lib,~/.gem/ruby/1.8/gems/appengine-tools-0.0.8/lib,~/.gem/ruby/1.8/gems/avatar-0.2.0/lib,~/.gem/ruby/1.8/gems/bcrypt-ruby-2.1.2/lib,~/.gem/ruby/1.8/gems/bundler-0.8.1/lib,~/.gem/ruby/1.8/gems/cgi_multipart_eof_fix-2.5.0/lib,~/.gem/ruby/1.8/gems/chronic-0.2.3/lib,~/.gem/ruby/1.8/gems/colored-1.1/lib,~/.gem/ruby/1.8/gems/crack-0.1.4/lib,~/.gem/ruby/1.8/gems/currency-0.4.11/lib,~/.gem/ruby/1.8/gems/daemons-1.0.10/lib,~/.gem/ruby/1.8/gems/data_objects-0.10.0/lib,~/.gem/ruby/1.8/gems/datamapper-0.10.2/lib,~/.gem/ruby/1.8/gems/diff-lcs-1.1.2/lib,~/.gem/ruby/1.8/gems/dm-adjust-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-aggregates-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-appengine-0.0.7/lib,~/.gem/ruby/1.8/gems/dm-ar-finders-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-cli-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-constraints-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-core-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-list-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-nested_set-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-remixable-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-searchable-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-state_machine-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-tree-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-versioned-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-migrations-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-more-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-observer-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-rest-adapter-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-serializer-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-sweatshop-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-tags-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-timestamps-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-types-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-validations-0.10.2/lib,~/.gem/ruby/1.8/gems/do_sqlite3-0.10.0/lib,~/.gem/ruby/1.8/gems/erubis-2.6.5/lib,~/.gem/ruby/1.8/gems/eventmachine-0.12.10/lib,~/.gem/ruby/1.8/gems/extlib-0.9.14/lib,~/.gem/ruby/1.8/gems/fastercsv-1.5.0/lib,~/.gem/ruby/1.8/gems/fastthread-1.0.7/lib,~/.gem/ruby/1.8/gems/ffi-0.5.4/lib,~/.gem/ruby/1.8/gems/gem_plugin-0.2.3/lib,~/.gem/ruby/1.8/gems/geokit-1.5.0/lib,~/.gem/ruby/1.8/gems/haml-2.2.16/lib,~/.gem/ruby/1.8/gems/hashie-0.1.5/lib,~/.gem/ruby/1.8/gems/highline-1.5.1/lib,~/.gem/ruby/1.8/gems/hpricot-0.8.2/lib,~/.gem/ruby/1.8/gems/httparty-0.4.5/lib,~/.gem/ruby/1.8/gems/json_pure-1.2.0/lib,~/.gem/ruby/1.8/gems/libxml-ruby-1.1.3/lib,~/.gem/ruby/1.8/gems/linkparser-1.0.4/lib,~/.gem/ruby/1.8/gems/linkparser-1.0.6/lib,~/.gem/ruby/1.8/gems/mail-1.6.0/lib,~/.gem/ruby/1.8/gems/mailfactory-1.4.0/lib,~/.gem/ruby/1.8/gems/merb-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-action-args-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-assets-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-auth-1.0
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
let s:l = 5 - ((1 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 0
wincmd w
argglobal
edit lib/dtd-parser.rb
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
setlocal path=.,/usr/lib/ruby/gems/1.8/gems/gemcutter-0.2.1/lib,~/.gem/ruby/1.8/gems/bundler-0.8.1/bin,~/.gem/ruby/1.8/gems/bundler-0.8.1/lib,/usr/lib/ruby/site_ruby/1.8,/usr/lib/ruby/site_ruby/1.8/i686-linux,/usr/lib/ruby/site_ruby,/usr/lib/ruby/vendor_ruby/1.8,/usr/lib/ruby/vendor_ruby/1.8/i686-linux,/usr/lib/ruby/vendor_ruby,/usr/lib/ruby/1.8,/usr/lib/ruby/1.8/i686-linux,,~/.gem/ruby/1.8/gems/Linguistics-1.0.5/lib,~/.gem/ruby/1.8/gems/ParseTree-3.0.4/lib,~/.gem/ruby/1.8/gems/RedCloth-4.2.2/lib,~/.gem/ruby/1.8/gems/RubyInline-3.8.4/lib,~/.gem/ruby/1.8/gems/ZenTest-4.2.1/lib,~/.gem/ruby/1.8/gems/abstract-1.0.0/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.3/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.4/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.5/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.3/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.4/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.5/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.3/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.4/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.5/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.3/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.4/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.5/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.3/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.4/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.5/lib,~/.gem/ruby/1.8/gems/addressable-2.1.1/lib,~/.gem/ruby/1.8/gems/appengine-apis-0.0.12/lib,~/.gem/ruby/1.8/gems/appengine-jruby-jars-0.0.6/lib,~/.gem/ruby/1.8/gems/appengine-rack-0.0.6/lib,~/.gem/ruby/1.8/gems/appengine-sdk-1.3.0/lib,~/.gem/ruby/1.8/gems/appengine-tools-0.0.8/lib,~/.gem/ruby/1.8/gems/avatar-0.2.0/lib,~/.gem/ruby/1.8/gems/bcrypt-ruby-2.1.2/lib,~/.gem/ruby/1.8/gems/bundler-0.8.1/lib,~/.gem/ruby/1.8/gems/cgi_multipart_eof_fix-2.5.0/lib,~/.gem/ruby/1.8/gems/chronic-0.2.3/lib,~/.gem/ruby/1.8/gems/colored-1.1/lib,~/.gem/ruby/1.8/gems/crack-0.1.4/lib,~/.gem/ruby/1.8/gems/currency-0.4.11/lib,~/.gem/ruby/1.8/gems/daemons-1.0.10/lib,~/.gem/ruby/1.8/gems/data_objects-0.10.0/lib,~/.gem/ruby/1.8/gems/datamapper-0.10.2/lib,~/.gem/ruby/1.8/gems/diff-lcs-1.1.2/lib,~/.gem/ruby/1.8/gems/dm-adjust-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-aggregates-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-appengine-0.0.7/lib,~/.gem/ruby/1.8/gems/dm-ar-finders-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-cli-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-constraints-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-core-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-list-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-nested_set-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-remixable-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-searchable-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-state_machine-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-tree-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-versioned-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-migrations-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-more-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-observer-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-rest-adapter-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-serializer-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-sweatshop-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-tags-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-timestamps-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-types-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-validations-0.10.2/lib,~/.gem/ruby/1.8/gems/do_sqlite3-0.10.0/lib,~/.gem/ruby/1.8/gems/erubis-2.6.5/lib,~/.gem/ruby/1.8/gems/eventmachine-0.12.10/lib,~/.gem/ruby/1.8/gems/extlib-0.9.14/lib,~/.gem/ruby/1.8/gems/fastercsv-1.5.0/lib,~/.gem/ruby/1.8/gems/fastthread-1.0.7/lib,~/.gem/ruby/1.8/gems/ffi-0.5.4/lib,~/.gem/ruby/1.8/gems/gem_plugin-0.2.3/lib,~/.gem/ruby/1.8/gems/geokit-1.5.0/lib,~/.gem/ruby/1.8/gems/haml-2.2.16/lib,~/.gem/ruby/1.8/gems/hashie-0.1.5/lib,~/.gem/ruby/1.8/gems/highline-1.5.1/lib,~/.gem/ruby/1.8/gems/hpricot-0.8.2/lib,~/.gem/ruby/1.8/gems/httparty-0.4.5/lib,~/.gem/ruby/1.8/gems/json_pure-1.2.0/lib,~/.gem/ruby/1.8/gems/libxml-ruby-1.1.3/lib,~/.gem/ruby/1.8/gems/linkparser-1.0.4/lib,~/.gem/ruby/1.8/gems/linkparser-1.0.6/lib,~/.gem/ruby/1.8/gems/mail-1.6.0/lib,~/.gem/ruby/1.8/gems/mailfactory-1.4.0/lib,~/.gem/ruby/1.8/gems/merb-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-action-args-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-assets-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-auth-1.0
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
let s:l = 4 - ((3 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 0
wincmd w
argglobal
edit lib/dtd/attribute.rb
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
setlocal path=.,/usr/lib/ruby/gems/1.8/gems/gemcutter-0.2.1/lib,~/.gem/ruby/1.8/gems/bundler-0.8.1/bin,~/.gem/ruby/1.8/gems/bundler-0.8.1/lib,/usr/lib/ruby/site_ruby/1.8,/usr/lib/ruby/site_ruby/1.8/i686-linux,/usr/lib/ruby/site_ruby,/usr/lib/ruby/vendor_ruby/1.8,/usr/lib/ruby/vendor_ruby/1.8/i686-linux,/usr/lib/ruby/vendor_ruby,/usr/lib/ruby/1.8,/usr/lib/ruby/1.8/i686-linux,,~/.gem/ruby/1.8/gems/Linguistics-1.0.5/lib,~/.gem/ruby/1.8/gems/ParseTree-3.0.4/lib,~/.gem/ruby/1.8/gems/RedCloth-4.2.2/lib,~/.gem/ruby/1.8/gems/RubyInline-3.8.4/lib,~/.gem/ruby/1.8/gems/ZenTest-4.2.1/lib,~/.gem/ruby/1.8/gems/abstract-1.0.0/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.3/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.4/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.5/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.3/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.4/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.5/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.3/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.4/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.5/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.3/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.4/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.5/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.3/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.4/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.5/lib,~/.gem/ruby/1.8/gems/addressable-2.1.1/lib,~/.gem/ruby/1.8/gems/appengine-apis-0.0.12/lib,~/.gem/ruby/1.8/gems/appengine-jruby-jars-0.0.6/lib,~/.gem/ruby/1.8/gems/appengine-rack-0.0.6/lib,~/.gem/ruby/1.8/gems/appengine-sdk-1.3.0/lib,~/.gem/ruby/1.8/gems/appengine-tools-0.0.8/lib,~/.gem/ruby/1.8/gems/avatar-0.2.0/lib,~/.gem/ruby/1.8/gems/bcrypt-ruby-2.1.2/lib,~/.gem/ruby/1.8/gems/bundler-0.8.1/lib,~/.gem/ruby/1.8/gems/cgi_multipart_eof_fix-2.5.0/lib,~/.gem/ruby/1.8/gems/chronic-0.2.3/lib,~/.gem/ruby/1.8/gems/colored-1.1/lib,~/.gem/ruby/1.8/gems/crack-0.1.4/lib,~/.gem/ruby/1.8/gems/currency-0.4.11/lib,~/.gem/ruby/1.8/gems/daemons-1.0.10/lib,~/.gem/ruby/1.8/gems/data_objects-0.10.0/lib,~/.gem/ruby/1.8/gems/datamapper-0.10.2/lib,~/.gem/ruby/1.8/gems/diff-lcs-1.1.2/lib,~/.gem/ruby/1.8/gems/dm-adjust-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-aggregates-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-appengine-0.0.7/lib,~/.gem/ruby/1.8/gems/dm-ar-finders-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-cli-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-constraints-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-core-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-list-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-nested_set-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-remixable-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-searchable-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-state_machine-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-tree-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-versioned-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-migrations-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-more-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-observer-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-rest-adapter-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-serializer-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-sweatshop-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-tags-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-timestamps-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-types-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-validations-0.10.2/lib,~/.gem/ruby/1.8/gems/do_sqlite3-0.10.0/lib,~/.gem/ruby/1.8/gems/erubis-2.6.5/lib,~/.gem/ruby/1.8/gems/eventmachine-0.12.10/lib,~/.gem/ruby/1.8/gems/extlib-0.9.14/lib,~/.gem/ruby/1.8/gems/fastercsv-1.5.0/lib,~/.gem/ruby/1.8/gems/fastthread-1.0.7/lib,~/.gem/ruby/1.8/gems/ffi-0.5.4/lib,~/.gem/ruby/1.8/gems/gem_plugin-0.2.3/lib,~/.gem/ruby/1.8/gems/geokit-1.5.0/lib,~/.gem/ruby/1.8/gems/haml-2.2.16/lib,~/.gem/ruby/1.8/gems/hashie-0.1.5/lib,~/.gem/ruby/1.8/gems/highline-1.5.1/lib,~/.gem/ruby/1.8/gems/hpricot-0.8.2/lib,~/.gem/ruby/1.8/gems/httparty-0.4.5/lib,~/.gem/ruby/1.8/gems/json_pure-1.2.0/lib,~/.gem/ruby/1.8/gems/libxml-ruby-1.1.3/lib,~/.gem/ruby/1.8/gems/linkparser-1.0.4/lib,~/.gem/ruby/1.8/gems/linkparser-1.0.6/lib,~/.gem/ruby/1.8/gems/mail-1.6.0/lib,~/.gem/ruby/1.8/gems/mailfactory-1.4.0/lib,~/.gem/ruby/1.8/gems/merb-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-action-args-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-assets-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-auth-1.0
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
silent! normal! zE
let s:l = 12 - ((9 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12
normal! 014l
wincmd w
argglobal
edit lib/dtd/attribute.treetop
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
setlocal spelllang=en_us
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
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
edit spec/dtd_attribute_spec.rb
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
setlocal path=.,/usr/lib/ruby/gems/1.8/gems/gemcutter-0.2.1/lib,~/.gem/ruby/1.8/gems/bundler-0.8.1/bin,~/.gem/ruby/1.8/gems/bundler-0.8.1/lib,/usr/lib/ruby/site_ruby/1.8,/usr/lib/ruby/site_ruby/1.8/i686-linux,/usr/lib/ruby/site_ruby,/usr/lib/ruby/vendor_ruby/1.8,/usr/lib/ruby/vendor_ruby/1.8/i686-linux,/usr/lib/ruby/vendor_ruby,/usr/lib/ruby/1.8,/usr/lib/ruby/1.8/i686-linux,,~/.gem/ruby/1.8/gems/Linguistics-1.0.5/lib,~/.gem/ruby/1.8/gems/ParseTree-3.0.4/lib,~/.gem/ruby/1.8/gems/RedCloth-4.2.2/lib,~/.gem/ruby/1.8/gems/RubyInline-3.8.4/lib,~/.gem/ruby/1.8/gems/ZenTest-4.2.1/lib,~/.gem/ruby/1.8/gems/abstract-1.0.0/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.3/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.4/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.5/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.3/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.4/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.5/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.3/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.4/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.5/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.3/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.4/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.5/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.3/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.4/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.5/lib,~/.gem/ruby/1.8/gems/addressable-2.1.1/lib,~/.gem/ruby/1.8/gems/appengine-apis-0.0.12/lib,~/.gem/ruby/1.8/gems/appengine-jruby-jars-0.0.6/lib,~/.gem/ruby/1.8/gems/appengine-rack-0.0.6/lib,~/.gem/ruby/1.8/gems/appengine-sdk-1.3.0/lib,~/.gem/ruby/1.8/gems/appengine-tools-0.0.8/lib,~/.gem/ruby/1.8/gems/avatar-0.2.0/lib,~/.gem/ruby/1.8/gems/bcrypt-ruby-2.1.2/lib,~/.gem/ruby/1.8/gems/bundler-0.8.1/lib,~/.gem/ruby/1.8/gems/cgi_multipart_eof_fix-2.5.0/lib,~/.gem/ruby/1.8/gems/chronic-0.2.3/lib,~/.gem/ruby/1.8/gems/colored-1.1/lib,~/.gem/ruby/1.8/gems/crack-0.1.4/lib,~/.gem/ruby/1.8/gems/currency-0.4.11/lib,~/.gem/ruby/1.8/gems/daemons-1.0.10/lib,~/.gem/ruby/1.8/gems/data_objects-0.10.0/lib,~/.gem/ruby/1.8/gems/datamapper-0.10.2/lib,~/.gem/ruby/1.8/gems/diff-lcs-1.1.2/lib,~/.gem/ruby/1.8/gems/dm-adjust-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-aggregates-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-appengine-0.0.7/lib,~/.gem/ruby/1.8/gems/dm-ar-finders-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-cli-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-constraints-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-core-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-list-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-nested_set-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-remixable-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-searchable-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-state_machine-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-tree-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-versioned-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-migrations-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-more-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-observer-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-rest-adapter-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-serializer-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-sweatshop-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-tags-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-timestamps-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-types-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-validations-0.10.2/lib,~/.gem/ruby/1.8/gems/do_sqlite3-0.10.0/lib,~/.gem/ruby/1.8/gems/erubis-2.6.5/lib,~/.gem/ruby/1.8/gems/eventmachine-0.12.10/lib,~/.gem/ruby/1.8/gems/extlib-0.9.14/lib,~/.gem/ruby/1.8/gems/fastercsv-1.5.0/lib,~/.gem/ruby/1.8/gems/fastthread-1.0.7/lib,~/.gem/ruby/1.8/gems/ffi-0.5.4/lib,~/.gem/ruby/1.8/gems/gem_plugin-0.2.3/lib,~/.gem/ruby/1.8/gems/geokit-1.5.0/lib,~/.gem/ruby/1.8/gems/haml-2.2.16/lib,~/.gem/ruby/1.8/gems/hashie-0.1.5/lib,~/.gem/ruby/1.8/gems/highline-1.5.1/lib,~/.gem/ruby/1.8/gems/hpricot-0.8.2/lib,~/.gem/ruby/1.8/gems/httparty-0.4.5/lib,~/.gem/ruby/1.8/gems/json_pure-1.2.0/lib,~/.gem/ruby/1.8/gems/libxml-ruby-1.1.3/lib,~/.gem/ruby/1.8/gems/linkparser-1.0.4/lib,~/.gem/ruby/1.8/gems/linkparser-1.0.6/lib,~/.gem/ruby/1.8/gems/mail-1.6.0/lib,~/.gem/ruby/1.8/gems/mailfactory-1.4.0/lib,~/.gem/ruby/1.8/gems/merb-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-action-args-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-assets-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-auth-1.0
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
let s:l = 4 - ((2 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 010l
wincmd w
argglobal
edit spec/dtd_base_spec.rb
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
setlocal path=.,/usr/lib/ruby/gems/1.8/gems/gemcutter-0.2.1/lib,~/.gem/ruby/1.8/gems/bundler-0.8.1/bin,~/.gem/ruby/1.8/gems/bundler-0.8.1/lib,/usr/lib/ruby/site_ruby/1.8,/usr/lib/ruby/site_ruby/1.8/i686-linux,/usr/lib/ruby/site_ruby,/usr/lib/ruby/vendor_ruby/1.8,/usr/lib/ruby/vendor_ruby/1.8/i686-linux,/usr/lib/ruby/vendor_ruby,/usr/lib/ruby/1.8,/usr/lib/ruby/1.8/i686-linux,,~/.gem/ruby/1.8/gems/Linguistics-1.0.5/lib,~/.gem/ruby/1.8/gems/ParseTree-3.0.4/lib,~/.gem/ruby/1.8/gems/RedCloth-4.2.2/lib,~/.gem/ruby/1.8/gems/RubyInline-3.8.4/lib,~/.gem/ruby/1.8/gems/ZenTest-4.2.1/lib,~/.gem/ruby/1.8/gems/abstract-1.0.0/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.3/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.4/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.5/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.3/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.4/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.5/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.3/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.4/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.5/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.3/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.4/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.5/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.3/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.4/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.5/lib,~/.gem/ruby/1.8/gems/addressable-2.1.1/lib,~/.gem/ruby/1.8/gems/appengine-apis-0.0.12/lib,~/.gem/ruby/1.8/gems/appengine-jruby-jars-0.0.6/lib,~/.gem/ruby/1.8/gems/appengine-rack-0.0.6/lib,~/.gem/ruby/1.8/gems/appengine-sdk-1.3.0/lib,~/.gem/ruby/1.8/gems/appengine-tools-0.0.8/lib,~/.gem/ruby/1.8/gems/avatar-0.2.0/lib,~/.gem/ruby/1.8/gems/bcrypt-ruby-2.1.2/lib,~/.gem/ruby/1.8/gems/bundler-0.8.1/lib,~/.gem/ruby/1.8/gems/cgi_multipart_eof_fix-2.5.0/lib,~/.gem/ruby/1.8/gems/chronic-0.2.3/lib,~/.gem/ruby/1.8/gems/colored-1.1/lib,~/.gem/ruby/1.8/gems/crack-0.1.4/lib,~/.gem/ruby/1.8/gems/currency-0.4.11/lib,~/.gem/ruby/1.8/gems/daemons-1.0.10/lib,~/.gem/ruby/1.8/gems/data_objects-0.10.0/lib,~/.gem/ruby/1.8/gems/datamapper-0.10.2/lib,~/.gem/ruby/1.8/gems/diff-lcs-1.1.2/lib,~/.gem/ruby/1.8/gems/dm-adjust-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-aggregates-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-appengine-0.0.7/lib,~/.gem/ruby/1.8/gems/dm-ar-finders-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-cli-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-constraints-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-core-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-list-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-nested_set-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-remixable-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-searchable-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-state_machine-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-tree-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-is-versioned-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-migrations-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-more-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-observer-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-rest-adapter-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-serializer-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-sweatshop-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-tags-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-timestamps-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-types-0.10.2/lib,~/.gem/ruby/1.8/gems/dm-validations-0.10.2/lib,~/.gem/ruby/1.8/gems/do_sqlite3-0.10.0/lib,~/.gem/ruby/1.8/gems/erubis-2.6.5/lib,~/.gem/ruby/1.8/gems/eventmachine-0.12.10/lib,~/.gem/ruby/1.8/gems/extlib-0.9.14/lib,~/.gem/ruby/1.8/gems/fastercsv-1.5.0/lib,~/.gem/ruby/1.8/gems/fastthread-1.0.7/lib,~/.gem/ruby/1.8/gems/ffi-0.5.4/lib,~/.gem/ruby/1.8/gems/gem_plugin-0.2.3/lib,~/.gem/ruby/1.8/gems/geokit-1.5.0/lib,~/.gem/ruby/1.8/gems/haml-2.2.16/lib,~/.gem/ruby/1.8/gems/hashie-0.1.5/lib,~/.gem/ruby/1.8/gems/highline-1.5.1/lib,~/.gem/ruby/1.8/gems/hpricot-0.8.2/lib,~/.gem/ruby/1.8/gems/httparty-0.4.5/lib,~/.gem/ruby/1.8/gems/json_pure-1.2.0/lib,~/.gem/ruby/1.8/gems/libxml-ruby-1.1.3/lib,~/.gem/ruby/1.8/gems/linkparser-1.0.4/lib,~/.gem/ruby/1.8/gems/linkparser-1.0.6/lib,~/.gem/ruby/1.8/gems/mail-1.6.0/lib,~/.gem/ruby/1.8/gems/mailfactory-1.4.0/lib,~/.gem/ruby/1.8/gems/merb-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-action-args-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-assets-1.0.15/lib,~/.gem/ruby/1.8/gems/merb-auth-1.0
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
let s:l = 11 - ((6 * winheight(0) + 5) / 11)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
11
normal! 017l
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 12 + 39) / 78)
exe '2resize ' . ((&lines * 12 + 39) / 78)
exe '3resize ' . ((&lines * 12 + 39) / 78)
exe '4resize ' . ((&lines * 12 + 39) / 78)
exe '5resize ' . ((&lines * 12 + 39) / 78)
exe '6resize ' . ((&lines * 11 + 39) / 78)
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
