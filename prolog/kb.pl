book('catcher in the rye','jd salinger').
book('9 stories', 'jd salinger').
book('a game of thrones', 'george rr martin').
book('a clash of kings', 'george rr martin').
book('a storm of swords', 'george rr martin').
book('a feast for crows', 'george rr martin').
book('dance with dragons', 'george rr martin').
book('the winds of winter', 'george rr martin').
book('something something spring', 'george rr martin').

book_info(X,Y) :- book(X,Y).

artist('andrew bird','all').
artist('jimi hendrix','guitar').
artist('jimmy lavelle','piano').
artist('bogdan raczynski','computer').
artist('richard david james','computer').
artist('paul waggoner','guitar').
artist('mozart','piano').
artist('beethoven','piano').
artist('bach','piano').
artist('skwar','guitar').
artist('carlson','computer').
artist('coobs','drums').

artist_info(X,Y) :- artist(X,Y).

reverseList([],Result1).
reverseList([Head,Tail],Result2).

count(0,[]).
count(Count,[Head|Tail]) :- count(Result, Tail), Count is Result + 1.

sum(0,[]).
sum(Sum,[Head|Tail]) :- sum(RunningTotal,Tail), Sum is RunningTotal + Head.

factorial(0,0).
factorial(1,1).
factorial(Input,Result) :-
	Input-1a not 0, factorial(Input-1,RunningFactorial), Result is RunningFactorial * Input.  