struct Cage
    cells::Vector{Tuple{Integer, Integer}}
    operation::Function
    target::Number
end

struct Puzzle
    size::Integer
    cages::Vector{Cage}
end

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

puzzle = Puzzle(
    5,
    [
        Cage([(1, 1), (2, 1), (3, 1)], +, 11),
        Cage([(1, 2), (2, 2), (3, 2)], +, 6),
        Cage([(1, 3), (1, 4), (2, 3)], +, 9),
        Cage([(1, 5)], +, 2),
        Cage([(2, 4), (2, 5), (3, 5), (4, 5)], +, 12),
        Cage([(3, 3), (3, 4), (4, 4)], +, 11),
        Cage([(4, 1), (4, 2), (4, 3), (5, 2)], +, 14),
        Cage([(5, 1)], +, 1),
        Cage([(5, 3), (5, 4), (5, 5)], +, 9),
    ],
)

function print_array(X)
    for r in eachrow(X)
        println(join(r))
    end
end

function print_kenken(p::Puzzle)
    cell_ids = fill(Char(0), (p.size, p.size))
    for (cage_index, cage) in enumerate(p.cages)
        for (i, j) in cage.cells
            cell_ids[i, j] = Char(96 + cage_index)
        end
    end

    table = fill(' ', (p.size * 2 + 3, p.size * 2 + 3))

    for i in 1:(p.size), j in 1:(p.size)
        I = i * 2 + 1
        J = j * 2 + 1
        table[I, J] = cell_ids[i, j]
    end

    for i in 0:(p.size), j in 0:(p.size)
        I = i * 2 + 1
        J = j * 2 + 1

        if table[I + 2, J] == table[I, J]
            table[I + 1, J] = ' '
        else
            table[I + 1, J] = '─'
        end

        if table[I, J + 2] == table[I, J]
            table[I, J + 1] = ' '
        else
            table[I, J + 1] = '│'
        end
    end

    for i in 0:(p.size), j in 0:(p.size)
        I = 2 * i + 2
        J = 2 * j + 2

        up = table[I - 1, J] != ' '
        down = table[I + 1, J] != ' '
        left = table[I, J - 1] != ' '
        right = table[I, J + 1] != ' '

        if all((up, down, left, right) .== (0, 0, 0, 0))
            table[I, J] = ' '
        elseif all((up, down, left, right) .== (0, 0, 1, 1))
            table[I, J] = '─'
        elseif all((up, down, left, right) .== (0, 1, 0, 1))
            table[I, J] = '┌'
        elseif all((up, down, left, right) .== (0, 1, 1, 0))
            table[I, J] = '┐'
        elseif all((up, down, left, right) .== (0, 1, 1, 1))
            table[I, J] = '┬'
        elseif all((up, down, left, right) .== (1, 0, 0, 1))
            table[I, J] = '└'
        elseif all((up, down, left, right) .== (1, 0, 1, 0))
            table[I, J] = '┘'
        elseif all((up, down, left, right) .== (1, 0, 1, 1))
            table[I, J] = '┴'
        elseif all((up, down, left, right) .== (1, 1, 0, 0))
            table[I, J] = '│'
        elseif all((up, down, left, right) .== (1, 1, 0, 1))
            table[I, J] = '├'
        elseif all((up, down, left, right) .== (1, 1, 1, 0))
            table[I, J] = '┤'
        else
            table[I, J] = '┼'
        end
    end

    print_array(table)
end



print_kenken(puzzle)
