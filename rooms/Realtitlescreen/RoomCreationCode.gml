pal_swap_init_system(shd_pal_swapper);

enum states 
{
	// the numbers shouldn't matter anymore
	// since I replaced them all to use these enums instead
	
	// the unused ones only exist because some code still references it
	// but they aren't needed for anything important
	
	normal,				// = 0
	titlescreen,		// = 1
	hookshot,			// = 2
	tacklecharge,		// = 3
	cheeseball,			// = 4
	slap,				// = 5
	cheesepep,			// = 6
	cheesepepstick,		// = 7
	boxxedpep,			// = 8
	pistolaim,			// = 9
	climbwall,			// = 10
	knightpepslopes,	// = 11
	portal,				// = 12
	secondjump,			// = 13
	chainsawbump,		// = 14
	handstandjump,		// = 15
	gottreasure,		// = 16
	knightpep,			// = 17
	knightpepattack,	// = 18
	meteorpep,			// = 19
	bombpep,			// = 20
	grabbing,			// = 21
	chainsawpogo,		// = 22
	shotgunjump,		// = 23
	stunned,			// = 24
	highjump,			// = 25
	chainsaw,			// = 26
	facestomp,			// = 27
	mach4,				// = 28
	timesup,			// = 29
	machroll,			// = 30
	shotgun,			// = 31
	pistol,				// = 32
	machfreefall,		// = 33
	Throw,				// = 34
	slam,				// = 35
	superslam,			// = 36
	skateboard,			// = 37
	grind,				// = 38
	grab,				// = 39
	punch,				// = 40
	backkick,			// = 41
	uppunch,			// = 42
	shoulder,			// = 43
	backbreaker,		// = 44
	bossdefeat,			// = 45
	pizzathrow,			// = 46
	bossintro,			// = 47
	gameover,			// = 48
	keyget,				// = 49
	tackle,				// = 50
	jump,				// = 51
	ladder,				// = 52
	slipnslide,			// = 53
	comingoutdoor,		// = 54
	smirk,				// = 55
	Sjump,				// = 56
	victory,			// = 57
	Sjumpprep,			// = 58
	crouch,				// = 59
	crouchjump,			// = 60
	crouchslide,		// = 61
	mach1,				// = 62
	mach2,				// = 63
	machslide,			// = 64
	bump,				// = 65
	hurt,				// = 66
	freefall,			// = 67
	hang,				// = 68
	turning,			// = 69
	freefallland,		// = 70
	door,				// = 71
	barrelcrouch,		// = 72
	barrelfloat,		// = 73
	barrelmach2,		// = 74
	barrelmach1,		// = 75
	barrelfall,			// = 76
	barrelnormal,		// = 77
	barrelslipnslide,	// = 78
	barrelroll,			// = 79
	current,			// = 80
	boulder,			// = 81
	runonball,			// = 82
	mach3,				// = 83
	freefallprep,		// = 84
	Sjumpland,			// = 85
	
	//enemy states
	idle,				// = 86
	bounce,				// = 87
	charge,				// = 88
	pizzagoblinthrow,	// = 89
	turn,				// = 90
	hitceilling,		// = 91
	hitwall,			// = 92
	rolling,			// = 93
	walk,				// = 94
	fall,				// = 95
	land,				// = 96
	hit,				// = 97
	stun,				// = 98
	
	unused99,			// = 99			// still missing and isn't used anywhere
	unused100,			// = 100		// still missing and isn't used anywhere
	
	grabbed,			// = 101
	
	// these exist appearently, but are used like once
	unused117 = 117,	// = 117
	unused119 = 119,	// = 119
	unused120,			// = 120
}