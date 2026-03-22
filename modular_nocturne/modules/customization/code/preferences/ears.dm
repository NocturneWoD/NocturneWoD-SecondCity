// snout toggle

/datum/preference/toggle/snout
	savefile_key = "has_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/snout/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features[FEATURE_SNOUT_NOCTURNE] = /datum/sprite_accessory/snouts/none::name

/datum/preference/toggle/snout/create_default_value()
	return FALSE

/datum/preference/toggle/snout/is_accessible(datum/preferences/preferences)
	. = ..()
	var/species = preferences.read_preference(/datum/preference/choiced/species)
	if(!species_can_access_mutant_customization(species))
		return FALSE
	return TRUE

/datum/preference/choiced/species_feature/felinid_ears
	category = PREFERENCE_CATEGORY_CLOTHING
