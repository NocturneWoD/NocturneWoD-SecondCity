/datum/socialrole/shop/pharmacystore/magadon
	suits =  list(/obj/item/clothing/suit/vampire/magadon_labcoat)

/mob/living/carbon/human/npc/pharmacystore_magadon
	staying = TRUE

/mob/living/carbon/human/npc/pharmacystore_magadon/Initialize(mapload)
	. = ..()

	AssignSocialRole(/datum/socialrole/shop/pharmacystore/magadon)
