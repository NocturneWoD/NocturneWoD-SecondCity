/obj/item/organ/genital/testicles
	name = "testicles"
	desc = "The 'ol cum tanks."
	icon = 'modular_nocturne/modules/customization/icons/obj/medical/organs/organs.dmi'
	icon_state = "testicles"

	slot = ORGAN_SLOT_EXTERNAL_TESTICLES
	zone = BODY_ZONE_CHEST

	dna_block = /datum/dna_block/feature/accessory/testicles_nocturne
	restyle_flags = EXTERNAL_RESTYLE_FLESH

	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/testicles

	aroused = AROUSAL_CANT

/obj/item/organ/genital/testicles/is_exposed()
	if(!owner)
		return FALSE
	if(!ishuman(owner))
		return FALSE

	var/mob/living/carbon/human/human = owner
	if(visibility_pref == ORGAN_VISIBILITY_MODE_NORMAL)
		if(human.underwear != "Nude" && !(human.underwear_visibility & UNDERWEAR_HIDE_UNDIES))
			return FALSE
		if((human.w_uniform && human.w_uniform.body_parts_covered & GROIN) || (human.wear_suit && human.wear_suit.body_parts_covered & GROIN))
			return FALSE
		return TRUE
	else
		var/vis = visibility_pref == ORGAN_VISIBILITY_MODE_ALWAYS_SHOW ? TRUE : FALSE
		return vis

// overlay

/datum/bodypart_overlay/mutant/genital/testicles
	feature_key = FEATURE_TESTICLES_NOCTURNE
	layers = EXTERNAL_BODY_FRONT_UNDER_CLOTHES | EXTERNAL_BEHIND
	feature_key_sprite = "testicles"

	organ_slot = ORGAN_SLOT_EXTERNAL_TESTICLES

/datum/bodypart_overlay/mutant/genital/testicles/inherit_color(obj/item/bodypart/bodypart_owner, force)
	// honestly this should be how inherit_color should be handled for ALL mutant overlays
	if(sprite_datum.color_src == USE_MATRIXED_COLORS)
		if(isnull(bodypart_owner))
			draw_color = null
			return TRUE

		if(draw_color && !force)
			return FALSE

		draw_color = bodypart_owner.owner?.dna.features[FEATURE_TESTICLES_NOCTURNE_COLORS]
		return TRUE
	else
		return ..()

