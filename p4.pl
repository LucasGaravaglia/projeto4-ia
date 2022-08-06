:- include(input).

exibeCaminho(X,Y,Len) :-
  caminho(X,Y,Len),
  write(X),
  write(".").

caminho(X,Y,Len) :-
  pode_ir(X,Y,Len,_),
  write(Y),
  write(", ").

caminho(X,Y,Len) :-
  pode_ir(X,Z,L,_),
  caminho(Z,Y,L1),
  write(Z), write(", "),
  Len is L + L1.
