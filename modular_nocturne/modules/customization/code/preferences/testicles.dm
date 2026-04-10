// regenerate_organs override

/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE, replace_missing = TRUE)
	. = ..()
	if(target.dna.features[FEATURE_TESTICLES_NOCTURNE] && can_regenerate_mutant_feature(FEATURE_TESTICLES_NOCTURNE))
		if(target.dna.features[FEATURE_TESTICLES_NOCTURNE] != /datum/sprite_accessory/nocturne/testicles/none::name && target.dna.features[FEATURE_TESTICLES_NOCTURNE] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/genital/testicles)
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .
	var/obj/item/organ/old_part = target.get_organ_slot(ORGAN_SLOT_EXTERNAL_TESTICLES)
	if(old_part)
		old_part.Remove(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_part.moveToNullspace()

// testicles toggle

/datum/preference/toggle/nocturne_toggle/testicles
	savefile_key = "has_testicles_nocturne"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	feature_key = FEATURE_TESTICLES_NOCTURNE

// testicles options

/datum/preference/choiced/nocturne_feature/testicles
	savefile_key = "feature_testicles_nocturne"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Testicles"
	should_generate_icons = TRUE
	category = PREFERENCE_CATEGORY_CLOTHING
	feature_key = FEATURE_TESTICLES_NOCTURNE
	toggle_pref = /datum/preference/toggle/nocturne_toggle/testicles

/datum/preference/choiced/nocturne_feature/testicles/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/testicles_color::savefile_key
	return data

/datum/preference/choiced/nocturne_feature/testicles/create_default_value()
	return SPRITE_ACCESSORY_NONE

/datum/preference/choiced/nocturne_feature/testicles/icon_for(value)
	return generate_testicles_icon(get_accessory_for_value(value))

/datum/preference/choiced/nocturne_feature/testicles/proc/generate_testicles_icon(datum/sprite_accessory/sprite_accessory)
	var/static/datum/universal_icon/body
	if (isnull(body))
		body = uni_icon('icons/mob/human/human.dmi', "human_basic", SOUTH)
	var/datum/universal_icon/final_icon = body.copy()

	if (!isnull(sprite_accessory))
		if(icon_exists(sprite_accessory.icon, "m_testicles_[sprite_accessory.icon_state]_FRONT_UNDER"))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_testicles_[sprite_accessory.icon_state]_FRONT_UNDER", SOUTH)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)

	final_icon.crop(8, 1, 24, 16)
	final_icon.scale(32, 32)

	return final_icon

// color

/datum/preference/tri_color/testicles_color
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "testicles_nocturne_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/testicles_color/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/testicles_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features[FEATURE_TESTICLES_NOCTURNE_COLORS] = value

/datum/preference/tri_color/testicles_color/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE
