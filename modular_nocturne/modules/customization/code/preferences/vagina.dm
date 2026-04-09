// regenerate_organs override

/datum/species/regenerate_organs(mob/living/carbon/target, datum/species/old_species, replace_current = TRUE, list/excluded_zones, visual_only = FALSE, replace_missing = TRUE)
	. = ..()
	if(target.dna.features[FEATURE_VAGINA_NOCTURNE] && can_regenerate_mutant_feature(FEATURE_VAGINA_NOCTURNE))
		if(target.dna.features[FEATURE_VAGINA_NOCTURNE] != /datum/sprite_accessory/nocturne/vagina/none::name && target.dna.features[FEATURE_VAGINA_NOCTURNE] != /datum/sprite_accessory/blank::name)
			var/obj/item/organ/replacement = SSwardrobe.provide_type(/obj/item/organ/genital/vagina)
			replacement.Insert(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
			return .
	var/obj/item/organ/old_part = target.get_organ_slot(ORGAN_SLOT_EXTERNAL_VAGINA)
	if(old_part)
		old_part.Remove(target, special = TRUE, movement_flags = DELETE_IF_REPLACED)
		old_part.moveToNullspace()

// vagina toggle

/datum/preference/toggle/nocturne_toggle/vagina
	savefile_key = "has_vagina_nocturne"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	feature_key = FEATURE_VAGINA_NOCTURNE

// vagina options

/datum/preference/choiced/nocturne_feature/vagina
	savefile_key = "feature_vagina_nocturne"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Vagina"
	should_generate_icons = TRUE
	category = PREFERENCE_CATEGORY_CLOTHING
	feature_key = FEATURE_VAGINA_NOCTURNE
	toggle_pref = /datum/preference/toggle/nocturne_toggle/vagina

/datum/preference/choiced/nocturne_feature/vagina/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = /datum/preference/tri_color/vagina_color::savefile_key
	return data

/datum/preference/choiced/nocturne_feature/vagina/create_default_value()
	return SPRITE_ACCESSORY_NONE

/datum/preference/choiced/nocturne_feature/vagina/icon_for(value)
	return generate_vagina_icon(get_accessory_for_value(value))

/datum/preference/choiced/nocturne_feature/vagina/proc/generate_vagina_icon(datum/sprite_accessory/sprite_accessory)
	var/static/datum/universal_icon/body
	if (isnull(body))
		body = uni_icon('icons/mob/human/human.dmi', "human_basic", SOUTH)
	var/datum/universal_icon/final_icon = body.copy()

	if (!isnull(sprite_accessory))
		if(icon_exists(sprite_accessory.icon, "m_vagina_[sprite_accessory.icon_state]_FRONT_UNDER"))
			var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_vagina_[sprite_accessory.icon_state]_FRONT_UNDER", SOUTH)
			final_icon.blend_icon(accessory_icon, ICON_OVERLAY)

	final_icon.crop(8, 1, 24, 16)
	final_icon.scale(32, 32)

	return final_icon

// color

/datum/preference/tri_color/vagina_color
	priority = PREFERENCE_PRIORITY_BODY_TYPE
	savefile_key = "vagina_nocturne_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/tri_color/vagina_color/create_default_value()
	return list(sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"),
	sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]"))

/datum/preference/tri_color/vagina_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features[FEATURE_VAGINA_NOCTURNE_COLORS] = value

/datum/preference/tri_color/vagina_color/is_valid(value)
	if (!..(value))
		return FALSE
	return TRUE
