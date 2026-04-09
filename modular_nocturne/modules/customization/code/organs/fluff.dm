/obj/item/organ/fluff
	name = "fluff"
	desc = ""
	icon_state = "severedtail"

	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_EXTERNAL_FLUFF
	restyle_flags = EXTERNAL_RESTYLE_FLESH

	bodypart_overlay = /datum/bodypart_overlay/mutant/fluff

	dna_block = /datum/dna_block/feature/accessory/fluff_nocturne

	organ_flags = parent_type::organ_flags | ORGAN_EXTERNAL

/datum/bodypart_overlay/mutant/fluff
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT
	feature_key = FEATURE_FLUFF_NOCTURNE
	feature_key_sprite = "fluff"

/datum/bodypart_overlay/mutant/fluff/inherit_color(obj/item/bodypart/bodypart_owner, force)
	if(isnull(bodypart_owner))
		draw_color = null
		return TRUE

	if(draw_color && !force)
		return FALSE

	draw_color = bodypart_owner.owner?.dna.features[FEATURE_FLUFF_NOCTURNE_COLORS]
	return TRUE
