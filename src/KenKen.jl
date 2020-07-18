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

using JuMP

# We'll use the `COIN Branch-and-Cut` solver from [Cbc.jl](https://github.com/JuliaOpt/Cbc.jl) for this example.

using Cbc

# This isn't an optimisation problem, it's actually a feasibility problem.
# We want to find any solution that satsifies the rules of the puzzle, so we set `Cbc`'s argument `maxSolutions` to 1 so that the solver stops as soon as it finds a solution.

kenken = Model(optimizer_with_attributes(Cbc.Optimizer, "maxSolutions" => 1))

# We'll define a TODO

x = @variable(
    kenken,
    [i = 1:(puzzle.size), j = 1:(puzzle.size)] ,
    Int,
    lower_bound = 1,
    upper_bound = puzzle.size,
    start = 1
)


# Next we'll add the constraints that each row and column must contain each digit once.
# We loop over all the columns using the variable `index` and over all possible digits using `digit`.
# In each value of `index`, we constrain that column to only contains the digit `digit` once.
# The constraints for the rows are very similar, so we can add them at the same time.


each_digit_once_per_row = @constraint(
    kenken,
    [row = 1:(puzzle.size), digit = 1:(puzzle.size)],
    sum([x[row, j] == digit for j in 1:3]) == 1
)




# for index in 1:puzzle.size, digit in 1:puzzle.size
## The sum over each column must be 1 
# @constraint(kenken, reduce(+,[x[index, k] == digit for k in 1:puzzle.size]) == 1)
#     ## The sum over each row must be 1 
#     @constraint(kenken, sum(x[:, index] .== digit) == 1)
# end

# Finally, we have to make sure that the digits in each cage combine to that cage's target number.
# For each cage we'll use the `reduce` function to combine the digits in the cage's cells.

# TODO: explain this more

# We constrain this to be equal to the cage's target value.

# for cage in puzzle.cages
#     @constraint(   kenken,        reduce(cage.operation,     [x[i, j] for (i, j) in cage.cells ]) == cage.target    )
# end

# Now we have all of the constraints in place we can solve the problem!

kenken

optimize!(kenken)


# Check why the solver stopped.

@info termination_status(kenken)

# Extract the values of ``x``.
# Integer programs are solved as a series of linear programs so the values might not be precisely 0 and 1.
# We can just round them to the nearest integer to fix this.

x_solution = round.(Int, value.(x))
