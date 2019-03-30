
% The police are trying to track down the gang of three kids who have been
% stealing pumpkins. So far, they have established the following facts: the
% kids’ first names are Angela, Mary, and David; one is 5, one is 7, and one
% is 8; one has the last name Diamond, and the one with the last name Grant
% is 3 years older than the one with the last name Leung. You can assume
% Angela and Mary are female and David is male.

find(List) :-
    % A suspect List which is made of 3 child
    suspectList(3, List),
    % Angela is a female child on the list
    child('Angela',_,_,'Female') on List,
    % Mary is a female child on the list
    child('Mary',_,_,'Female') on List,
    % David is a male child on the list
    child('David',_,_,'Male') on List,
    % Grant is the person who is 3 years younger than Leung
    child(_,'Grant',A1,_) on List,
    % Diamond is the person who is 7 years old
    child(_,'Diamond',7,_) on List,
    % Leung is ther person who is 8 years old
    child(_,'Leung',A2,_) on List,

    % Calculating for the age of Grant & Leung
    A2 on [5, 7, 8],
    A1 on [5, 7, 8],
    A1 =:= (A2 + 3),

    % How we refer a relation betweeb our childern
    refferTo(child('Angela', _, _, 'Female'), child('Mary', _, _, 'Female'), List),
    refferTo(child('Angela', _, _, 'Female'), child('David', _, _, 'Male'), List).


:- op(100,xfy,on).
X on List :- member(X, List).

% SuspectList is a list of childs with: a. Name, b. Last Name, c. Age, d. Sex
suspectList(0, []).
suspectList(N, [child(_, _, _, _)|List]) :- N>0, N1 is N - 1, suspectList(N1, List).

% A sublist logic
sublist([X, Y], [X, Y | _]).
sublist(X, [_ | Y]) :- sublist(X, Y).

% If a variable is related to another
refferTo(A, B, L) :- sublist([A, B], L).
refferTo(B, A, L) :- sublist([A, B], L).
