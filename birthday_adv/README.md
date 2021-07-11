# Birthday Adventure

Birthday Adventure is a simple adventure implemented using the AdveBuilder engine.

The game is set in eight rooms. The object of the game is to bake a birthday cake.
In order to acquire the ingredients, equipment and energy to complete this task,
the player must search for items, solve puzzles and avoid flesh-burning acid, death
at the beak of a misanthropic avian menace, or just by good old-fashioned falling
over in the dark.

# Files

## birthday.s3t

This is a text file containing a dump of the SQLite3 database for the game.  In
order to initialise the database, create the Huffman tree and pack up the data into
the expected format, you will need to run

```
sqlite3 birthday.sqlite3 < birthday.s3t
make_huffman_tree5 -qbirthday -w
pack_database -qbirthday -obirthday_data.6502
```

## abengine2.6502

This is preconfigured to sit in memory just below the MODE 6 screen, because the
game is small enough to fit there.  So it should run fine on an Acorn Electron.

## BIRTHDY

This is the BASIC program providing the logic for the puzzles in the game.

