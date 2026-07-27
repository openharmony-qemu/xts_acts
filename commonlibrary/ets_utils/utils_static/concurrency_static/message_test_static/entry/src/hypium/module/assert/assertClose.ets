'use static';
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

export function assertClose(actualValue: number | null, expected: number[]): AssertResult {
  if (expected.length < 2) {
    return {
      pass: false,
      message: 'expected array must contain [value, precision]',
    };
  }
  if (actualValue === null) {
    return {
      pass: false,
      message: 'actualValue can not be null!!!',
    };
  }
  let result = false;
  let diff = Math.abs(expected[0] - actualValue);
  let actualAbs = Math.abs(actualValue);
  const eps = 1.0e-12;
  // actualAbs / diff are already non-negative from Math.abs.
  if (actualAbs < eps) {
    if (diff < eps) {
      result = true;
    } else {
      result = false;
    }
  } else if (diff / actualAbs < expected[1]) {
    result = true;
  } else {
    result = false;
  }
  const failMsg =
    '|' + actualValue + ' - ' + expected[0] + '|/' + actualValue + ' is not less than ' + expected[1];
  return {
    pass: result,
    message: result ? '' : failMsg,
  };
}
