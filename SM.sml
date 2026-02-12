fun controllo1(_,nil) = true 
    | controllo1 (a,x::xs) = if a = 0 then true else if a = x then false else controllo1(a,xs);
fun controllo nil = true 
    | controllo(x::xs) = if controllo1(x,xs) = true then controllo(xs) else false;

fun righe nil = true 
    | righe (x::xs) = controllo(x) andalso righe(xs);

fun coda nil = nil 
    | coda (nil::_) = nil 
    | coda ((y::ys)::xs) = ys::coda(xs); 
fun testa nil = nil 
    | testa (nil::_) = nil 
    | testa ((y::ys)::xs) = y::testa(xs);
fun colonne nil = true 
    | colonne (nil::_) = true 
    | colonne L = controllo(testa L) andalso colonne(coda L);

fun blocchi1 (nil,_,_) = nil
    | blocchi1 (x,y,z) = let val a1::a2::a3::ax = x;
    val b1::b2::b3::bx = y;
    val c1::c2::c3::cx = z in [a1,a2,a3,b1,b2,b3,c1,c2,c3]::blocchi1(ax,bx,cx) end;

fun fasce (a::b::c::xs) = blocchi1(a,b,c) @ fasce(xs)
  | fasce _ = nil;

fun blocchi nil = true
    | blocchi (x::xs) = controllo(x) andalso blocchi(xs);

fun verifySudoku L = righe(L) andalso colonne(L) andalso blocchi(fasce L);
