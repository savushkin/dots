const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#101110", /* black   */
  [1] = "#AB4337", /* red     */
  [2] = "#E8582C", /* green   */
  [3] = "#9C4F54", /* yellow  */
  [4] = "#D64F45", /* blue    */
  [5] = "#C08861", /* magenta */
  [6] = "#3C6A8B", /* cyan    */
  [7] = "#9baebd", /* white   */

  /* 8 bright colors */
  [8]  = "#6c7984",  /* black   */
  [9]  = "#AB4337",  /* red     */
  [10] = "#E8582C", /* green   */
  [11] = "#9C4F54", /* yellow  */
  [12] = "#D64F45", /* blue    */
  [13] = "#C08861", /* magenta */
  [14] = "#3C6A8B", /* cyan    */
  [15] = "#9baebd", /* white   */

  /* special colors */
  [256] = "#101110", /* background */
  [257] = "#9baebd", /* foreground */
  [258] = "#9baebd",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
