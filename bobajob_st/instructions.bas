   10DIMT$(7),G$(7):FORI%=1TO7:T$(I%)=CHR$(I%OR128):G$(I%)=CHR$(I%OR144):NEXTI%
   20N$=CHR$157:O$=CHR$156
   30ENVELOPE1,1,1,-1,1,1,2,1,127,0,0,-16,126,126
   40ONERRORGOTO3800
   50MODE7:VDU31,0,8:PROClogo
   60PRINT''"Press ESCAPE to skip introduction."
   70K%=INKEY500:CLS
  100VDU12,31,0,1,141,8,10,141,31,13,1:PRINT"BOBAJOB STREET":VDU31,13,2:PRINT"BOBAJOB STREET"
  110C$=CHR$134:G$=CHR$130:W$=CHR$135
  120PRINT
  130PRINT"Since your cake-baking efforts in the"'"last game BIRTHDAY ADVENTURE, job offersfor soldiers of fortune have become a"'"little thin on the ground, and you"
  140PRINT"have found yourself resorting to an"'"employment agency which specialises in"'"consolidating tiny jobs in the same areafor someone to do."
  150PRINT
  160PRINT"As soon as there is a full day's worth"'"of jobs for you to do, the agency will"'"send a driver to give you your list of"'"jobs and take you to the work site."
  170PRINT
  180PRINT"You will be collected once you have had"'"enough time to finish all the jobs on"'"the list."
  190PRINT
  200PROCmore
  210PRINT
  220PRINT"You must enter simple commands to move"'"around locations and manipulate objects"'"to complete tasks."
  230PRINT
  240PRINT"Commands may be a single word, such as"'"a direction:"C$"NORTH, SOUTH, UP"W$"(you can"'"abbreviate directions), or other single"
  250PRINT"word commands such as"C$"INVENTORY"W$"(I) to"'"list what you are carrying, or"C$"HELP"'"if you get stuck."
  260PRINT
  270PRINT"You can"C$"SAVE"W$"your progress in the game"'"to"C$"RESTORE"W$"later, or"C$"RESTART"W$"from the"'"beginning, if you get hopelessly lost."
  280PRINT
  290PRINT"To repeat a room description, press"'G$"RETURN"W$"on its own with no command."
  300PRINT
  310PROCmore
  320PRINT
  330PRINT"To interact with objects, use commands"'"of the form"C$"VERB"G$"NOUN"W$". Many objects"'"can be"C$"TAKE"W$"n and"C$"DROP"W$"ped. If you type"
  340PRINTC$"TAKE"W$"without a noun, you will pick up"'"the nearest object (as in the order of"'"listing)."
  350PRINT:REMCHR$134;"TAKE BOOK";CHR$135;",";CHR$134;"LISTEN RADIO";CHR$135;",";CHR$134;"DROP KEY"
  360PRINT"Rarely, you might need a three-word"'"command, such as"C$"TAKE 13MM SPANNER"W$"or"'C$"GET INSIDE BOX"W$"."
  370PRINT
  380PRINT"Some useful commands are"C$"SEARCH"G$"OBJECT"'"which may reveal objects hidden inside"'"other objects, and"C$"EXAMINE"G$"OBJECT"W$"which"
  390PRINT"may give additional information."
  400PRINT
  410PROCmore
  420CLS
  430PRINTTAB(0,11);"Keep watching for a clue or press"'"ESCAPE to start game.";
  440PRINTTAB(0,24);:K%=INKEY1000
 3000CLS
 3001REMFORI%=1TO3:SOUND1,1,100,20:SOUND1,0,100,20:SOUND1,1,100,20:SOUND1,0,100,140:REPEATUNTILADVAL-6>12:NEXTI%
 3002PROCring
 3005PRINT
 3010PROCbt(0,1,22)
 3020PROCb(0,1,3,22,"Hello, Bobajob Agency?")
 3030PROCbb(0,1,22)
 3040PROCbt(7,6,27)
 3050PROCb(7,6,4,27,"It's Mrs. Partridge. Could you send someone around who is very good with baby animals, to feed Tiddles his bowl of milk?")
 3060PROCbb(7,6,27)
 3070PROCbt(0,1,22)
 3080PROCb(0,1,3,22,"I'm sure we can find someone suitable.")
 3090PROCbb(0,1,22)
 3100PROCbt(24,6,10)
 3110PROCb(24,6,4,10,"Thank you!")
 3120PROCbb(24,6,10)
 3130PRINT''':K$=INKEY$1000
 3140PROCring
 3200PROCbt(0,1,22):PROCb(0,1,3,22,"Hello, Bobajob Agency?"):PROCbb(0,1,22)
 3210PROCbt(6,3,28)
 3220PROCb(6,3,5,28,"It's Mrs Turtledove. I need someone to-")
 3230PROCbr(6,3,5,28,"STOP THAT!")
 3240PROCb(6,3,5,28,"take a book back to the library for me. I'm a bit busy with")
 3250PROCbr(6,3,5,28,"LEAVE IT ALONE!")
 3260PROCb(6,3,5,28,"kids at the moment.")
 3270PROCbb(6,3,28)
 3280PROCbt(0,1,22)
 3290PROCb(0,1,3,22,"That shouldn't be too much trouble at all.")
 3300PROCbb(0,1,22)
 3310PROCbt(24,3,10):PROCb(24,3,5,10,"Thank you!"):PROCbb(24,3,10)
 3320PRINT'':K$=INKEY$1000
 3330PROCring
 3400PROCbt(0,1,22):PROCb(0,1,3,22,"Hello, Bobajob Agency?"):PROCbb(0,1,22)
 3410PROCbt(7,4,27)
 3420PROCb(7,4,7,27,"This is Mr French, the newsagent. There's a leaking pipe in the flat above my shop. Could you send someone round to have a look at it, please?")
 3430PROCbb(7,4,27)
 3440PROCbt(0,1,22)
 3450PROCb(0,1,3,22,"I'll find you somebody with a bit of plumbing experience.")
 3460PROCbb(0,1,22)
 3470PROCbt(23,4,11)
 3480PROCb(23,4,7,11,"Fantastic! Toodle-pip!")
 3490PROCbb(23,4,11)
 3500PRINT'':K$=INKEY$1000
 3510PROCring
 3600PROCbt(0,1,22):PROCb(0,1,3,22,"Hello, Bobajob Agency?"):PROCbb(0,1,22)
 3610PROCbt(8,5,26)
 3620PROCb(8,5,4,26,"This is Mr Colley. Is there any chance you could send somebody around to water my pot plant?")
 3625PROCb(8,5,4,26,"")
 3630PROCb(8,5,4,26,"It's quite valuable.")
 3640PROCbb(8,5,26)
 3650PROCbt(0,1,22)
 3660PROCb(0,1,3,22,"We have people on our books who know all about plants.")
 3670PROCbb(0,1,22)
 3680PROCbt(22,5,12)
 3690PROCb(22,5,4,12,"Groovy, man!")
 3700PROCbb(22,5,12)
 3710PRINT''':K$=INKEY$1000
 3720GOTO3820
 3800REPORT:PRINT" at line ";ERL
 3810IFERR<>17END
 3820CHAIN"BOBAJOB"
