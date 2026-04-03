/datum/job/vampire/chef
	title = JOB_RESTAURANT
	description = "Work yourself near to death to feed the hungry masses."
	faction = FACTION_CITY
	total_positions = 3
	spawn_positions = 3
	config_tag = "RESTAURANT"
	outfit = /datum/outfit/job/vampire/chef
	job_flags = CITY_JOB_FLAGS
	allowed_splats = SPLAT_ALL
	exp_required_type_department = EXP_TYPE_SERVICES
	department_for_prefs = /datum/job_department/city_services
	departments_list = list(
		/datum/job_department/city_services,
	)
	display_order = JOB_DISPLAY_ORDER_CHEF
	minimal_masquerade = 0
	known_contacts = list(
		JOB_FARMER,
	)

/datum/outfit/job/vampire/chef
	name = "Restaurant Employee"
	jobtype = /datum/job/vampire/chef
	uses_default_clan_clothes = TRUE

	id = /obj/item/card/chef
	suit = /obj/item/clothing/suit/toggle/chef
	l_pocket = /obj/item/smartphone
	r_pocket = /obj/item/vamp/keys/chef
	backpack_contents = list(
		/obj/item/knife = 1,
		/obj/item/sharpener = 1,
		/obj/item/choice_beacon/ingredient = 1,
		/obj/item/card/credit = 1,
	)
	head = /obj/item/clothing/head/utility/chefhat
