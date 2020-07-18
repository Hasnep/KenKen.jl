using Pkg
Pkg.instantiate()

using Literate
Literate.notebook(joinpath("src", "KenKen.jl"), joinpath("build", "notebook"))
Literate.markdown(joinpath("src", "KenKen.jl"), joinpath("build", "markdown"))
