# kenken

A [KenKen](https://en.wikipedia.org/wiki/KenKen) solver written to teach myself the [JuMP.jl](https://github.com/JuliaOpt/JuMP.jl) package.
Shamelessly copied most of the text and the code from the [Sodoku Solver Example](https://www.juliaopt.org/notebooks/JuMP-Sudoku.html) by Iain Dunning.

To build the document from source, run:

```julia
using Pkg
Pkg.instantiate()

using Literate
Literate.notebook(joinpath("src", "KenKen.jl"), joinpath("build", "notebook"))
```
