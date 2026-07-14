/datum/job/vampire/magadon_security
	title = JOB_MAGADON_SECURITY
	description = "You are a security officer for the local Autumn Health clinic. Your job is to ensure the safety of both the clinic and Magadon's secrets and to help your boss turn over any contract violators to corporate."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	faction = FACTION_PENTEX
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Chief of Security and the Head Manager"
	req_admin_notify = 1
	exp_granted_type = EXP_TYPE_MAGADON
	config_tag = "MAGADON_SECURITY"
	job_flags = CITY_JOB_FLAGS
	outfit = /datum/outfit/job/vampire/magadon_security

	allowed_tribes = list(TRIBE_BLACK_SPIRAL_DANCERS, TRIBE_RONIN)

	display_order = JOB_DISPLAY_ORDER_MAGADON_SECURITY
	department_for_prefs = /datum/job_department/magadon
	departments_list = list(
		/datum/job_department/magadon,
	)

	known_contacts = list(
		JOB_MAGADON_SECURITY_CHIEF
	)

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SEC

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

/datum/outfit/job/vampire/magadon_security
	name = JOB_MAGADON_SECURITY
	jobtype = /datum/job/vampire/magadon_security

	ears = /obj/item/radio/headset/darkpack
	id = /obj/item/card/magadon/security
	uniform =  /obj/item/clothing/under/vampire/magadon_shirt
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	gloves = /obj/item/clothing/gloves/vampire/work
	suit = /obj/item/clothing/suit/vampire/vest
	belt = /obj/item/storage/belt/holster/detective/darkpack/endron
	l_pocket = /obj/item/smartphone
	r_pocket = /obj/item/vamp/keys/magadon/security
	backpack_contents = list(/obj/item/phone_book=1, /obj/item/card/credit=1)
