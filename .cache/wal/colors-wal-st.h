const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0A1117", /* black   */
  [1] = "#36484F", /* red     */
  [2] = "#395664", /* green   */
  [3] = "#47595C", /* yellow  */
  [4] = "#51686B", /* blue    */
  [5] = "#5E7B83", /* magenta */
  [6] = "#75999F", /* cyan    */
  [7] = "#b9cdd0", /* white   */

  /* 8 bright colors */
  [8]  = "#818f91",  /* black   */
  [9]  = "#36484F",  /* red     */
  [10] = "#395664", /* green   */
  [11] = "#47595C", /* yellow  */
  [12] = "#51686B", /* blue    */
  [13] = "#5E7B83", /* magenta */
  [14] = "#75999F", /* cyan    */
  [15] = "#b9cdd0", /* white   */

  /* special colors */
  [256] = "#0A1117", /* background */
  [257] = "#b9cdd0", /* foreground */
  [258] = "#b9cdd0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
