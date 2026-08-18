/*
MAGAZIN - Marketed by Magadon in the late 80s as a treatment for ED, Magazin is actually a potent aphrodisiac. Magadon's master plan to increase
SA rates across the world fell apart as partygoers of the early 90s rave explosion discovered the pill's true effects.
Now, Magazin has gained a new life as a popular party drug sold in shady gas stations, Setite therapy clinics, and dance clubs.
"RE-LOAD WITH MAGAZIN!"
*/

/datum/reagent/drug/magazin
	name = "Magazin"
	description = "A powerful aphrodisiac first sold by Magadon as an erectile dysfunction treatment in the late 80s. Now a popular party drug."
	taste_description = "strawberries"
	color = "#FFADFF"

/datum/reagent/drug/magazin/on_mob_metabolize(mob/living/affected_mob)
	. = ..()
	// give the user a stiffy
	if(iscarbon(affected_mob))
		var/mob/living/carbon/affected_carbon = affected_mob
		for(var/obj/item/organ/genital/genital in affected_carbon.organs)
			if(!genital.aroused == AROUSAL_CANT)
				genital.aroused = AROUSAL_FULL
				genital.update_sprite_suffix()

		affected_carbon.update_body()

/datum/reagent/drug/magazin/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, metabolization_ratio)
	. = ..()
	// aphros are mostly something meant to be rp'd out (if you even really want to).
	// they dont have any real effects outside of ignorable flavor text
	if(SPT_PROB(1, seconds_per_tick))
		var/high_message = pick("You're feeling frisky...", "You're having trouble suppressing your urges...", "You feel pent up...")
		to_chat(affected_mob, span_notice("[high_message]"))

/datum/chemical_reaction/magazin
	results = list(/datum/reagent/drug/magazin = 6)
	required_reagents = list(/datum/reagent/consumable/ethanol = 2, /datum/reagent/hydrogen = 2, /datum/reagent/oxygen = 2, /datum/reagent/water = 1)
	required_temp = 400
	mix_message = "The mixture boils off a pink vapor..."
