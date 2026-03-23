// regenerate_organs override

/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE, replace_missing = TRUE)
	. = ..()
	if(target.dna.features[FEATURE_EARS_NOCTURNE] && can_regenerate_mutant_feature(FEATURE_EARS_NOCTURNE))
		if(target.dna.features[FEATURE_EARS_NOCTURNE] != /datum/sprite_accessory/nocturne/ears/none::name && target.dna.features[FEATURE_EARS_NOCTURNE] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/ears/mutant)
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .

// ear toggle

/datum/preference/toggle/nocturne_toggle/ears
	savefile_key = "has_ears_nocturne"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	feature_key = FEATURE_EARS_NOCTURNE

// ear options

/datum/preference/choiced/nocturne_feature/ears
	savefile_key = "feature_ears_nocturne"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Ears"
	should_generate_icons = TRUE
	relevant_organ = /obj/item/organ/ears/mutant
	category = PREFERENCE_CATEGORY_CLOTHING
	feature_key = FEATURE_EARS_NOCTURNE
	toggle_pref = /datum/preference/toggle/nocturne_toggle/ears

/datum/preference/choiced/nocturne_feature/ears/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/ears_color::savefile_key
	return data

/datum/preference/choiced/nocturne_feature/ears/create_default_value()
	return SPRITE_ACCESSORY_NONE

/datum/preference/choiced/nocturne_feature/ears/icon_for(value)
	return generate_ears_icon(get_accessory_for_value(value))

/datum/preference/choiced/nocturne_feature/ears/proc/generate_ears_icon(datum/sprite_accessory/sprite_accessory)
	var/static/datum/universal_icon/body
	if (isnull(body))
		body = uni_icon('modular_nocturne/modules/customization/icons/mob/human/species/anthro/bodyparts.dmi', "anthro_head_m")
	var/datum/universal_icon/final_icon = body.copy()

	if(sprite_accessory.icon_state != "none")
		if(icon_exists(sprite_accessory.icon, "m_ears_noct_[sprite_accessory.icon_state]_ADJ"))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_ears_noct_[sprite_accessory.icon_state]_ADJ")
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_RED, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_ears_noct_[sprite_accessory.icon_state]_ADJ_2"))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_ears_noct_[sprite_accessory.icon_state]_ADJ_2")
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_ears_noct_[sprite_accessory.icon_state]_ADJ_3"))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_ears_noct_[sprite_accessory.icon_state]_ADJ_3")
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_BLUE, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		// front breaker
		if(icon_exists(sprite_accessory.icon, "m_ears_noct_[sprite_accessory.icon_state]_FRONT"))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_ears_noct_[sprite_accessory.icon_state]_FRONT")
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_RED, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_ears_noct_[sprite_accessory.icon_state]_FRONT_2"))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_ears_noct_[sprite_accessory.icon_state]_FRONT_2")
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_ears_noct_[sprite_accessory.icon_state]_FRONT_3"))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_ears_noct_[sprite_accessory.icon_state]_FRONT_3")
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_BLUE, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)

	final_icon.crop(11, 20, 23, 32)
	final_icon.scale(32, 32)

	return final_icon

/datum/preference/tri_color/ears_color
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "ears_nocturne_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/ears_color/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/ears_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features[FEATURE_EARS_NOCTURNE_COLORS] = value

/datum/preference/tri_color/ears_color/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE
