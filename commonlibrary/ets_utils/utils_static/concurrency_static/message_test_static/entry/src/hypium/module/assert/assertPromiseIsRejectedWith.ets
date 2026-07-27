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
import { HypiumValue } from '../types/common';

function formatAssertValue(value: HypiumValue): string {
  if (value instanceof Error) {
    return value.message;
  }
  try {
    return JSON.stringify(value);
  } catch (_e) {
    return String(value);
  }
}

function assertPromiseIsRejectedWith(
  actualPromise: Promise<HypiumValue>,
  expectedValue: HypiumValue[]
): Promise<AssertResult> {
  const tips = (passed: boolean) => {
    return (
      'Expected a promise ' +
      (passed ? 'not ' : '') +
      'to be rejected with ' +
      formatAssertValue(expectedValue[0])
    );
  };
  return actualPromise.then<AssertResult, AssertResult>(
    (): AssertResult => {
      return {
        pass: false,
        message: tips(false) + ' but actualValue is resolve',
      };
    },
    (actualValue: HypiumValue): AssertResult => {
      if (formatAssertValue(actualValue) == formatAssertValue(expectedValue[0])) {
        return {
          pass: true,
          message:
            'actualValue was rejected with ' +
            formatAssertValue(actualValue) +
            '.',
        };
      } else if (
        actualValue instanceof Error &&
        typeof expectedValue[0] === 'string' &&
        (actualValue as Error).message === expectedValue[0]
      ) {
        return {
          pass: true,
          message:
            'actualValue was rejected with ' +
            (actualValue as Error).message +
            '.',
        };
      } else {
        return {
          pass: false,
          message:
            tips(false) +
            ' but it was rejected with ' +
            formatAssertValue(actualValue) +
            '.',
        };
      }
    }
  );
}
export { assertPromiseIsRejectedWith };
