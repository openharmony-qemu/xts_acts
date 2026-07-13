'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '@ohos/hypium-binary/src/main/indexStatic';
import { Neg, Pos } from '../types.test';
import Utils from '../../Util.test'

namespace testNS2_15 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === undefined || v === null) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined || v === null) {
      expect(v).assertEqual(undefined);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      expect(v instanceof Object || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual("abc");
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined);
    expect(res).assertEqual(1);
    res = f1("abc");
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_15(v: Any): void {
  expect(v instanceof Object || v === undefined || v === null).assertTrue();
}
function f1_15(v: Object | undefined | null): number {
  if (v instanceof Object || v === undefined || v === null) {
    foo_15(v);
    return f2_15(v);
  }
  else {
    return 0;
  }
}
function f2_15(v: Object | undefined | null): number {
  if (v === undefined || v === null) {
    expect(v).assertEqual(null);
    return 1;
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
    foo_15(v);
    expect(v).assertEqual(5n);
    return 2;
  }
}

export default function DiffTypeIsSubOfTypeTOnPredefinedTest01(): void {
  describe('DiffTypeIsSubOfTypeTOnPredefinedTest01', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

/**
 * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1500
 * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0015
 * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
 *               in case of usage instanceof on predefined types
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it("testDiffTypeIsSubOfTypeTOnPredefined0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  let res: number = f1_15(null);
  expect(res).assertEqual(1);
  res = f1_15(5n);
  expect(res).assertEqual(2);

});
  })
}
