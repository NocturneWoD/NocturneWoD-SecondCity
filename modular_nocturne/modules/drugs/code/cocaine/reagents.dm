/datum/reagent/drug/cocaine
	name = "cocaine"
	description = "A powerful stimulant extracted from coca leaves. Reduces stun times, but causes drowsiness and severe brain damage if overdosed."
	color = "#ffffff"
	overdose_threshold = 20
	ph = 9
	taste_description = "bitterness" // supposedly does taste bitter in real life
	addiction_types = list(/datum/addiction/stimulants = 40)

/datum/reagent/drug/cocaine/on_mob_metabolize(mob/living/containing_mob)
	. = ..()
	containing_mob.add_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants)
	ADD_TRAIT(containing_mob, TRAIT_BATON_RESISTANCE, type)

/datum/reagent/drug/cocaine/on_mob_end_metabolize(mob/living/containing_mob)
	. = ..()
	containing_mob.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants)
	REMOVE_TRAIT(containing_mob, TRAIT_BATON_RESISTANCE, type)

/datum/reagent/drug/cocaine/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, metabolization_ratio)
	. = ..()
	if(SPT_PROB(2.5, seconds_per_tick))
		var/high_message = pick("You feel jittery.", "You feel like you gotta go fast.", "You feel like you need to step it up.")
		to_chat(affected_mob, span_notice("[high_message]"))
	affected_mob.add_mood_event("zoinked", /datum/mood_event/stimulant_heavy, name)
	affected_mob.AdjustStun(-1.5 SECONDS * seconds_per_tick * metabolization_ratio)
	affected_mob.AdjustKnockdown(-1.5 SECONDS * seconds_per_tick * metabolization_ratio)
	affected_mob.AdjustUnconscious(-1.5 SECONDS * seconds_per_tick * metabolization_ratio)
	affected_mob.AdjustImmobilized(-1.5 SECONDS * seconds_per_tick * metabolization_ratio)
	affected_mob.AdjustParalyzed(-1.5 SECONDS* seconds_per_tick * metabolization_ratio)
	if(affected_mob.adjust_stamina_loss(-2 * seconds_per_tick * metabolization_ratio, updating_stamina = FALSE))
		. = UPDATE_MOB_HEALTH
	if(SPT_PROB(2.5, seconds_per_tick))
		affected_mob.emote("shiver")

/datum/reagent/drug/cocaine/overdose_start(mob/living/affected_mob, metabolization_ratio)
	to_chat(affected_mob, span_userdanger("Your heart beats is beating so fast, it hurts..."))

/datum/reagent/drug/cocaine/overdose_process(mob/living/affected_mob, seconds_per_tick, metabolization_ratio)
	. = ..()
	var/need_mob_update = affected_mob.adjust_tox_loss(1 * seconds_per_tick * metabolization_ratio, updating_health = FALSE, required_biotype = affected_biotype)
	need_mob_update += affected_mob.adjust_organ_loss(ORGAN_SLOT_HEART, (rand(10, 20) / 10) * seconds_per_tick * metabolization_ratio)
	affected_mob.set_jitter_if_lower(5 SECONDS)
	if(SPT_PROB(2.5, seconds_per_tick))
		affected_mob.emote(pick("twitch","drool"))
	if(!HAS_TRAIT(affected_mob, TRAIT_FLOORED))
		if(SPT_PROB(1.5, seconds_per_tick))
			affected_mob.visible_message(span_danger("[affected_mob] collapses onto the floor!"))
			affected_mob.Paralyze(135,TRUE)
			affected_mob.drop_all_held_items()
	if(need_mob_update)
		return UPDATE_MOB_HEALTH
