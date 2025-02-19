/obj/machinery/computer/ai_resource_distribution
	name = "\improper AI system resource distribution"
	desc = "Used for distributing processing resources across the current artificial intelligences."
	req_one_access = list(ACCESS_RD, ACCESS_NETWORK)
	
	icon_keyboard = "tech_key"
	icon_screen = "ai-fixer"
	light_color = LIGHT_COLOR_PINK

	authenticated = FALSE

	var/human_only = FALSE

	circuit = /obj/item/circuitboard/computer/ai_resource_distribution


/obj/machinery/computer/ai_resource_distribution/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(obj_flags & EMAGGED)
		return FALSE
	obj_flags |= EMAGGED
	authenticated = TRUE
	to_chat(user, span_warning("You bypass the access restrictions."))
	return TRUE

/obj/machinery/computer/ai_resource_distribution/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "AiResources", name)
		ui.open()

/obj/machinery/computer/ai_resource_distribution/ui_data(mob/living/carbon/human/user)
	var/list/data = list()

	data["authenticated"] = authenticated

	if(issilicon(user))
		var/mob/living/silicon/borg = user
		data["username"] = borg.name
		data["has_access"] = TRUE

	if(IsAdminGhost(user))
		data["username"] = user.client.holder.admin_signature
		data["has_access"] = TRUE

	if(ishuman(user) && !(obj_flags & EMAGGED))
		var/username = user.get_authentification_name("Unknown")
		data["username"] = user.get_authentification_name("Unknown")
		if(username != "Unknown")
			var/datum/data/record/record
			for(var/RP in GLOB.data_core.general)
				var/datum/data/record/R = RP

				if(!istype(R))
					continue
				if(R.fields["name"] == username)
					record = R
					break
			if(record)
				if(istype(record.fields["photo_front"], /obj/item/photo))
					var/obj/item/photo/P1 = record.fields["photo_front"]
					var/icon/picture = icon(P1.picture.picture_image)
					picture.Crop(10, 32, 22, 22)
					var/md5 = md5(fcopy_rsc(picture))

					if(!SSassets.cache["photo_[md5]_cropped.png"])
						SSassets.transport.register_asset("photo_[md5]_cropped.png", picture)
					SSassets.transport.send_assets(user, list("photo_[md5]_cropped.png" = picture))

					data["user_image"] = SSassets.transport.get_asset_url("photo_[md5]_cropped.png")
		data["has_access"] = check_access(user.get_idcard())

	if(obj_flags & EMAGGED)
		data["username"] = "ERROR"
		data["has_access"] = TRUE

	if(!authenticated)
		return data

	data["total_cpu"] = GLOB.ai_os.total_cpu
	data["total_ram"] = GLOB.ai_os.total_ram
	

	data["total_assigned_cpu"] = GLOB.ai_os.total_cpu_assigned()
	data["total_assigned_ram"] = GLOB.ai_os.total_ram_assigned()

	data["human_only"] = human_only


	data["ais"] = list()

	for(var/mob/living/silicon/ai/A in GLOB.ai_list)
		data["ais"] += list(list("name" = A.name, "ref" = REF(A), "assigned_cpu" = GLOB.ai_os.cpu_assigned[A] ? GLOB.ai_os.cpu_assigned[A] : 0, "assigned_ram" = GLOB.ai_os.ram_assigned[A] ? GLOB.ai_os.ram_assigned[A] : 0))

	return data

/obj/machinery/computer/ai_resource_distribution/ui_act(action, params)
	if(..())
		return

	if(!authenticated)
		if(action == "log_in")
			if(issilicon(usr))
				authenticated = TRUE
				return

			if(IsAdminGhost(usr))
				authenticated = TRUE

			if(obj_flags & EMAGGED)
				authenticated = TRUE


			var/mob/living/carbon/human/H = usr
			if(!istype(H))
				return

			if(check_access(H.get_idcard()))
				authenticated = TRUE
		return

	var/is_human = ishuman(usr)

	switch(action)
		if("log_out")
			authenticated = FALSE
			. = TRUE

		if("clear_ai_resources")
			var/mob/living/silicon/ai/target_ai = locate(params["targetAI"])
			if(!istype(target_ai))
				return

			GLOB.ai_os.clear_ai_resources(target_ai)
			. = TRUE

		if("set_cpu")
			var/mob/living/silicon/ai/target_ai = locate(params["targetAI"])
			if(!istype(target_ai))
				return
			if(human_only && !is_human)
				to_chat(usr, span_warning("CAPTCHA check failed. This console is NOT silicon operable. Please call for human assistance."))
				return 
			var/amount = params["amount_cpu"]
			if(amount > 1 || amount < 0)
				return
			GLOB.ai_os.set_cpu(target_ai, amount)
			. = TRUE
		if("max_cpu")
			var/mob/living/silicon/ai/target_ai = locate(params["targetAI"])
			if(!istype(target_ai))
				return
			if(human_only && !is_human)
				to_chat(usr, span_warning("CAPTCHA check failed. This console is NOT silicon operable. Please call for human assistance."))
				return 
			var/amount = (1 - GLOB.ai_os.total_cpu_assigned()) + GLOB.ai_os.cpu_assigned[target_ai]

			GLOB.ai_os.set_cpu(target_ai, amount)
			. = TRUE
		if("add_ram")
			var/mob/living/silicon/ai/target_ai = locate(params["targetAI"])
			if(!istype(target_ai))
				return
			if(human_only && !is_human)
				to_chat(usr, span_warning("CAPTCHA check failed. This console is NOT silicon operable. Please call for human assistance."))
				return 

			if(GLOB.ai_os.total_ram_assigned() >= GLOB.ai_os.total_ram)
				return
			GLOB.ai_os.add_ram(target_ai, 1)
			. = TRUE

		if("remove_ram")
			var/mob/living/silicon/ai/target_ai = locate(params["targetAI"])
			if(!istype(target_ai))
				return
			if(human_only && !is_human)
				to_chat(usr, span_warning("CAPTCHA check failed. This console is NOT silicon operable. Please call for human assistance."))
				return 

			var/current_ram = GLOB.ai_os.ram_assigned[target_ai]

			if(current_ram <= 0)
				return
			GLOB.ai_os.remove_ram(target_ai, 1)
			. = TRUE
		if("toggle_human_status")
			if(!is_human)
				to_chat(usr, span_warning("CAPTCHA check failed. This console is NOT silicon operable. Please call for human assistance."))
				return 
			human_only = !human_only
			to_chat(usr, span_notice("This console is now operable by [human_only ? "humans only." : "humans and silicons."]"))
		
