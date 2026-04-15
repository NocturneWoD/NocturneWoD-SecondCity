/obj/item/seeds/cocaleaf
	name = "coca leaf seed pack"
	desc = "These seeds grow into coca shrubs. They make you feel energized just looking at them..."
	icon = 'modular_nocturne/modules/drugs/icons/items.dmi'
	growing_icon = 'modular_nocturne/modules/drugs/icons/growing.dmi'
	icon_state = "seed-cocaleaf"
	species = "cocaleaf"
	plantname = "Coca Leaves"
	maturation = 8
	potency = 20
	growthstages = 2
	product = /obj/item/food/grown/cocaleaf
	mutatelist = list()
	reagents_add = list(/datum/reagent/drug/cocaine = 0.3, /datum/reagent/consumable/nutriment = 0.15)

/obj/item/food/grown/cocaleaf
	seed = /obj/item/seeds/cocaleaf
	name = "coca leaf"
	desc = "A leaf of the coca shrub, which contains the potent psychoactive alkaloid cocaine."
	icon = 'modular_nocturne/modules/drugs/icons/items.dmi'
	icon_state = "cocaleaf"
	foodtypes = VEGETABLES
	tastes = list("leaves" = 1)
