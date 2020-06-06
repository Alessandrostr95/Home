etichetta(parente,1).
etichetta(amico,2).
etichetta(collega,3).


conoscenza(a,b,parente).
conoscenza(b,c,parente).
conoscenza(a,c,amico).
conoscenza(c,e,collega).


catena_conoscenza(P1,P2,[Tipo]):-
    conoscenza(P1,P2,Tipo).

catena_conoscenza(P1,P2,[Tipo|L]):-
    conoscenza(P1,P3,Tipo),
	catena_conoscenza(P3,P2,L).

valoreCatena([],0).
valoreCatena([A|L],N):-
    etichetta(A,N1),
    valoreCatena(L,N2),
    N is N1 + N2.

listaValoriCatene([],[]).
listaValoriCatene([A|R1],[(A,V)|R2]):-
    valoreCatena(A,V),
    listaValoriCatene(R1,R2).

catenaMinima([(A,_)],A).
catenaMinima([(A,Va),(_,Vb)|R],C):-
    Va =< Vb,
    catenaMinima([(A,Va)|R],C).

catenaMinima([(_,Va),(B,Vb)|R],C):-
    Va > Vb,
    catenaMinima([(B,Vb)|R],C).
    
catena_conoscenza_da_percorrere(P1,P2,CatenaMigliore):-
    setof(Catena, catena_conoscenza(P1,P2,Catena), ListaTutteCatene),
    listaValoriCatene(ListaTutteCatene,ListaValori),
    catenaMinima(ListaValori,CatenaMigliore).
