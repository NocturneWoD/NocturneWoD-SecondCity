
#define MAXIMUM_MARKINGS_PER_LIMB 3


/// Where bodyparts get their colors from, one color, three, or tg mutant color
// #define HAIR_COLOR "hair_color"
// #define FACIAL_HAIR_COLOR "facial_hair_color"
// #define EYE_COLOR "eye_color"
// #define MUTANT_COLOR "mutant_color"
#define USE_ONE_COLOR "one_color"
#define USE_MATRIXED_COLORS	"matrixed_colors"

/// Matrix colors for being husked
#define HUSK_COLOR_LIST list(list(0.64, 0.64, 0.64, 0), list(0.64, 0.64, 0.64, 0), list(0.64, 0.64, 0.64, 0), list(0, 0, 0, 1))

/// Default feature colors
#define DEFAULT_MATRIXED_FEATURE_COLORS list("#ffffff", "#ffffff", "#ffffff")

// Some defines for sprite accessories
// Which color source we're using when the accessory is added
#define DEFAULT_PRIMARY	1
#define DEFAULT_SECONDARY 2
#define DEFAULT_TERTIARY 3
#define DEFAULT_MATRIXED 4 // Uses all three colors for a matrix
#define DEFAULT_SKIN_OR_PRIMARY 5 // Uses skin tone color if the character uses one, otherwise primary

/// For mutant accessory layering, lets us use our existing icon naming scheme
#define MUTANT_ACCESSORY_NO_AFFIX "mutant_accessory_no_affix"

// organ slots
#define ORGAN_SLOT_EXTERNAL_FLUFF "fluff"
#define ORGAN_SLOT_EXTERNAL_BREASTS "breasts"
#define ORGAN_SLOT_EXTERNAL_VAGINA "vagina"
#define ORGAN_SLOT_EXTERNAL_PINTLE "pintle"
#define ORGAN_SLOT_EXTERNAL_TESTICLES "testicles"

// "organ" visibility flags
#define ORGAN_VISIBILITY_MODE_ALWAYS_SHOW "Always Show"
#define ORGAN_VISIBILITY_MODE_NORMAL "Normal"
#define ORGAN_VISIBILITY_MODE_ALWAYS_HIDE "Always Hide"

// more "organ" flags
#define AROUSAL_CANT 0
#define AROUSAL_NONE 1
#define AROUSAL_FULL 2
