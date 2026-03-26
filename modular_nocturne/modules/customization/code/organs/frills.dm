/obj/item/organ/frills/mutant
	name = "mutant frills"
	dna_block = /datum/dna_block/feature/accessory/frills_nocturne
	bodypart_overlay = /datum/bodypart_overlay/mutant/frills/mutant

/datum/bodypart_overlay/mutant/frills/mutant
	feature_key = FEATURE_FRILLS_NOCTURNE
	feature_key_sprite = FEATURE_FRILLS

/datum/bodypart_overlay/mutant/frills/mutant/color_images(list/image/overlays, layer, obj/item/bodypart/limb)
	draw_color = limb.owner?.dna.features[FEATURE_FRILLS_NOCTURNE_COLORS]
	return ..()
