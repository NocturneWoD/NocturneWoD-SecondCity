/obj/structure/retail/police
	name = "Requisitions"
	desc = "An HC24-A requisitions form for obtaining police equipment, from handcuffs and gloves all the way to firearms and ammo."
	icon_state = "menu"
	product_categories = list(
		list(
			"name" = "Equipment",
			"icon" = "handcuffs",
			"products" = list(
				/obj/item/restraints/handcuffs = 0,
				/obj/item/radio/headset/darkpack/police = 0,
				/obj/item/storage/belt/holster/detective/darkpack = 5,
				/obj/item/storage/belt/police/swat = 5,
				/obj/item/clothing/suit/vampire/vest/police = 5,
				/obj/item/flashlight/seclite = 0,
				/obj/item/clothing/gloves/tackler/combat/insulated = 5,
				/obj/item/camera/detective = 0,
				/obj/item/taperecorder = 0,
				/obj/item/toy/crayon/white = 0,
				/obj/item/detective_scanner/darkpack = 0,
				/obj/item/storage/box/bodybags = 0,
			),
		),

		list(
			"name" = "Uniforms",
			"icon" = "shirt",
			"products" = list(
				/obj/item/clothing/under/vampire/police = 0,
				/obj/item/clothing/under/vampire/police/long = 0,
				/obj/item/clothing/under/vampire/police/turtleneck = 0,
				/obj/item/clothing/under/vampire/police/pants = 0,
				/obj/item/clothing/under/vampire/police/utility = 0,
				/obj/item/clothing/suit/vampire/coat/police = 0,
				/obj/item/clothing/head/vampire/police = 0,
			),
		),

		list(
			"name" = "Firearms",
			"icon" = "gun",
			"products" = list(
				/obj/item/gun/ballistic/automatic/pistol/darkpack/glock19 = 25,
				/obj/item/gun/ballistic/automatic/pistol/darkpack/m1911 = 25,
				/obj/item/gun/ballistic/shotgun/vampire = 50,
				/obj/item/gun/ballistic/automatic/darkpack/mp5 = 100,
				/obj/item/gun/ballistic/automatic/darkpack/mp7 = 100,
				/obj/item/gun/ballistic/automatic/darkpack/ar15 = 125,
				/obj/item/gun/ballistic/automatic/darkpack/autoshotgun = 200,
				/obj/item/gun/ballistic/automatic/darkpack/sniper = 300,
				/obj/item/gun/ballistic/automatic/darkpack/autosniper = 350,
			),
		),

		list(
			"name" = "Ammo",
			"icon" = "explosion",
			"products" = list(
				/obj/item/ammo_box/magazine/glock9mm = 10,
				/obj/item/ammo_box/magazine/darkpack45acp = 10,
				/obj/item/ammo_box/darkpack/c12g/buck = 15,
				/obj/item/ammo_box/darkpack/c12g/rubber = 15,
				/obj/item/ammo_box/darkpack/c12g/incap = 15,
				/obj/item/ammo_box/magazine/darkpack9mp5 = 20,
				/obj/item/ammo_box/magazine/darkpack/c46pdw = 20,
				/obj/item/ammo_box/magazine/darkpack556 = 10,
				/obj/item/ammo_box/magazine/darkpackautoshot = 30,
				/obj/item/ammo_box/darkpack/c50 = 50,
				/obj/item/ammo_box/magazine/vamp762x51PSG1 = 50,
			),
		),
	)

	var/list/allowed_jobs = list(
		JOB_POLICE_CAPTAIN,
		JOB_POLICE_SERGEANT,
		JOB_POLICE_OFFICER,
		JOB_EMERGENCY_DISPATCHER,
		JOB_FEDERAL_INVESTIGATOR,
		JOB_NATIONAL_GUARD,
		JOB_POLICE_SWAT,
	)
	var/rejection_message = "You aren't approved to fill this out!"

/obj/structure/retail/police/can_interact(mob/user)
	. = ..()
	if(!. || isnull(user.mind))
		return FALSE

	var/user_job = user.mind.assigned_role.title

	if(!allowed_jobs.Find(user_job))
		to_chat(user, span_warning(rejection_message))
		return FALSE
