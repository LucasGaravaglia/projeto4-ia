:- include(input).



caminho(Inicio,Destino,Len) :-
  pode_ir(Inicio,Destino,Len,Linha),
  write("Pasou pela linha: "),write(Linha),nl,
  write("Pasou pela estação: "),write(Destino),nl.

caminho(Inicio,Destino,Len) :-
  pode_ir(Inicio,Intermediario,L,Linha),
  caminho(Intermediario,Destino,L1),
  Len is L + L1,
  write("Pasou pela linha: "),write(Linha),nl,
  write("Pasou pela estação: "),write(Intermediario),nl.
