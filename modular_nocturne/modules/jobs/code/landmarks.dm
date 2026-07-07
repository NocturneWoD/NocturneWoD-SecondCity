#define JOB_START_HELPER(job_type, job_name)	\
	/obj/effect/landmark/start/darkpack/##job_type {	\
		name = ##job_name; \
		icon_state = "Citizen"; \
	}

JOB_START_HELPER(farmer, JOB_FARMER)
JOB_START_HELPER(chef, JOB_RESTAURANT)
JOB_START_HELPER(salon, JOB_SALON)

JOB_START_HELPER(magadon/head_manager, JOB_MAGADON_CORP_HEAD)
JOB_START_HELPER(magadon/middle_manager, JOB_MAGADON_CORP_MIDDLE_MANAGER)
JOB_START_HELPER(magadon/security_chief, JOB_MAGADON_SECURITY_CHIEF)
JOB_START_HELPER(magadon/security, JOB_MAGADON_SECURITY)
JOB_START_HELPER(magadon/doctor, JOB_MAGADON_DOCTOR)

#undef JOB_START_HELPER
