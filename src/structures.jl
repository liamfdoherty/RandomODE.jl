struct RandomODE{TF, TM} where {TF <: Function, TM <: Function}
    a::Real # Left endpoint
    b::Real # Right endpoint
    nₓ::Int # Total number of interior mesh points
    Δx::Real # Mesh spacing
    x::Vector # Mesh points including boundary
    m::TM # Mean of (log of) random coefficient
    σ::Real # Standard deviation of (log of) random coefficient
    s::Real # Parameter associated with covariance operator
    V::Function # Potential
    left_bc::TLBC # Left boundary condition
    right_bc::TRBC # Right boundary condition
    A::Matrix # Matrix for discrete Laplacian
    f::TF # RHS function
    rhs::Vector # RHS vector
    u::Vector # Solution of the problem
end

struct DirichletBC
    boundary_condition::Real
end