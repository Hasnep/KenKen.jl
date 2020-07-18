using JuMP
using Cbc
# using GLPK

sudoku = Model(optimizer_with_attributes(Cbc.Optimizer, "maxSolutions" => 1))
# sudoku = Model(GLPK.Optimizer)

@variable(sudoku, 1 <= x[1:9, 1:9] <= 9 , Int)

@constraint(
    sudoku,
    each_digit_once_per_row[row in 1:9, digit in 1:9],
    sum(x[row, :] .== digit) >= 1
)

# @constraint(
#     sudoku,
#     each_digit_once_per_row[row in 1:9, digit in 1:9],
#     sum([x[row, column] == digit for column in 1:9]) == 1
# )

optimize!(sudoku)

term_status = termination_status(sudoku)
is_optimal = term_status == MOI.OPTIMAL
if is_optimal
    @info "Solved!"
else
    @error "Not solved! :("
end
