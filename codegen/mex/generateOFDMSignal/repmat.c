/*
 * repmat.c
 *
 * Code generation for function 'repmat'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "generateOFDMSignal.h"
#include "repmat.h"

/* Function Definitions */
void repmat(const creal_T a[1280], creal_T b[128000])
{
  int32_T itilerow;
  int32_T ibcol;
  for (itilerow = 0; itilerow < 100; itilerow++) {
    ibcol = itilerow * 1280;
    memcpy(&b[ibcol], &a[0], 1280U * sizeof(creal_T));
  }
}

/* End of code generation (repmat.c) */
