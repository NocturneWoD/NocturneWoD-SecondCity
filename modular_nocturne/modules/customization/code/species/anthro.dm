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
	mutantears = /obj/item/organ/ears/mutant
	mutant_features = list(
		FEATURE_EARS_NOCTURNE,
		FEATURE_FRILLS_NOCTURNE,
		FEATURE_HORNS_NOCTURNE,
		FEATURE_SNOUT_NOCTURNE,
		FEATURE_TAIL_NOCTURNE,
		FEATURE_FLUFF_NOCTURNE,
		FEATURE_BREASTS_NOCTURNE,
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

/datum/species/human/anthro/prepare_human_for_preview(mob/living/carbon/human/human)
	// generic lizard
	human.set_hairstyle("Bald", update = TRUE)
	human.set_facial_hairstyle("Shaved", update = TRUE)
	human.dna.features[FEATURE_MUTANT_COLOR] = "#556B4A"
	human.dna.features[FEATURE_FRILLS_NOCTURNE_COLORS] = list("#556B4A", "#556B4A", "#556B4A")
	human.dna.features[FEATURE_HORNS_NOCTURNE_COLORS] = list("#2D2824", "#2D2824", "#2D2824")
	human.dna.features[FEATURE_SNOUT_NOCTURNE_COLORS] = list("#556B4A", "#556B4A", "#556B4A")
	human.dna.features[FEATURE_EARS_NOCTURNE] = SPRITE_ACCESSORY_NONE
	human.dna.features[FEATURE_FRILLS_NOCTURNE] = "Short"
	human.dna.features[FEATURE_HORNS_NOCTURNE] = "Curled"
	human.dna.features[FEATURE_SNOUT_NOCTURNE] = "Lizard (Sharp)"
	human.dna.features[FEATURE_TAIL_NOCTURNE] = SPRITE_ACCESSORY_NONE
	human.dna.features[FEATURE_FLUFF_NOCTURNE] = SPRITE_ACCESSORY_NONE
	human.undershirt = "Tank Top (White)"
	regenerate_organs(human)
	human.update_body(is_creating = TRUE)
