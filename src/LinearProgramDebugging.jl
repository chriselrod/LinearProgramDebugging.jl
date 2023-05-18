module LinearProgramDebugging

using JuMP, HiGHS, LinearAlgebra

export fit, define_var, checksat
# reexports
export value

function fit(C, L)
  # C[:,1] = C[:,2:end] * x
  model = Model(HiGHS.Optimizer)
  M, N = size(C)
  @variable(model, x[1:N-1] >= 0)
  @constraint(model, C[:, 1] .== C[:, 2:end] * x)
  @objective(model, Min, sum(x[L+1:end]))
  optimize!(model)
  return model
end
function checksat(c, C)
  # c = C * x
  model = Model(HiGHS.Optimizer)
  N = size(C, 2)
  @variable(model, x[1:N] >= 0)
  @constraint(model, c .== C * x)
  @objective(model, Min, sum(x))
  optimize!(model)
  return model
end

function define_var(C, x, trunc = 0)
  N = length(x)
  D = size(C, 2) - trunc
  C2 = C[:, 1:D-N]
  @views mul!(C2[:, 1], C[:, D+1-N:D], x, -1, 1)
  C2
end

end
