/datum/job/vampire/magadon_corp_head
	title = JOB_MAGADON_CORP_HEAD
	description = "You are the Head Manager for the local Magadon subsidiary health clinic. Keep your middle managers and security goons in line."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	faction = FACTION_PENTEX
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Board"
	req_admin_notify = 1
	minimal_player_age = 25
	exp_requirements = 180
	exp_required_type = EXP_TYPE_MAGADON
	exp_required_type_department = EXP_TYPE_MAGADON
	exp_granted_type = EXP_TYPE_MAGADON
	config_tag = "MAGADON_CORP_HEAD"
	job_flags = CITY_JOB_FLAGS
	outfit = /datum/outfit/job/vampire/magadon_corp_head

	minimal_masquerade = 5
	// minimal_renown_rank = 4
	allowed_tribes = list(TRIBE_BLACK_SPIRAL_DANCERS, TRIBE_RONIN)

	display_order = JOB_DISPLAY_ORDER_MAGADON_CORP_HEAD
	department_for_prefs = /datum/job_department/magadon
	departments_list = list(
		/datum/job_department/magadon,
	)

	known_contacts = list(
		JOB_MAGADON_CORP_MIDDLE_MANAGER,
		JOB_MAGADON_SECURITY_CHIEF,
	)

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	liver_traits = list(TRAIT_ROYAL_METABOLISM)

/datum/outfit/job/vampire/magadon_corp_head
	name = JOB_MAGADON_CORP_HEAD
	jobtype = /datum/job/vampire/magadon_corp_head

	id = /obj/item/card/magadon/head_manager
	uniform =  /obj/item/clothing/under/vampire/magadon_executivesuit
	shoes = /obj/item/clothing/shoes/vampire/businessblack
	suit = /obj/item/clothing/suit/vampire/magadon_labcoat
	l_pocket = /obj/item/smartphone
	r_pocket = /obj/item/vamp/keys/magadon/leader
	backpack_contents = list(/obj/item/gun/ballistic/automatic/pistol/darkpack/deagle=1, /obj/item/phone_book=1, /obj/item/card/credit/prince=1)
