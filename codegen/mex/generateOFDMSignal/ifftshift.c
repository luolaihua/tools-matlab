/*
 * ifftshift.c
 *
 * Code generation for function 'ifftshift'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "generateOFDMSignal.h"
#include "ifftshift.h"

/* Function Definitions */
void ifftshift(creal_T x[768])
{
  int32_T i2;
  int32_T i;
  int32_T i1;
  int32_T ia;
  int32_T k;
  real_T tmp_re;
  real_T tmp_im;
  i2 = 1;
  for (i = 0; i < 12; i++) {
    i1 = i2;
    i2 += 64;
    ia = i1 - 1;
    i1 += 31;
    for (k = 0; k < 32; k++) {
      tmp_re = x[ia].re;
      tmp_im = x[ia].im;
      x[ia] = x[i1];
      x[i1].re = tmp_re;
      x[i1].im = tmp_im;
      ia++;
      i1++;
    }
  }
}

/* End of code generation (ifftshift.c) */
