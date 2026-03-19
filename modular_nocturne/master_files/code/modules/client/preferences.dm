/datum/preferences
	var/list/list/body_markings = list()
	var/list/list/body_markings_colors = list()

/datum/preferences/proc/validate_markings()
	var/list/list/final_markings = list()
	var/list/list/final_markings_colors = list()

	for(var/zone in body_markings)
		if(LAZYLEN(body_markings[zone]) != LAZYLEN(body_markings_colors[zone]))
			continue

		LAZYINITLIST(final_markings[zone])
		LAZYINITLIST(final_markings_colors[zone])

		var/datum/bodypart_overlay/simple/body_marking/body_markings/markings = new /datum/bodypart_overlay/simple/body_marking/body_markings()

		for(var/marking_index in 1 to LAZYLEN(body_markings[zone]))
			var/marking_name = body_markings[zone][marking_index]
			var/marking_color = body_markings_colors[zone][marking_index]

			// invalid marking
			var/datum/sprite_accessory/body_marking/accessory = markings.get_accessory(marking_name)
			if(isnull(accessory))
				continue

			LAZYADDASSOC(final_markings, zone, marking_name)
			LAZYADDASSOC(final_markings_colors, zone, sanitize_hexcolor(marking_color))

	body_markings = final_markings
	body_markings_colors = final_markings_colors

