// regenerate_organs override

/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE, replace_missing = TRUE)
	. = ..()
	if(target.dna.features[FEATURE_TAIL_NOCTURNE] && can_regenerate_mutant_feature(FEATURE_TAIL_NOCTURNE))
		if(target.dna.features[FEATURE_TAIL_NOCTURNE] != /datum/sprite_accessory/nocturne/tails/none::name && target.dna.features[FEATURE_TAIL_NOCTURNE] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/tail/mutant)
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .
	var/obj/item/organ/old_part = target.get_organ_slot(ORGAN_SLOT_EXTERNAL_TAIL)
	if(old_part && old_part.type == /obj/item/organ/tail/mutant) // only delete if this the mutant tail
		old_part.Remove(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_part.moveToNullspace()

// tail toggle

/datum/preference/toggle/nocturne_toggle/tail
	savefile_key = "has_tail_nocturne"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	feature_key = FEATURE_TAIL_NOCTURNE

// actual tail options

/datum/preference/choiced/nocturne_feature/tail
	savefile_key = "feature_tail_nocturne"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Tail"
	should_generate_icons = TRUE
	relevant_organ = /obj/item/organ/tail/mutant
	category = PREFERENCE_CATEGORY_CLOTHING
	feature_key = FEATURE_TAIL_NOCTURNE
	toggle_pref = /datum/preference/toggle/nocturne_toggle/tail

/datum/preference/choiced/nocturne_feature/tail/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/tail_color::savefile_key
	return data

/datum/preference/choiced/nocturne_feature/tail/create_default_value()
	return SPRITE_ACCESSORY_NONE

/datum/preference/choiced/nocturne_feature/tail/icon_for(value)
	return generate_tail_icon(get_accessory_for_value(value))

/datum/preference/choiced/nocturne_feature/tail/proc/generate_tail_icon(datum/sprite_accessory/sprite_accessory)
	var/static/datum/universal_icon/body
	if (isnull(body))
		body = uni_icon('icons/mob/human/human.dmi', "human_basic", NORTH)
	var/datum/universal_icon/final_icon = body.copy()

	if(sprite_accessory.icon_state != "none")
		if(icon_exists(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_BEHIND", NORTH))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_BEHIND", NORTH)
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_RED, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_BEHIND_2", NORTH))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_BEHIND_2", NORTH)
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_BEHIND_3", NORTH))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_BEHIND_3", NORTH)
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_BLUE, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		// adjacent breaker
		if(icon_exists(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_ADJ", NORTH))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_ADJ", NORTH)
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_RED, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_ADJ_2", NORTH))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_ADJ_2", NORTH)
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_ADJ_3", NORTH))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_ADJ_3", NORTH)
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_BLUE, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		// front breaker
		if(icon_exists(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_FRONT", NORTH))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_FRONT", NORTH)
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_RED, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_FRONT_2", NORTH))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_FRONT_2", NORTH)
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)
		if(icon_exists(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_FRONT_3", NORTH))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_tail_[sprite_accessory.icon_state]_FRONT_3", NORTH)
			accessory_icon.shift(NORTH, 0)
			accessory_icon.blend_color(COLOR_BLUE, ICON_MULTIPLY)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)

	final_icon.crop(0, 0, 32, 32)
	final_icon.scale(32, 32)

	return final_icon

// tail colors

/datum/preference/tri_color/tail_color
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "tail_nocturne_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/tail_color/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/tail_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features[FEATURE_TAIL_NOCTURNE_COLORS] = value

/datum/preference/tri_color/tail_color/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE
