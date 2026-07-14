/obj/structure/sign/barber
	name = "barbershop sign"
	desc = "A glowing red-blue-white stripe you won't mistake for any other!"
	icon = 'modular_nocturne/modules/jobs/icons/items.dmi'
	icon_state = "barber"
	buildable_sign = FALSE // Don't want them removed, they look too jank.

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/barber, 13)

/obj/structure/sign/barber/Initialize(mapload)
	. = ..()
	if(mapload)
		find_and_mount_on_atom()

/obj/structure/sign/barber/get_turfs_to_mount_on()
	return list(get_step(src, dir))

// hunter weapon crates

/obj/structure/closet/crate/wooden/hunter_weapons
	desc = null
	abstract_type = /obj/structure/closet/crate/wooden/hunter_weapons

/obj/structure/closet/crate/wooden/hunter_weapons/Initialize(mapload)
	. = ..()
	if(isnull(desc))
		desc = "It's stamped with some Chinese characters."

/obj/structure/closet/crate/wooden/hunter_weapons/shotgun
	name = "shotgun shipment"
	desc = "It's stamped with some Chinese characters. 'SHOTGUN' is crudely handwritten on the crate."

/obj/structure/closet/crate/wooden/hunter_weapons/shotgun/PopulateContents()
	new /obj/item/gun/ballistic/shotgun/vampire(src)
	new /obj/item/gun/ballistic/shotgun/vampire(src)
	new /obj/item/gun/ballistic/shotgun/vampire(src)
	new /obj/item/ammo_box/darkpack/c12g(src)
	new /obj/item/ammo_box/darkpack/c12g(src)
	new /obj/item/ammo_box/darkpack/c12g(src)
	new /obj/item/ammo_box/darkpack/c12g(src)
	new /obj/item/ammo_box/darkpack/c12g/buck/incendiary(src)
	new /obj/item/ammo_box/darkpack/c12g/silver(src)

/obj/structure/closet/crate/wooden/hunter_weapons/smg
	name = "SMG shipment"
	name = "It's stamped with some Chinese characters. 'ASSAULT GUN' is crudely handwritten on the crate."

/obj/structure/closet/crate/wooden/hunter_weapons/smg/PopulateContents()
	new /obj/item/gun/ballistic/automatic/darkpack/uzi(src)
	new /obj/item/gun/ballistic/automatic/darkpack/uzi(src)
	new /obj/item/gun/ballistic/automatic/darkpack/uzi(src)
	new /obj/item/storage/fancy/hardcase/mag_uzi(src)
	new /obj/item/storage/fancy/hardcase/mag_uzi(src)
	new /obj/item/ammo_box/darkpack/c9mm(src)
	new /obj/item/ammo_box/darkpack/c9mm(src)
	new /obj/item/ammo_box/darkpack/c9mm(src)
	new /obj/item/ammo_box/darkpack/c9mm/silver(src)

/obj/structure/closet/crate/wooden/hunter_weapons/assault_rifle
	name = "assault rifle shipment"
	name = "It's stamped with some Chinese characters. 'RIFLE' is crudely handwritten on the crate."

/obj/structure/closet/crate/wooden/hunter_weapons/assault_rifle/PopulateContents()
	new /obj/item/gun/ballistic/automatic/darkpack/ar15(src)
	new /obj/item/gun/ballistic/automatic/darkpack/ar15(src)
	new /obj/item/gun/ballistic/automatic/darkpack/ar15(src)
	new /obj/item/storage/fancy/hardcase/mag_556(src)
	new /obj/item/storage/fancy/hardcase/mag_556(src)
	new /obj/item/ammo_box/darkpack/c556(src)
	new /obj/item/ammo_box/darkpack/c556(src)
	new /obj/item/ammo_box/darkpack/c556/incendiary(src)
	new /obj/item/ammo_box/darkpack/c556/silver(src)

// NOCTURNE TODO: add explosives
