(* Checks if a number 'a' is unique within a list.
   Ignores '0' as it represents an empty cell.
*)
fun controllo1(_,nil) = true 
    | controllo1 (a,x::xs) = if a = 0 then true else if a = x then false else controllo1(a,xs);

(* Validates a list (row/column/block) by ensuring no duplicates exist.
   Uses recursion to check each element against the rest of the list.
*)
fun controllo nil = true 
    | controllo(x::xs) = if controllo1(x,xs) = true then controllo(xs) else false;

(* Validates all rows in the matrix *)
fun righe nil = true 
    | righe (x::xs) = controllo(x) andalso righe(xs);

(* Helper functions for Matrix Transposition:
   'testa' extracts the first column, 'coda' removes it.
*)
fun coda nil = nil 
    | coda (nil::_) = nil 
    | coda ((y::ys)::xs) = ys::coda(xs); 

fun testa nil = nil 
    | testa (nil::_) = nil 
    | testa ((y::ys)::xs) = y::testa(xs);

(* Validates all columns by transforming them into rows (transposition)
   and applying the 'controllo' function.
*)
fun colonne nil = true 
    | colonne (nil::_) = true 
    | colonne L = controllo(testa L) andalso colonne(coda L);

(* Restructures the grid to extract 3x3 sub-grids.
   Processes three rows simultaneously to group elements into blocks.
*)
fun blocchi1 (nil,_,_) = nil
    | blocchi1 (x,y,z) = let val a1::a2::a3::ax = x;
    val b1::b2::b3::bx = y;
    val c1::c2::c3::cx = z in [a1,a2,a3,b1,b2,b3,c1,c2,c3]::blocchi1(ax,bx,cx) end;

(* Groups rows into horizontal bands of three to facilitate block extraction *)
fun fasce (a::b::c::xs) = blocchi1(a,b,c) @ fasce(xs)
  | fasce _ = nil;

(* Validates the list of 3x3 blocks *)
fun blocchi nil = true
    | blocchi (x::xs) = controllo(x) andalso blocchi(xs);

(* Main Entry Point: 
   Verifies the Sudoku grid by checking rows, columns, and 3x3 blocks.
*)
fun verifySudoku L = righe(L) andalso colonne(L) andalso blocchi(fasce L);
