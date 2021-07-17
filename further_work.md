# SAVE and RESTORE

Add `SAVE` and `RESTORE` commands as built-ins.  BASIC program must poke any cheeky variables it is using into state registers before calling `action_cmd` to
SAVE a position.  Can then use OSFILE to write out the game state to a save file.  When RESTOREing a position, the reverse operation must be done after
`action_cmd` returns.

# SEARCH as built-in

Since the behaviour of `SEARCH` is consistent, consider adding it as a built-in command.  A table would indicate object to search (i.e. `N%`), room where
command is valid (when searching a non-carryable object; or 0, meaning the object must be available, i.e. carried or in room), object to release and controlling
game state bit  (which must be 0 to release the object, and will change to 1 afterwards).  Could be bit-packed to take advantage of a space saving for carryable
objects, and this would also make it easy to allow the release of multiple objects in a single SEARCH (or not release an object but do update state bit).



