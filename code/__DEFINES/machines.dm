// These are indexes in a list, and indexes for "dynamic" and static channels should be kept contiguous
#define AREA_USAGE_EQUIP 1
#define AREA_USAGE_LIGHT 2
#define AREA_USAGE_ENVIRON 3
#define AREA_USAGE_TOTAL 4
#define AREA_USAGE_STATIC_EQUIP 5
#define AREA_USAGE_STATIC_LIGHT	6
#define AREA_USAGE_STATIC_ENVIRON 7
#define AREA_USAGE_LEN AREA_USAGE_STATIC_ENVIRON // largest idx
/// Index of the first dynamic usage channel
#define AREA_USAGE_DYNAMIC_START AREA_USAGE_EQUIP
/// Index of the last dynamic usage channel
#define AREA_USAGE_DYNAMIC_END AREA_USAGE_ENVIRON
/// Index of the first static usage channel
#define AREA_USAGE_STATIC_START AREA_USAGE_STATIC_EQUIP
/// Index of the last static usage channel
#define AREA_USAGE_STATIC_END AREA_USAGE_STATIC_ENVIRON

//Power use
#define NO_POWER_USE 0
#define IDLE_POWER_USE 1
#define ACTIVE_POWER_USE 2


//bitflags for door switches.
#define OPEN	(1<<0)
#define IDSCAN	(1<<1)
#define BOLTS	(1<<2)
#define SHOCK	(1<<3)
#define SAFE	(1<<4)

//used in design to specify which machine can build it
#define IMPRINTER		(1<<0)	//For circuits. Uses glass/chemicals.
#define PROTOLATHE		(1<<1)	//New stuff. Uses glass/metal/chemicals
#define AUTOLATHE		(1<<2)	//Uses glass/metal only.
#define CRAFTLATHE		(1<<3)	//Uses fuck if I know. For use eventually.
#define MECHFAB			(1<<4) 	//Remember, objects utilising this flag should have construction_time and construction_cost vars.
#define BIOGENERATOR	(1<<5) 	//Uses biomass
#define LIMBGROWER		(1<<6) 	//Uses synthetic flesh
#define SMELTER			(1<<7) 	//uses various minerals
#define NANITE_COMPILER  (1<<8) //Prints nanite disks
#define RACK_CREATOR 	(1<<9) //For AI non-physical AI hardware. (RAM expansions)
//Note: More than one of these can be added to a design but imprinter and lathe designs are incompatable.

//Modular computer/NTNet defines

//Modular computer part defines
#define MC_CPU "CPU"
#define MC_HDD "HDD"
#define MC_SDD "SDD"
#define MC_CARD "CARD"
#define MC_CARD2 "CARD2"
#define MC_NET "NET"
#define MC_PRINT "PRINT"
#define MC_CELL "CELL"
#define MC_CHARGE "CHARGE"
#define MC_AI "AI"
#define MC_SENSORS "SENSORS"

//NTNet stuff, for modular computers
									// NTNet module-configuration values. Do not change these. If you need to add another use larger number (5..6..7 etc)
#define NTNET_SOFTWAREDOWNLOAD 1 	// Downloads of software from NTNet
#define NTNET_PEERTOPEER 2			// P2P transfers of files between devices
#define NTNET_COMMUNICATION 3		// Communication (messaging)
#define NTNET_SYSTEMCONTROL 4		// Control of various systems, RCon, air alarm control, etc.

//NTNet transfer speeds, used when downloading/uploading a file/program.
#define NTNETSPEED_LOWSIGNAL 0.5	// GQ/s transfer speed when the device is wirelessly connected and on Low signal
#define NTNETSPEED_HIGHSIGNAL 1	// GQ/s transfer speed when the device is wirelessly connected and on High signal
#define NTNETSPEED_ETHERNET 3		// GQ/s transfer speed when the device is using wired connection

//Caps for NTNet logging. Less than 10 would make logging useless anyway, more than 500 may make the log browser too laggy. Defaults to 100 unless user changes it.
#define MAX_NTNET_LOGS 300
#define MIN_NTNET_LOGS 10