10000DEFPROClogo
10010VDU151:PRINTSTRING$(39,"|");
10020VDU151,255,46,120:PRINTSTRING$(33,"|");:VDU116,45,255
10030VDU151,255,106,125,32,52,107,39,120,50,109,32,52,107,39,120,50,111,255,52,104,39,120,50,109,32,52,107,255,255,33,124,114,117,52,104,122,255,53,255
10040VDU151,255,106,255,32,52,107,48,111,37,122,32,52,107,32,115,49,106,47,53,106,48,111,37,122,32,52,107,255,255,45,124,34,255,113,114,63,111,53,255
10050VDU151,255,114,109,124,124,255,255,124,126,125,124,124,255,124,255,125,126,116,113,126,255,124,126,125,124,124,255,255,255,125,124,126,255,255,255,125,62,113,255
10060VDU151,255,126:PRINTSTRING$(35,"|");:VDU125,255
10070ENDPROC
10100DEFPROCmore
10110LOCALK$
10120PRINT"Press any key for more.";
10130K$=GET$
10140CLS
10150ENDPROC
10205L$=""
11700DEFPROCring
11710LOCALI%:FORI%=1TO25:PRINT:NEXTI%
11720FORI%=1TO1:SOUND1,1,100,20:SOUND1,0,100,20:SOUND1,1,100,20:SOUND1,0,100,140:REPEATUNTILADVAL-6>12ORI%>2:NEXTI%
11730ENDPROC
11800DEFPROCbl(L%,B%,F%,W%,A$)
11810PRINTSTRING$(L%," ");T$(B%)N$T$(F%)LEFT$(A$+STRING$(W%," "),W%)"  "O$;:IFPOS>0PRINT
11820ENDPROC
11830DEFPROCbt(L%,B%,W%)
11840PRINTSTRING$(L%," ");G$(B%)"_"STRING$(W%+2,"|")"0";:IFPOS>0PRINT
11850ENDPROC
11860DEFPROCbb(L%,B%,W%)
11870PRINTSTRING$(L%," ");G$(B%)""""STRING$(W%+2,"/")"!";:IFPOS>0PRINT
11880ENDPROC
11890DEFPROCbr(L%,B%,F%,W%,A$)
11900PRINTSTRING$(L%," ");T$(B%)N$T$(F%)RIGHT$(STRING$(W%," ")+A$,W%)"  "O$;:IFPOS>0PRINT
11910ENDPROC
12000DEFPROCb(L%,B%,F%,W%,A$)
12010LOCALM%,C%,P%,W$,L$:M%=&900:$M%=A$:L$="":W$=""
12030REPEAT
12040REPEAT
12050REPEAT
12060C%=?M%:M%=M%+1
12070IFC%>32W$=W$+CHR$C%
12080UNTILC%<=32
12090IFL$>""L$=L$+" "
12100IFLENL$+LENW$<=W%L$=L$+W$:W$=""
12110UNTILC%=13ORLENL$+LENW$>W%
12120PROCbl(L%,B%,F%,W%,L$)
12130L$=W$:W$=""
12140UNTILC%=13
12150IFL$>""PROCbl(L%,B%,F%,W%,L$)
12160ENDPROC
