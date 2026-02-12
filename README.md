# Sudoku Verifier in Standard ML
A functional programming implementation designed to verify the correctness of a Sudoku grid.

## Overview
This project was developed as part of a Functional Programming course. It implements a verification algorithm to check if a 9x9 Sudoku grid has been correctly filled according to the standard rules: unique numbers from 1 to 9 in each column, row, and 3x3 sub-grid.

## Technical Implementation
**Paradigm**: Functional Programming.

**Programming Language**: Standard ML.

**Key Concepts**: Recursion, Pattern Matching, and List Manipulation.

**Logic**: The algorithm breaks down the matrix into rows, then rotates it to check columns, and finally uses a helper function (fasce) to restructure the 3x3 blocks into lists for validation. Recursion is handled by using Pattern Matching to traverse the nested list structures.
