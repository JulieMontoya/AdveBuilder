# BIRTHDAY ADVENTURE

Please bear in mind that this will spoil any enjoyment you may have had from the game.

## The Game World

The game world consists of just 8 rooms.  These are a white room, a kitchen, a blue room, a room with bare brick walls, the top of a
ladder, a dark loft space, a back yard and a tiny henhouse which is also dark.

## Object of the Game

The object of the game is to bake a birthday cake.  This will require the player to collect some ingredients  (an instant cake mix and an egg)  and equipment
(baking tins)  as well as arranging an energy supply  (by finding a coin and inserting it into a gas meter).  Some locations are dark, and the player must
locate a suitable light source to visit them without risking a fatal fall.

(This is analogous to the classic adventure game concept where the player has to collect several treasures, bring them to a certain location and say a magic word to
complete the game; the cake mix, egg and baking tins are the "treasures" that must be collected and brought to the kitchen, and the "magic word" is the command
`BAKE CAKE`.)

## Ways to Die

The player must avoid being pecked to death by a vicious mother hen, having the flesh eaten off their bones by dripping acid or falling and breaking their neck in
the dark.

## At the Start

The player begins in the white room and can reach the kitchen, blue room, backyard and henhouse.  

Rudimentary in-game assistance is provided by a `HELP` command; which generally just suggests `SEARCH`ing or `EXAMINE`ing things, but is also used to telegraph
specific parts of the solution path to the player: in a room where `SEARCH`ing something reveals an object, if the search has not yet been performed, `SEARCH` is
suggested as a generic response.

Discoveries can be made by `SEARCH`ing furniture mentioned in the descriptions.  In the kitchen, `SEARCH CUPBOARD` reveals a bag of bird seed and an instant cake
mix.  If the latter is `EXAMINE`d, the player will see:

```
Instant cake mix. Add one egg. Divide
mix evenly between two cake tins and
bake 15 minutes at no. 4.
```

This should indicate the steps towards the final goal:  the player needs to locate an egg and some baking tins.  It's not unreasonable for the player to suppose that an egg is likely to be found in a henhouse.  However, this particular henhouse is dark, and any attempt to `TAKE` what is in there results in a suitably gory
ending:

```
You try to grab something in the dark,
but then some enormous angry creature
lunges at you and pecks you to death!
Game over!
```

## Seek and Ye Shall Find

`SEARCH CUPBOARD` in the kitchen reveals two items: a bag of bird seed and a pack of instant cake mix  (the first of several items needed to complete the
game).

`SEARCH SOFA` in the blue room reveals a pound coin between the cushions.  What could be the purpose of the coin?  It _must_ do something useful, otherwise the
author of the game would not have felt the need to hide it .....

`SEARCH CUPBOARD` in the white room reveals that the cupboard is concealing a gas meter.  `EXAMINE METER` further shows that it is of the coin-operated type,
and requires a coin to be inserted to enable the gas supply.  This must be done before the final command will succeed.

## Puzzle One: the Dripping Acid

The doorway South from the white room, linking it to the bare brick room, has a strange liquid dripping from the lintel and into a drainage trough in the floor.
As the player will soon learn, this is a deadly corrosive acid.

```
The liquid must be some sort of acid! It
eats into your flesh ..... You are dead!
Game over!
```

To proceed past the acid, the player requires some protection.  In the kitchen is a colourful umbrella.  If the player picks up the umbrella and tries to pass
through the acid, a slightly different final message is displayed:

```
The dripping acid eats into your
flesh..... You notice, just before you
die, that it is taking a while to eat
through the fabric of the folded
umbrella.
Game over!
```

It is of course necessary to `OPEN UMBRELLA` before going South from the white room.

## Puzzle Two: Trapped

The umbrella having been destroyed by the acid, the player is now trapped in the white room.  There is a ladder which can be climbed, but the only room
accessible from there is dark, and any direction save `BACK` results in a grisly ending:

```
You stumble in the dark and break your
neck!
Game over!
```

The in-game HELP system will already have clued the player to the fact that `TAKE` without a noun will pick up the first object found.  And this is in fact the
key to solving this puzzle.  `TAKE` in the dark loft area picks up an unidentified object.  When the player returns into the light, it is revealed to be a small
plastic tube, which can be `EXAMINE`d:

