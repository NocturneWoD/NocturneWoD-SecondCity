/obj/item/organ/tail/mutant
	name = "mutant tail"
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/mutant

	dna_block = /datum/dna_block/feature/accessory/tail_nocturne
	wag_flags = WAG_ABLE

/datum/bodypart_overlay/mutant/tail/mutant
	feature_key = FEATURE_TAIL_NOCTURNE
	feature_key_sprite = "tail"

/datum/bodypart_overlay/mutant/tail/mutant/inherit_color(obj/item/bodypart/bodypart_owner, force)
	if(isnull(bodypart_owner))
		draw_color = null
		return TRUE

	if(draw_color && !force)
		return FALSE

	draw_color = bodypart_owner.owner?.dna.features[FEATURE_TAIL_NOCTURNE_COLORS]
	return TRUE

/datum/bodypart_overlay/mutant/tail/mutant/can_draw_on_bodypart(obj/item/bodypart/bodypart_owner)
	return ..() && can_draw_on_chest(bodypart_owner.owner, FEATURE_TAIL_NOCTURNE) // so are tails
