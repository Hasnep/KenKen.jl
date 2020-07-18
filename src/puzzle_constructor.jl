

# Define an easy problem



# Define a harder puzzle

harder_puzzle = Puzzle(
    5,
    [
        Cage([(1, 1), (2, 1), (3, 1)], :+, 11),
        Cage([(1, 2), (2, 2), (3, 2)], :+, 6),
        Cage([(1, 3), (1, 4), (2, 3)], :+, 9),
        Cage([(1, 5)], :+, 2),
        Cage([(2, 4), (2, 5), (3, 5), (4, 5)], :+, 12),
        Cage([(3, 3), (3, 4), (4, 4)], :+, 11),
        Cage([(4, 1), (4, 2), (4, 3), (5, 2)], :+, 14),
        Cage([(5, 1)], :+, 1),
        Cage([(5, 3), (5, 4), (5, 5)], :+, 9),
    ],
)

# Define a hard problem

# ## kenken_size = 6
# ## kenken_cages = [
# ##     Dict(:cells => [(1, 1)], :value => 1, :operation => +),
# ##     Dict(:cells => [(2, 1), (1, 2), (2, 2)], :value => 15, :operation => +),
# ##     Dict(:cells => [(3, 1), (4, 1), (3, 2)], :value => 10, :operation => +),
# ##     Dict(:cells => [(5, 1), (4, 2), (5, 2), (4, 3)], :value => 13, :operation => +),
# ##     Dict(:cells => [(6, 1), (6, 2), (6, 3)], :value => 11, :operation => +),
# ##     Dict(:cells => [(1, 3), (2, 3), (1, 4), (1, 5)], :value => 13, :operation => +),
# ##     Dict(:cells => [(3, 3), (3, 4), (3, 5)], :value => 11, :operation => +),
# ##     Dict(:cells => [(5, 3), (5, 4), (6, 4)], :value => 7, :operation => +),
# ##     Dict(:cells => [(2, 4), (2, 5)], :value => 7, :operation => +),
# ##     Dict(:cells => [(4, 4), (4, 5), (4, 6)], :value => 11, :operation => +),
# ##     Dict(:cells => [(5, 5), (6, 5), (5, 6)], :value => 13, :operation => +),
# ##     Dict(:cells => [(1, 6), (2, 6), (3, 6)], :value => 9, :operation => +),
# ##     Dict(:cells => [(6, 6)], :value => 5, :operation => +),
# ## ]

# ## # Define a super hard problem
# ## kenken_size = 9
# ## kenken_cages = [
# ##     Dict(:cells => [(1, 1), (1, 2)], :value => 54, :operation => *),
# ##     Dict(:cells => [(2, 1), (3, 1), (4, 1), (5, 1)], :value => 10, :operation => +),
# ##     Dict(:cells => [(6, 1), (7, 1), (8, 1)], :value => 20, :operation => +),
# ##     Dict(:cells => [(9, 1), (9, 2)], :value => 5, :operation => -),
# ##     Dict(:cells => [(2, 2), (3, 2)], :value => 2, :operation => /),
# ##     Dict(:cells => [(4, 2), (5, 2)], :value => 3, :operation => -),
# ##     Dict(:cells => [(6, 2), (6, 3), (6, 4)], :value => 20, :operation => *),
# ##     Dict(:cells => [(7, 2), (8, 2)], :value => 5, :operation => -),
# ##     Dict(:cells => [(1, 3), (2, 3)], :value => 8, :operation => -),
# ##     Dict(:cells => [(3, 3), (4, 3), (5, 3)], :value => 168, :operation => *),
# ##     Dict(:cells => [(7, 3), (7, 4)], :value => 1, :operation => -),
# ##     Dict(:cells => [(8, 3), (9, 3)], :value => 2, :operation => /),
# ##     Dict(:cells => [(1, 4), (1, 5)], :value => 15, :operation => *),
# ##     Dict(:cells => [(2, 4), (3, 4)], :value => 5, :operation => -),
# ##     Dict(:cells => [(4, 4), (4, 5)], :value => 72, :operation => *),
# ##     Dict(:cells => [(5, 4), (5, 5)], :value => 8, :operation => -),
# ##     Dict(:cells => [(8, 4), (8, 5)], :value => 3, :operation => /),
# ##     Dict(:cells => [(9, 4), (9, 5)], :value => 2, :operation => -),
# ##     Dict(:cells => [(2, 5), (3, 5), (3, 6), (3, 7)], :value => 22, :operation => +),
# ##     Dict(:cells => [(6, 5), (6, 6)], :value => 4, :operation => -),
# ##     Dict(:cells => [(7, 5)], :value => 4, :operation => +),
# ##     Dict(:cells => [(1, 6), (1, 7)], :value => 3, :operation => -),
# ##     Dict(:cells => [(2, 6), (2, 7)], :value => 4, :operation => /),
# ##     Dict(:cells => [(4, 6), (4, 7)], :value => 2, :operation => /),
# ##     Dict(:cells => [(5, 6), (5, 7)], :value => 2, :operation => -),
# ##     Dict(:cells => [(7, 6), (8, 6)], :value => 3, :operation => /),
# ##     Dict(:cells => [(8, 6)], :value => 5, :operation => +),
# ##     Dict(:cells => [(6, 7), (7, 7), (7, 8)], :value => 16, :operation => +),
# ##     Dict(:cells => [(8, 7), (9, 7)], :value => 5, :operation => -),
# ##     Dict(:cells => [(1, 8), (1, 9), (2, 9)], :value => 80, :operation => *),
# ##     Dict(:cells => [(2, 8), (3, 8), (3, 9)], :value => 14, :operation => +),
# ##     Dict(:cells => [(4, 8), (5, 8), (6, 8)], :value => 10, :operation => +),
# ##     Dict(:cells => [(8, 8), (8, 9)], :value => 3, :operation => /),
# ##     Dict(:cells => [(9, 8), (9, 9)], :value => 6, :operation => -),
# ##     Dict(:cells => [(4, 9), (5, 9), (6, 9), (7, 9)], :value => 30, :operation => +),
# ## ]