```
The tube is made of soft translucent
white plastic. It contains a liquid and
a small glass vial. There is some faint
text embossed into it: 'B.N. TO
.C.I.A.E'
```

In case it is still not obvious that this is a glowstick of the type beloved by ravers, attempting to `SHAKE` the tube produces this message:

```
You shake the tube, but the glass vial
inside does not break.
```

It is hoped that the player will then try `BEND TUBE` to produce this message:

```
You bend the tube and the glass vial
inside bursts. The chemicals mix and
react. It is now giving off a yellowish
glow.
```

_If the player has not solved this puzzle within a certain number of moves, a clue is automatically given:_

```
You hear something! It sounds like your
own voice, coming from very far away:
'I don't know if you can hear this, but
this is me from the future. If you are
still stuck, you need to use TAKE on its
own.'
```

Now the player has a light source, and will be able to see in the loft area a pair of baking tins  (which the player must `TAKE` to complete the game)  and an
exit, with a last hint that the player had better make sure to collect everything they need as there will be no return.  The return path, including landing on
the sofa in the blue room, might provide an additional hint to the player to try `SEARCH`ing the sofa if they have not done so already.

_If the clue was given, a gratuitous message is displayed on the first turn_ after _landing on the sofa:_

```
Suddenly, a swirling time vortex opens
before you! You feel a strange
compulsion to shout into it:
'I don't know if you can hear this, but
this is me from the future. If you are
still stuck, you need to use TAKE on its
own.'
The time vortex closes as suddenly as it
opened, and you snap back to normal.
```

_To avoid creating unnecessary parallel universes, which might lead to stability problems in the event of improbability leaks, this is not displayed if the player managed to work out how to get the glowstick before the clue was deemed necessary._

## Puzzle Three: The Killer Hen

Now the player has a light source, the hen house can be revisited, and the vicious monster revealed as a mother hen being over-protective with an egg.  As a
reward for the hard work of finding and activating a light source (!), attempting to `TAKE` the egg is no longer fatal; just unsuccessful:

```
She won't let you get near enough to do
that!
```

(Let this stand as a piece of advice to game developers:  Remember that puzzles are intended to be solved.  Early deaths are fine, but try to avoid killing the
player off once they have made a certain amount of progress.)

As suggested by in-game HELP, `DROP`ping the bag of bird seed  (found in the kitchen cupboard; you might have to go `BACK` and `SEARCH` for it)  in the henhouse
distracts the mother hen, allowing the player to take the egg.

## The Final Act: BAKE CAKE

To complete the game, the player must return to the kitchen and enter the command `BAKE CAKE`.  If the player is not carrying the egg, cake mix and baking tins,
they must be present in the room; and the coin must have been inserted in the gas meter.

If any of the egg, cake mix or baking tins are absent, this message is displayed:

```
You are missing something important!
```

The player is expected at least to have found the cake mix  (and indeed must certainly have done so if they have already obtained the egg, since the cake mix
is found along with the bird seed that must be deployed as a distraction before the egg can be taken)  and so be able to work out what else they need .....

If the ingredients and tins are present and correct but the meter has not yet been fed, this is displayed instead:

```
The ignition sparks, but the oven will
not light!'
```

Only if the player has the cake mix, egg, baking tins, and the coin is inserted in the meter, is the winning text displayed:

```
Congratulations! You baked a beautiful
birthday cake!
Game over!
```

# Complete Solution

```
W
TAKE UMBRELLA
E
OPEN UMBRELLA
S
(now the umbrella is destroyed)
U
W
TAKE
(you grab something but can't see what it is)
BACK
INVENTORY
EXAMINE TUBE
BEND TUBE
(it's a raver's glowstick)
W
TAKE TINS
(you will need them)
D
SEARCH SOFA
(there is a coin between the cushions)
TAKE COIN
N
SEARCH CUPBOARD
(for some useful stuff)
TAKE SEED
W
S
DROP SEED
(this will keep the vicious hen busy)
TAKE EGG
BACK
E
E
SEARCH CUPBOARD
(there's a gas meter inside it)
INSERT COIN
(now you have gas)
W
BAKE CAKE
```

