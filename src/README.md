# BeebAsm Source Files

# abengine5.6502

The AdveBuilder game engine provides the following features:
+ Integrates text compression, word wrapping and automatic capitalisation
+ Displays room and object descriptions
+ Accepts and parses commands
+ Deals with moving between rooms
+ Handles picking up and dropping objects and listing the player's inventory
+ Displays messages when the player `EXAMINE`s objects
+ Saves and restores the game state and restarts a game from the beginning.

This version provides an extra level of independence from the game database.  The Huffman tree is held in the last page of the data file, immediately before the beginning of the engine code.  At the end of the last page are the addresses of database tables: verb list, noun / modifier list, game messages, stock messages, rooms and objects.  Therefore, these no longer need to be hard-coded into the engine; the only hard-coded address is the start of this page.

## Entry Points

The game engine is intended to be called from a BASIC program.  It provides the following entry points:

### init_game

This subroutine sets all game state bits and characters to zero, all objects to their initial locations, sets `R%=1` so the player starts off in room 1, displays stock message #0 corresponding to **WELCOME** and sets the `show_desc` flag to force the room description to be displayed.

### select_room

This subroutine selects the rooms table entry for the current room, given in the BASIC variable `R%`; and expands its light status, exit destinations and the address of its description text from the bit-packed record.  The light status is returned in the BASIC variable `L%`.

### art_light

