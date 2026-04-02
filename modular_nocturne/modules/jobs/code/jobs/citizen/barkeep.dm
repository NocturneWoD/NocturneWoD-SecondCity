/datum/job/vampire/barkeep
	title = JOB_BARKEEP
	description = "Put on a fake smile, mix drinks, and keep your patrons drunk."
	faction = FACTION_CITY
	total_positions = 2
	spawn_positions = 2
	config_tag = "BARKEEP"
	outfit = /datum/outfit/job/vampire/barkeep
	job_flags = CITY_JOB_FLAGS
	allowed_splats = SPLAT_ALL
	exp_required_type_department = EXP_TYPE_SERVICES
	department_for_prefs = /datum/job_department/city_services
	departments_list = list(
		/datum/job_department/city_services,
	)
	display_order = JOB_DISPLAY_ORDER_BARKEEP
	minimal_masquerade = 0
