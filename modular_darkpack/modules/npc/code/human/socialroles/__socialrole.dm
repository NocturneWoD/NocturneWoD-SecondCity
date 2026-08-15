/datum/socialrole
	//For randomizing
	var/list/s_tones = list(
		"albino",
		"caucasian1",
		"caucasian2",
		"caucasian3",
		"latino",
		"mediterranean",
		"asian1",
		"asian2",
		"arab",
		"indian",
		"african1",
		"african2",
	)
	var/min_age = 18
	var/max_age = 85
	var/preferred_gender
	var/list/male_names = list(
		"Jack",
		"Robert",
		"Cornelius",
		"Tyler"
	)
	var/list/female_names = list(
		"Marla"
	)
	var/list/surnames = list(
		"Durden",
		"Polson",
		"Singer"
	)

	//Hair shit
	var/list/hair_colors = list(
		"#040404", 	//Black
		"#120b05", 	//Dark Brown
		"#342414",	//Brown
		"#554433",	//Light Brown
		"#695c3b",	//Dark Blond
		"#ad924e",	//Blond
		"#dac07f",	//Light Blond
		"#802400",	//Ginger
		"#a5380e",	//Ginger alt
		"#ffeace",	//Albino
		"#650b0b",	//Punk Red
		"#14350e",	//Punk Green
		"#080918",   //Punk Blue
	)
	var/list/male_hair = list(
		"Bald",
		"Afro",
		"Afro 2",
		"Afro (Large)",
		"Balding Hair",
		"Bedhead",
		"Bedhead 2",
		"Bedhead 3",
		"Boddicker",
		"Bowlcut",
		"Bowlcut 2",
		"Business Hair",
		"Business Hair 2",
		"Business Hair 3",
		"Business Hair 4",
		"Bun (Manbun)",
		"Buzzcut",
		"Comet",
		"CIA",
		"Coffee House",
		"Combover",
		"Crewcut",
		"Father",
		"Flat Top",
		"Gelled Back",
		"Joestar",
		"Keanu Hair",
		"Mohawk",
		"Mohawk (Shaved)",
		"Mohawk (Unshaven)",
		"Oxton",
		"Pompadour",
		"Ronin",
		"Shaved",
	)
	var/list/male_facial = list(
		"Beard (Abraham Lincoln)",
		"Beard (Chinstrap)",
		"Beard (Dwarf)",
		"Beard (Full)",
		"Beard (Cropped Fullbeard)",
		"Beard (Goatee)",
		"Beard (Hipster)",
		"Beard (Neckbeard)",
		"Beard (Very Long)",
		"Beard (Martial Artist)",
		"Beard (Moonshiner)",
		"Beard (Long)",
		"Beard (Volaju)",
		"Beard (Three o Clock Shadow)",
		"Beard (Five o Clock Shadow)",
		"Beard (Seven o Clock Shadow)",
		"Moustache (Fu Manchu)",
		"Moustache (Hulk Hogan)",
		"Moustache (Watson)",
		"Sideburns (Elvis)",
		"Sideburns (Mutton Chops)",
		"Sideburns",
		"Shaved",
	)
	var/list/female_hair = list(
		"Ahoge",
		"Long Bedhead",
		"Beehive",
		"Beehive 2",
		"Bob Hair",
		"Bob Hair 2",
		"Bob Hair 3",
		"Bob Hair 4",
		"Bobcurl",
		"Braided",
		"Braided Front",
		"Braid (Short)",
		"Braid (Low)",
		"Bun Head",
		"Bun Head 2",
		"Bun Head 3",
		"Bun (Large)",
		"Bun (Tight)",
		"Double Bun",
		"Emo",
		"Emo Fringe",
		"Feather",
		"Gentle",
		"Long Hair 1",
		"Long Hair 2",
		"Long Hair 3",
		"Long Over Eye",
		"Long Emo",
		"Long Fringe",
		"Ponytail",
		"Ponytail 2",
		"Ponytail 3",
		"Ponytail 4",
		"Ponytail 5",
		"Ponytail 6",
		"Ponytail 7",
		"Ponytail (High)",
		"Ponytail (Short)",
		"Ponytail (Long)",
		"Ponytail (Country)",
		"Ponytail (Fringe)",
		"Poofy",
		"Short Hair Rosa",
		"Shoulder-length Hair",
		"Volaju",
	)

	// TODO: refactor this into a premade outfit
	var/list/backpacks = list(
		/obj/item/storage/backpack/satchel,
		/obj/item/storage/backpack/satchel/leather
	)
	var/list/shoes = list()
	var/list/uniforms = list()
	var/list/belts = list()
	var/list/suits = list()
	var/list/hats = list()
	var/list/gloves = list()
	var/list/masks = list()
	var/list/neck = list()
	var/list/ears = list()
	var/list/glasses = list()
	var/list/inhand_items = list()
	var/list/pockets = list()

	//For workers and police
	var/obj/item/card/id/id_type

	//What will npc use in fight, if so
	var/obj/item/melee/melee_weapon
	var/obj/item/gun/range_weapon

	//For reaction
	var/list/male_phrases = list(
		"My wife is waiting for me at home...",
		"Sorry, pal, not today.",
		"Go find yourself someone at the bar, I'm busy.",
	)
	var/list/female_phrases = list(
		"Buy yourself a watch.",
		"I'm going to scream if you keep it up!",
		"Don't touch me.",
	)
	var/list/neutral_phrases = list(
		"Fuck off.",
		"Go on your way.",
		"Not the best time to talk right now, pal.",
		"Мgmmph...",
		"Do I know you?",
		"I don't have much time.",
	)
	var/list/random_phrases = list(
		"You a foreigner?...",
		"It seems I've been going around here in circles for the third time, already.",
		"Watch where you're walkin'!",
		"Go back to the drains where you came from.",
		"Tourists... Pheh.",
		"Rumors travel fast.",
	)
	var/list/answer_phrases = list(
		"I agree.",
		"Yes-yes...",
		"Exactly.",
		"Maybe.",
		"Exactly.",
		"Affirmative..",
	)
	var/list/help_phrases = list(
		"Help!",
		"Help Me!!",
		"What the hell's going on here!?",
		"Shoot!!",
	)
	var/list/car_dodged = list(
		"WOAH!",
		"Watch where you're going!",
		"Holy shit!",
		"Watch it!",
		"Learn to drive!",
		"You almost ran me over!",
		"What the fuck!?",
	)

	var/is_criminal = FALSE

	// NOCTURNE ADDITION START
	var/list/species_weighted = list(
		/datum/species/human = 10, //racism
		/datum/species/human/demihuman = 20,
		/datum/species/human/anthro = 70
	)

	var/datum/anthro_type/coolfurry
	// NOCTURNE ADDITION END

