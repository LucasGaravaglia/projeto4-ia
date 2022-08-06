:- include(input).

/* Predicato que exibe todos os caminhos e distancias respectivas de X a Y */
exibeCaminho(X,Y,Len) :-
  caminho(X,Y,Len),
  write(X),
  write(".").
/* Predicato que exibe todos os caminhos e distancias respectivas de X a Y */
caminho(X,Y,Len) :-
  pode_ir(X,Y,Len,_),
  write(Y),
  write(", ").
/* Predicato que exibe todos os caminhos e distancias respectivas de X a Y */
caminho(X,Y,Len) :-
  pode_ir(X,Z,L,_),
  caminho(Z,Y,L1),
  write(Z), write(", "),
  Len is L + L1.



/* Predicato que chama o menor caminho de X a Y */
menorCaminho(X,Y) :-
  caminho2(X,Y),
  write(X),
  write(".").
/* Predicato que chama o menor caminho de X a Y */
caminho2(X,Y) :-
  pode_ir(X,Y,_,_),
  write(Y),
  write(", ").
/* Predicato que chama o menor caminho de X a Y cortando a recursão ao achar o menor */
caminho2(X,Y) :-
  pode_ir(X,Z,_,_),
  caminho2(Z,Y),!, 
  write(Z), write(", ").



/* Predicato que exibe todas as linhas percorridas de X a Y*/
linhas(X,Y):-
  pode_ir(X,Y,_,L),
  write(L),
  write(", ").
/* Predicato que exibe todas as linhas percorridas de X a Y*/
linhas(X,Y):-
  pode_ir(X,Z,_,L),
  linhas(Z,Y),
  write(L),
  write(", ").




