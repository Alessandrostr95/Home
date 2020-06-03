'''
    Teoria assiomatica dei numeri con lambda calcolo
'''
base = lambda x : x + 1 

zero = lambda f : lambda x : x
uno = lambda f : lambda x : f(x)
due = lambda f : lambda x : f(f(x))
tre = lambda f : lambda x : f(f(f(x)))
#...
print( due (base)(0) )
print( tre (base)(0) )

succ = lambda w : lambda x : lambda y : x((w)(x)(y))

print(  (succ(due)) (base)(0)   )       #successore di due
print(  succ(succ(due)) (base)(0)   )   #successore di successore di due
print(  (succ(tre)) (base)(0)   )       #successore di tre

sum = lambda x : lambda y : lambda f : lambda g : (x) (f) ( (y) (f) (g)  )

print(  sum(due)(tre) (base)(0)   )                 # somma 2,3
print(  sum(zero)(tre) (base)(0)   )                # somma 0,3
print(  sum(uno)(sum(due)(tre)) (base)(0)   )       # somma 1,( somma(2,3) )

mult = lambda x : lambda y : lambda f : (x) ( (y) (f) )

print( mult(due)(tre) (base)(0) )                       # 2 * 3
print( mult(zero)(uno) (base)(0) )                      # 0 * 1
print( mult(due)(mult(due)(tre)) (base)(0) )            # 1 * (2*3)
print( mult(sum(due)(tre))(mult(due)(tre)) (base)(0) )  # (2 + 3) * (2 * 3)

'''
    LOGICA BOOLEANA
'''
V = lambda v: lambda f: v
F = lambda v: lambda f: f

AND = lambda p: lambda q: (p)(q)(p)
print(  AND(V)(V) == V  )
print(  AND(V)(F) == F  )
print(  AND(F)(V) == F  )
print(  AND(F)(F) == F  )

OR = lambda p: lambda q: (p)(p)(q)
print(  OR(V)(V) == V  )
print(  OR(V)(F) == V  )
print(  OR(F)(V) == V  )
print(  OR(F)(F) == F  )

NOT = lambda p: (p)(F)(V)
print(  NOT(V) == F  )
print(  NOT(F) == V  )

IMPLIES = lambda p: lambda q: OR (NOT(p)) (q)
print(  IMPLIES(V)(V) == V  )
print(  IMPLIES(V)(F) == F  )
print(  IMPLIES(F)(V) == V  )
print(  IMPLIES(F)(F) == V  )

IFF = lambda p: lambda q: AND (IMPLIES(p)(q)) (IMPLIES(q)(p))
print(  IFF(V)(V) == V  )
print(  IFF(V)(F) == F  )
print(  IFF(F)(V) == F  )
print(  IFF(F)(F) == V  )

XOR1 = lambda p: lambda q: OR (AND(p)(NOT(q))) (AND(NOT(p))(q))
print(  XOR1(V)(V) == F  )
print(  XOR1(V)(F) == V  )
print(  XOR1(F)(V) == V  )
print(  XOR1(F)(F) == F  )

XOR2 = lambda p: lambda q: NOT (IFF(p)(q))
print(  XOR2(V)(V) == F  )
print(  XOR2(V)(F) == V  )
print(  XOR2(F)(V) == V  )
print(  XOR2(F)(F) == F  )
