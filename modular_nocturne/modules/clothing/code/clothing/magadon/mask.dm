#define CLOTHING_MASK_ICONS \
	icon = 'modular_nocturne/modules/clothing/icons/clothing.dmi'; \
	worn_icon = 'modular_nocturne/modules/clothing/icons/worn.dmi'; \
	ONFLOOR_ICON_HELPER('modular_nocturne/modules/clothing/icons/onfloor.dmi')

/obj/item/clothing/mask/vampire/gas/magadon
	name = "magadon gas mask"
	desc = "A high-tech gas mask branded belonging to Magadon Incorporated."
	icon_state = "gas_magadon"
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | MASKINTERNALS
	flags_inv = HIDEFACE | HIDEHAIR | HIDEFACIALHAIR | HIDESNOUT
	w_class = WEIGHT_CLASS_NORMAL
	flags_cover = MASKCOVERSMOUTH | PEPPERPROOF
	CLOTHING_MASK_ICONS

#undef CLOTHING_MASK_ICONS
