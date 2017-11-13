# Diametro di un grafo

```
Filippo Mameli
filippo.mameli@stud.unifi.it
6222254
```
Il grafo analizzato è una instantanea della struttura di Internet a livello di sistemi autonomi, ricostruita dalle tabelle BGP pubblicate dall'Università di Oregon ([Link](http://www-personal.umich.edu/~mejn/netdata/)).
- Numero nodi 22963
- Numero archi 48436

L' algoritmo che esamina tutti i nodi per trovare il diametro restituisce questo output:
```Julia
elapsed time: 273.147031908 seconds
Diameter 11
```
Il programma impiega quasi 5 minuti per controllare tutti i nodi.

Utilizzando invece l'algoritmo basato sull'analisi delle frange di un visita in ampiezza i risultati sono totalmente diversi. In ogni caso il programma è più veloce dell'algoritmo con ricerca esaustiva, ma la scelta del nodo di partenza nel secondo caso risulta molto importante.

Prendendo come nodo di partenza il nodo più connesso abbiamo il seguente risultato:
```Julia
1  8724
2  9200
3  14633
4  16852
elapsed time: 0.080959525 seconds
Diameter 11
```
I primi numeri indicano i nodi esaminati. In questo caso sono stati controllati solo 4 nodi invece che 22963 e la ricerca del diametro si è conclusa in solo 0.08 secondi.

Prendendo il nodo con meno connessioni invece impiega più tempo:
```Julia
1  16852
2  9200
3  10994
4  11227
5  11291
6  11527
.
.
.
216  21901
217  22007
218  22099
219  22511
220  22583
221  22730
222  22788
223  22797
elapsed time: 2.65926177 seconds
Diameter 11
```
Il diametro ovviamente rimane invariato, ma il tempo impiegato è di 2.6 secondi e sono stati esaminato 223 nodi.

Cercando la media su un campione di 10 elementi scelti casualmente abbiamo:
```Julia
1.6610603
5.6646657
1.3717076
32.109867
6.2312164
3.3367977
1.7527943
1.8665112
3.8030324
1.1471504
Tempo Massimo    32.109867
Tempo Minimo 	 1.1471504
Tempo Medio 	 5.89448
```

Dati questi risultati sembra che almeno empiricamente la scelta del nodo con più connessioni come nodo di partenza sia quella che restituisce il diametro in meno tempo.
