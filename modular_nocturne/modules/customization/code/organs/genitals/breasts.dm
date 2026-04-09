// boobs

/obj/item/organ/genital/breasts
	name = "breasts"
	desc = "Boring and overrated."
	icon = 'modular_nocturne/modules/customization/icons/obj/medical/organs/organs.dmi'
	icon_state = "breasts"

	slot = ORGAN_SLOT_EXTERNAL_BREASTS
	zone = BODY_ZONE_CHEST

	dna_block = /datum/dna_block/feature/accessory/breasts_nocturne
	restyle_flags = EXTERNAL_RESTYLE_FLESH

	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/breasts

	aroused = AROUSAL_CANT

/obj/item/organ/genital/breasts/is_exposed()
	if(!owner)
		return FALSE
	if(!ishuman(owner))
		return FALSE

	var/mob/living/carbon/human/human = owner
	if(visibility_pref == ORGAN_VISIBILITY_MODE_NORMAL)
		if((human.undershirt != "Nude" && !(human.underwear_visibility & UNDERWEAR_HIDE_SHIRT)) || (human.bra != "Nude" && !(human.underwear_visibility & UNDERWEAR_HIDE_BRA)))
			return FALSE
		if((human.w_uniform && human.w_uniform.body_parts_covered & CHEST) || (human.wear_suit && human.wear_suit.body_parts_covered & CHEST))
			return FALSE
		if(human.underwear != "Nude" && !(human.underwear_visibility & UNDERWEAR_HIDE_UNDIES))
			var/datum/sprite_accessory/clothing/underwear/worn_underwear = SSaccessories.underwear_list[human.underwear]
			if(worn_underwear.hides_breasts)
				return FALSE
		return TRUE
	else
		var/vis = visibility_pref == ORGAN_VISIBILITY_MODE_ALWAYS_SHOW ? TRUE : FALSE
		return vis

// overlay

/datum/bodypart_overlay/mutant/genital/breasts
	feature_key = FEATURE_BREASTS_NOCTURNE
	layers = EXTERNAL_ADJACENT | EXTERNAL_BEHIND
	feature_key_sprite = "breasts"

	organ_slot = ORGAN_SLOT_EXTERNAL_BREASTS

/datum/bodypart_overlay/mutant/genital/breasts/inherit_color(obj/item/bodypart/bodypart_owner, force)
	// honestly this should be how inherit_color should be handled for ALL mutant overlays
	if(sprite_datum.color_src == USE_MATRIXED_COLORS)
		if(isnull(bodypart_owner))
			draw_color = null
			return TRUE

		if(draw_color && !force)
			return FALSE

		draw_color = bodypart_owner.owner?.dna.features[FEATURE_BREASTS_NOCTURNE_COLORS]
		return TRUE
	else
		return ..()

