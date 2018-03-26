(f . g) x = f (g x)
(f o g)(x) = f(g(x))

flip f a b = f b a
f(a,b)->f(b,a)

curry f a b = f (a,b)
f(a,b)->f(a(b))

flip (curry f ) = curry (f . swap)

flip(curry(f))-> curry(f o swap)
