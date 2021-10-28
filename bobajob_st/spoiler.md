# Bobajob Street

Please bear in mind that this will spoil any enjoyment you may have had from the game.

## The Game World

The game world consists of just 16 rooms (of which one is actually the inside of a sleeping bag). There is a street with three houses, a flat above a shop and a library. Near the library is an alleyway and a grassy knoll from which can be seen the library's 24-hour self-service book deposit machine.

## The Back Story

A crazy old cat lady, a mother of a hyperactive child, a shopkeeper and an ageing hippy have engaged the player, via an unusual employment agency, to perform some simple odd jobs.

## Object of the Game

The object of the game is to perform the following odd jobs:
```
Feed Tiddles
Return library book
Mend leaking pipe
Water pot plant
```

As the player wanders about, it soon becomes obvious that something is not quite right.  Nobody answers when the player knocks on a door.  The houses are unlocked, allowing the player to wander in and out.  The shop and library are closed.  Where is everyone?

The first house has
```
You are in a cluttered room, absoulutely
stuffed with paintings of cats,
photographs of cats, cartoon drawings of
cats and ornaments shaped like cats in
pottery, glass and plastic.
Directions:
 South.
There is a refrigerator here.
There is a blue and white china bowl on
the floor here.
There is a handwritten note here.
There is no sign of a real, live cat
anywhere.
```

The obvious course of action should be `READ NOTE`, which shows the following:

```
It says, in neat copperplate script, 'Be
gentle with Tiddles. He is only a baby.
He loves to be stroked before you give
him his bowl of milk.'
```

A bottle of milk is revealed when the player types `SEARCH FRIDGE`.  The built-in `HELP` suggests for the player to try summoning the cat by typing something like `CALL TIDDLES` or `HERE PUSS`; which produces the following message:

```
An enormous tiger suddenly materialises, apparently out of nowhere!
```

The tiger's behaviour -- looking you up and down; standing away from you, craning its neck towards you to sniff you and suddenly withdrawing its head to think about what it has smelt; looking back and forth between you and its bowl with sad eyes; lying on its back and baring its teeth and extending its claws when stroked, but getting nasty if you try to stroke it while it is drinking its milk -- is based on the author's personal observation of an ordinary domestic cat.  

After `FEED TIGER`, `FEED TIDDLES` or `USE MILK`, the player has limited turns before being accidentally killed by the tiger "playing too rough" as Elvis Presley sang.  The empty milk bottle must be saved for use later in the game; it is possible for the player to create an effective stalemate by leaving the bottle behind and wasting too many turns to be able later to retrieve the bottle and get away from the tiger.

