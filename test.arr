# Comments
# TODO FIXME NOTE Comment

# Names (execute `hi link pyretName Question` to make sure this works)
ab123
a-b1234
a-----b
______
_-_-_

# Numbers
1
-1
+1
123.456
1e10
1.08e10

# Strings
"this is a string"
'this is also a string'
```this is
a multiline
string
```

# Operators
1 + 2
1 * 2
1 / 2
1 - 2

# Construction
[list: 1,2,3,4]
[set: 1,2,3,4]
[foobar: 1,2,3,4]

# Annotated variables
a :: Number
a :: foo-bar
a :: foo-bar.foo-baz
a :: foo-bar.List<Number>
a :: A.Number
a :: List<Number>
a :: A.List<Option<Number>>
a :: {Number; Boolean}
a :: {{Number; Boolean}; {String; List<Any>}}
a :: Foo -> Bar
a :: List<Foo> -> List<Bar>
a :: { Number; Boolean } -> { String; Boolean }
a :: (Foo -> Bar)

# New `type` declaration
type Foo = Number
type Predicate<a> = (a -> Boolean) # This is a comment
1  # This should be correctly highlighted

# Functions
fun abc(a :: Number, b :: String):
end

fun fun-name block:
end

method meth-name(a :: Number, b :: String)
end

fun add(x :: Number, y :: Number) -> Number:
end

lam(b :: Number, c :: Number) -> Number

# Data declarations
data BinTree<A>:
  | Leaf(a :: Number)
  | Branch(l :: BinTree, r :: BinTree)
end

# cases
cases(A.Expr) exp:
  | s-id(_, id) => id.toname()
  | s-id-letrec(_, id, _) => id.toname()
end
