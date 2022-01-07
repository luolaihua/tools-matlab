/*
 * _coder_generateOFDMSignal_api.c
 *
 * Code generation for function '_coder_generateOFDMSignal_api'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "generateOFDMSignal.h"
#include "_coder_generateOFDMSignal_api.h"
#include "SystemCore.h"
#include "generateOFDMSignal_mexutil.h"
#include "generateOFDMSignal_data.h"

/* Function Declarations */
static const mxArray *b_emlrt_marshallOut(const emlrtStack *sp, const creal_T u
  [128000]);

/* Function Definitions */
static const mxArray *b_emlrt_marshallOut(const emlrtStack *sp, const creal_T u
  [128000])
{
  const mxArray *y;
  const mxArray *m3;
  static const int32_T iv6[1] = { 128000 };

  y = NULL;
  m3 = emlrtCreateNumericArray(1, iv6, mxDOUBLE_CLASS, mxCOMPLEX);
  emlrtExportNumericArrayR2013b(sp, m3, (void *)&u[0], 8);
  emlrtAssign(&y, m3);
  return y;
}

void generateOFDMSignal_api(generateOFDMSignalStackData *SD, const mxArray *
  const prhs[2], const mxArray *plhs[2])
{
  static const uint32_T msg[4] = { 2502136338U, 2271756421U, 3488508607U,
    1879052736U };

  static const uint32_T numFrames[4] = { 2292092518U, 594673700U, 3576016107U,
    1886006928U };

  real_T frameLen;
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;

  /* Check constant function inputs */
  emlrtCheckArrayChecksumR2014a(&st, "msg", msg, prhs[0], false);
  emlrtCheckArrayChecksumR2014a(&st, "numFrames", numFrames, prhs[1], false);

  /* Invoke the target function */
  generateOFDMSignal(&st, SD->f0.txSig, &frameLen);

  /* Marshall function outputs */
  plhs[0] = b_emlrt_marshallOut(&st, SD->f0.txSig);
  plhs[1] = emlrt_marshallOut(frameLen);
}

/* End of code generation (_coder_generateOFDMSignal_api.c) */
