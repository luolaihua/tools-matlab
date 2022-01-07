/*
 * randi.c
 *
 * Code generation for function 'randi'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "generateOFDMSignal.h"
#include "randi.h"

/* Function Definitions */
void randi(real_T r[16])
{
  int32_T k;
  emlrtRandu(&r[0], 16);
  for (k = 0; k < 16; k++) {
    r[k] = muDoubleScalarFloor(r[k] * 2.0);
  }
}

/* End of code generation (randi.c) */
