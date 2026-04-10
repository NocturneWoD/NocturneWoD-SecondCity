/obj/item/organ/snout/mutant
	name = "mutant snout"
	bodypart_overlay = /datum/bodypart_overlay/mutant/snout/mutant

	dna_block = /datum/dna_block/feature/accessory/snout_nocturne

/datum/bodypart_overlay/mutant/snout/mutant
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT
	feature_key = FEATURE_SNOUT_NOCTURNE
	feature_key_sprite = FEATURE_SNOUT

/datum/bodypart_overlay/mutant/snout/mutant/inherit_color(obj/item/bodypart/bodypart_owner, force)
	if(isnull(bodypart_owner))
		draw_color = null
		return TRUE

	if(draw_color && !force)
		return FALSE

	draw_color = bodypart_owner.owner?.dna.features[FEATURE_SNOUT_NOCTURNE_COLORS]
	return TRUE
