/datum/component/armor_plate
	var/amount = 0
	var/maxamount = 3
	var/upgrade_item = /obj/item/stack/sheet/animalhide/goliath_hide
	var/datum/armor/added_armor = list(MELEE = 10)
	var/upgrade_name

/datum/component/armor_plate/Initialize(_maxamount,obj/item/_upgrade_item,datum/armor/_added_armor)
	if(!isobj(parent) && !iscyborg(parent)) // Only objects and cyborgs can have this component.
		return COMPONENT_INCOMPATIBLE

	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(examine))
	RegisterSignal(parent, COMSIG_PARENT_ATTACKBY, PROC_REF(applyplate))
	RegisterSignal(parent, COMSIG_PARENT_PREQDELETED, PROC_REF(dropplates))

	if(_maxamount)
		maxamount = _maxamount
	if(_upgrade_item)
		upgrade_item = _upgrade_item
	if(_added_armor)
		if(islist(_added_armor))
			added_armor = getArmor(arglist(_added_armor))
		else if (istype(_added_armor, /datum/armor))
			added_armor = _added_armor
		else
			stack_trace("Invalid type [_added_armor.type] passed as _armor_item argument to armorplate component")
	else
		added_armor = getArmor(arglist(added_armor))
	var/obj/item/typecast = upgrade_item
	upgrade_name = initial(typecast.name)

/datum/component/armor_plate/proc/examine(datum/source, mob/user, list/examine_list)
	if(istype(parent, /obj))
		if(ismecha(parent))
			if(amount)
				if(amount < maxamount)
					examine_list += span_notice("Its armor is enhanced with [amount] [upgrade_name].")
				else
					examine_list += span_notice("It's wearing a fearsome carapace entirely composed of [upgrade_name] - its pilot must be an experienced monster hunter.")
			else
				examine_list += span_notice("It has attachment points for strapping monster hide on for added protection.")
		else
			if(amount)
				examine_list += span_notice("It has been strengthened with [amount]/[maxamount] [upgrade_name].")
			else
				examine_list += span_notice("It can be strengthened with up to [maxamount] [upgrade_name].")
	if(iscyborg(parent))
		if(amount)
			examine_list += span_notice("They have been strengthened with [amount]/[maxamount] [upgrade_name].")
		else
			examine_list += span_notice("They can be strengthened with up to [maxamount] [upgrade_name].")

/datum/component/armor_plate/proc/applyplate(datum/source, obj/item/I, mob/user, params)
	if(!istype(I,upgrade_item))
		return
	if(amount >= maxamount)
		to_chat(user, span_warning("You can't improve [parent] any further!"))
		return

	if(istype(I,/obj/item/stack))
		I.use(1)
	else
		if(length(I.contents))
			to_chat(user, span_warning("[I] cannot be used for armoring while there's something inside!"))
			return
		qdel(I)
	amount++

	if(istype(parent, /obj))
		var/obj/O = parent
		O.armor = O.armor.attachArmor(added_armor)

		if(ismecha(O))
			var/obj/mecha/R = O
			R.update_appearance(UPDATE_ICON)
			to_chat(user, span_info("You strengthen [R], improving its resistance against melee, bullet and laser damage."))
		else
			to_chat(user, span_info("You strengthen [O], improving its resistance against melee attacks."))
	if(iscyborg(parent))
		var/mob/living/silicon/robot/cyborg = parent
		cyborg.armor = cyborg.armor.attachArmor(added_armor)
		to_chat(user, span_info("You strengthen [cyborg], improving their resistance against melee attacks."))

/datum/component/armor_plate/proc/dropplates(datum/source, force)
	if(ismecha(parent)) //items didn't drop the plates before and it causes erroneous behavior for the time being with collapsible helmets
		for(var/i in 1 to amount)
			new upgrade_item(get_turf(parent))
	if(iscyborg(parent))
		var/mob/living/silicon/robot/cyborg = parent
		for(var/i in 1 to amount)
			cyborg.armor.detachArmor(added_armor)
			new upgrade_item(get_turf(parent))
