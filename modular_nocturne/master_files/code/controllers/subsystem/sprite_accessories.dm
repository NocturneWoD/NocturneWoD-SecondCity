#define DEFAULT_SPRITE_LIST "default_sprites"

#define INIT_ACCESSORY(sprite_accessory) init_sprite_accessory_subtypes(sprite_accessory, add_blank = FALSE)[DEFAULT_SPRITE_LIST]

/datum/controller/subsystem/accessories
	var/list/body_markings

/datum/controller/subsystem/accessories/setup_lists()
	. = ..()

	body_markings = init_sprite_accessory_subtypes(/datum/sprite_accessory/body_marking)[DEFAULT_SPRITE_LIST]

	feature_list[FEATURE_EARS_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/ears)
	feature_list[FEATURE_FRILLS_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/frills)
	feature_list[FEATURE_HORNS_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/horns)
	feature_list[FEATURE_SNOUT_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/snouts)
	feature_list[FEATURE_TAIL_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/tails)
	feature_list[FEATURE_FLUFF_NOCTURNE] = INIT_ACCESSORY(/datum/sprite_accessory/nocturne/fluff)

#undef INIT_ACCESSORY

#undef DEFAULT_SPRITE_LIST
