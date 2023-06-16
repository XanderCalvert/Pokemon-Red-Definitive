# Pokémon Red and Blue 

This codebase is a fork of the disassembly of Pokémon Red and Blue.

The goal of this project is to make a definitive version of Pokémon version for the Gameboy how I imagine how it should have been done.

The scope of this project is ever growing at the moment with the main focus being on fixing bugs and adding Quality of Life improvements.

Feel free to submit pull requests with justifications.

Quite a weird passion project to be taking on in my free time but it makes a welcome change from writing WordPress Themes and Plugins.

## Current Plans

Currently found in the code where the flag is that shows and hide the guy blocking cerulean cave which is when you beat the Elite 4. Investigating whether this flag can be used to add the unobtainable pokemon into the game after as well.

Implimented a check for the route encounter data to be changed depending on flags. Going to be elite 4 for starters and version exclusives. Diploma for Mew.

Also can add additional trainers in with this flag as well probably. Would just depend on memory size but need to find that out.

## Current issues on this branch

```
/mnt/d/codingpokemon/pokemon-red-definitive$ make

data/wild/grass_water.asm: no newline at end of file
text/CeruleanCaveB1F.asm: no newline at end of file
data/wild/grass_water.asm: no newline at end of file
text/CeruleanCaveB1F.asm: no newline at end of file
data/wild/grass_water.asm: no newline at end of file
text/CeruleanCaveB1F.asm: no newline at end of file
data/wild/grass_water.asm: no newline at end of file
text/CeruleanCaveB1F.asm: no newline at end of file
data/wild/grass_water.asm: no newline at end of file
text/CeruleanCaveB1F.asm: no newline at end of file
rgblink -p 0x00 -d -m pokered.map -n pokered.sym -l layout.link -o pokered.gbc audio_red.o home_red.o main_red.o maps_red.o ram_red.o text_red.o gfx/pics_red.o gfx/sprites_red.o gfx/tilesets_red.o
error: home.asm(21) -> home/overworld.asm(2260) -> macros/farcall.asm::callfar(9): Requested BANK() of symbol "LoadWildData", which was not found
error: home.asm(21) -> home/overworld.asm(2260) -> macros/farcall.asm::callfar(8): Unknown symbol "LoadWildData"
error: main.asm(55) -> engine/overworld/wild_mons.asm(99) -> data/wild/e4_grass_water.asm(3): Unknown symbol "ViridianForestWildMonsE4"
Linking failed with 3 errors
make: *** [Makefile:151: pokered.gbc] Error 1
```

## Please support the original project this was forked from.

This is a disassembly of Pokémon Red and Blue.

It builds the following ROMs:

- Pokemon Red (UE) [S][!].gb `sha1: ea9bcae617fdf159b045185467ae58b2e4a48b9a`
- Pokemon Blue (UE) [S][!].gb `sha1: d7037c83e1ae5b39bde3c30787637ba1d4c48ce2`
- BLUEMONS.GB (debug build) `sha1: 5b1456177671b79b263c614ea0e7cc9ac542e9c4`
- dmgapae0.e69.patch `sha1: 0fb5f743696adfe1dbb2e062111f08f9bc5a293a`
- dmgapee0.e68.patch `sha1: ed4be94dc29c64271942c87f2157bca9ca1019c7`

To set up the repository, see [**INSTALL.md**](INSTALL.md).


## See also

- [**Wiki**][wiki] (includes [tutorials][tutorials])
- [**Symbols**][symbols]
- **Discord:** [pret][discord]
- **IRC:** [libera#pret][irc]

Other disassembly projects:

- [**Pokémon Yellow**][pokeyellow]
- [**Pokémon Gold/Silver**][pokegold]
- [**Pokémon Crystal**][pokecrystal]
- [**Pokémon Pinball**][pokepinball]
- [**Pokémon TCG**][poketcg]
- [**Pokémon Ruby**][pokeruby]
- [**Pokémon FireRed**][pokefirered]
- [**Pokémon Emerald**][pokeemerald]

[pokeyellow]: https://github.com/pret/pokeyellow
[pokegold]: https://github.com/pret/pokegold
[pokecrystal]: https://github.com/pret/pokecrystal
[pokepinball]: https://github.com/pret/pokepinball
[poketcg]: https://github.com/pret/poketcg
[pokeruby]: https://github.com/pret/pokeruby
[pokefirered]: https://github.com/pret/pokefirered
[pokeemerald]: https://github.com/pret/pokeemerald
[wiki]: https://github.com/pret/pokered/wiki
[tutorials]: https://github.com/pret/pokered/wiki/Tutorials
[symbols]: https://github.com/pret/pokered/tree/symbols
[discord]: https://discord.gg/d5dubZ3
[irc]: https://web.libera.chat/?#pret
[ci]: https://github.com/pret/pokered/actions
[ci-badge]: https://github.com/pret/pokered/actions/workflows/main.yml/badge.svg
