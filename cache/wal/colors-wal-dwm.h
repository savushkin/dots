static const char norm_fg[] = "#9baebd";
static const char norm_bg[] = "#101110";
static const char norm_border[] = "#6c7984";

static const char sel_fg[] = "#9baebd";
static const char sel_bg[] = "#E8582C";
static const char sel_border[] = "#9baebd";

static const char urg_fg[] = "#9baebd";
static const char urg_bg[] = "#AB4337";
static const char urg_border[] = "#AB4337";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
