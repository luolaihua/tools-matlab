/*
 * SystemCore.h
 *
 * Code generation for function 'SystemCore'
 *
 */

#ifndef SYSTEMCORE_H
#define SYSTEMCORE_H

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mwmathutil.h"
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "rtwtypes.h"
#include "generateOFDMSignal_types.h"

/* Function Declarations */
extern void SystemCore_parenReference(const emlrtStack *sp,
  commcodegen_BPSKModulator *obj, const real_T varargin_1[576], creal_T
  varargout_1[576]);
extern void b_SystemCore_parenReference(const emlrtStack *sp, comm_OFDMModulator
  *obj, const creal_T varargin_1[576], creal_T varargout_1[960]);

#endif

/* End of code generation (SystemCore.h) */
