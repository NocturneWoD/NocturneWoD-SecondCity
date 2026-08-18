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

	minimum_masquerade = 5
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
		JOB_TOWNHALL_MAYORAIDE
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

/datum/memory/key/magadon_vault_code
	var/remembered_code

/datum/memory/key/magadon_vault_code/New(
	datum/mind/memorizer_mind,
	atom/protagonist,
	atom/deuteragonist,
	atom/antagonist,
	remembered_code,
)
	src.remembered_code = remembered_code
	return ..()

/datum/memory/key/magadon_vault_code/get_names()
	return list("The vault code to the underground Magadon facility is [remembered_code].")

/datum/memory/key/magadon_vault_code/get_starts()
	return list(
		"[protagonist_name] blurts out [remembered_code], then looks nervous. Were they supposed to say that...?"
	)

/datum/job/vampire/magadon_corp_head/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	var/obj/structure/vaultdoor/pincode/magadon/door = locate() in GLOB.vault_doors
	if(door)
		spawned.mind.add_memory(/datum/memory/key/magadon_vault_code, remembered_code = door.pincode)
