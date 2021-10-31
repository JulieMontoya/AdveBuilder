# Thoughts, in No Particular Order

+ Create minimal BASIC program using just built-in commands as starting point for game.  (Start by deleting game-specific stuff from BIRTHDY)
+ We ideally want to be able to generate everything game-specific from the SQLite3 database, and have nothing game-specific in the engine code.  **BELIEVED DONE** -- the proof will be in swapping-in a complete game database, which requires writing another game!
+ **DONE** Put addresses of tables at fixed locations in game data file.  Extend engine logic to handle tables with 256 entries aot 128.  Carry will be set by `ASL A` for entries &80-&FF; so do ADC #0 on high byte of address when copying to table pointer.  BEGUN -- buildable code in work area now using this, still not quite right though as really want to arrange addresses to use &FF for last byte of fixed area aot &00 for first byte of fixed area.  Now fixed.  Last page of game data file will be uncompression tree and table of addresses.
+ Add option to generate an object's "in-room" description from its "carried" one.
+ Add a construct for embedding a second message within one being decompressed. For example `There is @ here.` When the uncompressor sees @, save the current uncompressor state [&70-&73], set up the state for the second message, display the second message  (hoping there is no @ sign in it),  restore the state and display the rest of the message.
+ Make `SEARCH` a built-in command  (as we have established a consistent behaviour in _Birthday Adventure_).  Use a table to specify object being `SEARCH`ed, required room (if object is fixed; or 0 if portable, meaning must be in room or carried) to avoid **NOT_HERE**, object to release and controlling state bit (which will be set on releasing the object, with **FOUND**; or gives **EXAM_0SPEC** if this is already set when searching).
+ Use constants for stock messages, with a tool to take them from the SQLite3 database and export as a .6502 include file, in game engine source code.  **BEGUN** -- buildable code in work area now using this. **DONE** with knobs on, because $ was causing problems in Makefile.
+ Add entry point to read a room's visited flag; and internal subroutines to set and clear same. **DONE**
+ Extend database format to include support for short and long descriptions for previously visited and unvisited rooms respectively.
+ **DONE** Make `DIE` a built-in command.  Would not accessed directly by typing a command, but by BASIC program altering `V%`.  Use `M%` to specify dying message, and set `E%`=**GAME_OVER** to satisfy `UNTIL` condition.  DONE -- also added `LIVE` built-in command.
+ Remember last direction moved, to allow `FORWARDS`, `LEFT` and `RIGHT` -- which will take the same direction, next available direction to its left  (counting down)  and next available direction to its right  (counting up)  respectively.

## Extensions to text uncompression

+ Use `CHR$(6)` (invisible when PRINTed) as "shift on" command instead of encoding capital letters explicitly.  (Check whether this gives any space saving.)
+ Introduce tokens which can be expanded. `CHR$(16)` to `CHR$(31)` could be used  (easy enough to check, still out of way of anything else we are trapping).  Use slack space after tree to store token expansions, pass offset via 1 byte in last page. To save space, instead of a table of addresses, use bit 7=1 to indicate beginning or end of a token and search forwards from beginning every time. 


## SEARCH TABLE
Byte offset | Meaning
------------|-------------------------------------------------------------
0           | Object to search (=`N%`). If =0 then indicates search room.
1           | Room. If =0 then indicates object must be available.
2           | Controlling state bit; set to 1 when object dropped.
3           | Object to release.

Searching one object can release multiple objects, but each one needs a separate controlling state bit.

Alternatively:  Bit-packed search table.

+ 0 => search room.
+ 1 + 8 bits => object to search (=`N%`).

+ 0 => object must be available
+ 1 + 8 bits => room where command being actioned

+ 6 bits => controlling state bit

+ 0 + 8 bits => object to release (last one)
+ 1 + 8 bits => object to release (followed by same again)

## Container Logic

Add helper functions, and possibly extend built-in commands, to implement containers: objects which can have other objects placed inside and retrieved from them.

Put objects into container  (`FILL container`, `STUFF container`):  list objects in-hand  (skipping the container itself)  one by one and offer Y/n.  Return to BASIC after each "yes" to allow program to deal with cases where objects will not fit or objects which will damage the container e.g. burning oil lamps, sharp blades.  Last time through should signal no more objects.

`PUT object [INTO] container` would set `M%<>N%` to distinguish from ordinary `PUT`.  (Unfortunately, the first-second-last parser has no way to distinguish between `STUFF TURKEY [INSIDE] PILLOWCASE` and `STUFF TURKEY [WITH] PILLOWCASE`; if `STUFF` is a simple synonym for `FILL` with the same verb number to make the two-word case behave identically then the latter is assumed, but `PUT TURKEY INSIDE PILLOWCASE` works the opposite way around.)  At checking stage, if M%<>N% then `M%` must be in-hand  (or else **NO_CARRY**)  and `N%` must be in-hand or in-room  (or else **NOT_HERE**).  On actioning command, if `M%<>N%` then we need to relocate object `M%` to an alternative room which might be given in another BASIC variable, or else somehow determined from `N%`.

`INSERT object [INTO] container` could be made a built-in; check always passes if `M%=N%`  (`INSERT OBJECT`)  to allow BASIC program to deal with this form of command, otherwise acts as `PUT object [INTO] container`.

`TAKE object [FROM] container` would set `M%<>N%` to distinguish from ordinary `TAKE`.  At checking stage, if a means exists to determine the container's associated virtual room directly from `N%`, we can check the wanted object's availability automatically and maybe set **NOT_HERE**.  If `M%` is the token for the word `FROM`  (analogously with naked `TAKE`)  then we need to pick `M%` from the contained objects.  On actioning command, if `M%<>N%` then we need to relocate object `M%` to the player's hands  (i.e., room 0).

List objects in container:  like main loop of `INVENTORY` command, expecting program to provide preamble and "empty" message if applicable.

Count  (without displaying)  objects in container:  necessary in order to implement some logic, e.g. it might not be possible to fold a free-standing tent while there is something inside it.  

Might be possible to merge some of this with any `SEARCH` built-in.  `SEARCH`ing a container should release its contents, either to the player's hands if carried, or else to the room.  `EXAMINE`ing it should list them.

Worth adding "container" property to objects? 0 => not container, 1 + 8 bits => room where its contents are.  Will need to see if room for extra bit in padding bits in common object record sizes .....
