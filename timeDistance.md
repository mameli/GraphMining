# Distanza di Milgram

```
Filippo Mameli
filippo.mameli@stud.unifi.it
6222254
```
Il grafo analizzato è una instantanea della struttura di Internet a livello di sistemi autonomi, ricostruita dalle tabelle BGP pubblicate dall'Università di Oregon ([Link](http://www-personal.umich.edu/~mejn/netdata/)).
- Numero nodi $22963$
- Numero archi $48436$
- $Log(22963) \sim  10$

Per calcolare la distanza esatta lo script Julia impiega 10 minuti
``` Julia
Distanza precisa
3.842426273858345
elapsed time: 599.227492509 seconds
```
Il valore della distanza è stato calcolato poi su un campione di $10$, $ 1000$ e $10000$ nodi del grafo. I nodi del campione sono stati presi in modo casuale, ma comunque senza controllare due volte lo stesso nodo.

Già per $10$ nodi si può vedere che la distanza è molto simile a quella esatta.
C'è un errore dello $0,008\%$ che è molto meglio dell'errore sull'unità che ci si poteva aspettare dato il piccolo valore del campione.
```Julia
Distanza approssimata con 10 nodi
elapsed time: 0.306798446 seconds
3.809655082309903
```
L'errore su $1000$ nodi diminuisce e arriva allo $0,004\%$, ma il tempo di computazione sale a $26$ secondi.
```Julia
Distanza approssimata con 1000
elapsed time: 26.268962878 seconds
3.827348605751196
```
Esaminando quasi la metà dei nodi del grafo si arriva al un errore pari allo $0,001\%$ però il tempo di calcolo è di circa $5$ minuti.

```Julia
Distanza approssimata 10000
elapsed time: 272.883007912 seconds
3.838361537485526
```

I campioni molto grandi producono risultati più precisi, ma il tempo impiegato rispetto ai campioni piccoli è molto meno conveniente.
