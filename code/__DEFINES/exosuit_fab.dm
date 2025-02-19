/// Module is compatible with Security Cyborg models
#define BORG_MODULE_SECURITY 		(1<<0)
/// Module is compatible with Miner Cyborg models
#define BORG_MODULE_MINER			(1<<1)
/// Module is compatible with Janitor Cyborg models
#define BORG_MODULE_JANITOR			(1<<2)
/// Module is compatible with Medical Cyborg models
#define BORG_MODULE_MEDICAL			(1<<3)
/// Module is compatible with Engineering Cyborg models
#define BORG_MODULE_ENGINEERING		(1<<4)
/// Module is compatible with Service Cyborg model
#define BORG_MODULE_SERVICE 		(1<<5)

/// Module is compatible with Ripley Exosuit models
#define EXOSUIT_MODULE_RIPLEY		(1<<0)
/// Module is compatible with Odyseeus Exosuit models
#define EXOSUIT_MODULE_ODYSSEUS		(1<<1)
/// Module is compatible with Firefighter Exosuit models
#define EXOSUIT_MODULE_FIREFIGHTER	(1<<2)
/// Module is compatible with Gygax Exosuit models
#define EXOSUIT_MODULE_GYGAX		(1<<3)
/// Module is compatible with Durand Exosuit models
#define EXOSUIT_MODULE_DURAND		(1<<4)
/// Module is compatible with H.O.N.K Exosuit models
#define EXOSUIT_MODULE_HONK			(1<<5)
/// Module is compatible with Phazon Exosuit models
#define EXOSUIT_MODULE_PHAZON		(1<<6)
/// Module is compatible with Sidewinder Exosuit models
#define EXOSUIT_MODULE_SIDEWINDER	(1<<7)

/// Module is compatible with "Working" Exosuit models - Ripley and Firefighter
#define EXOSUIT_MODULE_WORKING		EXOSUIT_MODULE_RIPLEY | EXOSUIT_MODULE_FIREFIGHTER
/// Module is compatible with "Combat" Exosuit models - Gygax, H.O.N.K, Durand, Phazon, and Sidewinder
#define EXOSUIT_MODULE_COMBAT		EXOSUIT_MODULE_GYGAX | EXOSUIT_MODULE_HONK | EXOSUIT_MODULE_DURAND | EXOSUIT_MODULE_PHAZON | EXOSUIT_MODULE_SIDEWINDER
/// Module is compatible with "Medical" Exosuit modelsm - Odysseus
#define EXOSUIT_MODULE_MEDICAL		EXOSUIT_MODULE_ODYSSEUS
