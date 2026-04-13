/obj/item/reagent_containers/applicator/snortable/cocaine
	name = "cocaine"
	desc = "A powdered form of cocaine, a stimulant extracted from coca leaves."

	list_reagents = list(/datum/reagent/drug/cocaine = 10)

/obj/item/reagent_containers/applicator/snortable/cocaine/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/selling, 125, "cocaine", TRUE, -1, 5)

/obj/item/storage/box/baggie/cocaine
	name = "white package"
	icon_state = "package_cocaine"

	spawn_count = 3
	spawn_type = /obj/item/reagent_containers/applicator/snortable/cocaine
