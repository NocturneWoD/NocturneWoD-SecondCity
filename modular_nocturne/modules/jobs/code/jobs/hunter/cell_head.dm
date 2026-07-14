/datum/job/vampire/hunter_cell_head
	title = JOB_HUNTER_CELL_HEAD
	description = "You are the leader of " + CITY_NAME + "'s local hunter cell, the Bushwhackers. Follow the will of God and lead His holy army to purge the supernatural forces of Hell from your community."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	faction = FACTION_CITY
	total_positions = 1
	spawn_positions = 1
	supervisors = "the will of the Father, the Son, and the Holy Spirit."
	req_admin_notify = 1
	minimal_player_age = 25
	exp_requirements = 180
	exp_required_type = EXP_TYPE_HUNTER
	exp_required_type_department = EXP_TYPE_HUNTER
	exp_granted_type = EXP_TYPE_HUNTER
	config_tag = "HUNTER_CELL_HEAD"
	job_flags = CITY_JOB_FLAGS
	outfit = /datum/outfit/job/vampire/hunter_cell_head

	allowed_splats = list(SPLAT_NONE)

	display_order = JOB_DISPLAY_ORDER_HUNTER_CELL_HEAD
	department_for_prefs = /datum/job_department/hunter
	departments_list = list(
		/datum/job_department/hunter,
	)

	known_contacts = list(
		JOB_HUNTER_CELL_SOLDIER,
	)

/datum/outfit/job/vampire/hunter_cell_head
	name = JOB_HUNTER_CELL_HEAD
	jobtype = /datum/job/vampire/hunter_cell_head

	id = /obj/item/card/hunter
	uniform = /obj/item/clothing/under/vampire/hunter_pants/camo
	shoes = /obj/item/clothing/shoes/vampire/jackboots/work
	gloves = /obj/item/clothing/gloves/vampire/work
	suit = /obj/item/clothing/suit/vampire/vest
	belt = /obj/item/storage/belt/holster/detective/darkpack
	l_pocket = /obj/item/smartphone
	r_pocket = /obj/item/vamp/keys/hunter
	backpack_contents = list(/obj/item/gun/ballistic/automatic/pistol/darkpack/deagle=1, /obj/item/card/credit=1)
