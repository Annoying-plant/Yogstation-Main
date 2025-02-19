/*ALL DEFINES RELATED TO CONSTRUCTION, CONSTRUCTING THINGS, OR CONSTRUCTED OBJECTS GO HERE*/

//Defines for construction states

//girder construction states
#define GIRDER_NORMAL 0
#define GIRDER_REINF_STRUTS 1
#define GIRDER_REINF 2
#define GIRDER_DISPLACED 3
#define GIRDER_DISASSEMBLED 4

//rwall construction states
#define INTACT 0
#define SUPPORT_LINES 1
#define COVER 2
#define CUT_COVER 3
#define ANCHOR_BOLTS 4
#define SUPPORT_RODS 5
#define SHEATH 6

//window construction states
#define WINDOW_OUT_OF_FRAME 0
#define WINDOW_IN_FRAME 1
#define WINDOW_SCREWED_TO_FRAME 2

//reinforced window construction states
#define RWINDOW_FRAME_BOLTED 3
#define RWINDOW_BARS_CUT 4
#define RWINDOW_POPPED 5
#define RWINDOW_BOLTS_OUT 6
#define RWINDOW_BOLTS_HEATED 7
#define RWINDOW_SECURE 8

//mecha wreckage repair states
#define MECHA_WRECK_CUT 0
#define MECHA_WRECK_DENTED 1
#define MECHA_WRECK_LOOSE 2
#define MECHA_WRECK_UNWIRED 3

//airlock assembly construction states
#define AIRLOCK_ASSEMBLY_NEEDS_WIRES 0
#define AIRLOCK_ASSEMBLY_NEEDS_ELECTRONICS 1
#define AIRLOCK_ASSEMBLY_NEEDS_SCREWDRIVER 2

//default_unfasten_wrench() return defines
#define CANT_UNFASTEN 0
#define FAILED_UNFASTEN 1
#define SUCCESSFUL_UNFASTEN 2

//ai core defines
#define EMPTY_CORE 0
#define CIRCUIT_CORE 1
#define SCREWED_CORE 2
#define CABLED_CORE 3
#define GLASS_CORE 4
#define AI_READY_CORE 5

//Construction defines for the pinion airlock
#define GEAR_SECURE 1
#define GEAR_LOOSE 2

//floodlights because apparently we use defines now
#define FLOODLIGHT_NEEDS_WIRES 0
#define FLOODLIGHT_NEEDS_LIGHTS 1
#define FLOODLIGHT_NEEDS_SECURING 2
#define FLOODLIGHT_NEEDS_WRENCHING 3

//other construction-related things

//windows affected by Nar'sie turn this color.
#define NARSIE_WINDOW_COLOUR "#7D1919"

//let's just pretend fulltile windows being children of border windows is fine
#define FULLTILE_WINDOW_DIR NORTHEAST

//The amount of materials you get from a sheet of mineral like iron/diamond/glass etc
#define MINERAL_MATERIAL_AMOUNT 2000
//The maximum size of a stack object.
#define MAX_STACK_SIZE 50
//maximum amount of cable in a coil
#define MAXCOIL 40

// Crafting defines.
// When adding new defines, please make sure to also add them to the encompassing list.
#define CAT_WEAPON_RANGED "Weapons: Ranged"
#define CAT_WEAPON_MELEE "Weapons: Melee"
#define CAT_WEAPON_AMMO "Weapon Ammo"
#define CAT_TOOLS "Tools"
#define CAT_ROBOT "Robotics"
#define CAT_CLOTHING "Clothing"
#define CAT_ARMOR "Armor"
#define CAT_EQUIPMENT "Equipment"
#define CAT_STRUCTURES "Structures"
#define CAT_PRIMAL "Tribal"
#define CAT_BAIT "Fishing Bait"
#define CAT_MEDICAL "Medical"
#define CAT_MISC "Misc"

GLOBAL_LIST_INIT(crafting_category, list(
	CAT_WEAPON_RANGED,
	CAT_WEAPON_MELEE,
	CAT_WEAPON_AMMO,
	CAT_TOOLS,
	CAT_ROBOT,
	CAT_CLOTHING,
	CAT_ARMOR,
	CAT_STRUCTURES,
	CAT_EQUIPMENT,
	CAT_PRIMAL,
	CAT_BAIT,
	CAT_MEDICAL,
	CAT_MISC
))

// Food/Drink crafting defines.
// When adding new defines, please make sure to also add them to the encompassing list.
#define CAT_FOOD	"Foods"
#define CAT_BREAD	"Breads"
#define CAT_BURGER	"Burgers"
#define CAT_CAKE	"Cakes"
#define CAT_EGG	"Egg-Based Food"
#define CAT_MEAT	"Meats"
#define CAT_MISCFOOD	"Misc. Food"
#define CAT_PASTRY	"Pastries"
#define CAT_PIE	"Pies"
#define CAT_PIZZA	"Pizzas"
#define CAT_SALAD	"Salads"
#define CAT_SANDWICH	"Sandwiches"
#define CAT_SOUP	"Soups"
#define CAT_SPAGHETTI	"Spaghettis"
#define CAT_ICE	"Frozen"
#define CAT_DRINK   "Drinks"
#define CAT_SEAFOOD   "Seafood"

GLOBAL_LIST_INIT(crafting_category_food, list(
	CAT_FOOD,
	CAT_BREAD,
	CAT_BURGER,
	CAT_CAKE,
	CAT_EGG,
	CAT_MEAT,
	CAT_SEAFOOD,
	CAT_MISCFOOD,
	CAT_PASTRY,
	CAT_PIE,
	CAT_PIZZA,
	CAT_SALAD,
	CAT_SANDWICH,
	CAT_SOUP,
	CAT_SPAGHETTI,
	CAT_ICE,
	CAT_DRINK,
))

#define RCD_FLOORWALL (1<<0)
#define RCD_AIRLOCK (1<<1)
#define RCD_DECONSTRUCT (1<<2)
#define RCD_WINDOWGRILLE (1<<3)
#define RCD_MACHINE (1<<4)
#define RCD_COMPUTER (1<<5)
#define RCD_FURNISHING (1<<6)
#define RCD_CONVEYOR (1<<7)
#define RCD_SWITCH (1<<8)

#define RCD_UPGRADE_FRAMES (1<<0)
#define RCD_UPGRADE_SIMPLE_CIRCUITS	(1<<1)
#define RCD_UPGRADE_SILO_LINK (1<<2)
#define RCD_UPGRADE_FURNISHING (1<<3)
#define RCD_UPGRADE_CONVEYORS (1<<4)

#define RCD_WINDOW_FULLTILE "full tile"
#define RCD_WINDOW_DIRECTIONAL "directional"
#define RCD_WINDOW_NORMAL "glass"
#define RCD_WINDOW_REINFORCED "reinforced glass"
