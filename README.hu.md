# A fejlesztőrendszer használata

A szövegfájlok szerkesztésére tetszőleges szövegszerkesztőt
használhatunk. Windows-on a geany is alkalmazható. Az Open funkcióval
megnyithatók a szerkesztendő fájlok.


## Projekt létrehozása


Töltsük ki/módosítsuk a `prj.mk` fájlt. Paraméterek:

- `PRG` az assembly forrás fájl neve, az .asm kiteresztés nélkül! A
  példában a fájl egy alkönyvtárban van, de tehetjük a csomag
  könyvtárába is (ahol a `prj.mk` fájl van), akkor nem kell a névbe
  útvonal. Vagy készíthetünk saját alkönyvtárat.

- `INSTS` a szimulációban lefuttatandó utasítások száma.


## Írjuk meg a programot

A `PRG` paraméterben megadott néven (és helyre) mentsük el a fájlt
**.asm** kiterjesztéssel. Az irodalomjegyzékből használjuk a

[cpu](https://danieldrotos.github.io/p12dev/p2223.html)

anyagot, amiben megtaláljuk a CPU utasításait, és a

[asm](https://danieldrotos.github.io/p12dev/asm.html)

dokumentumot, amiben az assembler pszeudó utasításai vannak leírva. A
fordításhoz az alább szereplő eljárást használjuk!


## Fordítás, szimuláció

A műveletet parancssorból a

```
make
```

parancs kiadásával végezhetjük el. Geany-ban válasszuk az
"Összeállítás" menüből a "Make" pontot (Shift-F9). A geany ilyenkor
elmenti a módosított fájlokat.

A make parancs

- lefordítja az assembly forrást
- lefordítja a HW tervet
- lefuttatja a szimulációt, ez generálja a VCD fájlt
- megnyitja a VCD fájlt a megjelenítőben (gtkwave)

A fordításnak a gtkwave bezárásakor lesz vége, a geany-ban ez után
folytathatjuk a munkát.


## Egyéb műveletek

```
make progs        ; a monitor és a példák lefordítása
make sw           ; csak a szoftver lefordítása
make hw           ; csak a hardver lefordítása, szimuláció nélkül
make compile      ; szoftver és a hardver terv lefordítása szimuláció nélkül
make sim          ; csak a hardver lefordítása és szimulációja
make show         ; a VCD fájl megjelenítése a gtkwave-el
make iss          ; az alkalmazás szimulációja uCsim-el
make emu          ; uCsim, az FPGA kártya kép megjelenítésével
make clean        ; a generált fájlok letörlése
```


## Utasításkészlet szimuláció

A hardveres szimuláció mellett a rendszer szoftveresen is szimulálható
uCsim szimulátor segítségével. A művelet a következő paranccsal indítható:

```
make iss
```

Elindítja a szimulációt és három terminál ablakot nyit meg, **UART**,
**cmd1** és **cmd2** címmel. Az UART ablak az szimulált uarthoz
csatlakozik, ebben nyomjuk meg az ENTER billentyűt, hogy megkapjuk a
monitor promptot. A program elindításához adjuk ki a

```
g kezdőcím
```

monitor parancsot, hexadecimális cím használatával. A cmd1 és cmd2
ablakok a szimulátor vezérlésére használhatók, a dokumentáció a
következő címen található:

http://www.ucsim.hu


## FPGA megvalósítás

Az FPGA megvalósítás lefordításához és kártyára való letöltéséhez
használjuk a fejlesztőrendszer részletes leírását tartalmazó
dokumentációt:

[dev](https://danieldrotos.github.io/p12dev/devenv.html)
