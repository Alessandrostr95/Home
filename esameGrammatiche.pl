%tipo messaggio
messaggio(N) --> eventiFuturi(N),". ", { 1 is (N mod 4) + 1}.
messaggio(N) --> situazioneAmore(N),". ", { 2 is (N mod 4) + 1}.
messaggio(N) --> situazioneAttualeLavoro(N),". ", situazioneSalute(N), { 3 is (N mod 4) + 1}.
messaggio(N) --> fraseGenericaEventoPositivo,". ", situazioneSalute(N), { 4 is (N mod 4) + 1}.


%tipi sottomessaggi
eventiFuturi(N) --> eventoFuturoAmore(N),", ",eventoFuturoLavoro,", ",eventoFuturoSalute," e ",eventoFuturoVincite, { 1 is (N mod 3) + 1}.
situazioneAmore(N) --> situazioneAttualeAmore," e ", eventoFuturoAmore(N), { 2 is (N mod 3) + 1}.
situazioneSalute(N) --> situazioneAttualeSalute(N)," e ", eventoFuturoSalute, { 3 is (N mod 3) + 1}.

%tipi frasi
situazioneAttualeAmore --> "Sei innamorato".
situazioneAttualeLavoro(N) --> "Il lavoro va bene", { 0 is (N mod 2)}; "Il lavoro va male", { 1 is (N mod 2)}.
situazioneAttualeSalute(N) --> "Sano come un pesce", { 0 is (N mod 2)}; "Un po' fiacco", { 1 is (N mod 2)}.
situazioneAttualeVincite --> "Sei fortunato".
eventoFuturoAmore(N) --> "Troverai il tuo amore", { 0 is (N mod 2)}; "Verrai lasciato", { 1 is (N mod 2)}.
eventoFuturoLavoro --> "Avrai un aumento".
eventoFuturoSalute --> "Ti sveglierai col torcicollo".
eventoFuturoVincite --> "Vincerai al lotto se giochi 8 e 33".
fraseGenericaFelicità --> "Sarai soddisfatto del codice che hai scritto".
fraseGenericaEventoPositivo --> "Passerai LMP con 30 e lode".


hash(String,N):-
    atom_codes(String,Simboli),
    sommaElementiLista(Simboli,Somma),
    length(Simboli,Lunghezza),
    N is Somma // Lunghezza.


sommaElementiLista([],0).
sommaElementiLista([A|R],N):-
    number(A),
    sommaElementiLista(R,N1),
    N is A + N1.

%messaggioPerPersona(!Atmo,!String,!String,?String)
messaggioPerPersona(Nome,DataDiNascita,DataDiOggi,MESSAGGIO):-
    string_to_atom(DataDiNascita, D1),
    string_to_atom(DataDiOggi, D2),
    hash(Nome,N1),
    hash(D1,N2),
    hash(D2,N3),
    Key is (N1 + N2 + N3) mod 100,
    write(Key),nl,
    messaggio(Key,M,[]),!,
    atom_codes(MESSAGGIO, M).


%messaggioPerPersona(!Atmo,!List,!List,?String)
messaggioPerPersona(Nome,DataDiNascita,DataDiOggi,MESSAGGIO):-
    sommaElementiLista(DataDiNascita, N2),
    sommaElementiLista(DataDiOggi, N3),
    hash(Nome,N1),
    Key is (N1 + N2 + N3) mod 100,
    write(Key),nl,
    messaggio(Key,M,[]),!,
    atom_codes(MESSAGGIO, M).