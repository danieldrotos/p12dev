# A fejleszt�rendszer haszn�lata

A sz�vegf�jlok szerkeszt�s�re tetsz�leges sz�vegszerkeszt�t
haszn�lhatunk. Windows-on a geany is alkalmazhat�. Az Open funkci�val
megnyithat�k a szerkesztend� f�jlok.


## 1. Projekt l�trehoz�sa


T�lts�k ki/m�dos�tsuk a `prj.mk` f�jlt. Param�terek:

- `PRG` az assembly forr�s f�jl neve, az .asm kitereszt�s n�lk�l! A
  p�ld�ban a f�jl egy alk�nyvt�rban van, de tehetj�k a csomag
  k�nyvt�r�ba is (ahol a `prj.mk` f�jl van), akkor nem kell a n�vbe
  �tvonal. Vagy k�sz�thet�nk saj�t alk�nyvt�rat.

- `INSTS` a szimul�ci�ban lefuttatand� utas�t�sok sz�ma.


## 2. �rjuk meg a programot

A `PRG` param�terben megadott n�ven (�s helyre) ments�k el a f�jlt
**.asm** kiterjeszt�ssel. Az irodalomjegyz�kb�l haszn�ljuk a

[pcpu](https://docs.google.com/document/d/1MMJTB6DxL5sSkYoF5do1A1qZC5c4BnU0c9VOwRNeq6Y/edit?usp=sharing)

anyagot, amiben megtal�ljuk a CPU utas�t�sait, �s a

[pasm](https://docs.google.com/document/d/1bQZooX6hUN2C4n99xTbH_ixLitfhPmOWg5OT2IrxJ5U/edit?usp=sharing)

dokumentumot, amiben az assembler pszeud� utas�t�sai vannak le�rva. A
ford�t�shoz az al�bb szerepl� elj�r�st haszn�ljuk!


## 3. Ford�t�s, szimul�ci�

A m�veletet parancssorb�l a

```
make
```

parancs kiad�s�val v�gezhetj�k el. Geany-ban v�lasszuk az
"�ssze�ll�t�s" men�b�l a "Make" pontot (Shift-F9). A geany ilyenkor
elmenti a m�dos�tott f�jlokat.

A make parancs

- leford�tja az assembly forr�st
- leford�tja a HW tervet
- lefuttatja a szimul�ci�t, ez gener�lja a VCD f�jlt
- megnyitja a VCD f�jlt a megjelen�t�ben (gtkwave)

A ford�t�snak a gtkwave bez�r�sakor lesz v�ge, a geany-ban ez ut�n
folytathatjuk a munk�t.


## 4. Egy�b m�veletek

A ford�t�s �s a szimul�ci� eredm�ny�nek let�rl�se:

```
make clean
```

Geany eset�n: "�ssze�ll�t�s" men� "Make egy�ni c�llal"
(Shift-Ctrl-F9), majd �rjuk be a clean, vagy wclean c�lt.

A szoftver �s a hardver terv leford�t�sa szimul�ci� n�lk�l:

```
make compile
```

Csak a hardver leford�t�sa �s szimul�ci�ja:

```
make sim
```

Csak a hardver leford�t�sa, szimul�ci� n�lk�l:

```
make hw
```

Csak a szoftver leford�t�sa:

```
make sw
```
