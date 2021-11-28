"""
`solve!` - solve a single instance of a RandomODEProblem
"""
function solve!(problem::RandomODEProblem)
    problem.u = problem.A\problem.rhs
    return problem
end

"""
`solve_ensemble!` - solve an ensemble of RandomODEProblems
"""
function solve_ensemble!(problems::Vector)
    num_problems = length(problems)

    Threads.@threads for i ∈ 1:num_problems
        potential = sample_field(problems[i])
        problems[i].V = potential
        assemble_system!(problems[i])
        solve!(problems[i])
    end

    return problems
end