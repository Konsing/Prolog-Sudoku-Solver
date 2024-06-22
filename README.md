# Prolog Sudoku Solver

A Prolog program for solving Sudoku puzzles.

## Overview

This project provides a Prolog implementation of a Sudoku solver. It includes predicates to validate and solve a Sudoku grid.

## Predicates

1. **Valid Row**
   - `valid([])`
   - `valid([Head|Tail])`

2. **Extract Columns**
   - `columns(Grid, Columns)`

3. **Extract Block**
   - `block(Grid, BlockRow, BlockCol, Block)`

4. **Extract All Blocks**
   - `blocks(Grid, Blocks)`

5. **Check Valid Grid**
   - `is_valid_grid(Grid)`

6. **Solve Grid**
   - `solve([])`
   - `solve([Row|Rows])`

7. **Solve Row**
   - `solve_row([])`
   - `solve_row([Cell|Cells])`

8. **Sudoku Solving Predicate**
   - `sudoku(Grid)`

9. **Print Sudoku Table**
   - `printsudoku([])`
   - `printsudoku([H|T])`

## How to Use

Load the program into a Prolog interpreter and use the `sudoku/1` predicate to solve a Sudoku puzzle.

```prolog
?- [sudoku].
?- sudoku([[5,3,_,_,7,_,_,_,_],
           [6,_,_,1,9,5,_,_,_],
           [_,9,8,_,_,_,_,6,_],
           [8,_,_,_,6,_,_,_,3],
           [4,_,_,8,_,3,_,_,1],
           [7,_,_,_,2,_,_,_,6],
           [_,6,_,_,_,_,2,8,_],
           [_,_,_,4,1,9,_,_,5],
           [_,_,_,_,8,_,_,7,9]]).