This subroutine overrides the dark status of a room **if** the light source  (by convention, object #9)  is active **and** the player is carrying it  (or it is in the current room).

If there is more than one light source in the game, or some rooms are conditionally illuminated, you will have to deal with this in your BASIC program, and set `L%` accordingly before calling the next subroutine.

### disp_desc

This subroutine displays the description text for the current room, **or** the **DARK** stock message, depending upon `L%`.

### list_exits

This subroutine, which you might not need to call, lists the directions available from the current room.  All the room descriptions in _Birthday Adventure_ already mention the exits in the text, so this feature is not used here.  A future version of the engine could include the facility for rooms to have an abbreviated description, which will be displayed if a room has been visited previously.

### list_obj

This subroutine lists the objects in the current room, if light is available; or else does nothing.

### get_cmd

This subroutine accepts a command typed by the player and performs some checks on it.  The first word is assumed to be a **verb**, and its index number will be passed back to BASIC through the variable `V%`.  The second word is assumed to be a **modifier** (e.g. an adjective as in `PRESS RED BUTTON` or a preposition as in `SWITCH ON 3`), passed to BASIC as `M%`; and the last word is assumed to be a **noun** which is passed to BASIC as `N%` and probably corresponds directly to an object in the game.  If the command is only two words long, the second word is treated as both the noun and the modifier; i.e., `N% = M%`.  A word is deemed matched as soon as it is matched in full against a listed word without caring to match the full length of the listed word, so words can be abbreviated to the shortest unique form.  There is one list of verbs and a separate list of nouns and modifiers, thus allowing nouns to be aligned as far as possible with objects.

At this stage, built-in commands -- the directions including `BACK`, `LOOK`, `EXAMINE`, `TAKE`, `DROP` and `INVENTORY` -- are tested roughly for feasibility  (for example, you can't `TAKE` an object which is not in the room, and not all objects are able to be picked up and carried)  and any error conditon indicated by setting the value of `E%`.
+ If the command is a direction, the destination room  (or 0, if there is no exit)  will be in `D%` and its light status in `K%`.
+ If the command is `EXAMINE` and the object is not available, then set `E%`=7 for **NOT_HERE**.
+ If the command is `TAKE` and the object is not in the room, or is not able to be picked up and carried, then set `E%` accordingly  (2 = **CANT_DO** or 7 = **NOT_HERE**).  If no object is given, search for the first carryable object in the room and set `N%` accordingly; else set `E%`=7 (**NOT_HERE**) if no suitable object is found.
+ If the command is `DROP` and the player is not carrying the object, set `E%`=8 (**NO_CARRY**).

If the verb is on the verb list but not recognised as a built-in one, the command is effectively ignored: the BASIC program will have to deal with it.  Otherwise, a value of 1, corresponding to a **NONSENSE** error, is returned in E%.

The position in memory of the first character of the last word parsed is returned in `I%`, in case you wish to do any extended parsing of your own.  For instance, in a game featuring a telephone, the player might have to `DIAL` some number for a clue or to cause something to happen.  If the player enters `DIAL 6325` then `I%` will contain the location of the figure 6 in the command.  This can be read using the construct `$I%` in BASIC.  (_Birthday Adventure_ does not make use of this.)

By the time the engine returns to BASIC,  `V%`, `M%`, `N%`, `I%`, `D%` and `E%` and `K%` will have been set to appropriate values.  However, `R%` will not have been altered yet, and the locations of any objects being picked up or deposited will not yet have been updated.  All that has happened so far is that it has determined exactly _how_ it is going to proceed once the command is actioned.

### action_cmd

This subroutine first looks at `E%` and determines whether or not an error message is required.  If so, it is displayed.  Otherwise, `V%` is examined and, if the verb is a built-in one, the game state is updated to reflect the actions oreviously determined when `get_cmd` was called.
+ For a direction, we set `R%` to the value in `D%`, update the light status and set the "show description" flag.
+ If the command is `LOOK`, we just set the "show description" flag.
+ If the command is `EXAMINE`, we display the "examine" message for the object.
+ If the command is `TAKE`, we set the object's location to 0  (if the room is lit)  or 255  (if the room is in darkness).
+ If the command is `DROP`, we set the object's location to `R%`.
+ If the command is `INVENTORY`, then we display a list of objects in location 0  (i.e., carried by the player) and the number, if any, of unidentified objects which have been picked up in the dark  (i.e., in location 255).
+ If the command is `SAVE`, we store the current room (from `R%`) and previous rooms (so when the game is restored, `BACK` returns to the room visited before the one in which the `SAVE` command was given, and not the room visited before the one in which the `RESTORE` command was given) in the game state area, set up a control block and fire off a call to OSFILE &00 to save out the game state area.  If the command is more than one word long, the last word  (whose starting address will be in `I%`)  is treated as a filename; otherwise, a default filename is assumed.
+ If the command is `RESTORE`, we set up a control block, again using the last word of the command as a filename if present, and fire off a call to OSFILE &FF; then retrieve the previous and current rooms and set the "show description" flag.
+ If the command is `RESTART`, we call `init_game` to start a new game.
+ If the command is the special pseudo-command `DIE`, we display the message given by `M%` and kill off the player.
+ If the command is the special pseudo-command `LIVE`, we display the message given by `M%`.  (This and the immediately preceding are intended to be set by game logic.)

### get_state_bit

This subroutine reads a game state bit (**B0**-**B255**) specified in the accumulator (`A%` when called from BASIC) and returns with the `Z` flag set accordingly (i.e., `Z`=0 if the bit was 1).  This can be read in BASIC using `USRget_state_bit AND&2000000`. 

### clear_state_bit

This subroutine clears a game state bit (**B0**-**B255**) specified in the accumulator (`A%` when called from BASIC).

### set_state_bit

This subroutine sets a game state bit (**B0**-**B255**) specified in the accumulator (`A%` when called from BASIC).

### select_msg

This subroutine displays a game message whose ID number is given in the accumulator (`A%` when called from BASIC).

### select_sysmsg

This subroutine displays a stock message whose ID number is given in the accumulator (`A%` when called from BASIC).

### test_avail

This subroutine checks whether the object specified by `N%` (i.e., the noun in the command just parsed)  is available  (i.e., present in the room or being carried), and returns with `Z`=1 if the object is available.  This can be read in BASIC using `USRtest_avail AND&2000000`.

### test_avail_X

This does likewise, but for the object whose ID is given in the X register  (`X%` in BASIC)  rather than `N%`.  In fact, the actual code is
```
\  TEST IF OBJECT N% IS AVAILABLE  (CARRIED OR IN ROOM)
\  on return  Z=0 => OBJECT IS AVAILABLE
\             Z=1 => NEITHER CARRIED NOR IN ROOM

.real_test_avail
    LDX bas_var_N
.real_test_avail_X
    LDA object_loc,X    \  Z=1 => carried
    BEQ _ta1
    CMP bas_var_R       \  Z=1 => in room
._ta1
    RTS
```

# abengine4.6502

This is an older version of the game engine which required the addresses of the database tables to be compiled into it.  In this version, the addresses are obtained from well-known locations in the game data file.

# abengine3.6502

This is an older version of the game engine, without `SAVE` / `RESTORE` or `RESTART` functionality.

# abengine2.6502

This is an older version of the game engine, with a different implementation of `EXAMINE` messages and using memory locations to pass light status instead of L% and K%.

# What Changed

### 3 to 4

Entry points and workspace addresses have been changed  (now moved to top end of code, just before frame buffer).  New built-in commands `SAVE`, `RESTORE`, `RESTART`.

### 2 to 3

The "old" way of storing EXAMINE messages was as follows:

0 => no message
10 => message with same number as object
11 + 6 bits => message with given number

The "new" way of storing EXAMINE messages is as follows:

0 => no message
10 + 8 bits => compressed text in object record, at given offset from in_room description
11 + 6 bits => message with given number

When an object is decoded, if the message type is 0, the object examine message address `obj_em_addr` is set to the address of the stock message for "nothing special"; if the message type is 10, then the address is calculated by adding the given offset to `obj_ld_addr`; and if the message type is 11, then `obj_em_addr` is populated with the starting address of the given numbered message.  Thus, whenever the `EXAMINE` command is actioned, the procedure is always the same in any case:  just display the message starting at the address given in `obj_em_addr`.
