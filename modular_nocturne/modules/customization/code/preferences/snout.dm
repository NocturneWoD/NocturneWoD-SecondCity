// regenerate_organs override

/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE, replace_missing = TRUE)
	. = ..()
	if(target.dna.features[FEATURE_SNOUT_NOCTURNE] && can_regenerate_mutant_feature(FEATURE_SNOUT_NOCTURNE))
		if(target.dna.features[FEATURE_SNOUT_NOCTURNE] != /datum/sprite_accessory/nocturne/snouts/none::name && target.dna.features[FEATURE_SNOUT_NOCTURNE] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/snout/mutant)
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .
	var/obj/item/organ/old_part = target.get_organ_slot(ORGAN_SLOT_EXTERNAL_SNOUT)
	if(old_part && old_part.type == /obj/item/organ/snout/mutant) // only delete if this the mutant snout
		old_part.Remove(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_part.moveToNullspace()

// snout toggle

/datum/preference/toggle/nocturne_toggle/snout
	savefile_key = "has_snout_nocturne"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	feature_key = FEATURE_SNOUT_NOCTURNE

// actual snout options

/datum/preference/choiced/nocturne_feature/snout
	savefile_key = "feature_snout_nocturne"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Snout"
	should_generate_icons = TRUE
	relevant_organ = /obj/item/organ/snout/mutant
	category = PREFERENCE_CATEGORY_CLOTHING
	feature_key = FEATURE_SNOUT_NOCTURNE
	toggle_pref = /datum/preference/toggle/nocturne_toggle/snout

/datum/preference/choiced/nocturne_feature/snout/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/snout_color::savefile_key
	return data

/datum/preference/choiced/nocturne_feature/snout/create_default_value()
	return SPRITE_ACCESSORY_NONE

/datum/preference/choiced/nocturne_feature/snout/icon_for(value)
	return generate_snout_icon(get_accessory_for_value(value))

/datum/preference/choiced/nocturne_feature/snout/proc/generate_snout_icon(datum/sprite_accessory/sprite_accessory)
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
	savefile_key = "snout_nocturne_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/snout_color/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/snout_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features[FEATURE_SNOUT_NOCTURNE_COLORS] = value

/datum/preference/tri_color/snout_color/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE
