#define JOB_START_HELPER(job_type, job_name)	\
	/obj/effect/landmark/start/darkpack/##job_type {	\
		name = ##job_name; \
		icon_state = ##job_name; \
	}

JOB_START_HELPER(citizen/farmer, JOB_FARMER)
JOB_START_HELPER(citizen/chef, JOB_RESTAURANT)
JOB_START_HELPER(citizen/salon, JOB_SALON)

#undef JOB_START_HELPER
