/datum/preference/choiced/bra
	savefile_key = "bra"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Bra"
	category = PREFERENCE_CATEGORY_CLOTHING
	should_generate_icons = TRUE

/datum/preference/choiced/bra/init_possible_values()
	return assoc_to_keys_features(SSaccessories.bra_list)

/datum/preference/choiced/bra/icon_for(value)
	var/static/datum/universal_icon/body
	if (isnull(body))
		body = uni_icon('icons/mob/human/bodyparts_greyscale.dmi', "human_r_arm")
		body.blend_icon(uni_icon('icons/mob/human/bodyparts_greyscale.dmi', "human_l_arm"), ICON_OVERLAY)
		body.blend_icon(uni_icon('icons/mob/human/bodyparts_greyscale.dmi', "human_r_hand"), ICON_OVERLAY)
		body.blend_icon(uni_icon('icons/mob/human/bodyparts_greyscale.dmi', "human_l_hand"), ICON_OVERLAY)
		body.blend_icon(uni_icon('icons/mob/human/bodyparts_greyscale.dmi', "human_chest_m"), ICON_OVERLAY)

	var/datum/universal_icon/icon_with_bra = body.copy()

	if (value != "Nude")
		var/datum/sprite_accessory/accessory = SSaccessories.bra_list[value]
		icon_with_bra.blend_icon(uni_icon(accessory.icon, accessory.icon_state), ICON_OVERLAY)

	icon_with_bra.crop(10, 11, 22, 23)
	icon_with_bra.scale(32, 32)
	return icon_with_bra

/datum/preference/choiced/bra/apply_to_human(mob/living/carbon/human/target, value)
	target.bra = value

/datum/preference/choiced/bra/compile_constant_data()
	var/list/data = ..()
	data[SUPPLEMENTAL_FEATURE_KEY] = "bra_color"

	return data

/datum/preference/choiced/bra/create_informed_default_value(datum/preferences/preferences)
	if(preferences.read_preference(/datum/preference/choiced/gender) == FEMALE)
		return /datum/sprite_accessory/clothing/bra/sports_bra::name
	return /datum/sprite_accessory/clothing/bra/nude::name

// colors

/datum/preference/color/undershirt_color
	savefile_key = "undershirt_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/color/undershirt_color/apply_to_human(mob/living/carbon/human/target, value)
	target.undershirt_color = value

/datum/preference/color/socks_color
	savefile_key = "socks_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/color/socks_color/apply_to_human(mob/living/carbon/human/target, value)
	target.socks_color = value


/datum/preference/color/bra_color
	savefile_key = "bra_color"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SUPPLEMENTAL_FEATURES

/datum/preference/color/bra_color/apply_to_human(mob/living/carbon/human/target, value)
	target.bra_color = value
