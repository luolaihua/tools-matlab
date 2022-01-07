/*
 * OFDMModulator.h
 *
 * Code generation for function 'OFDMModulator'
 *
 */

#ifndef OFDMMODULATOR_H
#define OFDMMODULATOR_H

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
extern void OFDMModulator_stepImpl(const creal_T dataIn[576], const real_T
  varargin_1[48], creal_T yout[960]);

#endif

/* End of code generation (OFDMModulator.h) */
