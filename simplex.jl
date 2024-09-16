using JuMP
using Gurobi

# model
model = Model(Gurobi.Optimizer)

# variables
@variable(model, x>=0)
@variable(model, y>=0)
@variable(model, z>=0)

# objective function
@objective(model, Max, x+2*y+3*z)

# contraints
@constraint(model, 35*x+40*y+65*z <=600)
@constraint(model, x-z >=0)
@constraint(model, x-y >=0)
@constraint(model, x<=4) # branching
# add other branch contraints 

# optimize
optimize!(model)
println("optimal value of x: ", value(x))
println("optimal value of y: ", value(y))
println("optimal value of z: ", value(z))
println("objective value: ", objective_value(model))