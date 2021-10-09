# Bobajob Street

Bobajob Street is a simple adventure implemented using the AdveBuilder engine.  The game is set in 15 (or maybe 16) rooms.

Being a soldier of fortune, living a life of adventure and making new friends wherever you go _sounds_ romantic; but the ugly truth is, people are simply not prepared to pay for your services.  When they even bother to offer you a share of the treasure, they expect you to take outrageous risks and be grateful for the experience and the exposure.  In desperation, you have signed up with a strange employment agency in a building you did not know existed, on a street you have never walked down before; and now you have the following list of apparently simple tasks:
```
Feed Tiddles
Return library book
Mend leaking pipe
Water pot plant
```
Good, honest, old-fashioned odd jobs for the odd bob.  Surely nothing can go wrong?  Nothing on that list sounds dangerous; and in any case, the old cat lady, the nice young family, the shopkeeper and the softly-spoken gentleman with the long, grey hair will be there to show you where to find everything .....

Of course, nothing is as it seems.  It wouldn't be much of an adventure if it was!  But where is everybody, and how will you fix that pipe without any proper plumbing tools?  And can it really be as simple as all that?

Bobajob Street was written to test polystate objects, and also introduce the ideas of "container" objects and non-player characters.  It ended up taking a darker turn  ;)


## Container Logic

The sleeping bag  (where the book is initially hidden)  functions as a container.  It can be picked up and carried  (at least within the house)  and also functions as a visitable room.  Objects dropped inside the sleeping bag can be found by `SEARCH`ing it.  It's dark inside the bag, though, so you will not be able to see what you are picking up .....

## Non-Player Characters

Tiddles turns out not to be an ordinary domestic cat, but a large tiger!  The tiger is fairly benign, until he has had his breakfast .....

At the end of the game, a final task is revealed:  Defeat the crazed chainsaw-wielding serial killer who has been terrorising the villagers!  The killer begins from a grassy knoll near the self-service book deposit machine outside the library and chases the player down mercilessly.  The player must hide in the one place a chainsaw cannot cut, and hope the killer does not know .....

