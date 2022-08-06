/* lê-se X é progenitor de Y, onde progenitor(X, Y). */
progenitor(luiz, caio).
progenitor(simone, caio).
progenitor(luiz, paulo).
progenitor(solange, paulo).
progenitor(luiz, pedro).
progenitor(solange, pedro).
progenitor(pedro, joao).
progenitor(bianca, joao).

/* lê-se X é homem|mulher, onde genero(X, homem|mulher). */
genero(luiz, homem).
genero(caio, homem).
genero(paulo, homem).
genero(pedro, homem).
genero(joao, homem).
genero(simone, mulher).
genero(solange, mulher).
genero(bianca, mulher).

/* X é pai de Y */
pai(X, Y) :-
    progenitor(X, Y),
    genero(X, homem).

/* X é mãe de Y */
mae(X, Y) :-
    progenitor(X, Y),
    genero(X, mulher).

/* X é irmão de Y */
irmao(X, Y) :-
    progenitor(Z, X),
    progenitor(Z, Y),
    X \== Y.

/* X é irmão por parte de pai de Y */
irmao_por_pai(X, Y) :-
    pai(Z, X), pai(Z, Y), X \== Y.

/* X é irmão por parte de mãe de Y */
irmao_por_mae(X, Y) :-
    mae(Z, X), mae(Z, Y), X \== Y.

/* X é apenas meio irmão de Y, por parte de pai ou mãe */
meio_irmao(X, Y) :-
    irmao_por_pai(X, Y), not(irmao_por_mae(X, Y));
    not(irmao_por_pai(X, Y)), irmao_por_mae(X, Y).

/* X é filho de Y */
filho(X, Y) :-
    pai(Y, X);
    mae(Y, X).

/* X é tio de Y*/
tio(X, Y) :-
    irmao(X, Z),
    pai(Z, Y).

/* X é sobrinho de Y */
sobrinho(X, Y) :-
    tio(Y, X).

/* X é avo de Y */
avo(X, Y) :-
    pai(Z, Y), pai(X, Z);
    mae(Z, Y), pai(X, Z).

/* X é avó de Y */
avoh(X, Y) :-
    pai(Z, Y), mae(X, Z);
    mae(Z, Y), mae(X, Z).

/* X é ancestral de Y */
ancestral(X, Y) :-
    pai(X, Y);
    mae(X, Y).

ancestral(X, Y) :-
    pai(X, Z),
    ancestral(Z, Y).