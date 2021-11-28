"""
`assemble_system!` - assemble the matrix for the left hand side of the problem
"""
function assemble_system!(problem::RandomODEProblem)
    # construct the first row of the discrete Laplacian
    problem.A[1,1] = -2
    problem.A[1,2] = 1

    # construct middle rows
    for j ∈ 2:problem.nₓ - 1
        problem.A[j, j- 1] = 1
        problem.A[j, j] = -2
        problem.A[j, j + 1] = 1
    end

    # construct last row
    problem.A[problem.nₓ, problem.nₓ - 1] = 1
    problem.A[problem.nₓ, problem.nₓ] = -2

    # adjust for random potential
    problem.A = spdiagm(problem.V) - problem.A/problem.Δx^2

    return problem
end