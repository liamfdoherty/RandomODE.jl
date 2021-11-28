using RandomODE
using Test
using LinearAlgebra

@testset "Deterministic" begin
    @test include("deterministictest.jl")
end
