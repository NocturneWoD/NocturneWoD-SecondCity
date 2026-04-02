/datum/job/vampire/chef
	title = JOB_CHEF
	description = "Work yourself near to death to feed the hungry masses."
	faction = FACTION_CITY
	total_positions = 3
	spawn_positions = 3
	config_tag = "CHEF"
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
		JOB_FARMER
	)
