/mob/living/carbon/human/species/anthro
	race = /datum/species/human/anthro

/datum/species/human/anthro
	name = "Anthro"
	id = SPECIES_ANTHRO
	examine_limb_id = SPECIES_ANTHRO
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
	)
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/anthro,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/anthro,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/anthro,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/anthro,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/anthro,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/anthro,
	)
	mutant_features = list(
		FEATURE_EARS_NOCTURNE,
		FEATURE_SNOUT_NOCTURNE
	)
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	digi_leg_overrides = list(
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/digitigrade/anthro,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/digitigrade/anthro,
	)

/datum/species/human/anthro/get_species_description()
	return "A blank slate for you to make whatever silly creature your little heart desires!"

/datum/species/human/anthro/get_species_lore()
	return list(
		"\"...let me let you in on a little secret. You know how we're all this hodgepodge of different looking beings? \
		Some furred, some furless, sometimes with ears and tails, sometimes not? What if I told you that it wasn't always like this?",

		"There was a guy I knew fourty years back-- funny dude, he was. His name was Ken. He dabbled in... 'magic', to put it mildly. \
		And I don't mean some innuendo for drugs, or whatever the fuck-- I mean actual, honest to god MAGIC. \
		I mean, he did drugs, too, but, whatever. You seen those movies they're coming out with? Of wizards casting fireballs and shit? \
		THAT kind of magic. Real life mages.",

		"Right, right, right-- Anyways, I knew this guy, Ken. He'd host these parties back in, like... '66, I wanna say? We'd call them \
		'acid tests'. Everybody would drink this fruit punch that was laced with acid. This was before it got made illegal.",

		"You wanna know something about acid? It's bullshit!\"",
	)

/*
/datum/species/human/genemod/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	human_for_preview.dna.features[FEATURE_EARS] = "Fold"
	human_for_preview.dna.features[FEATURE_EARS_COLORS][1] = "#4E3E30"
	human_for_preview.dna.features[FEATURE_EARS_COLORS][2] = "#F4B1C8"
	human_for_preview.set_haircolor("#3a2d22", update = FALSE)
	human_for_preview.set_hairstyle("Short twintails", update = TRUE)
	human_for_preview.dna.features[FEATURE_MUTANT_COLOR] = skintone2hex("mixed3")
	human_for_preview.eye_color_left = "#442B12"
	human_for_preview.eye_color_right = "#442B12"
	regenerate_organs(human_for_preview)
	human_for_preview.update_body(is_creating = TRUE)
*/
