/// Middleware to handle markings
/datum/preference_middleware/markings
	action_delegations = list(
		"add_marking" = PROC_REF(add_marking),
		"change_marking" = PROC_REF(change_marking),
		"remove_marking" = PROC_REF(remove_marking),
		"color_marking" = PROC_REF(color_marking),
		"move_marking_up" = PROC_REF(move_marking_up),
		"move_marking_down" = PROC_REF(move_marking_down),
	)

/datum/preference_middleware/markings/proc/get_markings_by_zone(var/body_zone)
	var/datum/bodypart_overlay/simple/body_marking/body_markings/markings = new /datum/bodypart_overlay/simple/body_marking/body_markings()
	var/list/returnval = list()
	var/list/allmarkings = assoc_to_keys_features(SSaccessories.body_markings)

	var/zone_bitflag = GLOB.marking_zone_to_bitflag[body_zone]

	for(var/i in allmarkings)
		var/datum/sprite_accessory/body_marking/accessory = markings.get_accessory(i)
		if(accessory.body_zones & zone_bitflag)
			returnval += i
	return sort_list(returnval)

/datum/preference_middleware/markings/get_ui_data(mob/user)
	var/list/data = list()

	var/list/marking_parts = list()
	for(var/zone in GLOB.marking_zones)
		var/list/this_zone = list()

		this_zone["body_zone"] = zone
		this_zone["name"] = capitalize(parse_zone(zone))

		var/list/this_zone_marking_choices = list()
		for(var/marking_name in get_markings_by_zone(zone))
			var/list/this_marking_choice = list()

			this_marking_choice["name"] = marking_name
			this_marking_choice["icon"] = sanitize_css_class_name("marking_[zone]_[marking_name]")

			this_zone_marking_choices += list(this_marking_choice)

		var/list/this_zone_markings = list()
		for(var/marking_name in preferences.body_markings[zone])
		for(var/marking_index in 1 to LAZYLEN(preferences.body_markings[zone]))
			var/list/this_marking = list()

			var/marking_name = preferences.body_markings[zone][marking_index]
			this_marking["name"] = marking_name
			this_marking["marking_index"] = marking_index
			this_marking["color"] = sanitize_hexcolor(preferences.body_markings_colors[zone][marking_index], DEFAULT_HEX_COLOR_LEN, include_crunch = TRUE, default = "#FFFFFF")

			this_zone_markings += list(this_marking)
		this_zone["markings"] = this_zone_markings
		this_zone["markings_choices"] = this_zone_marking_choices
		this_zone["cant_add_markings"] = (LAZYLEN(this_zone_markings) >= MAXIMUM_MARKINGS_PER_LIMB ? "Marking limit reached!" : \
										(!LAZYLEN(this_zone_marking_choices) ? (LAZYLEN(this_zone_markings) ? "No more options found!" : "No options found!") : null))

		marking_parts += list(this_zone)

	data["marking_parts"] = marking_parts
	data["maximum_markings_per_limb"] = MAXIMUM_MARKINGS_PER_LIMB

	return data

/datum/preference_middleware/markings/apply_to_human(mob/living/carbon/human/target, datum/preferences/preferences)
	target.dna.features["markings_list"] = LAZYCOPY(preferences.body_markings)
	target.dna.features["markings_list_colors"] = LAZYCOPY(preferences.body_markings_colors)
	return

/datum/preference_middleware/markings/proc/add_marking(list/params, mob/user)
	var/zone = params["body_zone"]

	LAZYINITLIST(preferences.body_markings[zone])
	LAZYINITLIST(preferences.body_markings_colors[zone])

	var/list/available_markings = get_markings_by_zone(zone)
	for(var/marking_name in preferences.body_markings[zone]) // so you dont get the same markings over and over
		available_markings -= marking_name

	if(!length(available_markings))
		return FALSE

	if(LAZYLEN(preferences.body_markings[zone]) >= MAXIMUM_MARKINGS_PER_LIMB)
		return FALSE

	var/marking_name = available_markings[1]
	preferences.body_markings[zone] += marking_name
	preferences.body_markings_colors[zone] += "#FFFFFF"

	preferences.character_preview_view.update_body()
	return TRUE

/datum/preference_middleware/markings/proc/change_marking(list/params, mob/user)
	var/zone = params["body_zone"]
	var/index = params["marking_index"]
	var/new_marking = params["new_marking"]
	var/list/marking_list = preferences.body_markings[zone]
	if(LAZYACCESS(marking_list, index))
		marking_list[index] = new_marking
		preferences.character_preview_view.update_body()
		return TRUE
	return FALSE


/datum/preference_middleware/markings/proc/color_marking(list/params, mob/user)
	var/zone = params["body_zone"]
	var/index = params["marking_index"]
	var/list/marking_list_colors = preferences.body_markings_colors[zone]
	if(LAZYACCESS(marking_list_colors, index))
		var/new_color = tgui_color_picker(
			usr,
			"Select new color",
			null,
			marking_list_colors[index],
		)
		if(!new_color)
			return TRUE
		marking_list_colors[index] = sanitize_hexcolor(new_color)
		preferences.character_preview_view.update_body()
		return TRUE
	return FALSE

