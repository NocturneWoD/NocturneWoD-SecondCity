/obj/item/organ/fluff
	name = "fluff"
	desc = ""
	icon_state = "severedtail"

	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_EXTERNAL_FLUFF
	restyle_flags = EXTERNAL_RESTYLE_FLESH

	bodypart_overlay = /datum/bodypart_overlay/mutant/fluff

	dna_block = /datum/dna_block/feature/accessory/fluff_nocturne

/datum/bodypart_overlay/mutant/fluff
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT
	feature_key = FEATURE_FLUFF_NOCTURNE
	feature_key_sprite = "fluff"

/datum/bodypart_overlay/mutant/fluff/color_images(list/image/overlays, layer, obj/item/bodypart/limb)
	draw_color = limb.owner?.dna.features[FEATURE_FLUFF_NOCTURNE_COLORS]
	return ..()
