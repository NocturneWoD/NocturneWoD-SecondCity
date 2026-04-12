/obj/item/reagent_containers/cup/glass/baggie/cocaine
	name = "white package"
	icon_state = "package_cocaine"
	list_reagents = list(/datum/reagent/drug/cocaine = 30)


/obj/item/reagent_containers/cup/glass/baggie/cocaine/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/selling, 100, "cocaine", TRUE, -1, 5)
