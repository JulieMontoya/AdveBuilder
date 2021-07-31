# Thoughts, in No Particular Order

+ Create minimal BASIC program using just built-in commands as starting point for game.  (Start by deleting game-specific stuff from BIRTHDY)
+ We ideally want to be able to generate everything game-specific from the SQLite3 database, and have nothing game-specific in the engine code.
+ Put addresses of tables at fixed locations in game data file.  Extend engine logic to handle tables with 256 entries aot 128.  Carry will be set by `ASL A` for entries &80-&FF; so do ADC #0 on high byte of address when copying to table pointer.
+ Add option to generate an object's "in-room" description from its "carried" one.
+ Add a construct for embedding a second message within one being decompressed. For example `There is @ here.` When the uncompressor sees @, save the current uncompressor state [&70-&73], set up the state for the second message, display the second message  (hoping there is no @ sign in it),  restore the state and display the rest of the message.
+ Make `SEARCH` a built-in command  (as we have established a consistent behaviour in _Birthday Adventure_).  Use a table to specify object being `SEARCH`ed, required room (if object is fixed; or 0 if portable, meaning must be in room or carried) to avoid **NOT_HERE**, object to release and controlling state bit (which will be set on releasing the object, with **FOUND**; or gives **EXAM_0SPEC** if this is already set when searching).
+ Use constants for stock messages, with a tool to take them from the SQLite3 database and export as a .6502 include file, in game engine source code.
+ Add entry point to read a room's visited flag; and internal subroutines to set and clear same.
