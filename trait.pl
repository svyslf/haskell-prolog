/*Begin Question 4.1*/
prime(N):-
	N > 1, 
	primecheck(N, 2).

primecheck(N, S)
	:-	S >= N;
    	0 =\= N mod S,
    	S1 is S + 1,
    	primecheck(N, S1). 
/*End Question 4.1*/

/*Begin Question 4.2*/  	
indices([], _, []).
indices( [H|T], XS, [Y|ES] )
	:-	nth0(H, XS, Y),
    	indices(T, XS, ES).

extract(A,[A|B],B).  
extract(A,[C|B],[C|S]) 
	:- extract(A,B,S).

permute([],[]).
permute([R|S],T) 
:-	permute(S,U), 
    extract(R,T,U).
 
tothree(P, A, B, C) :-    
    indices([0,1,2], P, A),
    indices([3,4,5], P, B),
    indices([6,7,8], P, C).

listtoval([A, B, C], P) :- P is (A*100) + (B*10) + C. 

possible(X, Y, Z) :-
    permute([1,2,3,4,5,6,7,8,9], P),
    tothree(P, A, B, C), 
    listtoval(A, X),
    listtoval(B, Y), 
    listtoval(C, Z),
    X >= 90, X =< 180,
    Y >= 180, Y =< 270,
    Z >= 270, Z =< 360.
/*End Question 4.2*/

/*Begin Question 4.3*/
acceptable(X, Y, Z) :-
    not(prime(X)),
   	not(prime(Y)),
    not(prime(Z)).

trait( X, Y, Z )
  :- possible(X, Y, Z), acceptable(X, Y, Z). 
/*End Question 4.3*/

% Teaser solution => [159, 267, 348] 

main:-    
   trait(X, Y, Z),
   	write("X = "), write(X), 
	write("Y = "), write(Y), 
    	write("Z = "), write(Z).
   
 


