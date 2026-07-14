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

JOB_START_HELPER(hunter/soldier, JOB_HUNTER_CELL_SOLDIER)
JOB_START_HELPER(hunter/general, JOB_HUNTER_CELL_HEAD)

#undef JOB_START_HELPER

/obj/effect/abstract/hunter_delivery_spot
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x2"
	invisibility = INVISIBILITY_ABSTRACT

/obj/effect/abstract/hunter_delivery_spot/Initialize(mapload)
	. = ..()
	GLOB.hunter_delivery_spots += src

/obj/effect/abstract/hunter_delivery_spot/Destroy(force)
	. = ..()
	GLOB.hunter_delivery_spots -= src
