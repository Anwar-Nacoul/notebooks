% Please insert the names and email addresses of the group members:
% Muhammad Owais Mahmood, owais.mahmood@uni-potsdam.de
% Anwar Nacoul, anwar.nacoul.1@uni-potsdam.de
%

subgrid_size(3).

cell(X,Y) :- X = 1..9, Y = 1..9.	%create 81 cells 
number(N) :- N = 1..9.				% numbers 1 to 9

sudoku(X,Y,N) :- initial(X,Y,N).	%take numbers from user

1 { sudoku(X,Y,N) : number(N) } 1 :- cell(X,Y), not initial(X,Y,_).		%every cell has 1 uniqe number


:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.		%every row 1 number

:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.		%every col 1 number

%sub
subgrid(X,Y,B) :-
    cell(X,Y),
    subgrid_size(S),
    B = ((X-1)/S)*S + (Y-1)/S.

%every sub 1 number
subgrid_size(3).

:- sudoku(X1,Y1,N), sudoku(X2,Y2,N),
   subgrid(X1,Y1,B), subgrid(X2,Y2,B),
   X1 != X2.
   
#show sudoku/3.
