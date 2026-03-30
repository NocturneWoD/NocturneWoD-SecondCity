/obj/item/bodypart/head/anthro
	icon_greyscale = 'modular_nocturne/modules/customization/icons/mob/human/species/anthro/bodyparts.dmi'
	limb_id = SPECIES_ANTHRO

/obj/item/bodypart/chest/anthro
	icon_greyscale = 'modular_nocturne/modules/customization/icons/mob/human/species/anthro/bodyparts.dmi'
	limb_id = SPECIES_ANTHRO

/obj/item/bodypart/arm/left/anthro
	icon_greyscale = 'modular_nocturne/modules/customization/icons/mob/human/species/anthro/bodyparts.dmi'
	limb_id = SPECIES_ANTHRO

/obj/item/bodypart/arm/right/anthro
	icon_greyscale = 'modular_nocturne/modules/customization/icons/mob/human/species/anthro/bodyparts.dmi'
	limb_id = SPECIES_ANTHRO

/obj/item/bodypart/leg/left/anthro
	icon_greyscale = 'modular_nocturne/modules/customization/icons/mob/human/species/anthro/bodyparts.dmi'
	limb_id = SPECIES_ANTHRO

/obj/item/bodypart/leg/right/anthro
	icon_greyscale = 'modular_nocturne/modules/customization/icons/mob/human/species/anthro/bodyparts.dmi'
	limb_id = SPECIES_ANTHRO

/obj/item/bodypart/leg/left/digitigrade/anthro
	icon_greyscale = 'modular_nocturne/modules/customization/icons/mob/human/species/anthro/bodyparts.dmi'
	var/override_limb_id = null

/obj/item/bodypart/leg/left/digitigrade/anthro/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(!override_limb_id)
		if(limb_id == SPECIES_LIZARD)
			limb_id = SPECIES_ANTHRO
	else
		if(limb_id == BODYPART_ID_DIGITIGRADE)
			limb_id = override_limb_id + "_digitigrade"
		else
			limb_id = override_limb_id

/obj/item/bodypart/leg/left/digitigrade/anthro/change_appearance(icon, id, greyscale, dimorphic)
	var/icon_holder
	if(greyscale)
		icon_greyscale = icon
		icon_holder = icon
		should_draw_greyscale = TRUE
	else
		icon_static = icon
		icon_holder = icon
		should_draw_greyscale = FALSE

	if(id) //limb_id should never be falsey
		override_limb_id = id

	if(!isnull(dimorphic))
		is_dimorphic = dimorphic

	if(!owner)
		update_icon_dropped()
	else if(!(owner.living_flags & STOP_OVERLAY_UPDATE_BODY_PARTS))
		owner.update_body_parts()

	//This foot gun needs a safety
	if(!icon_exists(icon_holder, "[override_limb_id]_digitigrade_[body_zone][is_dimorphic ? "_[limb_gender]" : ""]"))
		reset_appearance()
		stack_trace("change_appearance([icon], [id], [greyscale], [dimorphic]) generated null digitigrade icon")

/obj/item/bodypart/leg/left/digitigrade/anthro/reset_appearance()
	override_limb_id = null
	. = ..()

/obj/item/bodypart/leg/right/digitigrade/anthro
	icon_greyscale = 'modular_nocturne/modules/customization/icons/mob/human/species/anthro/bodyparts.dmi'
	var/override_limb_id = null

/obj/item/bodypart/leg/right/digitigrade/anthro/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(!override_limb_id)
		if(limb_id == SPECIES_LIZARD)
			limb_id = SPECIES_ANTHRO
	else
		if(limb_id == SPECIES_LIZARD)
			limb_id = override_limb_id
		else
			limb_id = override_limb_id + "_digitigrade"

/obj/item/bodypart/leg/right/digitigrade/anthro/change_appearance(icon, id, greyscale, dimorphic)
	var/icon_holder
	if(greyscale)
		icon_greyscale = icon
		icon_holder = icon
		should_draw_greyscale = TRUE
	else
		icon_static = icon
		icon_holder = icon
		should_draw_greyscale = FALSE

	if(id) //limb_id should never be falsey
		override_limb_id = id

	if(!isnull(dimorphic))
		is_dimorphic = dimorphic

	if(!owner)
		update_icon_dropped()
	else if(!(owner.living_flags & STOP_OVERLAY_UPDATE_BODY_PARTS))
		owner.update_body_parts()

	//This foot gun needs a safety
	if(!icon_exists(icon_holder, "[override_limb_id]_digitigrade_[body_zone][is_dimorphic ? "_[limb_gender]" : ""]"))
		reset_appearance()
		stack_trace("change_appearance([icon], [id], [greyscale], [dimorphic]) generated null digitigrade icon")

/obj/item/bodypart/leg/right/digitigrade/anthro/reset_appearance()
	override_limb_id = null
	. = ..()
