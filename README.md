# AdveBuilder

Create text adventure games for the BBC Micro, from an SQLite3 database using
host-side tools and a 6502 cross assembler such as BeebAsm.

# birthday_adv

Birthday Adventure is a simple game created using the AdveBuilder engine,
more as a proof of concept than a serious game  (although it is actually
quite playable).  Note that this repository necessarily contains spoilers!
It's hard to talk about how a game was made, without giving away information
that would spoil the fun.  So here is a link straight to the disc image
[birthday_adv.ssd](https://github.com/JulieMontoya/AdveBuilder/blob/main/birthday_adv/birthday_adv.ssd)
so you can play it now and solve it on your own without seeing anything you
don't want to.

You can also [play in a web browser](https://earthshod.co.uk/~julie/jsbeeb/?disc1=birthday_adv.ssd&autoboot)
powered by the excellent [JSBeeb emulator](https://github.com/mattgodbolt/jsbeeb).

# bobajob_st

Bobajob Street is another game created using the AdveBuilder engine,
again more as a proof of concept than much else.  This introduces a true
polystate object, containers and non-player characters, and has more
rooms than Birthday Adventure -- though the map will still fit on a single
sheet of A4 if you use it in Landscape mode!

The object of the game is to do some odd jobs to earn a few bob.

This version was rushed out in time for Hallowe'en .....

Disc image link  (for your own real or emulated BBC micro or Acorn Electron):
[bobajob_street.ssd](https://github.com/JulieMontoya/AdveBuilder/raw/main/bobajob_st/bobajob_street.ssd)

Play in web browser, powered by JSBeeb:
[play in web browser](https://earthshod.co.uk/~julie/jsbeeb/?disc1=bobajob_street.ssd&autoboot)

# src

BeebAsm source code for the AdveBuilder game engine.

# scripts

Perl and shell scripts for working with the SQLite3 database on the host.

