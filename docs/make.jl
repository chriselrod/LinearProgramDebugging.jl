using LinearProgramDebugging
using Documenter

DocMeta.setdocmeta!(LinearProgramDebugging, :DocTestSetup, :(using LinearProgramDebugging); recursive=true)

makedocs(;
    modules=[LinearProgramDebugging],
    authors="chriselrod <elrodc@gmail.com> and contributors",
    repo="https://github.com/chriselrod/LinearProgramDebugging.jl/blob/{commit}{path}#{line}",
    sitename="LinearProgramDebugging.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
