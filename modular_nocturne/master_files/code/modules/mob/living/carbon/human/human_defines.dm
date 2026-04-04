/mob/living/carbon/human
	/// A list of mutant parts the human is trying to hide
	var/list/try_hide_mutant_parts

	/// Color of the undershirt
	var/undershirt_color = "#FFFFFF"
	/// Color of the socks
	var/socks_color = "#FFFFFF"
	/// The selected bra.
	var/bra = "Nude"
	/// Color of the bra.
	var/bra_color = "#FFFFFF"
	/// Flags for showing/hiding underwear, toggleabley by a verb
	var/underwear_visibility = NONE

///copies over clothing preferences like underwear to another human
/mob/living/carbon/human/copy_clothing_prefs(mob/living/carbon/human/destination)
	. = ..()

	destination.undershirt_color = undershirt_color
	destination.socks_color = socks_color
	destination.bra = bra
	destination.bra_color = bra_color
