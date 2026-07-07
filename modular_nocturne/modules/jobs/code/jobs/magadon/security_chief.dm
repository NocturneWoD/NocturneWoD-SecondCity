/datum/job/vampire/magadon_sec_chief
	title = JOB_MAGADON_SECURITY_CHIEF
	description = "You are the acting Chief of Security for the local Magadon subsidiary health clinic. Your duties are to keep your security officers in line, ensure the safety of both the clinic and Magadon's secrets, and to turn over any contract violators to corporate."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	faction = FACTION_PENTEX
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Head Manager"
	req_admin_notify = 1
	minimal_player_age = 25
	exp_requirements = 150
	exp_required_type = EXP_TYPE_MAGADON
	exp_required_type_department = EXP_TYPE_MAGADON
	exp_granted_type = EXP_TYPE_MAGADON
	config_tag = "MAGADON_SECURITY_CHIEF"
	job_flags = CITY_JOB_FLAGS
	outfit = /datum/outfit/job/vampire/magadon_sec_chief

	minimal_masquerade = 4
	// minimal_renown_rank = 3
	allowed_tribes = list(TRIBE_BLACK_SPIRAL_DANCERS, TRIBE_RONIN)
	display_order = JOB_DISPLAY_ORDER_MAGADON_SECURITY_CHIEF
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

/datum/outfit/job/vampire/magadon_sec_chief
	name = JOB_MAGADON_SECURITY_CHIEF
	jobtype = /datum/job/vampire/magadon_sec_chief

//	ears = /obj/item/p25radio
	id = /obj/item/card/magadon/security_chief
	uniform =  /obj/item/clothing/under/vampire/magadon_turtleneck
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	gloves = /obj/item/clothing/gloves/vampire/work
	head = /obj/item/clothing/head/vampire/pentex_beret
	suit = /obj/item/clothing/suit/vampire/vest
	belt = /obj/item/storage/belt/holster/detective/darkpack/endron
	glasses = /obj/item/clothing/glasses/vampire/sun
	l_pocket = /obj/item/smartphone
	r_pocket = /obj/item/vamp/keys/magadon/leader
	backpack_contents = list(/obj/item/gun/ballistic/automatic/pistol/darkpack/deagle=1, /obj/item/phone_book=1, /obj/item/veil_contract, /obj/item/card/credit/rich=1)
