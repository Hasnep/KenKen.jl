module KenKen
using JuMP
using Cbc

# Create an optimiser
kenken = Model(with_optimizer(Cbc.Optimizer, maxSolutions = 1))

# Create the variables
@variable(kenken, x[i = 1:kenken_size, j = 1:kenken_size, k = 1:kenken_size], Bin)

# Constrain that each cell can only contain one digit
for i in 1:kenken_size, j in 1:kenken_size
    @constraint(kenken, sum(x[i, j, k] for k in 1:kenken_size) == 1)
end

# for Each row, OR each column
for index in 1:kenken_size
    # For Each digit
    for k in 1:kenken_size
        # Sum across columns 
        @constraint(kenken, sum(x[index, j, k] for j in 1:kenken_size) == 1)
        # Sum across rows 
        @constraint(kenken, sum(x[i, index, k] for i in 1:kenken_size) == 1)
    end
end

# Constrain the cages
for cage in kenken_cages
    @constraint(
        kenken,
        reduce(
            cage[:operation],
            k * x[i, j, k] for (i, j) in cage[:cells], k in 1:kenken_size
        ) == cage[:value]
    )
end

@info "Solving"
optimize!(kenken)
@info "Solved"

# Extract the values of x
# Integer programs are solved as a series of linear programs
# so the values might not be precisely 0 and 1. We can just
# round them to the nearest integer to make it easier
x_solution = round.(Integer, value.(x))

# Create a matrix to store the solution
matrix_solution = zeros(Int, kenken_size, kenken_size)  # 9x9 matrix of integers
for i in 1:kenken_size, j in 1:kenken_size, k in 1:kenken_size
    if x_solution[i, j, k] == 1
        matrix_solution[i, j] = k
    end
end

# Display the solution
matrix_solution
end
