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
    
end