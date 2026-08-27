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

export interface CatExpandCfg {
  BOUND: number;
  PRE_1023: number;
  LEN_1025: number;
  LEN_1026: number;
  PRE_1020: number;
  PRE_1000: number;
  LONG_LEN: number;
  SAME_VAL: number;
  PUSH_A: number;
  PUSH_B: number;
  PUSH_C: number;
  PUSH_D: number;
  WRITE_END: number;
  EMOJI: string;
}

export const CAT_CFG: CatExpandCfg = {
  BOUND: 1024,
  PRE_1023: 1023,
  LEN_1025: 1025,
  LEN_1026: 1026,
  PRE_1020: 1020,
  PRE_1000: 1000,
  LONG_LEN: 100000,
  SAME_VAL: 42,
  PUSH_A: 1000,
  PUSH_B: 1034,
  PUSH_C: 1067,
  PUSH_D: 1100,
  WRITE_END: 1030,
  EMOJI: '测试😀🎉🔥'
};
