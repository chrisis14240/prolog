% Base Cases
merge_sort([],[]).
merge_sort([X],[X]).

% Recursion
merge_sort(List,Sorted):-
    List=[_,_|_],divide(List,L1,L2),
	merge_sort(L1,Sorted1),merge_sort(L2,Sorted2),
	merge(Sorted1,Sorted2,Sorted).

% merge, takes two list and merge them into one
merge([],L,L).
merge(L,[],L).
merge([X|T1],[Y|T2],[X|T]):-X=<Y,merge(T1,[Y|T2],T).
merge([X|T1],[Y|T2],[Y|T]):-X>Y,merge([X|T1],T2,T).

% divide, takes a list and divide into two separate list of equal size
divide(L,L1,L2):-length(L, Len), Half is Len//2, splitlist(L, L1, L2, Len//2).

splitlist(L, [], L, 0).
splitlist([H|T], [H|A], B, N) :- Nminus1 is N-1, splitlist(T, A, B, Nminus1).
