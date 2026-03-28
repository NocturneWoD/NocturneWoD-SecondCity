/datum/bodypart_overlay/simple/body_marking/body_markings
	blocks_emissive = EMISSIVE_BLOCK_NONE
	var/ishand = FALSE

/datum/bodypart_overlay/simple/body_marking/body_markings/get_accessory(name)
	return SSaccessories.body_markings[name]

/datum/bodypart_overlay/simple/body_marking/body_markings/get_image(layer, obj/item/bodypart/limb)
	var/gender_string = ""
	if(use_gender && !(limb.body_zone in GLOB.limb_zones))
		gender_string = (limb.is_dimorphic) ? (limb.limb_gender == "m" ? "_m" : "_f") : "_m" // defaults to male so that andros dont get tiddies
	var/zonestring = limb.body_zone
	if((limb.bodyshape & BODYSHAPE_DIGITIGRADE) && !limb.owner?.is_digitigrade_squished())
		zonestring = "digitigrade_1_" + limb.body_zone
	if(ishand)
		zonestring = limb.aux_zone
	return image(icon, icon_state + "_" + zonestring + gender_string, layer = layer)
