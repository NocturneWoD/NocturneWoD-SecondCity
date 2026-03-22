/obj/item/organ/snout/mutant
	name = "mutant snout"
	bodypart_overlay = /datum/bodypart_overlay/mutant/snout/mutant

/datum/bodypart_overlay/mutant/snout/mutant
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT
	feature_key = FEATURE_SNOUT_NOCTURNE
	feature_key_sprite = "snout"

/datum/bodypart_overlay/mutant/snout/mutant/color_images(list/image/overlays, layer, obj/item/bodypart/limb)
	draw_color = limb.owner?.dna.features[FEATURE_SNOUT_NOCTURNE_COLORS]
	return ..()
