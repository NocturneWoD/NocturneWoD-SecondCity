/obj/item/organ/horns/mutant
	name = "mutant horns"
	dna_block = /datum/dna_block/feature/accessory/horns_nocturne
	bodypart_overlay = /datum/bodypart_overlay/mutant/horns/mutant

/datum/bodypart_overlay/mutant/horns/mutant
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT | EXTERNAL_BEHIND
	feature_key = FEATURE_HORNS_NOCTURNE
	feature_key_sprite = FEATURE_HORNS

/datum/bodypart_overlay/mutant/horns/mutant/inherit_color(obj/item/bodypart/bodypart_owner, force)
	if(isnull(bodypart_owner))
		draw_color = null
		return TRUE

	if(draw_color && !force)
		return FALSE

	draw_color = bodypart_owner.owner?.dna.features[FEATURE_HORNS_NOCTURNE_COLORS]
	return TRUE

/datum/bodypart_overlay/mutant/horns/mutant/horns/can_draw_on_bodypart(obj/item/bodypart/bodypart_owner)
	return ..() && can_draw_on_head(bodypart_owner.owner, feature_key)