/mob/living/carbon/human/npc/proc/AssignSocialRole(datum/socialrole/S, dont_random)
	socialrole = new S()

	fully_replace_character_name(name, real_name)

	maxHealth = round(initial(maxHealth)+(initial(maxHealth)/3)*(st_get_stat(STAT_STAMINA)))
	health = round(initial(health)+(initial(health)/3)*(st_get_stat(STAT_STAMINA)))
	last_health = health

	is_criminal = socialrole.is_criminal
	if (check_holidays(FESTIVE_SEASON))
		if (!length(socialrole.suits))
			socialrole.suits = list(
				/obj/item/clothing/suit/vampire/coat/winter,
				/obj/item/clothing/suit/vampire/coat/winter/alt
			)
		if (!length(socialrole.neck) && prob(50))
			socialrole.neck = list(
				/obj/item/clothing/neck/vampire/scarf/red,
				/obj/item/clothing/neck/vampire/scarf,
				/obj/item/clothing/neck/vampire/scarf/blue,
				/obj/item/clothing/neck/vampire/scarf/green,
				/obj/item/clothing/neck/vampire/scarf/white
			)

	if(!dont_random)
		gender = pick(MALE, FEMALE)
		if(socialrole.preferred_gender)
			gender = socialrole.preferred_gender
		physique = gender

		// NOCTURNE ADDITION START
		set_species(pick_weight(socialrole.species_weighted))

		if(dna.species.id != SPECIES_HUMAN)
			var/datum/anthro_type/F = pick(subtypesof(/datum/anthro_type))
			socialrole.coolfurry = new F()

			if (socialrole.coolfurry.bald_chance > 0 && dna.species.id != SPECIES_DEMIHUMAN)
				if (prob(socialrole.coolfurry.bald_chance))
					socialrole.male_hair = list("Bald")
					socialrole.female_hair = list("Bald")
					socialrole.male_facial = list("Shaved")

			var/list/color_scheme = pick(socialrole.coolfurry.color_schemes)

			socialrole.hair_colors = list(color_scheme[2])

			dna.features[FEATURE_MUTANT_COLOR] = color_scheme[1]
			dna.features[FEATURE_EARS_NOCTURNE] = pick(socialrole.coolfurry.ears)
			dna.features[FEATURE_FRILLS_NOCTURNE] = pick(socialrole.coolfurry.frills)
			dna.features[FEATURE_HORNS_NOCTURNE] = pick(socialrole.coolfurry.horns)
			dna.features[FEATURE_TAIL_NOCTURNE] = pick(socialrole.coolfurry.tails)
			dna.features[FEATURE_FRILLS_NOCTURNE_COLORS] = color_scheme
			dna.features[FEATURE_HORNS_NOCTURNE_COLORS] = color_scheme
			dna.features[FEATURE_TAIL_NOCTURNE_COLORS] = color_scheme
			dna.features[FEATURE_EARS_NOCTURNE_COLORS] = color_scheme

			if (dna.species.id == SPECIES_ANTHRO)
				dna.features[FEATURE_SNOUT_NOCTURNE] = pick(socialrole.coolfurry.snouts)
				dna.features[FEATURE_SNOUT_NOCTURNE_COLORS] = color_scheme

			if(gender == MALE)
				if(prob(20)) //GULP!?
					dna.features[FEATURE_VAGINA_NOCTURNE] = "Human"
					dna.features[FEATURE_VAGINA_NOCTURNE_COLORS] = list("#F09488","#F09488","#F09488")
				else
					dna.features[FEATURE_PINTLE_NOCTURNE] = pick(socialrole.coolfurry.pintles)
					dna.features[FEATURE_TESTICLES_NOCTURNE] = "Medium"
					dna.features[FEATURE_PINTLE_NOCTURNE_COLORS] = list(color_scheme[1], "#A73A3A", "#A73A3A")
					dna.features[FEATURE_TESTICLES_NOCTURNE_COLORS] = color_scheme
			else
				dna.features[FEATURE_BREASTS_NOCTURNE] = "Medium"
				dna.features[FEATURE_BREASTS_NOCTURNE_COLORS] = color_scheme
				if(prob(20)) //GULP?!!!
					dna.features[FEATURE_PINTLE_NOCTURNE] = pick(socialrole.coolfurry.pintles)
					dna.features[FEATURE_TESTICLES_NOCTURNE] = "Medium"
					dna.features[FEATURE_PINTLE_NOCTURNE_COLORS] = list(color_scheme[1], "#A73A3A", "#A73A3A")
					dna.features[FEATURE_TESTICLES_NOCTURNE_COLORS] = color_scheme
				else
					dna.features[FEATURE_VAGINA_NOCTURNE] = "Human"
					dna.features[FEATURE_VAGINA_NOCTURNE_COLORS] = list("#F09488","#F09488","#F09488")
			dna.features[FEATURE_FLUFF_NOCTURNE] = SPRITE_ACCESSORY_NONE
			dna.features[FEATURE_WINGS_NOCTURNE] = SPRITE_ACCESSORY_NONE

			regenerate_organs()
		// NOCTURNE ADDITION END

		var/list/m_names = list()
		var/list/f_names = list()
		var/list/s_names = list()
		var/random_name
		if(socialrole.male_names)
			m_names = socialrole.male_names
		else
			m_names = GLOB.first_names_male
		if(socialrole.female_names)
			f_names = socialrole.female_names
		else
			f_names = GLOB.first_names_female
		if(socialrole.surnames)
			s_names = socialrole.surnames
		else
			s_names = GLOB.last_names
		age = rand(socialrole.min_age, socialrole.max_age)
		skin_tone = pick(socialrole.s_tones)

		if (age >= 55 && dna.species.id != SPECIES_ANTHRO) // NOCTURNE EDIT - ORIGINAL: if (age >= 55)
			set_haircolor("#a2a2a2")
			set_facial_haircolor(hair_color)
		else
			set_haircolor(pick(socialrole.hair_colors))
			set_facial_haircolor(hair_color)
		if (gender == MALE)
			set_hairstyle(pick(socialrole.male_hair))
			if (prob(25) || age >= 25)
				set_facial_hairstyle(pick(socialrole.male_facial))
			else
				set_facial_hairstyle("Shaved")
			random_name = "[pick(m_names)] [pick(s_names)]"
			fully_replace_character_name(newname = random_name)
		else
			set_hairstyle(pick(socialrole.female_hair))
			set_facial_hairstyle("Shaved")
			random_name = "[pick(f_names)] [pick(s_names)]"
			fully_replace_character_name(newname = random_name)

		set_eye_color(random_eye_color())
		update_visible_name()
		underwear = random_underwear(gender)
		if (prob(50))
			underwear_color = eye_color_left
		if (prob(50) || gender == FEMALE)
			undershirt = random_undershirt(gender)
		if (prob(25))
			socks = random_socks()

		update_body(is_creating = (dna.species.id == SPECIES_ANTHRO)) // NOCTURNE EDIT - ORIGINAL: update_body()

	// this should be refactored into just... applying a premade outfit
	var/datum/outfit/O = new()
	if(length(socialrole.backpacks))
		O.back = pick(socialrole.backpacks)
	if(length(socialrole.uniforms))
		O.uniform = pick(socialrole.uniforms)
	if(length(socialrole.belts))
		O.belt = pick(socialrole.belts)
	if(length(socialrole.suits))
		O.suit = pick(socialrole.suits)
	if(length(socialrole.gloves))
		O.gloves = pick(socialrole.gloves)
	if(length(socialrole.shoes))
		O.shoes = pick(socialrole.shoes)
	if(length(socialrole.hats))
		O.head = pick(socialrole.hats)
	if(length(socialrole.masks))
		O.mask = pick(socialrole.masks)
	if(length(socialrole.neck))
		O.neck = pick(socialrole.neck)
	if(length(socialrole.ears))
		O.ears = pick(socialrole.ears)
	if(length(socialrole.glasses))
		O.glasses = pick(socialrole.glasses)
	if(length(socialrole.inhand_items))
		O.r_hand = pick(socialrole.inhand_items)
	if(socialrole.id_type)
		O.id = socialrole.id_type
	if(O.uniform && length(socialrole.pockets))
		O.l_pocket = pick(socialrole.pockets)
		if(length(socialrole.pockets) > 1 && prob(50))
			var/list/another_pocket = socialrole.pockets.Copy()
			another_pocket -= O.l_pocket
			O.r_pocket = pick(another_pocket)
	equipOutfit(O)
	qdel(O)

	dna.update_dna_identity()
