# VERSION 7 OF THE GAME ENGINE

Version 7 of the game engine includes support for short descriptions where
rooms have already been visited.  As far as possible, this has been
implemented in a manner that should preserve compatibility with packed
game databases with only single room descriptions.

It is intended that a room's long description will include the available
exits, while a short description will rely on the `disp_exits` function.
However, if a room appears to have the same short and long description,
the exits will not be automatically listed even if the room has previously
been visited.  (The program is actually only matching the low bytes of the
address of the descriptions, and so could be fooled in the unlikely event
of a short description falling a multiple of 256 bytes away from the
corresponding long description.  If this ever happens, probably the easiest
course of action is to edit the assembler code produced by the
`pack_database` script and rearrange the descriptions; or even just insert
a BRK before the offending one, in order to take up an extra byte.)

## make_huffman_tree7

This script now takes an additional option, `-S`.  If this is 2, the tree
will be built against data including the `desc_short` field from the
SQLite database.  If this is 0 or absent, this field will not be included
in the query to retrieve the room data, in order to preserve compatibility
with existing databases.


## pack_database7

This script now takes an additional option, `-S`.  If this is absent, the
database will be packed without short descriptions and compatible with
earlier versions of the game engine.  If this is zero, the database will
be packed in the new format but with with no short descriptions.  If this
is 2, the database will be packed using the `desc_short` field from the
SQLite database.  If this is 1, this field will be automatically generated
and not queried from the database  (this was a development feature and
unlikely to be useful in practice).


The previous data format does not guarantee to leave a spare bit after the
exits data  (in fact, the very common case of a room having just one exit
in the short form aligns exactly to a byte boundary)  so a flag bit is used
in byte &F3 of the last page of the game database to indicate whether or
not short descriptions might be present.

When a room is unpacked, if the "old" data format is in use and only long
descriptions are present, the "room short description" address will be
populated with the long description address.  Otherwise, the short
description address will be populated from the game database.  It may be
specified as a 2-byte address or a 1-byte offset from the current address.



id  | description | desc_short | light
----|-------------|------------|------
INT | TEXT        | TEXT       | INT

The first bit of a room record is the light status:

bits     | meaning
--------:|---------
0        | Dark
1        | Light

This is followed by ten exit records, clockwise N-NW, U, D, each as follows:

bits            | meaning
---------------:|-------------------------------
0               | No exit
10 + 4 bits     | Offset to destination
11 + 8 bits     | Destination as absolute value

Then a short description indicator:

bits            | meaning
---------------:|------------------------------
0               | No short description
10 + 1 byte     | Literal short description preceded by its length
11 + 2 bytes    | Address of short description

The short description, or its address, follows at the next byte boundary.
The long description follows at the byte boundary after that.  The short
description is placed first, since its compressed length is most likely
to be less than 255 bytes.  (This would be about 6 lines of MODE 7 text,
uncompressed; the compression efficiency is such that this will be about
8 or 9 lines.)  It is always possible to specify a literal address for a
short description which exceeds this limit.

(The `pack_database` script could perform the compression first and
determine if or not a short description would fit the space available,
and transparently rig the output with an address for a too-long short
description -- which could come after the long one -- if necessary.)

