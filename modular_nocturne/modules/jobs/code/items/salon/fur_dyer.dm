#define COLOR_MODE_SPECIFIC "Specific Marking"
#define COLOR_MODE_GENERAL "General Color"

/obj/item/fur_dyer
	name = "electric fur dyer"
	desc = "Dye that is capable of recoloring fur in a mostly permanent way."
	icon = 'modular_nocturne/modules/jobs/icons/items.dmi'
	icon_state = "fur_sprayer"
	w_class = WEIGHT_CLASS_TINY
	var/mode = COLOR_MODE_SPECIFIC

/obj/item/fur_dyer/attack_self(mob/user, modifiers)
	. = ..()
	if(mode == COLOR_MODE_SPECIFIC)
		mode = COLOR_MODE_GENERAL
	else
		mode = COLOR_MODE_SPECIFIC

	balloon_alert(user, "set to [mode]!")

/obj/item/fur_dyer/attack(mob/living/M, mob/living/user, params)
	if(!ishuman(M))
		return ..()

	var/mob/living/carbon/human/target_human = M

	if(!HAS_TRAIT(target_human, TRAIT_MUTANT_COLORS))
		to_chat(user, span_warning("You can't dye [target_human], they don't have fur!"))
		return

	switch(mode)
		if(COLOR_MODE_SPECIFIC)
			dye_marking(target_human, user)
		if(COLOR_MODE_GENERAL)
			dye_general(target_human, user)

/obj/item/fur_dyer/proc/dye_general(mob/living/carbon/human/target_human, mob/living/user)
	var/selected_color = tgui_color_picker(
			user,
			"Select color",
			null,
			COLOR_WHITE,
		)

	if(!selected_color)
		return

	selected_color = sanitize_hexcolor(selected_color)

	visible_message(span_notice("[user] starts to masterfully paint [target_human]!"))

	if(do_after(user, 20 SECONDS, target_human))
		target_human.dna.features[FEATURE_MUTANT_COLOR] = selected_color

		target_human.dna.update_uf_block(/datum/dna_block/feature/mutant_color)
		target_human.update_body(is_creating = TRUE)
		target_human.update_mutations_overlay()

		visible_message(span_notice("[user] finishes painting [target_human]!"))

		playsound(src.loc, 'sound/effects/spray2.ogg', 50, TRUE)

/obj/item/fur_dyer/proc/dye_marking(mob/living/carbon/human/target_human, mob/living/user)

	var/list/current_markings = target_human.dna.features["markings_list"]
	var/list/current_marking_colors = target_human.dna.features["markings_list_colors"]
	var/selected_marking_area = user.zone_selected

	switch(selected_marking_area)
		if(BODY_ZONE_PRECISE_GROIN)
			selected_marking_area = BODY_ZONE_CHEST
		if(BODY_ZONE_PRECISE_EYES)
			selected_marking_area = BODY_ZONE_HEAD
		if(BODY_ZONE_PRECISE_MOUTH)
			selected_marking_area = BODY_ZONE_HEAD
		if(BODY_ZONE_PRECISE_L_FOOT)
			selected_marking_area = BODY_ZONE_L_LEG
		if(BODY_ZONE_PRECISE_R_FOOT)
			selected_marking_area = BODY_ZONE_R_LEG

	if(!current_markings[selected_marking_area])
		to_chat(user, span_danger("[target_human] has no bodymarkings on this limb!"))
		return

	// this is probably dumb, but it has a nice benefit that if the person has duplicate markings we get the last occuring one, NOT the first
	var/list/markings_to_index = list()
	for(var/marking_index in 1 to LAZYLEN(target_human.dna.features["markings_list"][selected_marking_area]))
		markings_to_index[target_human.dna.features["markings_list"][selected_marking_area][marking_index]] = marking_index

	var/selected_marking_id = tgui_input_list(user, "Please select which marking you'd like to color!", "Select marking", markings_to_index)

	if(!selected_marking_id || !markings_to_index[selected_marking_id])
		return

	var/selected_marking_index = markings_to_index[selected_marking_id]

	var/selected_color = tgui_color_picker(
			user,
			"Select marking color",
			null,
			COLOR_WHITE,
		)

	if(!selected_color)
		return

	selected_color = sanitize_hexcolor(selected_color)

	visible_message(span_notice("[user] starts to masterfully paint [target_human]!"))

	if(do_after(user, 20 SECONDS, target_human))
		current_marking_colors[selected_marking_area][selected_marking_index] = selected_color

		target_human.dna.species.remove_body_markings(target_human)
		target_human.dna.species.add_body_markings(target_human)

		visible_message(span_notice("[user] finishes painting [target_human]!"))

		playsound(src.loc, 'sound/effects/spray2.ogg', 50, TRUE)

#undef COLOR_MODE_SPECIFIC
#undef COLOR_MODE_GENERAL
