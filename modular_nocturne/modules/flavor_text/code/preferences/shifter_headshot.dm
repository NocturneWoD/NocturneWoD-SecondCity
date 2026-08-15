/datum/preference/text/headshot/war_form_headshot
	priority = PREFERENCE_PRIORITY_BODYPARTS
	savefile_key = "war_form_headshot"
	relevant_inherent_trait = TRAIT_FERA_FORMS
	must_have_relevant_trait = TRUE

/datum/preference/text/headshot/war_form_headshot/apply_to_human(mob/living/carbon/human/target, value)
	target?.dna.features[EXAMINE_DNA_WAR_FORM_HEADSHOT] = value

/datum/preference/text/headshot/feral_form_headshot
	priority = PREFERENCE_PRIORITY_BODYPARTS
	savefile_key = "feral_form_headshot"
	relevant_inherent_trait = TRAIT_FERA_FORMS
	must_have_relevant_trait = TRUE

/datum/preference/text/headshot/feral_form_headshot/apply_to_human(mob/living/carbon/human/target, value)
	target?.dna.features[EXAMINE_DNA_FERAL_FORM_HEADSHOT] = value
