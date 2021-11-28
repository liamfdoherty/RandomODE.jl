a = 0; b = 1
nₓ = 100
m(x) = x
σ = 1
s = 2
V(x) = 0.
left_bc = DirichletBC(0); right_bc = DirichletBC(0)
f(x) = 1.

problem = RandomODEProblem(a, b, nₓ, m, σ, s, left_bc, right_bc, f, potential = V);
assemble_system!(problem)
solve!(problem)

true_solution(x) = -x/2*(x - 1)

error = abs.(true_solution.(problem.x) - problem.u)
norm(error, Inf) < 1e-14
