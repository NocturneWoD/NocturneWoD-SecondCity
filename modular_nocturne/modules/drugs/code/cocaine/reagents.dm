/datum/reagent/drug/cocaine
	name = "cocaine"
	description = "A powerful stimulant extracted from coca leaves. Reduces stun times, but causes drowsiness and severe brain damage if overdosed."
	color = "#ffffff"
	overdose_threshold = 30
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

	affected_mob.add_mood_event("tweaking", /datum/mood_event/stimulant_medium, name)
	affected_mob.AdjustAllImmobility(-15 * metabolization_ratio * seconds_per_tick)
	affected_mob.set_jitter_if_lower(5 SECONDS * metabolization_ratio * seconds_per_tick)

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

// chemical reaction

// actual conversion of coca leaves to cocaine is WAY more complicated than this (see https://www.ojp.gov/pdffiles1/Digitization/132907NCJRS.pdf)
// in summary: first you dump the leaves into a baking soda solution, and then mix this with kerosene to get coca paste.
// next, you dissolve the paste into sulfuric acid, and then mix this with a solution of potassium permanganate.
// filter out the precipitate, and then add a solution of hydrochloric acid and acetone. cocaine hcl will precipitate from the mixture.
// discard the acid + acetone solution (or reuse), then dry the resulting product. you now have cocaine.

/datum/chemical_reaction/powder_cocaine
	required_reagents = list(/datum/reagent/drug/cocaine = 10)
	required_catalysts = list(/datum/reagent/toxin/acid = 5, /datum/reagent/acetone = 5)
	required_temp = 350

	reaction_flags = REACTION_INSTANT
	reaction_tags = REACTION_TAG_EASY | REACTION_TAG_DRUG | REACTION_TAG_ORGAN
	mob_react = FALSE

/datum/chemical_reaction/powder_cocaine/on_reaction(datum/reagents/holder, datum/equilibrium/reaction, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to round(created_volume, CHEMICAL_VOLUME_ROUNDING))
		new /obj/item/reagent_containers/applicator/snortable/cocaine(location)
