// length of the dna feature marking list
#define MARKING_LIST_LEN 24

// dna feature marking list item locations
#define MARKING_HEAD 1
#define MARKING_HEAD2 2
#define MARKING_HEAD3 3
#define MARKING_CHEST 4
#define MARKING_CHEST2 5
#define MARKING_CHEST3 6
#define MARKING_RARM 7
#define MARKING_RARM2 8
#define MARKING_RARM3 9
#define MARKING_LARM 10
#define MARKING_LARM2 11
#define MARKING_LARM3 12
#define MARKING_LHAND 13
#define MARKING_LHAND2 14
#define MARKING_LHAND3 15
#define MARKING_RHAND 16
#define MARKING_RHAND2 17
#define MARKING_RHAND3 18
#define MARKING_LLEG 19
#define MARKING_LLEG2 20
#define MARKING_LLEG3 21
#define MARKING_RLEG 22
#define MARKING_RLEG2 23
#define MARKING_RLEG3 24

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
