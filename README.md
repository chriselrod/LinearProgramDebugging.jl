# LinearProgramDebugging

[![Build Status](https://github.com/chriselrod/LinearProgramDebugging.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/chriselrod/LinearProgramDebugging.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/chriselrod/LinearProgramDebugging.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/chriselrod/LinearProgramDebugging.jl)

```julia
using LinearProgramDebugging
# x->y
A = [
  -1 1 0 0 0  0  0 -1
  -1 0 1 0 0  0 -1  0
   0 0 0 0 0  1  0  0
  -1 0 0 0 0 -1  0  1
   0 0 0 0 0  0  1  0
]
E = [
   0 0 0 1 0  0 -1  0
   1 0 0 0 1  1  0 -1
]
C = [
 0  1  -1  -1  0  -1  0   0   1   0  -1  1  -1  0  0  0   0   0  -1
 0  0   1   0  0   0  0   0   0   0   0  0   0  0  0  0   0   0   0
 0  0   0   1  0   0  0   0   0   0   0  0   0  0  0  0   0   0   0
 0  0   0   0  0   0  0   1   0  -1   0  0   0  1  0  0   0   0   0
 0  0   0   0  0   0  0   0   1   0  -1  0   0  0  1  0   0   0   0
 0  0   0   0  1  -1  0   0   1   0  -1  0   0  0  0  1   0   0   0
 0  0   0  -1  0   0  1  -1   0   1   0  0   0  0  0  0  -1   0   0
 0  0  -1   0  0   1  0   0  -1   0   1  0   0  0  0  0   0  -1   0
]
fit(define_var(C, [1, 0, 0, 1, 1, 0, 1],1), 0) # Model   status      : Optimal
fit(define_var(C, [0, 0, 0, 1, 1, 0, 1],1), 0) # Model   status      : Optimal

x = [1,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,1,0];
@views C[:,1] == C[:,2:end]*x # true

C2=[ 0 1 -1 -1 0 -1 0  0  1  0 -1 -1 1  0  0  0 0 0 -1
     0 0  1  0 0  0 0  0  0  0  0  0 0  0  0  0 0 0  0
     0 0  0  1 0  0 0  0  0  0  0  0 0  0  0  0 0 0  0
     0 0  0  0 0  0 0  1  0 -1  0  0 0 -1  0  0 0 0  0
     0 0  0  0 0  0 0  0  1  0 -1  0 0  0 -1  0 0 0  0
     0 0  0  0 1 -1 0  0  1  0 -1  0 0  0  0 -1 0 0  0
     0 0  0 -1 0  0 1 -1  0  1  0  0 0  0  0  0 1 0  0
     0 0 -1  0 0  1 0  0 -1  0  1  0 0  0  0  0 0 1  0 ];

fit(define_var(C2, [0, 0, 0, 1, 1, 0, 1],1), 0)
```
