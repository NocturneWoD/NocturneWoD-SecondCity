/datum/preference/toggle/nocturne_toggle
	abstract_type = /datum/preference/toggle/nocturne_toggle

	/// What feature key does this feature represent?
	var/feature_key

/datum/preference/choiced/nocturne_feature/New()
	. = ..()
	if(isnull(feature_key))
		CRASH("`feature_key` was not set for [type]!")

/datum/preference/toggle/nocturne_toggle/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features[feature_key] = SPRITE_ACCESSORY_NONE

/datum/preference/toggle/nocturne_toggle/create_default_value()
	return FALSE

/datum/preference/toggle/nocturne_toggle/is_accessible(datum/preferences/preferences)
	. = ..()
	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = GLOB.species_prototypes[species_type]
	if(LAZYLEN(species.mutant_features) && (feature_key in species.mutant_features))
		return TRUE
	return FALSE

/datum/preference/choiced/nocturne_feature
	abstract_type = /datum/preference/choiced/nocturne_feature
	/// What feature key does this feature represent?
	/// Does not need to be set, it will infer it from either relevant_organ or relevant_body_markings.
	/// However you can set it manually if you have a more complex feature.
	var/feature_key
	/// The specific preference that will allow the feature toggle to be seen.
	/// If unset, will be always visible
	var/datum/preference/toggle/nocturne_toggle/toggle_pref

/datum/preference/choiced/nocturne_feature/New()
	. = ..()
	if(isnull(feature_key))
		CRASH("`feature_key` was not set for [type]!")

/datum/preference/choiced/nocturne_feature/init_possible_values()
	return assoc_to_keys_features(get_accessory_list() - SPRITE_ACCESSORY_NONE)

/datum/preference/choiced/nocturne_feature/create_default_value()
	return get_consistent_feature_entry(get_accessory_list())

/datum/preference/choiced/nocturne_feature/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features[feature_key] = value

/datum/preference/choiced/nocturne_feature/is_accessible(datum/preferences/preferences)
	. = ..()
	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = GLOB.species_prototypes[species_type]
	if(!LAZYLEN(species.mutant_features) || !(feature_key in species.mutant_features))
		return FALSE
	if(toggle_pref)
		var/has_toggle = preferences.read_preference(toggle_pref)
		if(has_toggle == TRUE)
			return TRUE
		else
			return FALSE
	return TRUE

/// Returns what acessory list to draw from
/datum/preference/choiced/nocturne_feature/proc/get_accessory_list() as /list
	return SSaccessories.feature_list[feature_key]

/// Get a specific accessory for a given value
/datum/preference/choiced/nocturne_feature/proc/get_accessory_for_value(value)
	return get_accessory_list()[value]
