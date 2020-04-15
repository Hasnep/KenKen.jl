using Weave
weave("src/KenKen.jmd", out_path = "build/KenKen.html")
tangle("src/KenKen.jmd", out_path = "src/KenKen.jl", informat = "markdown")
