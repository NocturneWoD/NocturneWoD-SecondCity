/datum/job/vampire/salon
	title = JOB_SALON
	description = "Do tattoos, cut hair, give massages, and more... all for barely above minimum wage."
	faction = FACTION_CITY
	total_positions = 2
	spawn_positions = 2
	config_tag = "SALON"
	outfit = /datum/outfit/job/vampire/salon
	job_flags = CITY_JOB_FLAGS
	exp_required_type_department = EXP_TYPE_SERVICES
	department_for_prefs = /datum/job_department/city_services
	departments_list = list(
		/datum/job_department/city_services,
	)
	display_order = JOB_DISPLAY_ORDER_SALON
	minimal_masquerade = 0

/datum/outfit/job/vampire/salon
	name = "Salon Worker"
	jobtype = /datum/job/vampire/salon
	uses_default_clan_clothes = TRUE

	id = /obj/item/card/salon
	l_pocket = /obj/item/smartphone
	r_pocket = /obj/item/vamp/keys/salon
	backpack_contents = list(
		/obj/item/scissors = 1,
		/obj/item/straight_razor = 1,
		/obj/item/dyespray = 1,
		/obj/item/card/credit = 1,
	)
