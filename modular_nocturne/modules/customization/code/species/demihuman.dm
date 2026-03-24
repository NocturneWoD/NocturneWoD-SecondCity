// basically a clone of humans, but able to use mutant parts (ears, tails, etc)
/mob/living/carbon/human/species/demihuman
	race = /datum/species/human/demihuman

/datum/species/human/demihuman
	name = "Demihuman"
	id = SPECIES_DEMIHUMAN
	examine_limb_id = SPECIES_HUMAN
	mutant_features = list(
		FEATURE_EARS_NOCTURNE,
		FEATURE_TAIL_NOCTURNE,
		FEATURE_FLUFF_NOCTURNE,
	)

/datum/species/human/demihuman/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_hairstyle("Bald", update = TRUE)
	human.set_facial_hairstyle("Beard (Goatee)", update = TRUE)
	human.set_facial_haircolor("#7E3F00")
	human.update_body()

/datum/species/human/demihuman/get_species_description()
	return "A human, but with cool animal parts!"

/datum/species/human/demihuman/get_species_lore()
	return list(
 		"\"...it was a giant fucking party trick! Ken casted these spells turning EVERYBODY into these weird animal creatures. \
		Purple, pink, cyan, dogpeople, catpeople-- Everybody thought they was on some weird designer drug, so nobody questioned it! \
		Was fuckin' crazy to witness, especially when you knew what was really going on behind the curtain. \
		To Ken, this was his art; the ability to escape reality for a few hours. The ability to do ANYTHING. \
		The ability to see a whole different WORLD!",

		"...now. When us mages do our magic, we have to be careful that people don't see 'behind the curtain', so to say. Otherwise, bad things happen. \
		The Paradox, we call it... which is precisely what happened... Some poor fucking postal worker comes into the place, \
		then witnesses all these crazy fucking animal people! I don't even know how he got in, 'cause Ken had got a bunch of bikers doing security. \
		I think they was all drunk or some shit.",

		"Anyways--... when that guy saw 'behind the curtain'-- christ, we ALL felt it. This dread, man-- hooh, even thinking about it gives me \
		the chills... Ken? Christ, I saw sparks coming out of his body, like he was stuck in a god damn electric chair! That shit Backlashed on him HARD.",

		"And then, when that party was over? Guess what we saw when we walked out? The entire fucking planet was full of Ken's animal people!",

		"And the craziest bit? Everybody thought it was always like this!\""
	)
