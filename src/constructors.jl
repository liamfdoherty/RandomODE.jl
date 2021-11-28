"""
`RandomODEProblem` - initialize the problem data structure

Defaults to the zero potential; in this case the ODE becomes

-Δu = f

on (a, b) with the specified boundary conditions.
"""
function RandomODEProblem(a, b, nₓ, m, σ, s, left_bc, right_bc, f; potential = x -> 0.)
    Δx = (b - a)/(nₓ + 1)
    x = [a + i*Δx for i ∈ 1:nₓ]
    mean = m.(x)
    V = potential.(x)
    A = spzeros(nₓ, nₓ)
    rhs = f.(x)
    u = zeros(nₓ)
    return RandomODEProblem(a, b, nₓ, Δx, x, mean, σ, s, V, left_bc, right_bc, A, f, rhs, u)
end