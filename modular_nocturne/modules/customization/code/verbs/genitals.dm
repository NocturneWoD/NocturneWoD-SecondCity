/mob/living/carbon/human/verb/toggle_genitals()
	set category = "IC"
	set name = "Expose/Hide genitals"
	set desc = "Allows you to toggle which genitals should show through clothes or not."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You can't do this right now..."))
		return

	var/list/genital_list = list()
	for(var/obj/item/organ/genital/genital in organs)
		genital_list += genital

	if(!genital_list.len) //There is nothing to expose
		return

	var/obj/item/organ/genital/picked_organ = tgui_input_list(src, "Choose which genitalia to expose/hide", "Expose/Hide genitals", genital_list)

	if(!picked_organ || !(picked_organ in organs))
		return

	var/static/list/gen_vis_trans = list(
		ORGAN_VISIBILITY_MODE_ALWAYS_SHOW,
		ORGAN_VISIBILITY_MODE_NORMAL,
		ORGAN_VISIBILITY_MODE_ALWAYS_HIDE,
	)

	var/picked_visibility = tgui_input_list(src, "Choose visibility setting", "Expose/Hide genitals", gen_vis_trans)

	if(!picked_visibility || !picked_organ || !(picked_organ in organs))
		return

	picked_organ.visibility_pref = picked_visibility
	balloon_alert(src, "set to [LOWER_TEXT(picked_visibility)]")
	update_body()


/mob/living/carbon/human/verb/toggle_arousal()
	set category = "IC"
	set name = "Toggle arousal"
	set desc = "Allows you to toggle how aroused your private parts are."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You can't do this right now..."))
		return

	var/list/genital_list = list()
	for(var/obj/item/organ/genital/genital in organs)
		if(!genital.aroused == AROUSAL_CANT)
			genital_list += genital

	if(!genital_list.len) //There is nothing to modify.
		return

	var/obj/item/organ/genital/picked_organ = tgui_input_list(src, "Choose which genitalia to the change arousal of", "Toggle arousal", genital_list)

	if(!picked_organ || !(picked_organ in organs))
		return

	picked_organ.aroused = picked_organ.aroused == AROUSAL_FULL ? AROUSAL_NONE : AROUSAL_FULL
	picked_organ.update_sprite_suffix()
	balloon_alert(src, "toggled arousal")
	update_body()
