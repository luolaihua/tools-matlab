/*
 * generateOFDMSignal_initialize.c
 *
 * Code generation for function 'generateOFDMSignal_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "generateOFDMSignal.h"
#include "generateOFDMSignal_initialize.h"
#include "_coder_generateOFDMSignal_mex.h"
#include "generateOFDMSignal_data.h"

/* Function Declarations */
static void generateOFDMSignal_once(void);

/* Function Definitions */
static void generateOFDMSignal_once(void)
{
  const mxArray *m0;
  static const int32_T iv0[2] = { 0, 0 };

  static const int32_T iv1[2] = { 0, 0 };

  emlrtAssignP(&b_eml_mx, NULL);
  emlrtAssignP(&eml_mx, NULL);
  m0 = emlrtCreateNumericArray(2, iv0, mxDOUBLE_CLASS, mxREAL);
  emlrtAssignP(&b_eml_mx, m0);
  m0 = emlrtCreateCharArray(2, iv1);
  emlrtAssignP(&eml_mx, m0);
  generateOFDMSignal_init();
}

void generateOFDMSignal_initialize(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mexFunctionCreateRootTLS();
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, 0);
  emlrtEnterRtStackR2012b(&st);
  emlrtLicenseCheckR2012b(&st, "Communication_Toolbox", 2);
  if (emlrtFirstTimeR2012b(emlrtRootTLSGlobal)) {
    generateOFDMSignal_once();
  }
}

/* End of code generation (generateOFDMSignal_initialize.c) */
