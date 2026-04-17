/// Config entry for enabling flavortext min character count, good to disable for debugging purposes
// DISABLE THIS instead of setting flavor_text_character_requirement to 0 or I'll chop your arms off
/datum/config_entry/flag/min_flavor_text
	default = FALSE

/// Config entry for enabling flavortext min character count, good to disable for debugging purposes
// NEVER set this value to 0!!
/datum/config_entry/number/flavor_text_character_requirement
	default = 150
