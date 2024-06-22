% Helper predicate to flatten a list of lists
flatten_list([], []).
flatten_list([H|T], FlatList) :-
    flatten_list(T, NewFlat),
    append(H, NewFlat, FlatList).

% Check if a list contains unique elements, excluding 0 (empty cell)
unique(List) :-
    exclude(==(0), List, FilteredList),
    sort(FilteredList, Sorted),
    length(FilteredList, Len),
    length(Sorted, Len).

% Check validity of rows, columns, and 3x3 blocks
valid([]).
valid([Head|Tail]) :-
    unique(Head),
    valid(Tail).

% Extract a column from the Sudoku grid
column(Grid, ColIndex, Col) :-
    findall(Cell, (nth1(RowIndex, Grid, Row), nth1(ColIndex, Row, Cell)), Col).

% Extract all columns
columns(Grid, Columns) :-
    length(Grid, Len),
    numlist(1, Len, Indices),
    maplist(column(Grid), Indices, Columns).

% Extract a 3x3 block
block(Grid, BlockRow, BlockCol, Block) :-
    BlockStartRow is (BlockRow - 1) * 3 + 1,
    BlockEndRow is BlockStartRow + 2,
    BlockStartCol is (BlockCol - 1) * 3 + 1,
    BlockEndCol is BlockStartCol + 2,
    findall(Cell, (between(BlockStartRow, BlockEndRow, Row),
                   between(BlockStartCol, BlockEndCol, Col),
                   nth1(Row, Grid, GridRow),
                   nth1(Col, GridRow, Cell)), Block).

% Extract all 3x3 blocks
blocks(Grid, Blocks) :-
    findall(Block, (between(1, 3, Row),
                   between(1, 3, Col),
                   block(Grid, Row, Col, Block)), Blocks).

% Check if the grid is valid
is_valid_grid(Grid) :-
    valid(Grid),
    columns(Grid, Columns),
    valid(Columns),
    blocks(Grid, Blocks),
    valid(Blocks).

% Fill in the grid with numbers 1 through 9
solve([]).
solve([Row|Rows]) :-
    solve_row(Row),
    solve(Rows).

% Fill in a row with numbers 1 through 9
solve_row([]).
solve_row([Cell|Cells]) :-
    (   nonvar(Cell)
    ->  solve_row(Cells)
    ;   member(Cell, [1,2,3,4,5,6,7,8,9]),
        solve_row(Cells)
    ).

% Sudoku solving predicate
sudoku(Grid) :-
    is_valid_grid(Grid),
    solve(Grid).

% Print sudoku table
printsudoku([]).
printsudoku([H|T]) :-
    write(H), nl,
    printsudoku(T).