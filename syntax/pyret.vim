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
syn match comment '\#.*$' contains=pyretTodo
syntax region comment start=/#|/ skip=/\./ end=/|#/ contains=pyretTodo

" Todo
syn match pyretTodo "\vTODO|FIXME|NOTE" contained
hi link pyretTodo Todo

" Strings
syntax region string start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region string start=/\v'/ skip=/\v\\./ end=/\v'/
syntax region string start=/\v```/ skip=/\v\\./ end=/\v```/

" Numbers
syn match pyretNumber "\v[0-9]+"

" Template
syntax match pyretTemplate '\v\.\.\.'

hi link comment Comment
hi link basic Function
hi link delimeter PreProc
hi link op Label
hi link pyretNumber Constant
hi link literal Constant
hi link pyretTemplate ERROR
