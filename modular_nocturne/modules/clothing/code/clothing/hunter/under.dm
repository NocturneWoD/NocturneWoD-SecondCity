#define CLOTHING_UNDER_ICONS \
	icon = 'modular_nocturne/modules/clothing/icons/clothing.dmi'; \
	worn_icon = 'modular_nocturne/modules/clothing/icons/worn.dmi'; \
	ONFLOOR_ICON_HELPER('modular_nocturne/modules/clothing/icons/onfloor.dmi')

/obj/item/clothing/under/vampire/hunter_pants
	name = "combat pants"
	desc =  "A pair of military surplus cargo pants. This pair is in brown."
	icon_state = "hunterpants_brown"
	CLOTHING_UNDER_ICONS

/obj/item/clothing/under/vampire/hunter_pants/camo
	desc = "A pair of military surplus cargo pants. This pair is in camouflage."
	icon_state = "hunterpants_camo"
	CLOTHING_UNDER_ICONS

#undef CLOTHING_UNDER_ICONS
