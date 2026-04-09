#define DEFAULT_SPRITE_LIST "default_sprites"
#define MALE_SPRITE_LIST "male_sprites"
#define FEMALE_SPRITE_LIST "female_sprites"
#define INIT_ACCESSORY(sprite_accessory) init_sprite_accessory_subtypes(sprite_accessory, add_blank = FALSE)[DEFAULT_SPRITE_LIST]

/datum/controller/subsystem/accessories
	var/list/body_markings

	var/list/bra_list
	var/list/bra_m
	var/list/bra_f

/datum/controller/subsystem/accessories/setup_lists()
	. = ..()

	body_markings = INIT_ACCESSORY(/datum/sprite_accessory/body_marking)

	var/bra_lists = init_sprite_accessory_subtypes(/datum/sprite_accessory/clothing/bra)
	bra_list = bra_lists[DEFAULT_SPRITE_LIST]
	bra_m = bra_lists[MALE_SPRITE_LIST]
	bra_f = bra_lists[FEMALE_SPRITE_LIST]

	feature_list[FEATURE_EARS_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/ears)
	feature_list[FEATURE_FRILLS_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/frills)
	feature_list[FEATURE_HORNS_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/horns)
	feature_list[FEATURE_SNOUT_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/snouts)
	feature_list[FEATURE_TAIL_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/tails)
	feature_list[FEATURE_FLUFF_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/fluff)
	feature_list[FEATURE_BREASTS_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/breasts)
	feature_list[FEATURE_PINTLE_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/pintle)
	feature_list[FEATURE_TESTICLES_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/testicles)

#undef INIT_ACCESSORY

#undef DEFAULT_SPRITE_LIST
#undef MALE_SPRITE_LIST
#undef FEMALE_SPRITE_LIST
