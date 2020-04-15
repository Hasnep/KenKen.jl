# KenKen.jl

A [KenKen](https://en.wikipedia.org/wiki/KenKen) solver written to teach myself the [JuMP.jl](https://github.com/JuliaOpt/JuMP.jl) package.
Shamelessly copied from the [Sodoku Solver Example](https://www.juliaopt.org/notebooks/JuMP-Sudoku.html) by Iain Dunning.

A simple explanation is available at `TODO`, the source for which is at `src/KenKen.jmd`.
To build the document from source, run
```
julia --project -e "using Weave; weave(\"src/KenKen.jmd\", out_path=\"build/KenKen.html\")"
```

```
julia --project -e "using Weave; tangle(\"src/KenKen.jmd\", out_path=\"src/KenKen.jl\", informat=\"noweb\")"
```