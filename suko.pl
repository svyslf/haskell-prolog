/*Begin Question 3.1*/
indices([], _, []).
indices( [H|T], XS, [Y|ES] )
	:-	nth0(H, XS, Y),
    	indices(T, XS, ES).
/*End Question 3.1*/

/*Begin Question 3.2*/
extract(A,[A|B],B).  
extract(A,[C|B],[C|S]) 
	:- extract(A,B,S).

permute([],[]).
permute([R|S],T) 
:-	permute(S,U), 
    extract(R,T,U).  

possible(GRID)
:- permute([1,2,3,4,5,6,7,8,9], GRID).
/*End Question 3.2*/

/*Begin Question 3.3*/
listsum([], 0).
listsum([H|T], S) 
	:-	listsum(T, R),
    		S is H + R.

checksum(XS, Y):- listsum(XS, S), (S = Y -> true; false).

combine(L,GRID,COMPARETO) 
:- indices(L,GRID, RESULT),
   checksum(RESULT, COMPARETO).

acceptable(T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
  :-	possible(GRID),
    	combine(US,GRID,U),
    	combine(VS,GRID,V),
    	combine(WS,GRID,W),
		combine([0,1,3,4],GRID,T0),
    	combine([1,2,4,5],GRID,T1),
    	combine([3,4,6,7],GRID,T2),
    	combine([4,5,7,8],GRID,T3).
    	

suko(T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
	:- acceptable(T0, T1, T2, T3, US, U, VS, V, WS, W, GRID).

/*End Question 3.3*/

main :-
    suko( 15, 14, 26, 23
       , [0,1,2,3], 16
       , [4,6,7], 17
       , [5,8], 12
       , GRID ),
   /*Alternative test case: 
	suko(17, 21, 12, 16, [3,6,7,8], 16,
         	[0,2,5], 21,       
            	[1,4], 8, GRID),*/
	write(GRID).







