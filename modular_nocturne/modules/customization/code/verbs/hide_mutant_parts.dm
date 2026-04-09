/mob/living/carbon/human/verb/hide_mutant_parts()
	set category = "IC"
	set name = "Toggle mutant part hiding"
	set desc = "Allows you to toggle which mutant parts should try to be hidden."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You can't do this right now..."))
		return

	var/ears_button = (FEATURE_EARS_NOCTURNE in try_hide_mutant_parts) ? "Show ears" : "Hide ears"
	var/horns_button = (FEATURE_HORNS_NOCTURNE in try_hide_mutant_parts) ? "Show horns" : "Hide horns"
	var/tail_button = (FEATURE_TAIL_NOCTURNE in try_hide_mutant_parts) ? "Show tail" : "Hide tail"

	var/list/choice_list = list()
	var/available_parts = 0

	if(FEATURE_EARS_NOCTURNE in dna.species.mutant_features)
		choice_list += list("[ears_button]" = FEATURE_EARS_NOCTURNE)
		available_parts++

	if(FEATURE_HORNS_NOCTURNE in dna.species.mutant_features)
		choice_list += list("[horns_button]" = FEATURE_HORNS_NOCTURNE)
		available_parts++

	if(FEATURE_TAIL_NOCTURNE in dna.species.mutant_features)
		choice_list += list("[tail_button]" = FEATURE_TAIL_NOCTURNE)
		available_parts++

	if(!available_parts)
		to_chat(usr, span_warning("You have no mutant parts to hide!"))
		return

	if(LAZYLEN(try_hide_mutant_parts))
		choice_list += list("Show all" = "show")

	if(LAZYLEN(try_hide_mutant_parts) < available_parts)
		choice_list += list("Hide all" = "hide")

	var/picked_visibility = tgui_input_list(src, "Choose visibility setting", "Show/Hide mutant parts", choice_list)
	if(!picked_visibility)
		return

	var/picked_choice = choice_list[picked_visibility]

	switch(picked_choice)
		if(FEATURE_EARS_NOCTURNE)
			if(FEATURE_EARS_NOCTURNE in try_hide_mutant_parts)
				to_chat(usr, span_notice("You are no longer trying to hide your ears."))
				LAZYREMOVE(try_hide_mutant_parts, FEATURE_EARS_NOCTURNE)
			else
				to_chat(usr, span_notice("You are now trying to hide your ears."))
				LAZYOR(try_hide_mutant_parts, FEATURE_EARS_NOCTURNE)

		if(FEATURE_HORNS_NOCTURNE)
			if(FEATURE_HORNS_NOCTURNE in try_hide_mutant_parts)
				to_chat(usr, span_notice("You are no longer trying to hide your ears."))
				LAZYREMOVE(try_hide_mutant_parts, FEATURE_HORNS_NOCTURNE)
			else
				to_chat(usr, span_notice("You are now trying to hide your ears."))
				LAZYOR(try_hide_mutant_parts, FEATURE_HORNS_NOCTURNE)

		if(FEATURE_TAIL_NOCTURNE)
			if(FEATURE_TAIL_NOCTURNE in try_hide_mutant_parts)
				to_chat(usr, span_notice("You are no longer trying to hide your ears."))
				LAZYREMOVE(try_hide_mutant_parts, FEATURE_TAIL_NOCTURNE)
			else
				to_chat(usr, span_notice("You are now trying to hide your ears."))
				LAZYOR(try_hide_mutant_parts, FEATURE_TAIL_NOCTURNE)

		if("show")
			to_chat(usr, span_notice("You are no longer trying to hide your mutant parts."))
			LAZYNULL(try_hide_mutant_parts)

		if("hide")
			to_chat(usr, span_notice("You are now trying trying to hide your mutant parts."))
			LAZYOR(try_hide_mutant_parts, FEATURE_EARS_NOCTURNE)
			LAZYOR(try_hide_mutant_parts, FEATURE_HORNS_NOCTURNE)
			LAZYOR(try_hide_mutant_parts, FEATURE_TAIL_NOCTURNE)

	update_body_parts()
