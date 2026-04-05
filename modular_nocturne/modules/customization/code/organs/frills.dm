/obj/item/organ/frills/mutant
	name = "mutant frills"
	dna_block = /datum/dna_block/feature/accessory/frills_nocturne
	bodypart_overlay = /datum/bodypart_overlay/mutant/frills/mutant

/datum/bodypart_overlay/mutant/frills/mutant
	feature_key = FEATURE_FRILLS_NOCTURNE
	feature_key_sprite = FEATURE_FRILLS

/datum/bodypart_overlay/mutant/frills/mutant/inherit_color(obj/item/bodypart/bodypart_owner, force)
	if(isnull(bodypart_owner))
		draw_color = null
		return TRUE

	if(draw_color && !force)
		return FALSE

	draw_color = bodypart_owner.owner?.dna.features[FEATURE_FRILLS_NOCTURNE_COLORS]
	return TRUE
