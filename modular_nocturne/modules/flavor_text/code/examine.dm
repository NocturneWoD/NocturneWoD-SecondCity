/mob/living/carbon/proc/get_headshot_examine(mob/user)
	. = list()

	if(!user.client?.prefs.read_preference(/datum/preference/toggle/examine_headshot))
		return

	var/headshot = ""
	var/obscured = FALSE
	var/show_flavor_text_when_masked = client?.prefs.read_preference(/datum/preference/toggle/show_identity_when_masked)

	if(ishuman(src))
		var/mob/living/carbon/human/holder_human = src
		obscured = holder_human.obscured_slots & HIDEFACE

		if(isobserver(user) || show_flavor_text_when_masked || !obscured)
			headshot = holder_human.dna.features[EXAMINE_DNA_HEADSHOT]

			if(headshot)
				. += chat_headshot(headshot)
