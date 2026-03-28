/obj/item/organ/ears/mutant
	name = "mutant ears"
	bodypart_overlay = /datum/bodypart_overlay/mutant/ears/mutant

	dna_block = /datum/dna_block/feature/accessory/ears_nocturne

/datum/bodypart_overlay/mutant/ears/mutant
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT | EXTERNAL_BEHIND
	feature_key = FEATURE_EARS_NOCTURNE
	feature_key_sprite = FEATURE_EARS

/datum/bodypart_overlay/mutant/ears/mutant/color_images(list/image/overlays, layer, obj/item/bodypart/limb)
	draw_color = limb.owner?.dna.features[FEATURE_EARS_NOCTURNE_COLORS]
	return ..()

/datum/bodypart_overlay/mutant/ears/mutant/ears/can_draw_on_bodypart(obj/item/bodypart/bodypart_owner)
	return ..() && can_draw_on_head(bodypart_owner.owner, feature_key)
