# BeebAsm Source Files

# abengine3.6502

The AdveBuilder game engine provides the following features:
+ Integrates text compression, word wrapping and automatic capitalisation
+ Displays room and object descriptions
+ Accepts and parses commands
+ Deals with moving between rooms
+ Handles picking up and dropping objects and listing the player's inventory
+ Displays messages when the player `EXAMINE`s objects.  

In future it will also handle saving and restoring positions and starting a
new game.

## Entry Points

The game engine is intended to be called from a BASIC program.  It provides the following entry points:

### init_game

This subroutine sets all game state bits and characters to zero, all objects to their initial locations, sets `R%=1` so the player starts off in room 1, displays stock message #0 corresponding to **welcome** and sets the `show_desc` flag to force the room description to be displayed.

### select_room

This subroutine selects the rooms table entry for the current room, given in the BASIC variable `R%`; and expands its light status, exit destinations and the address of its description text from the bit-packed record.

### art_light

This subroutine overrides the dark status of a room **if** the light source  (by convention, object #9)  is active **and** the player is carrying it  (or it is in the current room).

### disp_desc

This subroutine displays the description text for the current room, **or** the **DARK** stock message.

### list_exits

This subroutine, which you might not need to call, lists the directions available from the current room.  All the room descriptions in Birthday Adventure already mention the exits in the text, so this feature is not used here.  A future version of the engine could include the facility for rooms to have an abbreviated description, which will be displayed if a room has been visited previously.

### list_obj

This subroutine lists the objects in the current room, if light is available; or else does nothing.

### get_cmd

This subroutine accepts a command typed by the player and performs some checks on it.  The first word is assumed to be a **verb**, and its index number will be passed back to BASIC through the variable `V%`.  The second word is assumed to be a **modifier** (e.g. an adjective as in `PRESS RED BUTTON` or a preposition as in `SWITCH ON 3`), passed to BASIC as `M%`; and the last word is assumed to be a **noun** which is passed to BASIC as `N%` and probably corresponds directly to an object in the game.  If the command is only two words long, the second word is treated as both the noun and the modifier; i.e., `N% = M%`.  A word is deemed matched as soon as it is matched in full against a listed word without caring to match the full length of the listed word, so words can be abbreviated to the shortest unique form.  There is one list of verbs and a separate list of nouns and modifiers, thus allowing nouns to be aligned as far as possible with objects.

At this stage, built-in commands -- the directions including `BACK`, `LOOK`, `EXAMINE`, `TAKE`, `DROP` and `INVENTORY` -- are tested roughly for feasibility  (for example, you can't `TAKE` an object which is not in the room, and not all objects are able to be picked up and carried)  and any error conditon indicated by setting the value of `E%`.  If the command is a direction, the destination room  (or 0, if there is no exit)  will be in `D%` and its light status in memory location `next_lt`. 

If the verb is on the verb list but not recognised as a built-in one, the command is effectively ignored: the BASIC program will have to deal with it.  Otherwise, a value of 1, corresponding to a **NONSENSE** error, is returned in E%.

The position in memory of the first character of the last word parsed is returned in `I%`, in case you wish to do any extended parsing of your own.  For instance, in a game featuring a telephone, the player might have to `DIAL` some number for a clue or to cause something to happen.  If the player enters `DIAL 6325` then `I%` will contain the location of the figure 6 in the command.  This can be read using the construct `$I%` in BASIC.  (Birthday Adventure does not make use of this.)

By the time the engine returns to BASIC,  `V%`, `M%`, `N%`, `I%`, `D%` and `E%` and the contents of `next_lt` will have been set to appropriate values.  However, `R%` will not have been altered yet, and the locations of any objects being picked up or deposited will not yet have been updated.  All that has happened so far is that it has determined exactly _how_ it is going to proceed once the command is actioned.

### action_cmd

This subroutine first looks at `E%` and determines whether or not an error message is required.  If so, it is displayed.  Otherwise, `V%` is examined and, if the verb is a built-in one, the game state is updated to reflect the actions oreviously determined when `get_cmd` was called.  For a direction, we set `R%` to the value in `D%`, update the light status and set the "show description" flag.  If the command is `LOOK`, we just set the "show description" flag.  If the command is `EXAMINE`, we display the "examine" message for the object. If the command is `TAKE`, we set the object's location to 0  (if the room is lit)  or 255  (if the room is in darkness).  If the command is `DROP`, we set the object's location to `R%`.  And if the command is `INVENTORY`, then we display a list of objects in location 0  (i.e., carried by the player) and the number, if any, of unidentified objects which have been picked up in the dark.

# abengine2.6502

This is an older version of the game engine, with a different implementation of `EXAMINE` messages and using memory locations to pass light status instead of L% and K%.

# What Changed

The "old" way of storing EXAMINE messages was as follows:

0 => no message
10 => message with same number as object
11 + 6 bits => message with given number

The "new" way of storing EXAMINE messages is as follows:

0 => no message
10 + 8 bits => compressed text in object record, at given offset from in_room description
11 + 6 bits => message with given number

When an object is decoded, if the message type is 0, the object examine message address `obj_em_addr` is set to the address of the stock message for "nothing special"; if the message type is 10, then the address is calculated by adding the given offset to `obj_ld_addr`; and if the message type is 11, then `obj_em_addr` is populated with the starting address of the given numbered message.  Thus, whenever the `EXAMINE` command is actioned, the procedure is always the same in any case:  just display the message starting at the address given in `obj_em_addr`.
