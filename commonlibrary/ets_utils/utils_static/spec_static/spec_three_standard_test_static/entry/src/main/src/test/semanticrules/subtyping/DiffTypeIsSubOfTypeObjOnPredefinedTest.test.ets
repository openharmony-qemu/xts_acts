'use static';
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
  from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

function foo_1(v: Object): void {
  expect(v instanceof number || v instanceof boolean).assertTrue();
}
function f1_1(v: number | boolean): number {
  foo_1(v);
  return f2_1(v);
}
function f2_1(v: number | boolean): number {
  if (v instanceof boolean) {
    expect(v).assertEqual(false);
    return 1;
  } else {
    expect(v instanceof number || v instanceof boolean).assertTrue();
    foo_1(v);
    expect(v).assertEqual(123);
    return 2;
  }
}

export default function DiffTypeIsSubOfTypeObjOnPredefinedTest(): void {
  describe('DiffTypeIsSubOfTypeObjOnPredefinedTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0100
     * @tc.name      testDiffTypeIsSubOfTypeObjOnPredefined0001
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnPredefined0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_1(false);
      expect(res).assertEqual(1);
      res = f1_1(123);
      expect(res).assertEqual(2);
    });
  });
}
