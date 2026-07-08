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
  from '@ohos/hypium-binary/src/main/indexStatic';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

interface I_8 {}
interface II1_8 extends I_8 {}
interface II2_8 extends I_8 {}
interface III1_8 extends II1_8 {}
interface III2_8 extends II1_8 {}
class C1_8 implements III1_8, III2_8 { v: bigint = 123n }
class C2_8 implements II2_8, III2_8 { v: number = 321 }
class C3_8 implements III1_8 { v: number = 7.8 }

function check_C1_8(a: Object) {
  expect(a instanceof C1_8).assertTrue();
  expect(a instanceof III1_8).assertTrue();
  expect(a instanceof III2_8).assertTrue();
  expect(a instanceof II1_8).assertTrue();
  expect(a instanceof I_8).assertTrue();
  expect((a as C1_8).v).assertEqual(123n);
}

function check_C3_8(a: Object) {
  expect(a instanceof C3_8).assertTrue();
  expect(a instanceof III1_8).assertTrue();
  expect(a instanceof II1_8).assertTrue();
  expect(a instanceof I_8).assertTrue();
  expect((a as C3_8).v).assertEqual(7.8);
}

function foo_8(v: Object): void {
  expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue();
}

function f1_8(v: III1_8 | III2_8 | II2_8): number {
  foo_8(v);
  return f2_8(v);
}

function f2_8(v: III1_8 | III2_8 | II2_8): number {
  if (v instanceof III2_8) {
    check_C1_8(v);
    return 1;
  } else {
    expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue();
    expect(v instanceof Object).assertTrue();
    foo_8(v);
    check_C3_8(v);
    return 2;
  }
}

export default function DiffTypeIsSubOfTypeObjOnNonGenTest(): void{
  describe('DiffTypeIsSubOfTypeObjOnNonGenTest', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_NON_GEN_0800
     * @tc.name      testDiffTypeIsSubOfTypeObjOnNonGen0008
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnNonGen0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_8(new C1_8());
      expect(res).assertEqual(1);
      res = f1_8(new C3_8());
      expect(res).assertEqual(2);
    });
  });
}
