/datum/anthro_type
	//For having anthro NPCs that aren't sparkledogs...

	var/list/color_schemes = list(
		list("#EAEAEA","#EAEAEA", "#EAEAEA"), //YT
		list("#292929","#232323", "#232323"), //Gloomy n Evyle.
		list("#292929","#EAEAEA", "#EAEAEA"), //Choc n Cream
		list("#EAEAEA","#292929", "#292929"), //Cream n Choc
		list("#292929","#996633", "#996633"), //Dobbie?
		list("#B4963B","#292929", "#292929"), //Leppard
		list("#F8B34B","#292929", "#292929"), //Tiger
		list("#AF5030","#EAEAEA", "#EAEAEA"), //Red
	)

	var/list/tails = list(SPRITE_ACCESSORY_NONE)
	var/list/ears = list(SPRITE_ACCESSORY_NONE)
	var/list/snouts = list(SPRITE_ACCESSORY_NONE)
	var/list/horns = list(SPRITE_ACCESSORY_NONE)
	var/list/frills = list(SPRITE_ACCESSORY_NONE)
	var/list/pintles = list(SPRITE_ACCESSORY_NONE)
	var/bald_chance = 0

/datum/anthro_type/canine
	tails = list(
		"Wolf",
		"Fox",
		"Fennec",
		"Fennec (Downward)",
		"Eevee",
		"Flareon",
		"Jackal",
		"Kitsune",
		"Nightstalker",
		"Shepherd"
	)

	ears = list(
		"Big Wolf",
		"Wolf",
		"Eevee",
		"Eevee (Alt)",
		"Eeeve (Torn)",
		"Dog",
		"Fennec",
		"Fennec (Alt)",
		"Fox",
		"Husky"
	)

	snouts = list(
		"Mammal (Thick)",
		"Mammal (Thick, Alt)",
		"Husky",
		"Mammal (Long)",
		"Mammal (Long, Alt)",
		"Mammal (Short)",
		"Mammal (Short, Alt)",
		"Hyena",
		"Anubis",
		"Jackal",
		"Stubby",
		"Skulldog"
	)

	pintles = list(
		"Knotted - Average",
		"Knotted - Average (Sheath)",
		"Knotted - Large",
		"Knotted - Large (Sheath)"
	)

/datum/anthro_type/feline
	tails = list(
		"Tiger",
		"Cat",
		"Cat (Big)",
		"Cat (Double)",
		"Leopard"
	)

	ears = list(
		"Cat",
		"Cat (Alt)",
		"Wolf",
		"Dog"
	)

	snouts = list(
		"Mammal (Long)",
		"Mammal (Long, Alt)",
		"Mammal (Short)",
		"Mammal (Short, Alt)",
		"Stubby",
		"Tajaran"
	)

	pintles = list(
		"Barbed, Knotted - Average",
		"Barbed, Knotted - Average (Sheath)",
		"Barbed, Knotted - Large",
		"Barbed, Knotted - Large (Sheath)"
	)

/datum/anthro_type/lizard
	color_schemes = list( //lizards get their own assortment
		list("#666633", "#666633", "#666633"), //Gross Green
		list("#4D4D4D", "#4D4D4D", "#4D4D4D"), //Decay Gray
		list("#554230", "#554230", "#554230"), //Braaaap Brown
		list("#DDDDDD", "#DDDDDD", "#DDDDDD"), //Shite White
		list("#2B4155", "#2B4155", "#2B4155"), //Azu Blue
	)

	tails = list(
		"Lizard (Short)",
		"Lizard (Smooth)",
		"Lizard (Spikes)",
		"Lizard (Tiger)",
		"Axolotl",
		"Furred Dragon",
		"Deathclaw",
		"Nightstalker",
		"Snake"
	)

	snouts = list(
		"Lizard (Sharp)",
		"Lizard (Round)"
	)

	pintles = list(
		"Hemi - Average",
		"Hemi - Average (Slit)",
		"Hemi - Large",
		"Hemi - Large (Slit)",
		"Hemi, Knotted - Average",
		"Hemi, Knotted - Average (Sheath)",
		"Hemi, Knotted - Large",
		"Hemi, Knotted - Large (Sheath)",
		"Tapered - Average",
		"Tapered - Average (Slit)",
		"Tapered - Large",
		"Tapered - Large (Slit)",
		"Flared - Average",
		"Flared - Large"
	)

	frills = list(
		"Aquatic",
		"Big",
		"Cobra",
		"Cobra (Ears)",
		"Divinity",
		"Earlike",
		"Earlike (Angled)",
		"Earlike (Thick)",
		"Horns",
		"Horns (Double)",
		"Short",
		"Simple",
		"Split",
		"Split (Big)",
		"Split (Slim)",
		SPRITE_ACCESSORY_NONE
	)

	horns = list(
		"Curled (Big)",
		"Broken",
		"Curled",
		"Double",
		"Dragon",
		"Drake",
		"Faceguard",
		"Guilmon",
		"Great",
		"Halo",
		"Broken (Left)",
		"Lifted",
		"Longhorns",
		"Marauder",
		"Outstretched",
		"Oni",
		"Oni (Large)",
		"Ram",
		"Ram (Alt)",
		"Ram (Curled)",
		"Ram (Curled, Alt)",
		"Ram (Curled, Small)",
		"Ram (Curled, Small, Alt)",
		"Ram (Curled, Small, Alt 2)",
		"Broken (Right)",
		"Sheep",
		"Short",
		"Sideswept",
		"Simple",
		"Stabbers",
		"Tiefling",
		"Tiefling (Alt)",
		SPRITE_ACCESSORY_NONE
	)

	bald_chance = 90
