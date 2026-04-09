// regenerate_organs override

/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE, replace_missing = TRUE)
	. = ..()
	if(target.dna.features[FEATURE_BREASTS_NOCTURNE] && can_regenerate_mutant_feature(FEATURE_BREASTS_NOCTURNE))
		if(target.dna.features[FEATURE_BREASTS_NOCTURNE] != /datum/sprite_accessory/nocturne/breasts/none::name && target.dna.features[FEATURE_BREASTS_NOCTURNE] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/genital/breasts)
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .
	var/obj/item/organ/old_part = target.get_organ_slot(ORGAN_SLOT_EXTERNAL_BREASTS)
	if(old_part)
		old_part.Remove(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_part.moveToNullspace()

// ear toggle

/datum/preference/toggle/nocturne_toggle/breasts
	savefile_key = "has_breasts_nocturne"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	feature_key = FEATURE_BREASTS_NOCTURNE

// ear options

/datum/preference/choiced/nocturne_feature/breasts
	savefile_key = "feature_breasts_nocturne"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Breasts"
	should_generate_icons = TRUE
	category = PREFERENCE_CATEGORY_CLOTHING
	feature_key = FEATURE_BREASTS_NOCTURNE
	toggle_pref = /datum/preference/toggle/nocturne_toggle/breasts

/datum/preference/choiced/nocturne_feature/breasts/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/breasts_color::savefile_key
	return data

/datum/preference/choiced/nocturne_feature/breasts/create_default_value()
	return SPRITE_ACCESSORY_NONE

/datum/preference/choiced/nocturne_feature/breasts/icon_for(value)
	return generate_breasts_icon(get_accessory_for_value(value))

/datum/preference/choiced/nocturne_feature/breasts/proc/generate_breasts_icon(datum/sprite_accessory/sprite_accessory)
	var/static/datum/universal_icon/final_icon
	final_icon = uni_icon('icons/mob/human/bodyparts_greyscale.dmi', "human_chest_f", SOUTH)

	if (!isnull(sprite_accessory))
		if(icon_exists(sprite_accessory.icon, "m_breasts_[sprite_accessory.icon_state]_ADJ"))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_breasts_[sprite_accessory.icon_state]_ADJ", SOUTH)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_breasts_[sprite_accessory.icon_state]_ADJ_2"))
			var/datum/universal_icon/accessory_icon_2 = uni_icon(sprite_accessory.icon, "m_breasts_[sprite_accessory.icon_state]_ADJ_2", SOUTH)
			accessory_icon_2.blend_color(COLOR_LIGHT_GRAYISH_RED, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon_2, ICON_OVERLAY)

	final_icon.crop(10, 8, 22, 23)
	final_icon.scale(26, 32)
	final_icon.crop(-2, 1, 29, 32)

	return final_icon

/datum/preference/tri_color/breasts_color
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "breasts_nocturne_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/breasts_color/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/breasts_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features[FEATURE_BREASTS_NOCTURNE_COLORS] = value

/datum/preference/tri_color/breasts_color/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE
