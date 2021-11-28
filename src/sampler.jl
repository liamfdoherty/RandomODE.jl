"""
`sample_field` - sample the random potential V(x); this potential is log-normally distributed with mean m(x) and covariance

σ^2(-d^2/dx^2)^(-s/2),

where m, σ, and s are user-specified parameters.
"""
function sample_field(problem::RandomODEProblem)
    N = problem.nₓ + 1; σ = problem.σ; s = problem.s; m = problem.m

    ξ = randn(N)
    û = zeros(ComplexF64, 2*N)

    k = 1:N
    λ = @. σ^2/(π*k)^s

    @. û[2:N + 1] = 2 * N * √(λ) * √(2) * ξ

    u = exp.(m + imag.(ifft(û))[N + 2:end])
    return u
end