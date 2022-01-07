/*
 * cat.c
 *
 * Code generation for function 'cat'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "generateOFDMSignal.h"
#include "cat.h"

/* Function Definitions */
void cat(const creal_T varargin_1[192], const creal_T varargin_2[768], creal_T
         y[960])
{
  int32_T iy;
  int32_T i;
  int32_T ix;
  int32_T l;
  iy = 0;
  for (i = 0; i < 12; i++) {
    ix = i << 4;
    for (l = 0; l < 16; l++) {
      y[iy] = varargin_1[ix];
      ix++;
      iy++;
    }

    ix = i << 6;
    for (l = 0; l < 64; l++) {
      y[iy] = varargin_2[ix];
      ix++;
      iy++;
    }
  }
}

/* End of code generation (cat.c) */
