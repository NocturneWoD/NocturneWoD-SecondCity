/obj/item/organ/horns/mutant
	name = "mutant horns"
	dna_block = /datum/dna_block/feature/accessory/horns_nocturne
	bodypart_overlay = /datum/bodypart_overlay/mutant/horns/mutant

/datum/bodypart_overlay/mutant/horns/mutant
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT | EXTERNAL_BEHIND
	feature_key = FEATURE_HORNS_NOCTURNE
	feature_key_sprite = "horns"

/datum/bodypart_overlay/mutant/horns/mutant/color_images(list/image/overlays, layer, obj/item/bodypart/limb)
	draw_color = limb.owner?.dna.features[FEATURE_HORNS_NOCTURNE_COLORS]
	return ..()
