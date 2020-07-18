# # KenKen

# ## Introduction

# [KenKen](https://en.wikipedia.org/wiki/KenKen) is a number puzzle similar to the Sodoku where the goal is to place the digits 1 to ``N`` on an ``N \times N`` grid, with some of the digits already filled in.

# Our solution must satisfy the following rules:
#   * The digits 1 to ``N`` must appear once each in each row.
#   * The digits 1 to ``N`` must appear once each in each column.
#   * The digits in each shape outlined by thicker lines (called a cage) must equal the number in the corner of the cage when combined using the cage's operation.

# We'll define some structs to hold information about the puzzle and the cages.

struct Cage
    cells::Vector{Tuple{Integer, Integer}}
    operation::Function
    target::Number
end

struct Puzzle
    size::Integer
    cages::Vector{Cage}
end

# Define an easy ``3 \times 3`` puzzle using only the ``+`` operator.

puzzle = Puzzle(
    3,
    [
        Cage([(1, 1), (2, 1)], +, 5),
        Cage([(1, 2), (1, 3)], +, 3),
        Cage([(2, 2)], +, 3),
        Cage([(2, 3), (3, 3)], +, 4),
        Cage([(3, 1), (3, 2)], +, 3),
    ],
)

# ## Solver

# We will use the integer solver from [Cbc.jl](https://github.com/JuliaOpt/Cbc.jl) for this example.

using JuMP
using Cbc

# This isn't an optimization problem, it's actually a feasibility problem.
# We want to find any solution that satsifies the rules of the puzzle, so we set `maxSolutions` to 1 so that the solver stops as soon as it finds a solution.

## Create a JuMP optimiser
kenken = Model(with_optimizer(Cbc.Optimizer, maxSolutions = 1))

# We will define a binary variable for each possible number in each possible cell, i.e., the variable ``x_{i, j, k}`` will be 1 if the cell at position ``(i, j)`` contains the digit ``k`` and 0 otherwise.

@variable(kenken, x[i = 1:(puzzle.size), j = 1:(puzzle.size), k = 1:(puzzle.size)], Bin)

# Now we can add out first constraint: that each cell must contain exactly one digit.
# For each cell at position ``(i, j)``, the sum across all possible digits must be 1.

for i in 1:(puzzle.size), j in 1:(puzzle.size)
    @constraint(kenken, sum(x[i, j, digit] for digit in 1:(puzzle.size)) == 1)
end

# Next we'll add the constraints that each row and column must contain each digit once.
# We loop over all the columns using the variable `index` and over all possible digits using `digit`.
# In each value of `index`, we constrain that column to only contains the digit `digit` once.
# The constraints for the rows are very similar, so we can add them at the same time.

for index in 1:(puzzle.size), digit in 1:(puzzle.size)
    ## The sum over each column must be 1 
    @constraint(kenken, sum(x[index, j, digit] for j in 1:(puzzle.size)) == 1)
    ## The sum over each row must be 1 
    @constraint(kenken, sum(x[i, index, digit] for i in 1:(puzzle.size)) == 1)
end

# Finally, we have to make sure that the digits in each cage combine to that cage's target number.
# For each cage we'll use the `reduce` function to combine the digits in the cage's cells.

# TODO: explain this more

# We constrain this to be equal to the cage's target value.

for cage in puzzle.cages
    @constraint(
        kenken,
        reduce(
            cage.operation,
            [sum(x[i, j, k] * k for k in 1:(puzzle.size)) for (i, j) in cage.cells],
        ) == cage.target
    )
end

# Now we have all of the constraints in place we can solve the problem!

optimize!(kenken)

# Extract the values of ``x``.
# Integer programs are solved as a series of linear programs so the values might not be precisely 0 and 1.
# We can just round them to the nearest integer to fix this.

x_solution = round.(Int, value.(x))

# To display the solution as a matrix we need to look for the values of `x[i, j, k]` that are equal to 1.

matrix_solution = zeros(Int, puzzle.size, puzzle.size)
for i in 1:(puzzle.size), j in 1:(puzzle.size), k in 1:(puzzle.size)
    if x_solution[i, j, k] == 1
        matrix_solution[i, j] = k
    end
end

matrix_solution
