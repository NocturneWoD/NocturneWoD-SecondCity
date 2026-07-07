/datum/job/vampire/magadon_doctor
	title = JOB_MAGADON_DOCTOR
	description = "You are a doctor for the local Autumn Health clinic. Help any wounded or diseased that come in. Pump them full of whatever prescription cocktail your heart desires."
	faction = FACTION_PENTEX
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Middle Managers and the Head Manager"
	config_tag = "MAGADON_DOCTOR"
	exp_granted_type = EXP_TYPE_MAGADON
	job_flags = CITY_JOB_FLAGS
	outfit = /datum/outfit/job/vampire/magadon_doctor

	display_order = JOB_DISPLAY_ORDER_MAGADON_DOCTOR
	department_for_prefs = /datum/job_department/magadon
	departments_list = list(
		/datum/job_department/magadon,
	)

	known_contacts = list(
		JOB_MAGADON_CORP_HEAD,
		JOB_MAGADON_CORP_MIDDLE_MANAGER,
	)

	alt_titles = list(
		"Clinic Nurse",
		"Clinic Surgeon",
		"Clinic Physician",
		"Clinic Paramedic",
	)


/datum/outfit/job/vampire/magadon_doctor
	name = JOB_MAGADON_DOCTOR
	jobtype = /datum/job/vampire/magadon_doctor

	ears = /obj/item/radio/headset/darkpack
	id = /obj/item/card/clinic
	uniform = /obj/item/clothing/under/vampire/nurse
	shoes = /obj/item/clothing/shoes/vampire/white
	suit =  /obj/item/clothing/suit/vampire/magadon_labcoat
	gloves = /obj/item/clothing/gloves/vampire/latex
	l_pocket = /obj/item/smartphone
	r_pocket = /obj/item/vamp/keys/magadon
	backpack_contents = list(/obj/item/card/credit=1, /obj/item/storage/medkit/darkpack/doctor=1)

	skillchips = list(/obj/item/skillchip/entrails_reader)
