% Please insert the names and email addresses of the group members:
% Anwar Nacoul, anwar.nacoul.1@uni-potsdam.de
%

%subgrid_size(3).

% Hints:
% - For subgrid_size(s), subgrids can be identified by labels 0..s*s-1
% - A cell (x,y) can be mapped to the subgrid labeled (((x-1)/s)*s + (y-1)/s)

% Your implementation please...
cell(X,Y) :- X = 1..9, Y = 1..9.	%create 81 cells 
number(N) :- N = 1..9.				% numbers 1 to 9

sudoku(X,Y,N) :- initial(X,Y,N).	%take numbers from user

1 { sudoku(X,Y,N) : number(N) } 1 :- cell(X,Y), not initial(X,Y,_).		%every cell has 1 uniqe number


:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.		%every row 1 number

:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.		%every col 1 number

%every sub 1 number
subgrid(X,Y,B) :-
    cell(X,Y),
    subgrid_size(S),
    B = ((X-1)/S)*S + (Y-1)/S.

#show sudoku/3.
