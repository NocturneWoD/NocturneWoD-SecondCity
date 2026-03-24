/obj/item/organ/tail/mutant
	name = "mutant tail"
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/mutant

	dna_block = /datum/dna_block/feature/accessory/tail_nocturne

/datum/bodypart_overlay/mutant/tail/mutant
	feature_key = FEATURE_TAIL_NOCTURNE
	feature_key_sprite = "tail"

/datum/bodypart_overlay/mutant/tail/mutant/color_images(list/image/overlays, layer, obj/item/bodypart/limb)
	draw_color = limb.owner?.dna.features[FEATURE_TAIL_NOCTURNE_COLORS]
	return ..()

/datum/bodypart_overlay/mutant/tail/mutant/can_draw_on_bodypart(obj/item/bodypart/bodypart_owner)
	return ..() && can_draw_on_chest(bodypart_owner.owner, FEATURE_TAIL_NOCTURNE) // so are tails
