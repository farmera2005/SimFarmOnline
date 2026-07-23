SimFarm DOS
Last Minute Information
September 1, 1993
-----------------------------

COPY PROTECTION:
---------------
SimFarm is NOT copy protected.  Please, please, oh pretty please do not give 
away copies of SimFarm to your friends.  Heck, don't give copies to your 
enemies either.  Illegal copies do terrible things to wholesome software 
companies like us, and will make us raise our prices.  Besides, if we find out 
you gave away an illegal copy of SimFarm, we'll tell your mother.  THEN you'll 
be in BIG trouble...


SOUND CARDS:
-----------
SimFarm works with a whole bunch of sound cards.  If you didn't see your sound 
card listed in the Install program, try selecting Sound Blaster 2.0.  Most 
cards on the market these days are Sound Blaster compatible.

To change the sound card settings easily, use the INSTALL.EXE program located 
in the SimFarm directory.  If you're familiar with editing text files, you may 
edit the SIMFARM.CFG configuration file directly.  Instructions are later in 
this file.

SimFarm uses Miles Drivers for sound card compatibility.  The Miles Drivers 
are external sound card drivers that give us versatile sound card support 
without having to change the SimFarm program itself.  You can see the drivers 
listed in the SIMFARM\SOUND sub directory.  They are the files with ".ADV" 
extensions.  As more sound cards become available, we will try to provide 
Miles Drivers for them.  Call our Tech Support Hotline or check our Tech 
Support BBS for information about the latest available drivers.

If you are low on free memory (conventional RAM), use the INSTALL.EXE to 
reconfigure SimFarm to have "No Sound" and "No Music." 


MOUSE DRIVERS:
-------------
SimFarm requires a Microsoft Compatible Mouse.  Older mouse drivers are not 
recommended.  Please contact the manufacturer of your mouse to receive the 
latest driver.


SIMFARM.CFG FILE FORMAT:
-----------------------
This is a standard ASCII text file that tells SimFarm what type of graphics, 
sound and music to use on your computer. Here's a sample SIMFARM.CFG file, 
with an explanation below.

V
.\SOUND\SBFM.ADV
220
7
1
*
NO_SOUND
*
*
*
*

Line 1:
Video Mode. Choose:
	E - EGA Hi-Res Color (640x350 16 Color)
	V - VGA Hi-Res Color (640x480 16 Color)

Line 2:
Miles Driver for MUSIC (MIDI).  Choose:
	ADLIB.ADV - Original Ad Lib
	SBFM.ADV - Sound Blaster V1.5 or V2.0
	SBP1FM.ADV - Older Sound Blaster Pro
	SBP2FM.ADV - Newer Sound Blaster Pro, Sound Blaster-16
	PASFM.ADV - Pro Audio Spectrum Plus
	PASOPL.ADV - Pro Audio Spectrum 16
	PCSPKR.ADV - Internal PC Speaker (Yuck!)
	TANDY.ADV - Tandy Built-in Sound
	GMT32MPU.ADV - Roland MT-32, LAPC-1
	MT32MPU - Roland MPU-401 General MIDI - Any sound card or MIDI sound 
source that emulates an MPU-401 and uses General MIDI instrument mapping can 
use this driver (ex: Roland Sound Canvas, SCC-1, Wave Blaster)
	NO_MUSIC - Disables all music

(The Miles Drivers are located in the DATA sub directory, so be sure to enter 
the path.  See the example SIMFARM.CFG above.)

Line 3:
Port Address for Sound Card.  Must be in HEX (ex: Sound Blaster is usually 
220).  "*" means default.

Line 4:
Interrupt (INT) for Sound Card.  Must be in Decimal (ex: Sound Blaster is 
usually 7).  "*" means default.

Line 5:
DMA Channel for Sound Card.  Must be in Decimal (ex: Sound Blaster is usually 
1).  "*" means default.

Line 6:
DRQ for Sound Card.  Must be in Decimal.  "*" means default.

Line 7:
Miles Driver for SOUND EFFECTS (Digital Audio). Choose:
	SBDIG.ADV  - Sound Blaster V1.5 or V2.0
	SBPDIG.ADV - Sound Blaster Pro, Sound Blaster-16
	PASDIG.ADV - Pro Audio Spectrum
	ALGDIG - Ad Lib Gold
	NO_SOUND - Disables all sound effects.

Lines 8, 9, 10 and 11 have the same properties as lines 3, 4, 5 and 6, but for 
the sound effects card. (Usually the same as the music card, unless you have a 
real fancy-shmancy setup.)



