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

export interface ArrayExpandCfg {
  BOUND: number;
  PRE_1023: number;
  PRE_1020: number;
  PRE_1000: number;
  LEN_1025: number;
  LEN_1026: number;
  LEN_1027: number;
  WRITE_END: number;
  SEG_MID_A: number;
  SEG_MID_B: number;
  SPECIAL_A: number;
  SPECIAL_B: number;
  LONG_LEN: number;
  FILL_42: number;
  AB_BYTES: number;
}

export const ARRAY_CFG: ArrayExpandCfg = {
  BOUND: 1024,
  PRE_1023: 1023,
  PRE_1020: 1020,
  PRE_1000: 1000,
  LEN_1025: 1025,
  LEN_1026: 1026,
  LEN_1027: 1027,
  WRITE_END: 1100,
  SEG_MID_A: 1034,
  SEG_MID_B: 1067,
  SPECIAL_A: 9999,
  SPECIAL_B: 8888,
  LONG_LEN: 100000,
  FILL_42: 42,
  AB_BYTES: 8
};
