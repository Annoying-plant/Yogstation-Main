/turf/open/water
	gender = PLURAL
	name = "water"
	desc = "Shallow water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	baseturfs = /turf/open/chasm/lavaland
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE
	slowdown = 1
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.
	flags_1 = NO_RUST | CAN_BE_DIRTY_1

	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

/turf/open/water/safe
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = FALSE
	baseturfs = /turf/open/indestructible/grass/sand

/turf/open/water/safe/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/fishable)
	
