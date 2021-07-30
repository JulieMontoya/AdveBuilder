# Thoughts in No Particular Order

+ Create minimal BASIC program
+ Put addresses of tables at fixed locations in game data file.  Extend engine logic to handle tables with 256 entries aot 128.  Carry will be set by `ASL A` for entries &80-&FF; so do ADC #0 on high byte of address when copying to table pointer.
+ Add option to generate an object's "in-room" description from its "carried" one.
+ Add a construct for embedding a second message within one being decompressed. For example `There is @ here.` When the uncompressor sees @, save the current uncompressor state [&70-&73], set up the state for the second message, display the second message  (hoping there is no @ sign in it),  restore the state and display the rest of the message.
