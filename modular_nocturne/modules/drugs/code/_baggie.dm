/datum/storage/baggie
	max_slots = 6
	max_total_storage = 6
	max_specific_storage = WEIGHT_CLASS_SMALL

/obj/item/storage/box/baggie
	name = "small plastic bag"
	desc = "A small ziploc bag for holding things."

	icon_state = "package_empty"
	icon = 'modular_darkpack/modules/drugs/icons/items.dmi'
	ONFLOOR_ICON_HELPER('modular_darkpack/modules/drugs/icons/onfloor.dmi')
	inhand_icon_state = null

	resistance_flags = NONE
	custom_materials = list(/datum/material/plastic = SHEET_MATERIAL_AMOUNT)

	storage_type = /datum/storage/baggie
	illustration = null
	foldable_result = null

	/// Number of items to spawn
	VAR_PROTECTED/spawn_count
	/// Item type to spawn
	VAR_PROTECTED/obj/item/spawn_type

/obj/item/storage/box/baggie/PopulateContents()
	SHOULD_NOT_OVERRIDE(TRUE)

	if(!spawn_count)
		return

	for(var/i in 1 to spawn_count)
		new spawn_type(src)

	icon_state = initial(icon_state) // update_icon_state is called before PopulateContents is called, so we need to set it back to the original value
	name = initial(name) // this is just to be safe

/obj/item/storage/box/baggie/update_icon_state()
	if(contents.len == 0)
		icon_state = /obj/item/storage/box/baggie::icon_state

	return ..()

/obj/item/storage/box/baggie/update_name()
	if(contents.len == 0)
		name = /obj/item/storage/box/baggie::name

	return ..()
