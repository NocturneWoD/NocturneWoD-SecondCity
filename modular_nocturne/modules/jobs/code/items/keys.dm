/obj/item/vamp/keys/farmer
	name = "farmer keys"
	accesslocks = list(
		LOCKACCESS_FARMER
	)
	color = "#6caf75"

/obj/item/vamp/keys/chef
	name = "kitchen keys"
	accesslocks = list(
		LOCKACCESS_CHEF
	)
	color = "#6caf75"

/obj/item/vamp/keys/salon
	name = "salon keys"
	accesslocks = list(
		LOCKACCESS_SALON
	)
	color = "#884978"

// magadon

/obj/item/vamp/keys/magadon
	name = "\improper Autumn Health clinic keys"
	accesslocks = list(
		LOCKACCESS_MAGADON
	)
	color = COLOR_CORP_MAGADON

/obj/item/vamp/keys/magadon/security
	name = "\improper " + EVIL_PHARMA_COMPANY + " security keys"
	accesslocks = list(
		LOCKACCESS_MAGADON,
		LOCKACCESS_MAGADON_SECURITY
	)

/obj/item/vamp/keys/magadon/corporate
	name = "\improper " + EVIL_PHARMA_COMPANY + " office keys"
	accesslocks = list(
		LOCKACCESS_MAGADON,
		LOCKACCESS_MAGADON_CORPORATE
	)

/obj/item/vamp/keys/magadon/leader
	name = "\improper " + EVIL_PHARMA_COMPANY + " keys"
	accesslocks = list(
		LOCKACCESS_MAGADON,
		LOCKACCESS_MAGADON_CORPORATE,
		LOCKACCESS_MAGADON_SECURITY
	)

// police

/obj/item/vamp/keys/police/dispatcher
	name = "emergency dispatcher keys"
	accesslocks = list(
		LOCKACCESS_POLICE,
		LOCKACCESS_DISPATCH
	)
