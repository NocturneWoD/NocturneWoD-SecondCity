/obj/item/reagent_containers/applicator/snortable
	name = "powder"
	desc = "An indescribable powder."

	icon_state = "cocaine"
	icon = 'modular_nocturne/modules/drugs/icons/items.dmi'
	ONFLOOR_ICON_HELPER('modular_nocturne/modules/drugs/icons/onfloor.dmi')
	inhand_icon_state = null

	volume = 10
	self_delay = 1.25 SECONDS
	apply_method = "snort"

/obj/item/reagent_containers/applicator/snortable/on_consumption(mob/living/consumer, mob/giver, list/modifiers)
	if(reagents.total_volume)
		reagents.trans_to(consumer, reagents.total_volume, transferred_by = giver, methods = INGEST)
	qdel(src)
	return

/obj/item/reagent_containers/applicator/snortable/interact_with_atom(atom/target, mob/living/user, list/modifiers)
	. = ..()
	if (.)
		return

	if(!target.is_refillable())
		return NONE

	if(target.is_drainable() && !target.reagents.total_volume)
		to_chat(user, span_warning("[target] is empty! There's nothing to dissolve [src] in."))
		return ITEM_INTERACT_BLOCKING

	if(target.reagents.holder_full())
		to_chat(user, span_warning("[target] is full."))
		return ITEM_INTERACT_BLOCKING

	user.visible_message(span_warning("[user] slips something into [target]!"), span_notice("You dissolve [src] in [target]."), null, 2)
	reagents.trans_to(target, reagents.total_volume, transferred_by = user)
	qdel(src)
	return ITEM_INTERACT_SUCCESS

/obj/item/reagent_containers/applicator/pill/on_accidental_consumption(mob/living/carbon/victim, mob/living/carbon/user, obj/item/source_item, discover_after = FALSE)
	to_chat(victim, span_warning("You inhale something."))
	on_consumption(victim, user)
	return FALSE
