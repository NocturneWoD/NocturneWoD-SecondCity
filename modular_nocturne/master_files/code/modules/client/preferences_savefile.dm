/datum/preferences/save_character()
	. = ..()
	var/tree_key = "character[default_slot]"
	if(!(tree_key in savefile.get_entry()))
		savefile.set_entry(tree_key, list())
	var/save_data = savefile.get_entry(tree_key)

	save_data["body_markings"] = body_markings
	save_data["body_markings_colors"] = body_markings_colors
	savefile.save()

/datum/preferences/load_character(slot)
	. = ..()
	var/tree_key = "character[default_slot]"
	var/list/save_data = savefile.get_entry(tree_key)

	body_markings = save_data?["body_markings"]
	body_markings = SANITIZE_LIST(body_markings)
	body_markings_colors = save_data?["body_markings_colors"]
	body_markings_colors = SANITIZE_LIST(save_data?["body_markings_colors"])

	validate_markings()
