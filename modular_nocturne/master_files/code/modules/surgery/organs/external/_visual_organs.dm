/datum/bodypart_overlay/mutant/snout
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT

/datum/bodypart_overlay/mutant/snout/color_images(list/image/overlays, layer, obj/item/bodypart/limb)
	draw_color = limb.owner?.dna.features[FEATURE_SNOUT_COLORS]
	return ..()
