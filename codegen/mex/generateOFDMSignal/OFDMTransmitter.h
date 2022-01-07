/*
 * OFDMTransmitter.h
 *
 * Code generation for function 'OFDMTransmitter'
 *
 */

#ifndef OFDMTRANSMITTER_H
#define OFDMTRANSMITTER_H

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
extern void OFDMTransmitter_stepImpl(const emlrtStack *sp, OFDMTransmitter *obj,
  creal_T y[128000]);

#endif

/* End of code generation (OFDMTransmitter.h) */
