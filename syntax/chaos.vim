" Vim syntax file
" Language:	chaos
" Maintainer:	zeauberg
" Created at:	2024 Apr 07

syntax case match

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "chaos"

hi! chaos.white.colgate guifg=#ffffff
hi! chaos.orange guifg=#ff4f0f guibg=bg
hi! chaos.golden guifg=#f4a938 guibg=bg
hi! chaos.pitch_black guifg=#000000 guibg=bg
hi! chaos.blue.sky guifg=#59c2ff guibg=bg
hi! chaos.blue.azure guifg=#3388f8 guibg=bg
hi! chaos.green.lime guifg=#8af478 guibg=bg
hi! chaos.red.error guifg=#ff3333 guibg=bg
hi! chaos.red.rose guifg=#ec3960 guibg=bg
hi! chaos.pink.rose guifg=#ef83c6 guibg=bg
hi! chaos.pink.piggy guifg=#ff00ff guibg=bg
hi! chaos.white.smoke guifg=#b3b1ad guibg=bg
hi! chaos.grey1 guifg=#3e4b59 guibg=bg
hi! chaos.grey2 guifg=#0d1016 guibg=bg
hi! chaos.grey3 guifg=#171b21 guibg=bg
hi! chaos.grey4 guifg=#404755 guibg=bg
hi! chaos.grey5 guifg=#626a73 guibg=bg
hi! def link chaos.grey chaos.grey1
hi! def link chaos.grey.dark chaos.grey5

hi! def chaos.quote guifg=#b3b1ad gui=italic
hi! def chaos.quote.single guifg=fg gui=italic

hi! def link chaos.comment 						chaos.grey5
hi! def link chaos.section 						chaos.pink.rose
hi! def link chaos.marker 						chaos.pink.rose
hi! def link chaos.line 							chaos.white.smoke
hi! def link chaos.block 							chaos.white.smoke
hi! def link chaos.declaration				chaos.golden
hi! def link chaos.type.colon					chaos.golden
hi! def link chaos.type.meta					chaos.blue.sky
hi! def link chaos.type.meta.gold			chaos.golden
hi! def link chaos.type.data					chaos.green.lime
hi! def link chaos.type.try						chaos.red.rose
hi! def link chaos.type.workload			chaos.red.rose
hi! def link chaos.type.opt						chaos.blue.sky
hi! def link chaos.quote.double				chaos.quote
hi! def link chaos.quote.escape				chaos.quote
hi! def link chaos.quote.backtick			chaos.golden
hi! def link chaos.dump.type					chaos.golden
hi! def link chaos.dump.block 				chaos.white.smoke
hi! def link chaos.tag								chaos.blue.azure
hi! def link chaos.arrow							chaos.golden
hi! def link chaos.syntax							chaos.blue.azure
hi! def link chaos.delimiter					chaos.golden

syn match chaos.arrow _ \@<=\(\(<-\)\|\(->\)\) \@=_
syn cluster chaos.quote contains=chaos.quote.single, chaos.quote.double, chaos.quote.backtick ", chaos.quote.escape, chaos.quote.at
syn region chaos.quote.single oneline matchgroup=chaos.syntax   start=_'_ end=/'\_s\?)/
syn region chaos.quote.double oneline matchgroup=chaos.syntax  start=_"_ end=_"_
syn region chaos.quote.backtick oneline matchgroup=chaos.syntax start=_`_ end=_`_
syn region chaos.quote.escape oneline matchgroup=chaos.syntax  start=_-''_ end=_''-_
syn cluster chaos.types contains=chaos.type.meta, chaos.type.meta.gold, chaos.type.data, chaos.type.try, chaos.type.workload
syn keyword chaos.type.meta  rl rf next bfr oft switch when dump fr needs opt done nextgroup=@chaos.type.after
syn keyword chaos.type.meta.gold wish nextgroup=@chaos.type.after
syn keyword chaos.type.data  inf i res rs log feedback proposal sn def hint code eg ie cite reason hmm conclusion problem desc cm data story glossary roadmap ms usage more goal req about requires scenario cheatsheet tldr summary nextgroup=@chaos.type.after
syn keyword chaos.type.try  try reading considering research nextgroup=@chaos.type.after
syn keyword chaos.type.workload todo read learn conf check impl consider refactor watch write document define fix nextgroup=@chaos.type.after
syn match chaos.type.opt _?_ nextgroup=@chaos.types, chaos.type.colon
syn match chaos.type.colon _:_ contained
syn match chaos.tag _ \@<=\#\k\+_
syn region chaos.property transparent matchgroup=chaos.syntax oneline start=_(_ end=_)_ contains=@chaos.types, @chaos.quote
syn cluster chaos.type.after contains=@chaos.quote, chaos.property, chaos.type.opt, chaos.type.colon
syn region chaos.block matchgroup=chaos.syntax start=_{{\@!_  end=_}}\@!_ contains=TOP
syn region chaos.dump.block matchgroup=chaos.grey start=_{{_  end=_}}$_ contains=NONE
syn match chaos.delimiter _--_
syn region chaos.comment oneline matchgroup=chaos.syntax start=/^#/ end=/$/ contains=NONE
syn region chaos.section oneline contains=chaos.property start=/^\~\{3}/ end=/$/
syn region chaos.marker oneline contains=chaos.property start=_^\~\/_ end=/$/

" keep for the ref
" chaos operators
" @ -> <- : { } {{ }} -'' ''    '..' ".." `..`
"syn match errorEmptyQuote /""\|''\|``/
"syn match errorLine /^.*$/chaosGolden
"syn match chaos.property transparent contained   _\w\+(\w\+)_ contains=@chaos.types
"syn region chaos.properties oneline contained  start=_\w\+(_  end=_\w)_ contains=chaos.property

"hi! def link chaos.tag.green					
