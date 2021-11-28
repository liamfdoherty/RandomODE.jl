"""
`RandomODeProblem` - structure to solve the random ODE

V(x)u - Δu = f

on (a, b), where A = Δ and V(x) is a random potential. Mutability allows for ease of updating the potential V(x).
"""
mutable struct RandomODEProblem{TM, TV, TLBC, TRBC, TF}
    a::Real # Left endpoint
    b::Real # Right endpoint
    nₓ::Int # Total number of interior mesh points
    Δx::Real # Mesh spacing
    x::Vector # Mesh points including boundary
    m::TM # Mean of (log of) random coefficient
    σ::Real # Standard deviation of (log of) random coefficient
    s::Real # Parameter associated with covariance operator
    V::TV # Potential
    left_bc::TLBC # Left boundary condition
    right_bc::TRBC # Right boundary condition
    A::SparseMatrixCSC # Matrix for LHS (Laplacian w/ random perturbation on diagonal)
    f::TF # RHS function
    rhs::Vector # RHS vector
    u::Vector # Solution of the problem
end

"""
`DirichletBC` - structure to house a DirichletBC boundary condition, i.e., a boundary condition for which

u(a) = uₗ, u(b) = uᵣ
"""
struct DirichletBC
    boundary_condition::Real
end