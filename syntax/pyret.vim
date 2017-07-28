" Vim syntax file
" Language: Pyret
" Maintainer: Rachit Nigam (rachit.nigam12@gmail.com)

if exists("b:current_syntax")
  finish
endif

set iskeyword+=-
set iskeyword+=:

syn match delimeter '!'
syn match delimeter '\.'
syn match delimeter '|'
syn match delimeter '('
syn match delimeter ')'
syn match delimeter '->'
syn match delimeter '='
syn match delimeter '=>'
syn match delimeter ':='

syn match delimeter '\['
syn match delimeter '\]'
syn match delimeter '{'
syn match delimeter '}'
syn match delimeter ':'
syn match delimeter '::'

syn keyword basic var fun end with: sharing: data include import
syn keyword basic provide as try: except when cases
syn keyword basic for from check: where: doc: and or not else: if else
syn keyword basic is is== is=~ is<=> is-not is-not== is-not=~ is-not<=>
syn keyword basic deriving ref graph: m-graph: block: satisfies
syn keyword basic violates shadow lam type type-let provide-types
syn keyword basic let rec letrec ask: table: extend using row: select
syn keyword basic extract order sieve by raises newtype method

" Operators
syn match op ' + '
syn match op ' - '
syn match op ' / '
syn match op ' * '
syn match op ' > '
syn match op ' < '
syn match op ' >= '
syn match op ' <= '
syn match op ' <> '

" Comments
syn match comment '\#.*$'
syntax region comment start=/#|/ skip=/\./ end=/|#/

" Strings
syntax region string start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region string start=/\v'/ skip=/\v\\./ end=/\v'/
syntax region string start=/\v```/ skip=/\v\\./ end=/\v```/

" Numbers
syn match number "[0-9]+"

" Template
syntax match pyretTemplate '\v\.\.\.'

hi def link comment Comment
hi def link basic Function
hi def link delimeter PreProc
hi def link op Label
hi def link number Constant
hi def link literal Constant
hi def link pyretTemplate ERROR
