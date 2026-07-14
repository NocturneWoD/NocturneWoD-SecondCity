/datum/job/vampire/hunter_cell_soldier
	title = JOB_HUNTER_CELL_SOLDIER
	description = "You are a solider of " + CITY_NAME + "'s local hunter cell, the Bushwhackers. Follow the will of the Field Lead and serve as God's sword to purge the supernatural from your community."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	faction = FACTION_CITY
	total_positions = 4
	spawn_positions = 4
	supervisors = "the General and God, hallowed be Thy name."
	req_admin_notify = 1
	exp_granted_type = EXP_TYPE_HUNTER
	config_tag = "HUNTER_CELL_SOLDIER"
	job_flags = CITY_JOB_FLAGS
	outfit = /datum/outfit/job/vampire/hunter_cell_soldier

	allowed_splats = list(SPLAT_NONE)

	display_order = JOB_DISPLAY_ORDER_HUNTER_CELL_SOLDIER
	department_for_prefs = /datum/job_department/hunter
	departments_list = list(
		/datum/job_department/hunter,
	)

	known_contacts = list(
		JOB_HUNTER_CELL_HEAD,
	)

/datum/outfit/job/vampire/hunter_cell_soldier
	name = JOB_HUNTER_CELL_SOLDIER
	jobtype = /datum/job/vampire/hunter_cell_soldier

	id = /obj/item/card/hunter
	uniform = /obj/item/clothing/under/vampire/hunter_pants/camo
	shoes = /obj/item/clothing/shoes/vampire/jackboots/work
	suit = /obj/item/clothing/suit/vampire/hunter_jacket
	belt = /obj/item/storage/belt/holster/detective/darkpack
	l_pocket = /obj/item/smartphone
	r_pocket = /obj/item/vamp/keys/hunter
	backpack_contents = list(/obj/item/card/credit=1)
