'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/** Radix-2 base used in performance pow / batch scenarios. */
export const PERF_BASE_TWO: int = 2;

/** Multiplicative identity for batch multiply-by-2 chains. */
export const PERF_ONE: int = 1;

/** Small factor used in large divide/modulo scenarios. */
export const PERF_FACTOR_FIVE: int = 5;

/** Exponent 64: batch multiply-by-2 and 2^64 width checks. */
export const PERF_POW2_EXP_64: int = 64;

/** Batch subtract-one steps on 2^4096 (decimal width unchanged). */
export const PERF_BATCH_SUBTRACT_ONE_128: int = 128;

/** Exponent 256: batch multiply and pow-vs-batch comparison. */
export const PERF_POW2_EXP_256: int = 256;

/** Exponent 512: half-width multiply and left-shift batch. */
export const PERF_POW2_EXP_512: int = 512;

/** Exponent 1023: adjacent power below 2^1024. */
export const PERF_POW2_EXP_1023: int = 1023;

/** Exponent 1024: pow, multiply, and comparison scenarios. */
export const PERF_POW2_EXP_1024: int = 1024;

/** Exponent 1025: verify double of 2^1024 via multiply. */
export const PERF_POW2_EXP_1025: int = 1025;

/** Exponent 1536: product of 2^1024 and 2^512. */
export const PERF_POW2_EXP_1536: int = 1536;

/** Exponent 2047: adjacent power below 2^2048. */
export const PERF_POW2_EXP_2047: int = 2047;

/** Exponent 2048: pow, multiply-half, and mixed batch base. */
export const PERF_POW2_EXP_2048: int = 2048;

/** Exponent 4095: boundary below 2^4096. */
export const PERF_POW2_EXP_4095: int = 4095;

/** Exponent 4096: ultra-large pow / multiply / toString scenarios. */
export const PERF_POW2_EXP_4096: int = 4096;

/** Batch multiply-by-2 steps yielding 2^64. */
export const PERF_BATCH_MULT_BY_TWO_64: int = 64;

/** Batch add-one steps on 2^1024 (decimal width unchanged). */
export const PERF_BATCH_ADD_ONE_64: int = 64;

/** Batch squaring steps from 2 yielding 2^4096 (2^(2^12)). */
export const PERF_BATCH_SQUARE_12: int = 12;

/** Batch multiply-by-2 steps yielding 2^256. */
export const PERF_BATCH_MULT_BY_TWO_256: int = 256;

/** Batch left-shift-by-1 steps yielding 2^512. */
export const PERF_BATCH_LEFT_SHIFT_512: int = 512;

/** Alternating add-one / multiply-by-2 iterations on 2^2048 base. */
export const PERF_BATCH_MIXED_OPS_32: int = 32;

/** Decimal digit count of 2^64: floor(64 * log10(2)) + 1 === 20. */
export const PERF_DEC_LEN_POW2_64: int = 20;

/** Decimal digit count of 2^256: floor(256 * log10(2)) + 1 === 78. */
export const PERF_DEC_LEN_POW2_256: int = 78;

/** Decimal digit count of 2^1024: floor(1024 * log10(2)) + 1 === 309. */
export const PERF_DEC_LEN_POW2_1024: int = 309;

/** Decimal digit count of 2^1536: floor(1536 * log10(2)) + 1 === 463. */
export const PERF_DEC_LEN_POW2_1536: int = 463;

/** Decimal digit count of 2^2048: floor(2048 * log10(2)) + 1 === 617. */
export const PERF_DEC_LEN_POW2_2048: int = 617;

/** Decimal width after 32 mixed add/multiply steps on 2^2048 base. */
export const PERF_DEC_LEN_MIXED_OPS_2048_BASE: int = 627;

/** Decimal digit count of 2^4095: floor(4095 * log10(2)) + 1 === 1233. */
export const PERF_DEC_LEN_POW2_4095: int = 1233;

/** Decimal digit count of 2^4096: floor(4096 * log10(2)) + 1 === 1234. */
export const PERF_DEC_LEN_POW2_4096: int = 1234;

/** Returns 2^exp as BigInt. */
export function perfPow2(exp: int): BigInt {
  return BigInt(PERF_BASE_TWO).pow(BigInt(exp));
}

/** Repeated multiply-by-2 from 1; returns 2^steps. */
export function perfBatchMultiplyByTwo(steps: int): BigInt {
  let acc = BigInt(PERF_ONE);
  const two = BigInt(PERF_BASE_TWO);
  for (let step = 0; step < steps; step++) {
    acc = acc.operatorMultiply(two);
  }
  return acc;
}

/** Repeated squaring from 2; after n steps returns 2^(2^n). */
export function perfBatchSquareFromTwo(squareSteps: int): BigInt {
  let acc = BigInt(PERF_BASE_TWO);
  for (let step = 0; step < squareSteps; step++) {
    acc = acc.operatorMultiply(acc);
  }
  return acc;
}

/** Repeated left-shift-by-1 from 1; returns 2^steps. */
export function perfBatchLeftShiftByOne(steps: int): BigInt {
  let acc = BigInt(PERF_ONE);
  const one = BigInt(PERF_ONE);
  for (let step = 0; step < steps; step++) {
    acc = acc.operatorLeftShift(one);
  }
  return acc;
}

/** Repeated add-one on base; returns base + steps. */
export function perfBatchAddOne(base: BigInt, steps: int): BigInt {
  const one = BigInt(PERF_ONE);
  let acc = base;
  for (let step = 0; step < steps; step++) {
    acc = acc.operatorAdd(one);
  }
  return acc;
}

/** Repeated subtract-one on base; returns base - steps. */
export function perfBatchSubtractOne(base: BigInt, steps: int): BigInt {
  const one = BigInt(PERF_ONE);
  let acc = base;
  for (let step = 0; step < steps; step++) {
    acc = acc.operatorSubtract(one);
  }
  return acc;
}
