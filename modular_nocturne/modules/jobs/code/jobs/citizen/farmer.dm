/datum/job/vampire/farmer
	title = JOB_FARMER
	description = "Keep the kitchen stocked with a steady supply of fresh ingredients. Maybe sell legally dubious herbal remedies on the side."
	faction = FACTION_CITY
	total_positions = 3
	spawn_positions = 3
	config_tag = "FARMER"
	outfit = /datum/outfit/job/vampire/farmer
	job_flags = CITY_JOB_FLAGS
	allowed_splats = SPLAT_ALL
	exp_required_type_department = EXP_TYPE_SERVICES
	department_for_prefs = /datum/job_department/city_services
	departments_list = list(
		/datum/job_department/city_services,
	)
	display_order = JOB_DISPLAY_ORDER_FARMER
	minimal_masquerade = 0
	known_contacts = list(
		JOB_CHEF
	)

/datum/outfit/job/vampire/farmer
	name = "Farmer"
	jobtype = /datum/job/vampire/farmer
	uses_default_clan_clothes = TRUE

	id = /obj/item/card/farmer
	suit = /obj/item/clothing/suit/apron
	suit_store = /obj/item/plant_analyzer
	l_pocket = /obj/item/smartphone
	r_pocket = /obj/item/vamp/keys/farmer
	gloves = /obj/item/clothing/gloves/botanic_leather
	backpack_contents = list(/obj/item/cultivator=1, /obj/item/card/credit=1)
