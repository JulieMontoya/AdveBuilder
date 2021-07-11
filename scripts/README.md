# Host-side Perl and shell scripts

These scripts are used to convert the SQLite3 database containing the game data to
6502 source code, which can then be assembled with BeebAsm alongside the game engine
code to produce the machine code portion of the final game.

# make_huffman_tree5

This script creates a Huffman tree for the printable parts of the database contents.

Command Line Options:

-q database_name -- specifies the filename (without .sqlite3 extension) of the game
database.

-w -- specifies actually to write the tree information to the database.

# pack_database

This script takes the database now with included Huffman tree, packs the text using
the encoding tree and generates the data expected by the uncompression subroutine
in the game engine.

Command Line Options:

-q database_name -- specifies the filename (without .sqlite3 extension) of the game
database.

-o output_file_name -- specifies the output file to be written.
