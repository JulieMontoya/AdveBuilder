# Host-side Perl and shell scripts

These scripts are used to convert the SQLite3 database containing the game data to
6502 source code, which can then be assembled with BeebAsm alongside the game engine
code to produce the machine code portion of the final game.  The output from the
database packing program is a single BeebAsm source file consisting of labels and
EQUB/EQUW/EQUS constructs representing the packed data; which is `INCLUDE`d from
within the game engine source file to produce the code and data files.

# make_huffman_tree6

This script creates a Huffman tree for the printable parts of the database contents.
It works with versions of the database where `exam_msg` is a TEXT field, and versions
of the game engine where the `EXAMINE` command expects the database in this format:
`EXAMINE` messages for objects are included in the frequency count.

Command Line Options:

-q database_name -- specifies the filename (without .sqlite3 extension) of the game
database.

-w -- specifies actually to write the tree information to the database.

# pack_database5

This script takes the database now with included word lists, Huffman tree and table
of tables; packs the text using the encoding tree and generates the data expected
by the uncompression subroutine in the game engine.  It works with versions of the
database where `exam_msg` is a TEXT field, and versions of the game engine where
the `select_obj` entry point and `EXAMINE` command expect the database in this
format.  Also stores the list of initial locations of objects where the data record
for the non-existent object #0 would be.

Command Line Options:

-q database_name -- specifies the filename (without .sqlite3 extension) of the game
database.

-o output_file_name -- specifies the output file to be written.

_-L 2|4_ -- _specifies whether to use 2 or 4 light levels; this feature is intended_
_for use with a future version of the game engine.  Do not use it yet._

# blunderer

This script lets you create rooms and link them together by entering direction
commands as though you were playing the game.

Command Line Options:

-q database name -- specifies the filename (without .sqlite3 extension) of the game
database.

Extra commands:

+ `SAFE` -- safe mode.
+ `DANGEROUS` -- dangerous mode, allows you to create new rooms and connections.
+ `DANGEROUS num` -- automatically switch back to safe mode after some number of turns.
+ `DESCRIBE` -- allows you to enter a description for the room.
+ `GOTO num` -- go straight to given numbered room.

In Safe Mode, you can move around and explore existing rooms but you are bound by any
no exit directions, and you can only change the description of a room if it has no
description.  In Dangerous Mode, new rooms are created automatically whenever you move,
as follows:

+ `DIRECTION` -- creates a new room and automatically links the exits to return in the opposite direction; e.g. `W` creates a new room, an exit West from the current room to the new room, and an exit East from the new room to the current room.
+ `DIRECTION/RETURN` -- creates an exit to a new room, but returning by a different direction; e.g. `NE/S` creates an exit that leaves to the Northeast but enters the next room from the South.  `N/` creates an exit North but does not make a return connection.
+ `DIRECTION num` -- creates an exit to a given room.
+ `DIRECTION/[RETURN] num` -- creates an exit to a given room, but returning by a different direction.

# mksm

This is a script to generate `stock_messages.6502` from an SQLite3 database.  This
file has constants for the IDs of the stock messages used by the game engine.

A single parameter is expected, which is the input filename without .sqlite3 extension.
Output is to STDOUT for easy redirection.

# Older Versions

These are provided for compatibility, so it is still possible to work with older
files.

# make_huffman_tree5

This script creates a Huffman tree for the printable parts of the database contents,
for versions of the database where `exam_msg` is an INTEGER field, and versions of
the game engine where the `EXAMINE` command expects this.

Command Line Options:

-q database_name -- specifies the filename (without .sqlite3 extension) of the game
database.

-w -- specifies actually to write the tree information to the database.

# pack_database4

This version did not properly begin the object table with the list of initial
locations in place of the phantom object 0.

# pack_database3

This script takes the database now with included Huffman tree, packs the text using
the encoding tree and generates the data expected by the uncompression subroutine
in the game engine.  It works with versions of the database where `exam_msg` is a
TEXT field, and versions of the game engine where the `select_obj` entry point and
`EXAMINE` command expect the database in this format.

# pack_database

This script takes the database now with included Huffman tree, packs the text using
the encoding tree and generates the data expected by the uncompression subroutine
in the game engine.  It works with versions of the database where `exam_msg` is an
INTEGER field, and versions of the engine where the `EXAMINE` command expects this.

Command Line Options:

-q database_name -- specifies the filename (without .sqlite3 extension) of the game
database.

-o output_file_name -- specifies the output file to be written.

Unfortunately, no format conversion tool exists; when _Birthday Adventure_ was
migrated, the .s3t file was just edited using a text editor to produce the new
format.

