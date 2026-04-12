/obj/item/reagent_containers/cup/glass/baggie
	name = "small plastic bag"
	icon_state = "package_empty"
	icon = 'modular_darkpack/modules/drugs/icons/items.dmi'
	ONFLOOR_ICON_HELPER('modular_darkpack/modules/drugs/icons/onfloor.dmi')

	// NOCTURNE EDIT START
	isGlass = FALSE
	reagent_consumption_method = INGEST
	gulp_size = 10
	// NOCTURNE EDIT END

// NOCTURNE EDIT START
/obj/item/reagent_containers/cup/glass/baggie/try_drink(mob/living/target_mob, mob/living/user)
	user.changeNext_move(CLICK_CD_MELEE)
	if(target_mob == user)
		if(DOING_INTERACTION_WITH_TARGET(user, user))
			return ITEM_INTERACT_BLOCKING
		if(!canconsume(user, user))
			return ITEM_INTERACT_BLOCKING

		user.visible_message(
			span_warning("[user] starts snorting a line from [src]!"),
			span_notice("You start snorting a line from [src]..."),
		)

		if(!do_after(user, 1.25 SECONDS, user))
			return ITEM_INTERACT_BLOCKING
		if(!reagents || !reagents.total_volume)
			return ITEM_INTERACT_BLOCKING // might be empty after the delay due to spam clicking

		user.visible_message(
			span_warning("[user] finishes snorting a line from [src]!"),
			span_notice("You finish snorting a line from [src]."),
		)
		// playsound(user, consumption_sound, rand(10, 50), TRUE)

		reagents.trans_to(user, gulp_size, transferred_by = user, methods = reagent_consumption_method)

		return ITEM_INTERACT_SUCCESS

	return ITEM_INTERACT_BLOCKING
// NOCTURNE EDIT END

/obj/item/reagent_containers/cup/glass/baggie/meth
	name = "blue package"
	icon_state = "package_meth"
	list_reagents = list(/datum/reagent/drug/methamphetamine = 30)


/obj/item/reagent_containers/cup/glass/baggie/meth/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/selling, 100, "meth", TRUE, -1, 4)


// NOCTURNE REMOVAL START - MOVED TO NOCTURNE DRUGS MODULE
/*
/obj/item/reagent_containers/cup/glass/baggie/meth/cocaine
	name = "white package"
	icon_state = "package_cocaine"
	list_reagents = list(/datum/reagent/drug/methamphetamine/cocaine = 30)


/obj/item/reagent_containers/cup/glass/baggie/meth/cocaine/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/selling, 100, "cocaine", TRUE, -1, 5)
*/
// NOCTURNE REMOVAL END
