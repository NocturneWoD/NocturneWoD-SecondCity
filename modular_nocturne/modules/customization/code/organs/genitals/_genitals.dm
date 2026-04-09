/obj/item/organ/genital
	/// Whether the organ is aroused, matters for sprites, use AROUSAL_CANT, AROUSAL_NONE, or AROUSAL_FULL
	var/aroused = AROUSAL_NONE
	/// Used for input from the user whether to show a genital through clothing or not, always or never etc.
	var/visibility_pref = ORGAN_VISIBILITY_MODE_NORMAL

	/// Used for determining what sprite is being used, derives from arousal state
	var/sprite_suffix

	organ_flags = parent_type::organ_flags | ORGAN_EXTERNAL | ORGAN_UNREMOVABLE // as funny as it would be, im not letting anybody get their dick chopped off

/obj/item/organ/genital/Initialize(mapload)
	. = ..()
	update_sprite_suffix()

/obj/item/organ/genital/proc/update_sprite_suffix()
	sprite_suffix = "[get_sprite_size_string()]"

	var/datum/bodypart_overlay/mutant/genital/our_overlay = bodypart_overlay

	our_overlay.sprite_suffix = sprite_suffix
	our_overlay.organ_slot = src.slot

/obj/item/organ/genital/proc/get_sprite_size_string()
	var/is_aroused = aroused == AROUSAL_FULL ? "_aroused" : ""
	return is_aroused

/obj/item/organ/genital/proc/is_exposed()
	return FALSE

// base overlay

/datum/bodypart_overlay/mutant/genital
	layers = EXTERNAL_ADJACENT
	/// The suffix appended to the feature_key for the overlays.
	var/sprite_suffix
	/// Organ slot, used to get reference to the actual organ this is attached to without angering the CI gods.
	var/organ_slot

	draw_on_husks = FALSE

/datum/bodypart_overlay/mutant/genital/get_base_icon_state()
	. = ..()
	. += "[sprite_suffix]"

	return .

/datum/bodypart_overlay/mutant/genital/can_draw_on_bodypart(obj/item/bodypart/bodypart_owner, mob/living/carbon/owner, is_husked = FALSE)
	var/obj/item/organ/genital/owning_organ = owner.get_organ_slot(organ_slot)
	return ..() && owning_organ?.is_exposed()