//Program bitflags
#define PROGRAM_ALL			(~0)
#define PROGRAM_CONSOLE		(1<<0)
#define PROGRAM_LAPTOP		(1<<1)
#define PROGRAM_TABLET		(1<<2)
#define PROGRAM_PHONE		(1<<3)
#define PROGRAM_PDA			(1<<4)
#define PROGRAM_TELESCREEN	(1<<5)
#define PROGRAM_INTEGRATED	(1<<6)

#define PROGRAM_PORTABLE PROGRAM_LAPTOP | PROGRAM_TABLET | PROGRAM_PHONE | PROGRAM_PDA
#define PROGRAM_STATIONARY PROGRAM_CONSOLE | PROGRAM_TELESCREEN

//Program states
#define PROGRAM_STATE_KILLED 0
#define PROGRAM_STATE_BACKGROUND 1
#define PROGRAM_STATE_ACTIVE 2
//Program categories
#define PROGRAM_CATEGORY_CMD "Command"
#define PROGRAM_CATEGORY_SEC "Security"
#define PROGRAM_CATEGORY_ENGI "Engineering"
#define PROGRAM_CATEGORY_SCI "Science"
#define PROGRAM_CATEGORY_MED "Medical"
#define PROGRAM_CATEGORY_SUPL "Supply"
#define PROGRAM_CATEGORY_MISC "Other"

#define FIREDOOR_OPEN 1
#define FIREDOOR_CLOSED 2



// These are used by supermatter and supermatter monitor program, mostly for UI updating purposes. Higher should always be worse!
#define SUPERMATTER_ERROR -1		// Unknown status, shouldn't happen but just in case.
#define SUPERMATTER_INACTIVE 0		// No or minimal energy
#define SUPERMATTER_NORMAL 1		// Normal operation
#define SUPERMATTER_NOTIFY 2		// Ambient temp > 80% of CRITICAL_TEMPERATURE
#define SUPERMATTER_WARNING 3		// Ambient temp > CRITICAL_TEMPERATURE OR integrity damaged
#define SUPERMATTER_DANGER 4		// Integrity < 50%
#define SUPERMATTER_EMERGENCY 5		// Integrity < 25%
#define SUPERMATTER_DELAMINATING 6	// Pretty obvious.

#define HYPERTORUS_INACTIVE 0		// No or minimal energy
#define HYPERTORUS_NOMINAL 1		// Normal operation
#define HYPERTORUS_WARNING 2		// Integrity damaged
#define HYPERTORUS_DANGER 3			// Integrity < 50%
#define HYPERTORUS_EMERGENCY 4		// Integrity < 25%
#define HYPERTORUS_MELTING 5		// Pretty obvious.

//Nuclear bomb stuff
#define NUKESTATE_INTACT		5
#define NUKESTATE_UNSCREWED		4
#define NUKESTATE_PANEL_REMOVED		3
#define NUKESTATE_WELDED		2
#define NUKESTATE_CORE_EXPOSED	1
#define NUKESTATE_CORE_REMOVED	0

#define NUKEUI_AWAIT_DISK 0
#define NUKEUI_AWAIT_CODE 1
#define NUKEUI_AWAIT_TIMER 2
#define NUKEUI_AWAIT_ARM 3
#define NUKEUI_TIMING 4
#define NUKEUI_EXPLODED 5

#define NUKE_OFF_LOCKED		0
#define NUKE_OFF_UNLOCKED	1
#define NUKE_ON_TIMING		2
#define NUKE_ON_EXPLODING	3

#define MACHINE_NOT_ELECTRIFIED 0
#define MACHINE_ELECTRIFIED_PERMANENT -1
#define MACHINE_DEFAULT_ELECTRIFY_TIME 30

//cloning defines. These are flags.
#define CLONING_SUCCESS (1<<0)
#define CLONING_DELETE_RECORD (1<<1)


#define CLICKSOUND_INTERVAL (0.1 SECONDS)	//clicky noises, how much time needed in between clicks on the machine for the sound to play on click again.
