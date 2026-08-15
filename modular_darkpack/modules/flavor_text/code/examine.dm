/mob/living/carbon
	///The Examine Panel TGUI.
	var/datum/examine_panel/examine_panel_tgui
	//Custom examine text, set via IC verb.
	var/custom_examine_message = null

/datum/examine_panel
	/// Mob that the examine panel belongs to.
	var/mob/living/carbon/holder

/datum/examine_panel/ui_state(mob/user)
	return GLOB.always_state

/datum/examine_panel/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ExaminePanel")
		ui.open()


/datum/examine_panel/ui_data(mob/user)
	var/list/data = list()

	var/flavor_text = ""
	var/character_notes = ""
	var/obscured
	var/name = ""
	var/headshot = ""
	// Whether or not the viewing user wants to see potential NSFW content in the holder's examine panel
	var/nsfw_content = TRUE // NOCTURNE EDIT - ORIGINAL: var/nsfw_content = user.client?.prefs.read_preference(/datum/preference/toggle/nsfw_content_pref)
	var/flavor_text_nsfw = ""
	var/ooc_notes = ""
	var/show_flavor_text_when_masked = holder.client?.prefs.read_preference(/datum/preference/toggle/show_identity_when_masked)

	if(ishuman(holder))
		var/mob/living/carbon/human/holder_human = holder
		obscured = holder_human.obscured_slots & HIDEFACE

		var/main_flavor_text_key = EXAMINE_DNA_FLAVOR_TEXT
		var/headshot_key = EXAMINE_DNA_HEADSHOT

		if(iscrinos(holder))
			main_flavor_text_key = EXAMINE_DNA_WAR_FORM_FLAVOR_TEXT
			headshot_key = EXAMINE_DNA_WAR_FORM_HEADSHOT
		else if(ishispo(holder) || islupus(holder))
			main_flavor_text_key = EXAMINE_DNA_FERAL_FORM_FLAVOR_TEXT
			headshot_key = EXAMINE_DNA_FERAL_FORM_HEADSHOT

		//Check if the mob is obscured, then continue to headshot
		if(isobserver(user) || show_flavor_text_when_masked || !obscured)
			headshot = holder_human.dna.features[headshot_key]
			/* // NOCTURNE REMOVAL START
			flavor_text = holder_human.dna.features[main_flavor_text_key]
			flavor_text_nsfw = holder.dna.features[EXAMINE_DNA_NSFW_FLAVOR_TEXT]
			ooc_notes = holder.dna.features[EXAMINE_DNA_OOC_NOTES]
			character_notes = holder.dna.features[EXAMINE_DNA_CHARACTER_NOTES]
			*/ // NOCTURNE REMOVAL END

			// NOCTURNE ADDITION START
			flavor_text = parsemarkdown_basic(html_encode(holder_human.dna.features[main_flavor_text_key]), color=TRUE)
			flavor_text_nsfw = parsemarkdown_basic(html_encode(holder_human.dna.features[EXAMINE_DNA_NSFW_FLAVOR_TEXT]), color=TRUE)
			ooc_notes = parsemarkdown_basic(html_encode(holder_human.dna.features[EXAMINE_DNA_OOC_NOTES]), color=TRUE)
			character_notes = parsemarkdown_basic(html_encode(holder_human.dna.features[EXAMINE_DNA_CHARACTER_NOTES]), color=TRUE)
			// NOCTURNE ADDITION END

			name = holder.name
		else if(obscured || !holder_human.dna)
			flavor_text = "Obscured"
			flavor_text_nsfw = "Obscured"
			character_notes = parsemarkdown_basic(html_encode(holder_human.dna.features[EXAMINE_DNA_CHARACTER_NOTES]), color=TRUE) // NOCTURNE EDIT - ORIGINAL: character_notes = "Obscured"
			ooc_notes = parsemarkdown_basic(html_encode(holder_human.dna.features[EXAMINE_DNA_OOC_NOTES]), color=TRUE) // NOCTURNE EDIT - ORIGINAL: ooc_notes = "Obscured"
			name = "Unknown"

	data["obscured"] = obscured ? TRUE : FALSE
	data["character_name"] = name
	data["flavor_text"] = flavor_text
	data["flavor_text_nsfw"] = CONFIG_GET(flag/nsfw_content) ? flavor_text_nsfw : null
	data["ooc_notes"] = CONFIG_GET(flag/nsfw_content) ? ooc_notes : null
	data["character_notes"] = character_notes
	data["headshot"] = headshot
	data["nsfw_content"] = nsfw_content ? TRUE : FALSE
	return data

/mob/living/carbon/proc/flavor_text_creation()
	var/flavor_text_to_show

	/* // NOCTURNE REMOVAL START
	var/main_flavor_text_key = EXAMINE_DNA_FLAVOR_TEXT
	if(iscrinos(src))
		main_flavor_text_key = EXAMINE_DNA_WAR_FORM_FLAVOR_TEXT
	else if(ishispo(src) || islupus(src))
		main_flavor_text_key = EXAMINE_DNA_FERAL_FORM_FLAVOR_TEXT

	var/preview_text = copytext_char(dna.features[main_flavor_text_key], 1, FLAVOR_PREVIEW_LIMIT)
	// What examine_tgui.dm uses to determine if flavor text appears as "Obscured".
	var/face_obscured = obscured_slots & HIDEFACE
	if(!face_obscured || (face_obscured && client?.prefs.read_preference(/datum/preference/toggle/show_identity_when_masked)))
		flavor_text_to_show = span_notice("[preview_text]... <a href='byond://?src=[REF(src)];view_flavortext=1;'>\[Look closer?\]</a>")
	*/ // NOCTURNE REMOVAL END

	flavor_text_to_show = span_notice("<a href='byond://?src=[REF(src)];view_flavortext=1;'>\[Examine closer\]</a>") // NOCTURNE ADDITION

	return flavor_text_to_show

/mob/living/carbon/Topic(href, href_list)
	if(href_list["view_flavortext"])
		examine_panel_tgui.ui_interact(usr)
	. = ..()
