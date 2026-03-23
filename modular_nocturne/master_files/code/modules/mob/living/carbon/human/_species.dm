/datum/species
	var/list/digi_leg_overrides = list(
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/digitigrade,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/digitigrade,
	)

//cover_flags2body_zones is funky with hand bitflags for some reason. this is more efficient for what we want to do anyway
/datum/species/proc/marking_zones(zone)
	if(!zone)
		return
	switch(zone)
		if(HEAD)
			return BODY_ZONE_HEAD
		if(CHEST)
			return BODY_ZONE_CHEST
		if(ARM_LEFT)
			return BODY_ZONE_L_ARM
		if(ARM_RIGHT)
			return BODY_ZONE_R_ARM
		if(HAND_LEFT)
			return BODY_ZONE_PRECISE_L_HAND
		if(HAND_RIGHT)
			return BODY_ZONE_PRECISE_R_HAND
		if(LEG_LEFT)
			return BODY_ZONE_L_LEG
		if(LEG_RIGHT)
			return BODY_ZONE_R_LEG

/datum/species/proc/add_doppler_markings(mob/living/carbon/human/target, value, colorvalue, bodypart)
	var/handlayer = FALSE
	bodypart = marking_zones(bodypart)
	if(bodypart == BODY_ZONE_PRECISE_L_HAND)
		handlayer = EXTERNAL_HAND
		bodypart = BODY_ZONE_L_ARM
	else if(bodypart == BODY_ZONE_PRECISE_R_HAND)
		handlayer = EXTERNAL_HAND
		bodypart = BODY_ZONE_R_ARM
	var/obj/item/bodypart/people_part =  target.get_bodypart(bodypart)
	if(people_part)
		var/datum/bodypart_overlay/simple/body_marking/body_markings/overlay = new /datum/bodypart_overlay/simple/body_marking/body_markings()
		var/datum/sprite_accessory/accessory = overlay.get_accessory(value)

		if(isnull(accessory))
			CRASH("Value: [value] did not have a corresponding sprite accessory!")

		overlay.icon = accessory.icon
		overlay.icon_state = accessory.icon_state
		if(handlayer)
			overlay.ishand = TRUE
			overlay.layers = handlayer
		if(bodypart == BODY_ZONE_HEAD)
			overlay.use_gender = FALSE
		else
			overlay.use_gender = accessory.gender_specific

		overlay.draw_color = colorvalue || accessory.default_color
		people_part.add_bodypart_overlay(overlay)

/datum/species/add_body_markings(mob/living/carbon/human/target)
	. = ..()

	if(target.dna.features["markings_list"])
		if(islist(target.dna.features["markings_list"]) && islist(target.dna.features["markings_list_colors"]))
			var/list/markingslist = target.dna.features["markings_list"]
			for(var/zone in GLOB.marking_zones)
				for(var/i in 1 to LAZYLEN(markingslist[zone]))
					if(markingslist[zone][i] && markingslist[zone][i] != SPRITE_ACCESSORY_NONE)
						add_doppler_markings(target, target.dna.features["markings_list"][zone][i], target.dna.features["markings_list_colors"][zone][i], GLOB.marking_zone_to_bitflag[zone])

/datum/species/proc/can_regenerate_mutant_feature(feature_key)
	SHOULD_CALL_PARENT(FALSE)
	return FALSE