At the second house, nobody is at home.  This house has two rooms.  Upstairs is a child's bedroom with a sleeping bag.  The library book is hidden in there  (the child must have been reading it in bed .....)  and can be found in one of two ways; either using `SEARCH BAG`, or by entering `GET INSIDE BAG`.  It's dark inside the sleeping bag, but `TAKE` on its own  (as in _Birthday Adventure_ or _Philosopher's Quest_)  finds something which is identified as a book when the player goes `BACK` to the room.

Once the player has the book, it must be returned to the library and exchanged for some chewing gum; which is then used to mend the leaking pipe which will be found in flat 3A.

The next building is a newsagent's shop; an alley and a metal staircase give access to a dingy flat above the shop, which  (surprisingly enough)  is unoccupied but has a very obvious leaking pipe.  However, there is no sign of the newsagent, who was supposed to have all the necessary tools and parts.

If the player attempts to `MEND PIPE` at this stage, they will be told:

```
You will need something soft and squidgy
to plug up the hole, and something to
wrap around it while it sets hard.
```

If the player still has the empty milk bottle, they can `FILL BOTTLE` with water from the sink.

The last house contains a pot plant  (in more senses, it is suggested, than just one .....)  which needs to be watered; but, for some reason best left known to the programmer, there is no source of water.

```
You are in a dimly-lit room with
Eastern-influenced wall hangings, old
rock concert posters, record sleeves and
fractal patterns. Wind chimes are
tinkling and there is a heavy scent of
joss sticks in the air.
Directions:
 North.
There is a large plant here in a pot,
with a powerful electric light shining
on it.
There is a small transistor radio here.
```

`EXAMINE PLANT` tells us:

```
It is over a metre tall with spiky
leaves and a pungent scent.
```

`LISTEN RADIO` produces one of the following messages, in turn:

```
It's tuned to an oldies station. The DJ
is playing 'Teddy Bear' by Elvis
Presley.

The DJ is playing a comedy ballad about
a bodger fixing a pipe with chewing gum
and sticking plasters.

It's tuned to an oldies station.
```

The Elvis song is a not-very-useful clue about tigers  (the player may well already have found out the hard way anyway).  The comedy ballad is a more useful clue how to mend the pipe.

In order to be able to `WATER PLANT` and complete the fourth job, the player must have fed Tiddles and refilled the empty milk bottle with water.

The last building in the street proper is the library.  This, too, is closed; but reading the sign on the door will reveal an additional exit from the base of the steps, which leads to a self-service book deposit machine.  Here the player is clued to `SCAN BOOK` to open the depository slot, and `INSERT BOOK` to complete job number two.  The machine also offers a free gift, which turns out to be a stick of chewing gum.  To the `EAST` of the book deposit machine is a grassy knoll; here there is also a first-aid kit, which may be `SEARCH`ed to reveal a sticking plaster and a (useless) empty pill packet.

As soon as the player has visited both the flat and the grassy knoll, an ominous message appears on the newsagent's window:

```
You are outside a small newsagent's
shop. The shop is closed. An alley leads
to the North.
Directions:
 North, East & West
A message has been scrawled in lipstick
across the shop window!
:READ MESSAGE
It says, in blood-red lipstick, 'I'LL BE
BACK AT MIDDAY!'
```

The player can now go to the flat, `CHEW GUM` until it is soft and squidgy, and `MEND PIPE`  (using the soft, squidgy gum to plug up the hole in the pipe and wrapping the sticking plaster around to hold it in place while it sets hard)  to complete the third job.

After completing all four jobs, the player has been led to believe the driver from the agency will return to collect them and the game is won .....  But instead, an extra job is discovered on the reverse of the list:

```
Defeat the crazed chainsaw-wielding serial killer who has been terrorising the villagers
```

The killer starts from the grassy knoll and chases the player down. If the killer is in the same room as the player, he will miss on the first turn but succeed on the second, and the game is over.

To complete the game, the player has to return to the child's bedroom and `GET INSIDE BAG`.  The killer will chase the player down and attempt to cut them out of the sleeping bag; whereupon the chainsaw will snag on the polyester fibres, which will melt, gum up the chain and stop the engine with a loud BANG.*  Now disarmed, the killer panics and runs away.  The closing message tells what happened while the player was inside the sleeping bag:

```
A police officer explains how the killer
ran away and tried to hide inside Mrs
Partridge's house, where Tiddles was
found playing with him! Mr French the
newsagent recognised the killer as his
tenant! Young Bobby Turtledove now has
an excuse to tidy his bedroom. There is
no sign of Mr Colley anywhere .....
```

## Ways to Die

The player can be killed by the tiger, if they try to stroke it while it is drinking its milk or if it finishes its milk.  It is also possible to make the game unwinnable by leaving the empty bottle behind and not having sufficient turns available to retrieve it.  After this task is done, everything is fairly benign until all the initial tasks have been completed; then there is a possibility of being chopped to pieces by the evil chainsaw-wielding maniac.

## Clues and trivia

+ The list of jobs must be read to show notifications of tasks completed.
+ The note gives some important information about Tiddles.
+ There are two ways to get the book: the player can either get inside the bag and find it, or `SEARCH BAG`.
+ `EXAMINE BOOK` reveals a barcode, as well as providing a clue about chainsaws and sleeping bags.
+ The responses to `MEND PIPE` without the necessary items, and the radio in house #4, provide clues how to deal with the pipe.
+ Refilling the bottle is a reference to the original _Colossal Cave_ adventure.  (It's also an example of a polystate object!)
+ `EXAMINE MACHINE` reveals a barcode scanner, and `SCAN` is suggested as a verb in one of the generic `HELP` messages, so the player knows how to complete task 2.
+ The grassy knoll is a reference to the assassination of John F. Kennedy.


```
* While this is believed to work, the author does not recommend testing it.  No responsibility is accepted for any damage occurring to your chainsaw, your sleeping bag or yourself.
 ```
