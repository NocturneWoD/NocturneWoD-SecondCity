// "HRhrhrhrgughHGHGhghuhrrhhh My left nut dont work so gooddghhhghhh From dh stroke nnnnaahhgngnnn
// Crystal meth make codebase LRP rHrhghhhdhh hurr duuurrhhhh" - Paxilmaniac

/obj/item/reagent_containers/applicator/snortable/meth
	name = "crystal meth"
	desc = "A crystalized form of methamphetamine."
	icon_state = "meth"

	list_reagents = list(/datum/reagent/drug/methamphetamine = 10)

/obj/item/reagent_containers/applicator/snortable/meth/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/selling, 175, "meth", TRUE, -1, 4)

/obj/item/storage/box/baggie/meth
	name = "blue package"
	icon_state = "package_meth"

	spawn_count = 3
	spawn_type = /obj/item/reagent_containers/applicator/snortable/meth
