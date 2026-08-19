#define COMBAT_NOTICE_COOLDOWN (10 SECONDS)
GLOBAL_DATUM_INIT(combat_indicator_vis, /obj/effect/overlay/indicator/combat, new)

/obj/effect/overlay/indicator/combat
	icon = 'modular_nocturne/modules/indicators/icons/indicators.dmi'
	icon_state = "combat"

/mob/living
	/// Is combat indicator enabled for this mob? Boolean.
	var/combat_indicator = FALSE
	/// When is the next time this mob will be able to use flick_emote and put the fluff text in chat?
	var/nextcombatpopup = 0

/**
 * Called whenever a mob's stat changes.
 * Checks if the mob's stat is greater than SOFT_CRIT, and if it is, it will disable CI.
 *
 * Arguments:
 * * source -- The mob in question that toggled CI status.
 * * new_stat -- The new stat of the mob.
 */

/mob/living/proc/ci_on_stat_change(mob/source, new_stat)
	SIGNAL_HANDLER
	if(new_stat <= SOFT_CRIT)
		return
	set_combat_indicator(FALSE, involuntary = TRUE)

/**
 * Called whenever a mob's CI status changes for any reason.
 *
 * Checks if the mob is dead, if config disallows CI, or if the current CI status is the same as state, and if it is, it will change CI status to state.
 *
 * Arguments:
 * * state -- Boolean. Inherited from the procs that call this, basically it's what that proc wants CI to change to - true or false, on or off.
 * * involuntary -- Boolean. If true, the mob is dead or unconscious, and the log will reflect that.
 */

/mob/living/proc/set_combat_indicator(state, involuntary = FALSE)
	if(combat_indicator == state) // If the mob is dead (should not happen) or if the combat_indicator is the same as state (also shouldnt happen) kill the proc.
		return

	/* // we're tying this to combat mode, instead of it being its own keybind
	if(stat == DEAD)
		disable_combat_indicator(involuntary)
	*/

	combat_indicator = state

	if(combat_indicator)
		enable_combat_indicator()
	else
		disable_combat_indicator()

/**
 * Called whenever a mob enables CI.
 *
 * Plays a sound, sents a message to chat, updates their overlay, and sets the mob's CI status to true.
 */

/mob/living/proc/enable_combat_indicator()
	if(world.time > nextcombatpopup) // As of the time of writing, COMBAT_NOTICE_COOLDOWN is 10 secs, so this is asking "has 10 secs past between last activation of CI?"
		nextcombatpopup = world.time + COMBAT_NOTICE_COOLDOWN
		playsound(src, 'sound/machines/chime.ogg', vol = 10, vary = FALSE, extrarange = -6, falloff_exponent = 4, frequency = null, channel = 0, pressure_affected = FALSE, ignore_walls = FALSE, falloff_distance = 1)
		flick_emote_popup_on_mob("combat", 2 SECONDS)
		var/ciweapon
		if(get_active_held_item())
			ciweapon = get_active_held_item()
			if(istype(ciweapon, /obj/item/gun))
				visible_message(span_boldwarning("[src] raises \the [ciweapon] with [p_their()] finger on the trigger, ready for combat!"))
			else
				visible_message(span_boldwarning("[src] readies \the [ciweapon] with a tightened grip and offensive stance, ready for combat!"))
		else
			visible_message(span_boldwarning("[src] takes a defensive stance and gets ready for combat!"))
	combat_indicator = TRUE
	// apply_status_effect(/datum/status_effect/grouped/surrender, src)
	log_message("<font color='red'>[src] has turned ON the combat indicator!</font>", LOG_ATTACK)
	RegisterSignal(src, COMSIG_MOB_STATCHANGE , PROC_REF(ci_on_stat_change))
	vis_contents |= GLOB.combat_indicator_vis

/**
 * Called whenever a mob disables CI. Or when they die or fall unconscious.
 *
 * Arguments:
 * * involuntary -- Boolean. If true, the mob is dead or unconscious, and the log will reflect that.
 */

/mob/living/proc/disable_combat_indicator(involuntary = FALSE)
	combat_indicator = FALSE
	// remove_status_effect(/datum/status_effect/grouped/surrender, src)
	if(involuntary)
		log_message("<font color='cyan'>[src] has fallen unconsious or has died and lost their combat indicator!</font>", LOG_ATTACK)
	else
		log_message("<font color='cyan'>[src] has turned OFF the combat indicator!</font>", LOG_ATTACK)
	UnregisterSignal(src, COMSIG_MOB_STATCHANGE)
	vis_contents -= GLOB.combat_indicator_vis

/**
 * Called whenever the user hits their combat indicator keybind, defaulted to C.
 *
 * If the user is conscious, it will set CI to be whatever the opposite of what it is currently.
 */

/mob/living/proc/user_toggle_combat_indicator()
	if(IS_UNCONSCIOUS_OR_CRIT(src))
		return
	set_combat_indicator(!combat_indicator) // Set CI status to whatever is the opposite of the current status.

#undef COMBAT_NOTICE_COOLDOWN


// Surrender shit
/atom/movable/screen/alert/status_effect/surrender/
	desc = "You're either in combat or being held up. Click here to surrender and show that you don't wish to fight. You will be incapacitated. (You can also say '*surrender' at any time to do this.)"

/datum/emote/living/surrender
	message = "drops to the floor and raises their hands defensively! They surrender%s!"
	stat_allowed = SOFT_CRIT

/datum/emote/living/surrender/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(isliving(user))
		var/mob/living/living_user = user
		living_user.set_combat_mode(FALSE)
		living_user.flick_emote_popup_on_mob("surrender", 15 SECONDS)

/datum/emote/living/surrender/select_message_type(mob/user, intentional)
	var/mob/living/living_mob = user
	if(living_mob?.body_position == LYING_DOWN)
		return "raises their hands defensively! They surrender%s!"
	. = ..()
