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

function foo_1(v: Object | undefined | null): void {
  expect(v === undefined || v === null || v instanceof Object).assertTrue()
}
function f1_1(v: Object | undefined): number {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
  foo_1(v)
  return f2_1(v)
}
function f2_1(v: Object | undefined): number {
  if (v === undefined) {
    expect(v).assertEqual(undefined)
    return 1
  }
  else {
    expect(v instanceof Object || v === undefined).assertTrue()
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo_1(v)
    expect(v).assertEqual(5n)
    return 2
  }
}

function f1_2(v: Object | undefined): number {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
  foo_1(v)
  return f2_2(v)
}
function f2_2(v: Object | undefined): number {
  if (typeof v === 'bigint' || v === undefined) {
    expect(v).assertEqual(undefined)
    return 1
  }
  else {
    expect(v instanceof Object || v === undefined).assertTrue()
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo_1(v)
    expect(v).assertEqual(7)
    return 2
  }
}

function foo_3(v: Any): void {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
}
function f1_3(v: Object | undefined | null): number {
  expect(v instanceof Object || v === undefined).assertTrue()
  foo_3(v)
  return f2_3(v)
}
function f2_3(v: Object | undefined | null): number {
  if (v === undefined) {
    expect(v).assertEqual(undefined)
    return 1
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    expect(v instanceof Object).assertTrue()
    foo_3(v)
    expect(v).assertEqual(5n)
    return 2
  }
}

function f1_4(v: Object | undefined | null): number {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
  foo_3(v)
  return f2_4(v)
}
function f2_4(v: Object | undefined | null): number {
  if (v === null) {
    expect(v).assertEqual(null)
    return 1
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    expect(v instanceof Object).assertTrue()
    foo_3(v)
    expect(v).assertEqual(5n)
    return 2
  }
}

function f1_5(v: Object | undefined | null): number {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
  foo_3(v)
  return f2_5(v)
}
function f2_5(v: Object | undefined | null): number {
  if (v === undefined || v === null) {
    expect(v).assertEqual(null)
    return 1
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    expect(v instanceof Object).assertTrue()
    foo_3(v)
    expect(v).assertEqual(5n)
    return 2
  }
}

function f1_6(v: Object | undefined | null): number {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
  foo_3(v)
  return f2_6(v)
}
function f2_6(v: Object | undefined | null): number {
  if (typeof v === 'bigint' || v === undefined || v === null) {
    expect(v).assertEqual(null)
    return 1
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    expect(v instanceof Object).assertTrue()
    foo_3(v)
    expect(v).assertEqual(5)
    return 2
  }
}

function foo_7(v: number | boolean): void {
  expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
}
function f1_7(v: number | boolean): number {
  expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
  foo_7(v)
  return f2_7(v)
}
function f2_7(v: number | boolean): number {
  if (typeof v === 'boolean') {
    expect(v).assertEqual(true)
    return 1
  }
  else {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
    foo_7(v)
    expect(v).assertEqual(5)
    return 2
  }
}

function f1_8(v: number | boolean): number {
  expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
  foo_7(v)
  return f2_8(v)
}
function f2_8(v: number | boolean): number {
  if (typeof v === 'number') {
    expect(v).assertEqual(5)
    return 1
  }
  else {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
    foo_7(v)
    expect(v).assertEqual(true)
    return 2
  }
}

function foo_9(v: number | boolean | string | number): void {
  expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
}
function f1_9(v: number | string | boolean): number {
  expect(typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string').assertTrue()
  foo_9(v)
  return f2_9(v)
}
function f2_9(v: number | string | boolean): number {
  if (typeof v === 'string') {
    expect(v).assertEqual("abc")
    return 1
  }
  else {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
    foo_9(v)
    expect(v).assertEqual(5)
    return 2
  }
}

function f1_10(v: number | string | boolean): number {
  expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
  foo_9(v)
  return f2_10(v)
}
function f2_10(v: number | string | boolean): number {
  if (typeof v === 'string' || typeof v === 'boolean') {
    expect(v).assertEqual("abc")
    return 1
  }
  else {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
    foo_9(v)
    expect(v).assertEqual(5)
    return 2
  }
}

function foo_11(v: Object | undefined | null): void {
  expect(v === undefined || v === null || v instanceof Object).assertTrue();
}
function f1_11(v: null | Object | undefined): number {
  if (v instanceof Object || v === undefined || v === null) {
    foo_11(v);
    return f2_11(v);
  }
  else {
    return 0;
  }
}
function f2_11(v: null | Object | undefined): number {
  if (v === undefined) {
    expect(v).assertEqual(undefined);
    return 1;
  }
  else {
    expect(v instanceof Object || v === undefined).assertTrue();
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
    foo_11(v);
    expect(v).assertEqual(5n);
    return 2;
  }
}

function f1_12(v: null | Object | undefined): number {
  if (v instanceof Object || v === undefined || v === null) {
    foo_11(v);
    return f2_12(v);
  }
  else {
    return 0;
  }
}
function f2_12(v: null | Object | undefined): number {
  if (typeof v === 'bigint' || v === undefined) {
    expect(v).assertEqual(undefined);
    return 1;
  }
  else {
    expect(v instanceof Object || v === undefined).assertTrue();
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
    foo_11(v);
    expect(v).assertEqual(7);
    return 2;
  }
}

export default function DiffTypeIsSubOfTypeTOnPredefinedTest(): void {
  describe('DiffTypeIsSubOfTypeTOnPredefinedTest', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0100
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0001
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_1(undefined);
      expect(res).assertEqual(1);
      res = f1_1(5n);
      expect(res).assertEqual(2);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0200
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0002
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_2(undefined);
      expect(res).assertEqual(1);
      res = f1_2(7);
      expect(res).assertEqual(2);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0300
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0003
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_3(undefined);
      expect(res).assertEqual(1);
      res = f1_3(5n);
      expect(res).assertEqual(2);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0400
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0004
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_4(null);
      expect(res).assertEqual(1);
      res = f1_4(5n);
      expect(res).assertEqual(2);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0500
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0005
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_5(null);
      expect(res).assertEqual(1);
      res = f1_5(5n);
      expect(res).assertEqual(2);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0600
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0006
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_6(null);
      expect(res).assertEqual(1);
      res = f1_6(5);
      expect(res).assertEqual(2);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0700
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0007
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_7(true);
      expect(res).assertEqual(1);
      res = f1_7(5);
      expect(res).assertEqual(2);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0800
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0008
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_8(5);
      expect(res).assertEqual(1);
      res = f1_8(true);
      expect(res).assertEqual(2);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0900
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0009
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let res: number = f1_9("abc");
      expect(res).assertEqual(1);
      res = f1_9(5);
      expect(res).assertEqual(2);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1000
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0010
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let res: number = f1_10("abc");
      expect(res).assertEqual(1);
      res = f1_10(5);
      expect(res).assertEqual(2);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1100
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0011
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_11(undefined);
      expect(res).assertEqual(1);
      res = f1_11(5n);
      expect(res).assertEqual(2);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1200
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0012
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_12(undefined);
      expect(res).assertEqual(1);
      res = f1_12(7);
      expect(res).assertEqual(2);
    });
  })
}
