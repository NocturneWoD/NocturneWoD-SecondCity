#define JOB_START_HELPER(job_type, job_name)	\
	/obj/effect/landmark/start/darkpack/##job_type {	\
		name = ##job_name; \
		icon_state = "Citizen"; \
	}

JOB_START_HELPER(farmer, JOB_FARMER)
JOB_START_HELPER(chef, JOB_RESTAURANT)
JOB_START_HELPER(salon, JOB_SALON)

#undef JOB_START_HELPER
