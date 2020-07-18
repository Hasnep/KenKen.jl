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

possible_solution = [2 1 3; 3 2 1; 1 3 2]

x = zeros(Bool, repeat([puzzle.size], 3)...)

for i in 1:(puzzle.size), j in 1:(puzzle.size), k in 1:(puzzle.size)
    if possible_solution[i, j] == k
        x[i, j, k] = true
    end
end

x

for cage in puzzle.cages
    list_of_digits = [k for (i, j) in cage.cells for k in 1:(puzzle.size) if x[i, j, k]]
    @info list_of_digits
    @info reduce(+, list_of_digits)
    @info cage.target
    @info reduce(+, list_of_digits) == cage.target
end
