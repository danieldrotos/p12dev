A fejlesztõrendszer használata
==============================

A szövegfájlok szerkesztésére tetszõleges szövegszerkesztõt
használhatunk. Windows-on a geany is alkalmazható. Az Open funkcióval
megnyithatók a szerkesztendõ fájlok.


1. Projekt létrehozása
----------------------

Töltsük ki/módosítsuk a prj.mk fájlt. Paraméterek:

- PRG az assembly forrás fájl neve, az .asm kiteresztés nélkül! A
  példában a fájl egy alkönyvtárban van, de tehetjük a csomag
  könyvtárába is (ahol a prj.mk fájl van), akkor nem kell a névbe
  útvonal. Vagy készíthetünk saját alkönyvtárat.

- INSTS a szimulációban lefuttatandó utasítások száma.


2. Írjuk meg a programot
------------------------

A PRG paraméterben megadott néven (és helyre) mentsük el a fájlt .asm
kiterjesztéssel. Az irodalomjegyzékbõl használjuk a pcpu anyagot,
amiben megtaláljuk a CPU utasításait, és a pasm-ot, amiben az
assembler pszeudó utasításai vannak leírva. A fordításhoz azonban
_ne_ a pasm-ban leírt módot, hanem az itt szereplõ eljárást használjuk!


3. Fordítás, szimuláció
-----------------------

A mûveletet parancssorból a

make

parancs kiadásával végezhetjük el. Geany-ban válasszuk az
"Összeállítás" menübõl a "Make" pontot (Shift-F9). A geany ilyenkor
elmenti a módosított fájlokat.

A make parancs

- lefordítja az assembly forrást
- lefordítja a HW tervet
- lefuttatja a szimulációt, ez generálja a VCD fájlt
- megnyitja a VCD fájlt a megjelenítõben (gtkwave)

A fordításnak a gtkwave bezárásakor lesz vége, a geany-ban ez után
folytathatjuk a munkát.


4. Egyéb mûveletek
------------------

A fordítás és a szimuláció eredményének letörlése:

make clean

Geany esetén: "Összeállítás" menü "Make egyéni céllal"
(Shift-Ctrl-F9), majd írjuk be a clean, vagy wclean célt.

A szoftver és a hardver terv lefordítása szimuláció nélkül:

make compile

Csak a hardver lefordítása és szimulációja:

make sim

Csak a hardver lefordítása, szimuláció nélkül:

make hw

Csak a szoftver lefordítása:

make sw

