" Vim syntax file
" Language: Pyret
" Maintainer: Rachit Nigam (rachit.nigam12@gmail.com)

if exists("b:current_syntax")
  finish
endif

syn case match
syn sync minlines=200 maxlines=1000

set iskeyword+=-
set iskeyword+=:

syn match delimeter '!'
syn match delimeter '\.'
syn match delimeter '='
syn match delimeter ':='

syn match delimeter ':'
syn match delimiter '%'

hi link delimeter PreProc

" Keywords
syn keyword pyretKeyword var from shadow ref
hi link pyretKeyword Keyword

" Imports and exports
syn keyword pyretImport include import provide provide-types as
hi link pyretImport PreProc

" Block structures in pyret
syn keyword pyretBlock end with: sharing: for
syn keyword pyretBlock try: except when
syn keyword pyretBlock check: where: doc: else: if else
syn keyword pyretBlock deriving graph: m-graph: block: satisfies
syn keyword pyretBlock violates type-let
syn keyword pyretBlock let rec letrec ask: table: extend using row: select
syn keyword pyretBlock extract order sieve by raises newtype
hi link pyretBlock Function

" Built-in functions
syn keyword pyretBuiltin is is== is=~ is<=> is-not is-not== is-not=~ is-not<=>
syn keyword pyretBuiltin and or not
syn keyword pyretBuiltin torepr to-repr tostring to-string raise
syn keyword pyretBuiltin is-boolean is-number is-string is-raw-array is-nothing
syn keyword pyretBuiltin is-function is-object
hi link pyretBuiltin Constant

" Operators
syn match pyretOperator '+'
syn match pyretOperator '-'
syn match pyretOperator '/'
syn match pyretOperator '*'
syn match pyretOperator '>'
syn match pyretOperator '<'
syn match pyretOperator '>='
syn match pyretOperator '<='
syn match pyretOperator '<>'
syn match pyretOperator '\^'
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
 \ nextgroup=pyretColonColon skipwhite
syn match pyretColonColon '::' nextgroup=@pyretAnn skipwhite contained
hi link pyretColonColon Keyword

" Type Annotations
syn cluster pyretAnn
 \ contains=pyretSimpleAnn,pyretComplexAnn,pyretRecordAnn,pyretParenAnn,pyretAnnDot

syn region pyretComplexAnn matchgroup=Keyword start='\v\<' end='\v\>'
 \ contained contains=@pyretAnn nextgroup=pyretAnnArrow skipwhite
hi link pyretComplexAnn Type

syn match pyretSimpleAnn '\v%((\w+-\w+)|\w+)' contained
 \ nextgroup=pyretComplexAnn,pyretAnnArrow,pyretAnnDot skipwhite
hi link pyretSimpleAnn Type

syn match pyretAnnDot '\.' contained nextgroup=pyretSimpleAnn
hi link pyretAnnDot Keyword

syn region pyretRecordAnn matchgroup=Keyword start='\v\{' end='\v\}' contained
 \ contains=@pyretAnn nextgroup=pyretAnnArrow skipwhite
hi link pyretRecordAnn Type

syn region pyretParenAnn matchgroup=Keyword start='\v\(' end='\v\)' contained
 \ contains=@pyretAnn skipwhite
hi link pyretParenAnn Type

syn match pyretAnnArrow '\v-\>' contained nextgroup=@pyretAnn skipwhite
hi link pyretAnnArrow Keyword

" `type` expressions
syn region pyretTypeDecl matchgroup=Keyword start='\v<type>' end='\v$'
 \ contains=@pyretAnn,pyretComment skipwhite keepend

" fun defintions
syn keyword pyretBlock fun method nextgroup=pyretFunName skipwhite
syn keyword pyretBlock lam nextgroup=pyretArgs skipwhite
syn match pyretFunName '\v[_a-zA-Z]((\-+)?[_a-zA-Z0-9]+)*' contained
 \ nextgroup=pyretArgs skipwhite
hi link pyretFunName Constant
syn region pyretArgs matchgroup=Keyword start='\v\(' end='\v\)'
 \ contained contains=pyretArgName nextgroup=pyretAnnArrow skipwhite
hi link pyretArgs Identifier
syn match pyretArgName '\v[_a-zA-Z]((\-+)?[_a-zA-Z0-9]+)*' contained transparent
 \ nextgroup=pyretColonColon skipwhite

" cases using |
syn match pyretBar '\v\|' nextgroup=pyretFunName skipwhite
hi link pyretBar Keyword
syn match pyretCaseArrow '\v\=\>'
hi link pyretCaseArrow Keyword

" Data defintions
syn keyword pyretBlock data nextgroup=pyretSimpleAnn skipwhite

" cases keyword
syn keyword pyretBlock cases nextgroup=pyretCaseType skipwhite
syn region pyretCaseType matchgroup=Keyword start='\v\(' end='\v\)'
 \ contained contains=@pyretAnn skipwhite
