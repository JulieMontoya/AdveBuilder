# Bobajob Street

Bobajob Street is a simple adventure implemented using the AdveBuilder engine.  The game is set in 15 (or maybe 16) rooms.

Being a soldier of fortune, living a life of adventure and making new friends wherever you go _sounds_ romantic; but the ugly truth is, people are simply not prepared to pay for your services.  When they even bother to offer you a share of the treasure, they expect you to take outrageous risks and be grateful for the experience and the exposure.  In desperation, you have signed up with a strange employment agency in a building you did not know existed, on a street you have never walked down before; and now you have the following list of apparently simple tasks:
```
Feed Tiddles
Return library book
Mend leaking pipe
Water pot plant
```
Good, honest, old-fashioned odd jobs for the odd bob.  Surely nothing can go wrong?  Nothing on that list sounds dangerous; and in any case, the old cat lady, the nice young family, the shopkeeper and the softly-spoken gentleman with the long, grey hair will be there to show you where to find everything .....

Of course, nothing is as it seems.  It wouldn't be much of an adventure if it was!  But where is everybody, and how will you fix that pipe without any proper plumbing tools?  And can it really be as simple as all that?

Bobajob Street was written to test polystate objects, and also introduce the ideas of "container" objects and non-player characters.  It ended up taking a darker turn  ;)

## Building Bobajob Street

Provided you have cloned the whole AdveBuilder repository and so have a `scripts` folder alongside `bobajob_st`, then all you should need to do is run

```
$ make
```

to create a disc image, `bobajob_street.ssd` .  

## Container Logic

The sleeping bag  (where the book is initially hidden)  functions as a container.  It can be picked up and carried  (at least within the house)  and also functions as a visitable room.  Objects dropped inside the sleeping bag can be found by `SEARCH`ing it.  It's dark inside the bag, though, so you will not be able to see what you are picking up .....

## Non-Player Characters

Tiddles turns out not to be an ordinary domestic cat, but a large tiger!  The tiger is fairly benign, until he has had his breakfast .....

At the end of the game, a final task is revealed:  Defeat the crazed chainsaw-wielding serial killer who has been terrorising the villagers!  The killer begins from a grassy knoll near the self-service book deposit machine outside the library and chases the player down mercilessly.  The player must hide in the one place a chainsaw cannot cut, and hope the killer does not know .....

# Files in bobajob_st

## bobajob_st.s3t

This is a text dump file which contains the SQL commands needed to create the SQLite3 database.

## instructions.bas

This is the BASIC program with the instructions for the game.

## bobajob_street.bas

This is the BASIC program with the actual game logic.

## npc_map_data.6502

This is a BeebAsm source file to create the non-player character map data.

## bobajob_street.6502

This is a BeebAsm source file to create a bootable disc image with a !BOOT file, the instructions, the BASIC program for the game, the non-player character map data, the game data and the engine code.

## abengine6.6502

This is the BeebAsm source for the game engine.

## stock_messages.6502

This is a BeebAsm source file with constants for stock messages.  It is generated from the sqlite database with its own Makefile target.

## Makefile

This is a standard Makefile to build the SSD image.

The Makefile assumes the presence of a `scripts` folder alongside the working folder with `make_huffman_tree`, `pack_database` and `mksm` scripts.  Note, if you alter the .sqlite database, you _must_ dump it as an .s3t file before running `make`, as the database always gets generated from this text dump.

_(Idea for future work: detect whether these tools are already in $PATH and if so, use those in preference)_
