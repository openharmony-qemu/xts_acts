/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* Unified constants for collections.TypedArray 1024-capacity boundary test cases. */

export interface TypedArrayExpandCfg {
  BOUND: number;
  PRE_1023: number;
  PRE_1020: number;
  LEN_1025: number;
  I32_BYTES: number;
  I16_BYTES: number;
  BUF_4096: number;
  SEG_A: number;
  SEG_B: number;
  FILL_42: number;
  INT8_MIN: number;
  INT8_MAX: number;
  INT16_MIN: number;
  INT16_MAX: number;
  UINT16_MAX: number;
  INT32_MIN: number;
  INT32_MAX: number;
  UINT32_MAX: number;
  UINT8_MAX: number;
}

export const TYPEDARRAY_CFG: TypedArrayExpandCfg = {
  BOUND: 1024,
  PRE_1023: 1023,
  PRE_1020: 1020,
  LEN_1025: 1025,
  I32_BYTES: 4100,
  I16_BYTES: 2050,
  BUF_4096: 4096,
  SEG_A: 342,
  SEG_B: 684,
  FILL_42: 42,
  INT8_MIN: -128,
  INT8_MAX: 127,
  INT16_MIN: -32768,
  INT16_MAX: 32767,
  UINT16_MAX: 65535,
  INT32_MIN: -2147483648,
  INT32_MAX: 2147483647,
  UINT32_MAX: 4294967295,
  UINT8_MAX: 255
};
