// snout toggle

/datum/preference/toggle/snout
	savefile_key = "has_snout"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_DEFAULT

/datum/preference/toggle/snout/apply_to_human(mob/living/carbon/human/target, value)
	if(value == FALSE)
		target.dna.features[FEATURE_SNOUT] = /datum/sprite_accessory/snouts/none::name

/datum/preference/toggle/snout/create_default_value()
	return FALSE

/datum/preference/toggle/snout/is_accessible(datum/preferences/preferences)
	. = ..()
	var/species = preferences.read_preference(/datum/preference/choiced/species)
	if(!species_can_access_mutant_customization(species))
		return FALSE
	return TRUE


// actual snout options

/datum/preference/choiced/species_feature/lizard_snout
	category = PREFERENCE_CATEGORY_CLOTHING

/datum/preference/choiced/species_feature/lizard_snout/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/snout_color::savefile_key
	return data

/datum/preference/choiced/species_feature/lizard_snout/is_accessible(datum/preferences/preferences)
	. = ..()
	var/datum/species/species = preferences.read_preference(/datum/preference/choiced/species)
	if(!species_can_access_mutant_customization(species))
		return FALSE
	var/has_snout = preferences.read_preference(/datum/preference/toggle/snout)
	if(has_snout == TRUE)
		return TRUE
	return FALSE

/datum/preference/choiced/species_feature/lizard_snout/create_default_value()
	return /datum/sprite_accessory/snouts/none::name

/datum/preference/choiced/species_feature/lizard_snout/icon_for(value)
	return generate_snout_icon(get_accessory_for_value(value))

/datum/preference/choiced/proc/generate_snout_icon(datum/sprite_accessory/sprite_accessory)
	var/static/datum/universal_icon/body
	if (isnull(body))
		body = uni_icon('modular_nocturne/modules/customization/icons/mob/human/species/anthro/bodyparts.dmi', "anthro_head_m", EAST)
	var/datum/universal_icon/final_icon = body.copy()

	if(sprite_accessory.icon_state != "none")
		if(icon_exists(sprite_accessory.icon, "m_snout_[sprite_accessory.icon_state]_ADJ"))
			var/datum/universal_icon/accessory_icon_adj = uni_icon(sprite_accessory.icon, "m_snout_[sprite_accessory.icon_state]_ADJ", EAST)
			accessory_icon_adj.blend_color(COLOR_RED, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon_adj, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_snout_[sprite_accessory.icon_state]_ADJ_2"))
			var/datum/universal_icon/accessory_icon_adj_2 = uni_icon(sprite_accessory.icon, "m_snout_[sprite_accessory.icon_state]_ADJ_2", EAST)
			accessory_icon_adj_2.blend_color(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon_adj_2, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_snout_[sprite_accessory.icon_state]_ADJ_3"))
			var/datum/universal_icon/accessory_icon_adj_3 = uni_icon(sprite_accessory.icon, "m_snout_[sprite_accessory.icon_state]_ADJ_3", EAST)
			accessory_icon_adj_3.blend_color(COLOR_BLUE, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon_adj_3, ICON_OVERLAY)
		///front breaker
		if(icon_exists(sprite_accessory.icon, "m_snout_[sprite_accessory.icon_state]_FRONT"))
			var/datum/universal_icon/accessory_icon_front = uni_icon(sprite_accessory.icon, "m_snout_[sprite_accessory.icon_state]_FRONT", EAST)
			accessory_icon_front.blend_color(COLOR_RED, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon_front, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_snout_[sprite_accessory.icon_state]_FRONT_2"))
			var/datum/universal_icon/accessory_icon_front_2 = uni_icon(sprite_accessory.icon, "m_snout_[sprite_accessory.icon_state]_FRONT_2", EAST)
			accessory_icon_front_2.blend_color(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon_front_2, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_snout_[sprite_accessory.icon_state]_FRONT_3"))
			var/datum/universal_icon/accessory_icon_front_3 = uni_icon(sprite_accessory.icon, "m_snout_[sprite_accessory.icon_state]_FRONT_3", EAST)
			accessory_icon_front_3.blend_color(COLOR_BLUE, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon_front_3, ICON_OVERLAY)

	final_icon.crop(11, 20, 23, 32)
	final_icon.scale(32, 32)

	return final_icon


// snout colors

/datum/preference/tri_color/snout_color
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "snout_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES
	//relevant_external_organ = /obj/item/organ/snout

/datum/preference/tri_color/snout_color/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/snout_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features[FEATURE_SNOUT_COLORS] = value

/datum/preference/tri_color/snout_color/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE
