
# Define a simple problem
kenken_size = 3
kenken_cages = [
    Dict(:cells => [(1, 1), (2, 1)], :value => 5, :operation => +),
    Dict(:cells => [(1, 2), (1, 3)], :value => 3, :operation => +),
    Dict(:cells => [(2, 2)], :value => 3, :operation => +),
    Dict(:cells => [(2, 3), (3, 3)], :value => 4, :operation => +),
    Dict(:cells => [(3, 1), (3, 2)], :value => 3, :operation => +),
]

# Define a harder problem
# kenken_size = 5
# kenken_cages = [
#     Dict(:cells => [(1, 1), (2, 1), (3, 1)], :value => 11, :operation => +),
#     Dict(:cells => [(1, 2), (2, 2), (3, 2)], :value => 6, :operation => +),
#     Dict(:cells => [(1, 3), (1, 4), (2, 3)], :value => 9, :operation => +),
#     Dict(:cells => [(1, 5)], :value => 2, :operation => +),
#     Dict(:cells => [(2, 4), (2, 5), (3, 5), (4, 5)], :value => 12, :operation => +),
#     Dict(:cells => [(3, 3), (3, 4), (4, 4)], :value => 11, :operation => +),
#     Dict(:cells => [(4, 1), (4, 2), (4, 3), (5, 2)], :value => 14, :operation => +),
#     Dict(:cells => [(5, 1)], :value => 1, :operation => +),
#     Dict(:cells => [(5, 3), (5, 4), (5, 5)], :value => 9, :operation => +),
# ]

# Define a hard problem
# kenken_size = 6
# kenken_cages = [
#     Dict(:cells => [(1, 1)], :value => 1, :operation => +),
#     Dict(:cells => [(2, 1), (1, 2), (2, 2)], :value => 15, :operation => +),
#     Dict(:cells => [(3, 1), (4, 1), (3, 2)], :value => 10, :operation => +),
#     Dict(:cells => [(5, 1), (4, 2), (5, 2), (4, 3)], :value => 13, :operation => +),
#     Dict(:cells => [(6, 1), (6, 2), (6, 3)], :value => 11, :operation => +),
#     Dict(:cells => [(1, 3), (2, 3), (1, 4), (1, 5)], :value => 13, :operation => +),
#     Dict(:cells => [(3, 3), (3, 4), (3, 5)], :value => 11, :operation => +),
#     Dict(:cells => [(5, 3), (5, 4), (6, 4)], :value => 7, :operation => +),
#     Dict(:cells => [(2, 4), (2, 5)], :value => 7, :operation => +),
#     Dict(:cells => [(4, 4), (4, 5), (4, 6)], :value => 11, :operation => +),
#     Dict(:cells => [(5, 5), (6, 5), (5, 6)], :value => 13, :operation => +),
#     Dict(:cells => [(1, 6), (2, 6), (3, 6)], :value => 9, :operation => +),
#     Dict(:cells => [(6, 6)], :value => 5, :operation => +),
# ]

# # Define a super hard problem
# kenken_size = 9
# kenken_cages = [
#     Dict(:cells => [(1, 1), (1, 2)], :value => 54, :operation => *),
#     Dict(:cells => [(2, 1), (3, 1), (4, 1), (5, 1)], :value => 10, :operation => +),
#     Dict(:cells => [(6, 1), (7, 1), (8, 1)], :value => 20, :operation => +),
#     Dict(:cells => [(9, 1), (9, 2)], :value => 5, :operation => -),
#     Dict(:cells => [(2, 2), (3, 2)], :value => 2, :operation => /),
#     Dict(:cells => [(4, 2), (5, 2)], :value => 3, :operation => -),
#     Dict(:cells => [(6, 2), (6, 3), (6, 4)], :value => 20, :operation => *),
#     Dict(:cells => [(7, 2), (8, 2)], :value => 5, :operation => -),
#     Dict(:cells => [(1, 3), (2, 3)], :value => 8, :operation => -),
#     Dict(:cells => [(3, 3), (4, 3), (5, 3)], :value => 168, :operation => *),
#     Dict(:cells => [(7, 3), (7, 4)], :value => 1, :operation => -),
#     Dict(:cells => [(8, 3), (9, 3)], :value => 2, :operation => /),
#     Dict(:cells => [(1, 4), (1, 5)], :value => 15, :operation => *),
#     Dict(:cells => [(2, 4), (3, 4)], :value => 5, :operation => -),
#     Dict(:cells => [(4, 4), (4, 5)], :value => 72, :operation => *),
#     Dict(:cells => [(5, 4), (5, 5)], :value => 8, :operation => -),
#     Dict(:cells => [(8, 4), (8, 5)], :value => 3, :operation => /),
#     Dict(:cells => [(9, 4), (9, 5)], :value => 2, :operation => -),
#     Dict(:cells => [(2, 5), (3, 5), (3, 6), (3, 7)], :value => 22, :operation => +),
#     Dict(:cells => [(6, 5), (6, 6)], :value => 4, :operation => -),
#     Dict(:cells => [(7, 5)], :value => 4, :operation => +),
#     Dict(:cells => [(1, 6), (1, 7)], :value => 3, :operation => -),
#     Dict(:cells => [(2, 6), (2, 7)], :value => 4, :operation => /),
#     Dict(:cells => [(4, 6), (4, 7)], :value => 2, :operation => /),
#     Dict(:cells => [(5, 6), (5, 7)], :value => 2, :operation => -),
#     Dict(:cells => [(7, 6), (8, 6)], :value => 3, :operation => /),
#     Dict(:cells => [(8, 6)], :value => 5, :operation => +),
#     Dict(:cells => [(6, 7), (7, 7), (7, 8)], :value => 16, :operation => +),
#     Dict(:cells => [(8, 7), (9, 7)], :value => 5, :operation => -),
#     Dict(:cells => [(1, 8), (1, 9), (2, 9)], :value => 80, :operation => *),
#     Dict(:cells => [(2, 8), (3, 8), (3, 9)], :value => 14, :operation => +),
#     Dict(:cells => [(4, 8), (5, 8), (6, 8)], :value => 10, :operation => +),
#     Dict(:cells => [(8, 8), (8, 9)], :value => 3, :operation => /),
#     Dict(:cells => [(9, 8), (9, 9)], :value => 6, :operation => -),
#     Dict(:cells => [(4, 9), (5, 9), (6, 9), (7, 9)], :value => 30, :operation => +),
# ]


using JuMP
using Cbc


# Create a JuMP optimiser
kenken = Model(with_optimizer(Cbc.Optimizer, maxSolutions = 1))


@variable(kenken, x[i = 1:kenken_size, j = 1:kenken_size, k = 1:kenken_size], Bin)


for i in 1:kenken_size, j in 1:kenken_size
    @constraint(kenken, sum(x[i, j, k] for k in 1:kenken_size) == 1)
end



# for Each row, OR each column and for Each digit
for index in 1:kenken_size, k in 1:kenken_size
        # Sum across columns 
        @constraint(kenken, sum(x[index, j, k] for j in 1:kenken_size) == 1)
        # Sum across rows 
        @constraint(kenken, sum(x[i, index, k] for i in 1:kenken_size) == 1)
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

