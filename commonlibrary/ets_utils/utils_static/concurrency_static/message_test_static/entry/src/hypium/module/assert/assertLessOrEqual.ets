'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { AssertResult } from '../modal/assertModel';

export function assertLessOrEqual(actualValue: number, expected: number[]): AssertResult {
  if (expected.length < 1) {
    return {
      pass: false,
      message: 'expected array must contain a comparison value',
    };
  }
  const expectedValue = expected[0];
  const pass = actualValue <= expectedValue;
  return {
    pass: pass,
    message: pass ? '' : actualValue + ' is not less than or equal to ' + String(expectedValue),
  };
}
