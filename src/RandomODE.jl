module RandomODE
    using Distributions    
    using LinearAlgebra
    using Random
    using SparseArrays
    using FFTW

    include("structures.jl")
    export RandomODEProblem, DirichletBC

    include("constructors.jl")
    export RandomODEProblem

    include("sampler.jl")
    export sample_field

    include("assembly.jl")
    export assemble_system!
    
    include("solve.jl")
    export solve!, solve_ensemble!
end