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
syn match delimeter '='
syn match delimeter '=>'
syn match delimeter ':='

syn match delimeter ':'
syn match delimiter '%'

hi link delimeter PreProc

" Keywords in pyret
syn keyword pyretKeyword var fun end with: sharing: data include import
syn keyword pyretKeyword provide as try: except when cases
syn keyword pyretKeyword for from check: where: doc: and or not else: if else
syn keyword pyretKeyword is is== is=~ is<=> is-not is-not== is-not=~ is-not<=>
syn keyword pyretKeyword deriving ref graph: m-graph: block: satisfies
syn keyword pyretKeyword violates shadow lam type type-let provide-types
syn keyword pyretKeyword let rec letrec ask: table: extend using row: select
syn keyword pyretKeyword extract order sieve by raises newtype method
hi link pyretKeyword Function

" Built-in functions
syn keyword pyretBuiltin torepr to-repr tostring to-string raise
syn keyword pyretBuiltin is-boolean is-number is-string is-raw-array is-nothing
syn keyword pyretBuiltin is-function is-object
hi link pyretBuiltin Constant

" Operators
syn match pyretOperator ' + '
syn match pyretOperator ' - '
syn match pyretOperator ' / '
syn match pyretOperator ' * '
syn match pyretOperator ' > '
syn match pyretOperator ' < '
syn match pyretOperator ' >= '
syn match pyretOperator ' <= '
syn match pyretOperator ' <> '
hi link pyretOperator Label

" Comments
syn match pyretComment '\#.*$' contains=pyretTodo
syntax region pyretComment start=/#|/ skip=/\./ end=/|#/ contains=pyretTodo
hi link pyretComment Comment

" Todo
syn match pyretTodo /\vTODO|FIXME|NOTE/ contained
hi link pyretTodo Todo

" Strings
syntax region string start=/\v"/ skip=/\v\\./ end=/\v("|$)/
syntax region string start=/\v'/ skip=/\v\\./ end=/\v('|$)/
syntax region string start=/\v```/ skip=/\v\\./ end=/\v```/

" Numbers
syn match pyretExactNumber "\v(\-|\+)?[0-9]+(\.[0-9]+)?(e[0-9]+)?"
hi link pyretExactNumber Constant

" Booleans
syn keyword pyretBoolean true
syn keyword pyretBoolean false
hi link pyretBoolean Boolean

" Template
syntax match pyretTemplate '\v\.\.\.'
hi link pyretTemplate ERROR

" Variable names in pyret. Need to be higher priority than numbers
syn match pyretName '\v[_a-zA-Z]((\-+)?[_a-zA-Z0-9]+)*'
