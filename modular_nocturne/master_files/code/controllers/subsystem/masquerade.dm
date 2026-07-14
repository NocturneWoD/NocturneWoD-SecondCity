#define DELIVERY_NONE 0
#define DELIVERY_SUSPICIOUS 1
#define DELIVERY_MODERATE 2
#define DELIVERY_BREACH 3

/datum/controller/subsystem/masquerade/proc/check_hunter_deliveries()
	var/delivery_level = DELIVERY_NONE

	if(!hunter_suspicious_delivery && masquerade_level <= 20)
		delivery_level = DELIVERY_SUSPICIOUS

	else if(!hunter_moderate_delivery && masquerade_level <= 14)
		delivery_level = DELIVERY_MODERATE

	else if(!hunter_breach_delivery && masquerade_level <= 9)
		delivery_level = DELIVERY_BREACH

	if(delivery_level)
		var/list/empty_turfs = list()

		for(var/obj/effect/abstract/hunter_delivery_spot/spot in GLOB.hunter_delivery_spots)
			var/turf/open/open_turf = get_turf(spot)
			if(!astype(open_turf))
				stack_trace("[spot] is not in an open turf. Turf is [open_turf]")
			if(!open_turf.is_blocked_turf())
				empty_turfs |= open_turf

		// we're fucked
		if(!length(empty_turfs))
			return

		var/turf/landing_turf = pick(empty_turfs)

		switch(delivery_level)
			if(DELIVERY_SUSPICIOUS)
				hunter_suspicious_delivery = TRUE
				new /obj/structure/closet/crate/wooden/hunter_weapons/shotgun(landing_turf)
			if(DELIVERY_MODERATE)
				hunter_moderate_delivery = TRUE
				new /obj/structure/closet/crate/wooden/hunter_weapons/smg(landing_turf)
			if(DELIVERY_BREACH)
				hunter_breach_delivery = TRUE
				new /obj/structure/closet/crate/wooden/hunter_weapons/assault_rifle(landing_turf)

		for(var/mob/player_mob as anything in get_active_player_list(alive_check = TRUE))
			if(!(istype(player_mob.mind?.assigned_role, /datum/job/vampire/hunter_cell_soldier) || istype(player_mob.mind?.assigned_role, /datum/job/vampire/hunter_cell_head)))
				continue
			to_chat(player_mob, span_boldnotice("The demons of Hell reveal themselves... A new weapon shipment has arrived at the warehouse."))

#undef DELIVERY_NONE
#undef DELIVERY_SUSPICIOUS
#undef DELIVERY_MODERATE
#undef DELIVERY_BREACH
