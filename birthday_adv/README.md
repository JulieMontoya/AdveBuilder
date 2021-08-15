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
make_huffman_tree6 -qbirthday -w
pack_database4 -qbirthday -obirthday_data.6502
beebasm -i abengine5.6502 -di birthday_empty.ssd -do birthday_adv.ssd
```

## abengine5.6502

This is preconfigured to sit in memory just below the MODE 6 screen, because the
game is small enough to fit there.  So it should run fine on an Acorn Electron.

This version of the engine can store `EXAMINE` messages for objects either
directly in with each object's record, or as a message number for the case
where several objects  (or a stateful object in more than one state)  should
display the same message when `EXAMINE`d; incorporates `SAVE`, `RESTORE` and
`RESTART`, `DIE` and `LIVE` special commands and improves separation between
the engine code and the game data files.

## BIRTHDY

This is the BASIC program providing the logic for the puzzles in the game.

## birthday.s3t

This is a text dump of the SQLite3 database which describes the rooms,
objects and messages for _Birthday Adventure_.

## abengine2.6502

Old file.
