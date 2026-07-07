/datum/job/vampire/magadon_middle_manager
	title = JOB_MAGADON_CORP_MIDDLE_MANAGER
	description = "You are a Middle Manager for the local Magadon subsidiary health clinic. Make sure that your doctor underlings keep the clinic under control."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	faction = FACTION_PENTEX
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Board and the Head Manager"
	req_admin_notify = 1
	exp_granted_type = EXP_TYPE_MAGADON
	config_tag = "MAGADON_MIDDLE_MANAGER"
	job_flags = CITY_JOB_FLAGS
	outfit = /datum/outfit/job/vampire/magadon_middle_manager

	minimal_masquerade = 5
	// minimal_renown_rank = 3
	allowed_tribes = list(TRIBE_BLACK_SPIRAL_DANCERS, TRIBE_RONIN)

	display_order = JOB_DISPLAY_ORDER_MAGADON_CORP_MIDDLE_MANAGER
	department_for_prefs = /datum/job_department/magadon
	departments_list = list(
		/datum/job_department/magadon,
	)

	known_contacts = list(
		JOB_MAGADON_CORP_HEAD,
	)

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	liver_traits = list(TRAIT_ROYAL_METABOLISM)

/datum/outfit/job/vampire/magadon_middle_manager
	name = JOB_MAGADON_CORP_MIDDLE_MANAGER
	jobtype = /datum/job/vampire/magadon_middle_manager

	id = /obj/item/card/magadon/middle_manager
	uniform =  /obj/item/clothing/under/vampire/magadon_suit
	shoes = /obj/item/clothing/shoes/vampire/businessblack
	l_pocket = /obj/item/smartphone
	r_pocket = /obj/item/vamp/keys/magadon/corporate
	backpack_contents = list(/obj/item/phone_book=1, /obj/item/veil_contract, /obj/item/card/credit/rich=1)