/datum/preference_middleware/markings/proc/remove_marking(list/params, mob/user)
	var/zone = params["body_zone"]
	var/index = params["marking_index"]
	var/list/marking_list = preferences.body_markings[zone]
	var/list/marking_list_colors = preferences.body_markings_colors[zone]
	if(LAZYACCESS(marking_list, index) && LAZYACCESS(marking_list_colors, index))
		marking_list -= marking_list[index]
		marking_list_colors -= marking_list_colors[index]
		if(LAZYLEN(marking_list) <= 0)
			marking_list = null
		if(LAZYLEN(marking_list_colors) <= 0)
			marking_list_colors = null
		preferences.character_preview_view.update_body()
		return TRUE
	return FALSE

/datum/preference_middleware/markings/proc/move_marking_up(list/params, mob/user)
	var/zone = params["body_zone"]
	var/index = params["marking_index"]
	var/list/marking_list = preferences.body_markings[zone]
	var/list/marking_list_colors = preferences.body_markings_colors[zone]

	if(LAZYLEN(marking_list) >= 2 && LAZYLEN(marking_list_colors) >= 2 && (index >= 2))
		marking_list.Swap(index, index-1)
		marking_list_colors.Swap(index, index-1)
		preferences.character_preview_view.update_body()
		return TRUE
	return FALSE

/datum/preference_middleware/markings/proc/move_marking_down(list/params, mob/user)
	var/zone = params["body_zone"]
	var/index = params["marking_index"]
	var/list/marking_list = preferences.body_markings[zone]
	var/list/marking_list_colors = preferences.body_markings_colors[zone]
	if(LAZYLEN(marking_list) >= 2 && LAZYLEN(marking_list_colors) >= 2 && (index < LAZYLEN(marking_list)) && (index < LAZYLEN(marking_list_colors)))
		marking_list.Swap(index, index+1)
		marking_list_colors.Swap(index, index+1)
		preferences.character_preview_view.update_body()
		return TRUE
	return FALSE


/datum/preference_middleware/markings/get_ui_assets()
	return list(
		get_asset_datum(/datum/asset/spritesheet/markings),
	)

// NOCTURNE TODO: maybe turn this into spritesheet_batched at some point? could also rewrite it to do simple
// icon overlay stuff instead of making an entire dummy
// i partially wrote some of this shit back in 2023 for a server bob joga was trying to start; it's probably out of date
/datum/asset/spritesheet/markings
	name = "markings"
	early = TRUE
	cross_round_cachable = TRUE

/datum/asset/spritesheet/markings/create_spritesheets()
	var/list/to_insert = list()
	var/static/icon/icon_fucked = icon('icons/effects/random_spawners.dmi', "questionmark")

	var/mob/living/carbon/human/dummy/consistent/dummy = new()

	// clean up the dummy just in case
	dummy.dna.species.remove_body_markings(dummy)

	// prepare markings previews
	var/datum/bodypart_overlay/simple/body_marking/body_markings/markings = new /datum/bodypart_overlay/simple/body_marking/body_markings()
	var/list/all_markings = assoc_to_keys_features(SSaccessories.body_markings)

	for(var/marking_name in all_markings)
		var/datum/sprite_accessory/body_marking/accessory = markings.get_accessory(marking_name)

		if(isnull(accessory))
			// should not happen but if it does...
			for(var/zone in GLOB.marking_zones)
				to_insert[sanitize_css_class_name("marking_[zone]_[marking_name]")] = icon_fucked
			continue

		for(var/zone in GLOB.marking_zones)
			var/zone_bitflag = GLOB.marking_zone_to_bitflag[zone]

			if(accessory.body_zones & zone_bitflag)
				// create the marking on the given bodypart
				var/obj/item/bodypart/bodypart = dummy.get_bodypart(check_zone(zone))
				if(!bodypart)
					// should not happen but if it does...
					to_insert[sanitize_css_class_name("marking_[zone]_[marking_name]")] = icon_fucked
					continue

				// body_marking.prepare_dummy(dummy) // could do some marking specific shit for the dummy here

				dummy.dna.species.add_doppler_markings(dummy, marking_name, accessory.default_color || COLOR_RED, zone_bitflag)

				var/image/bodypart_image = new()
				bodypart_image.add_overlay(bodypart.get_limb_icon())
				var/icon/bodypart_icon = getFlatIcon(bodypart_image)
				switch(zone)
					if(BODY_ZONE_HEAD)
						bodypart_icon.Crop(10, 19, 22, 31)
					if(BODY_ZONE_CHEST)
						bodypart_icon.Crop(9, 9, 23, 23)
					if(BODY_ZONE_L_ARM, BODY_ZONE_PRECISE_L_HAND)
						bodypart_icon.Crop(17, 10, 28, 21)
					if(BODY_ZONE_R_ARM, BODY_ZONE_PRECISE_R_HAND)
						bodypart_icon.Crop(4, 10, 15, 21)
					if(BODY_ZONE_L_LEG, BODY_ZONE_PRECISE_L_FOOT)
						bodypart_icon.Crop(9, 1, 23, 15)
					if(BODY_ZONE_R_LEG, BODY_ZONE_PRECISE_R_FOOT)
						bodypart_icon.Crop(9, 1, 23, 15)
				bodypart_icon.Scale(32, 32)

				to_insert[sanitize_css_class_name("marking_[zone]_[marking_name]")] = bodypart_icon

				// clear up the bodypart for the next marking to be applied
				dummy.dna.species.remove_body_markings(dummy)

	SSatoms.prepare_deletion(dummy) //FUCK YOU STUPID DUMB DUMB DUMMY

	for(var/spritesheet_key in to_insert)
		Insert(spritesheet_key, to_insert[spritesheet_key])
