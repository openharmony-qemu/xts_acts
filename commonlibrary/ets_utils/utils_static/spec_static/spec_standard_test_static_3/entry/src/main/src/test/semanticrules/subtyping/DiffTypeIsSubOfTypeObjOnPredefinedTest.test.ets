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

class Neg<T extends number> {
  constructor(x: T) {}
}

class Pos<T extends number> {
  constructor(x: T) {}
}

namespace testNS1_1 {
  function foo(v: Object): void {
    expect(v instanceof number || v instanceof boolean).assertTrue();
  }
  function f1(v: number | boolean): number {
    foo(v);
    return f2(v);
  }
  function f2(v: number | boolean): number {
    if (v instanceof boolean) {
      expect(v).assertEqual(false);
      return 1;
    } else {
      expect(v instanceof number || v instanceof boolean).assertTrue();
      foo(v);
      expect(v).assertEqual(123);
      return 2;
    }
  }

  export function runTest_1(): boolean {
    let res: number = f1(false);
    expect(res).assertEqual(1);
    res = f1(123);
    expect(res).assertEqual(2);
    return true;
  }
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

namespace testNS1_2 {
  function foo(v: Object): void {
    expect(v instanceof number || v instanceof boolean).assertTrue();
  }
  function f1(v: number | boolean): number {
    foo(v);
    return f2(v);
  }
  function f2(v: number | boolean): number {
    if (v instanceof number) {
      expect(v).assertEqual(123);
      return 1;
    } else {
      expect(v instanceof number || v instanceof boolean).assertTrue();
      foo(v);
      expect(v).assertEqual(false);
      return 2;
    }
  }

  export function runTest_2(): boolean {
    let res: number = f1(123);
    expect(res).assertEqual(1);
    res = f1(false);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_2(v: Object): void {
  expect(v instanceof number || v instanceof boolean).assertTrue();
}
function f1_2(v: number | boolean): number {
  foo_2(v);
  return f2_2(v);
}
function f2_2(v: number | boolean): number {
  if (v instanceof number) {
    expect(v).assertEqual(123);
    return 1;
  } else {
    expect(v instanceof number || v instanceof boolean).assertTrue();
    foo_2(v);
    expect(v).assertEqual(false);
    return 2;
  }
}

namespace testNS1_3 {
  function foo(v: Object): void {
    expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
  }
  function f1(v: number | string | boolean): number {
    foo(v);
    return f2(v);
  }
  function f2(v: number | string | boolean): number {
    if (v instanceof string) {
      expect(v).assertEqual("bca");
      return 1;
    } else {
      expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
      foo(v);
      expect(v).assertEqual(true);
      return 2;
    }
  }

  export function runTest_3(): boolean {
    let res: number = f1("bca");
    expect(res).assertEqual(1);
    res = f1(true);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_3(v: Object): void {
  expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
}
function f1_3(v: number | string | boolean): number {
  foo_3(v);
  return f2_3(v);
}
function f2_3(v: number | string | boolean): number {
  if (v instanceof string) {
    expect(v).assertEqual("bca");
    return 1;
  } else {
    expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
    foo_3(v);
    expect(v).assertEqual(true);
    return 2;
  }
}

namespace testNS1_4 {
  function foo(v: Object): void {
    expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
  }
  function f1(v: number | string | boolean): number {
    foo(v);
    return f2(v);
  }
  function f2(v: number | string | boolean): number {
    if (v instanceof string || v instanceof boolean) {
      expect(v).assertEqual(true);
      return 1;
    } else {
      expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
      foo(v);
      expect(v).assertEqual(6);
      return 2;
    }
  }

  export function runTest_4(): boolean {
    let res: number = f1(true);
    expect(res).assertEqual(1);
    res = f1(6);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_4(v: Object): void {
  expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
}
function f1_4(v: number | string | boolean): number {
  foo_4(v);
  return f2_4(v);
}
function f2_4(v: number | string | boolean): number {
  if (v instanceof string || v instanceof boolean) {
    expect(v).assertEqual(true);
    return 1;
  } else {
    expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
    foo_4(v);
    expect(v).assertEqual(6);
    return 2;
  }
}

namespace testNS1_5 {
  function foo(v: Object): void {
    expect(v instanceof number || v instanceof boolean).assertTrue();
  }
  function f1(v: number | boolean): number {
    foo(v);
    return f2(v);
  }
  function f2(v: number | boolean): number {
    if (v instanceof boolean) {
      expect(v).assertEqual(false);
      return 1;
    } else {
      expect(v instanceof number || v instanceof boolean).assertTrue();
      foo(v);
      expect(v).assertEqual(123);
      return 2;
    }
  }

  export function runTest_5(): boolean {
    let res: number = f1(false);
    expect(res).assertEqual(1);
    res = f1(123);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_5(v: Object): void {
  expect(v instanceof number || v instanceof boolean).assertTrue();
}
function f1_5(v: number | boolean): number {
  foo_5(v);
  return f2_5(v);
}
function f2_5(v: number | boolean): number {
  if (v instanceof boolean) {
    expect(v).assertEqual(false);
    return 1;
  } else {
    expect(v instanceof number || v instanceof boolean).assertTrue();
    foo_5(v);
    expect(v).assertEqual(123);
    return 2;
  }
}

namespace testNS1_6 {
  function foo(v: Object): void {
    expect(v instanceof number || v instanceof boolean).assertTrue();
  }
  function f1(v: number | boolean): number {
    foo(v);
    return f2(v);
  }
  function f2(v: number | boolean): number {
    if (v instanceof number) {
      expect(v).assertEqual(123);
      return 1;
    } else {
      expect(v instanceof number || v instanceof boolean).assertTrue();
      foo(v);
      expect(v).assertEqual(false);
      return 2;
    }
  }

  export function runTest_6(): boolean {
    let res: number = f1(123);
    expect(res).assertEqual(1);
    res = f1(false);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_6(v: Object): void {
  expect(v instanceof number || v instanceof boolean).assertTrue();
}
function f1_6(v: number | boolean): number {
  foo_6(v);
  return f2_6(v);
}
function f2_6(v: number | boolean): number {
  if (v instanceof number) {
    expect(v).assertEqual(123);
    return 1;
  } else {
    expect(v instanceof number || v instanceof boolean).assertTrue();
    foo_6(v);
    expect(v).assertEqual(false);
    return 2;
  }
}

namespace testNS1_7 {
  function foo(v: Object): void {
    expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
  }
  function f1(v: number | string | boolean): number {
    foo(v);
    return f2(v);
  }
  function f2(v: number | string | boolean): number {
    if (v instanceof string) {
      expect(v).assertEqual("bca");
      return 1;
    } else {
      expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
      foo(v);
      expect(v).assertEqual(true);
      return 2;
    }
  }

  export function runTest_7(): boolean {
    let res: number = f1("bca");
    expect(res).assertEqual(1);
    res = f1(true);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_7(v: Object): void {
  expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
}
function f1_7(v: number | string | boolean): number {
  foo_7(v);
  return f2_7(v);
}
function f2_7(v: number | string | boolean): number {
  if (v instanceof string) {
    expect(v).assertEqual("bca");
    return 1;
  } else {
    expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
    foo_7(v);
    expect(v).assertEqual(true);
    return 2;
  }
}

namespace testNS1_8 {
  function foo(v: Object): void {
    expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
  }
  function f1(v: number | string | boolean): number {
    foo(v);
    return f2(v);
  }
  function f2(v: number | string | boolean): number {
    if (v instanceof string || v instanceof boolean) {
      expect(v).assertEqual(true);
      return 1;
    } else {
      expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
      foo(v);
      expect(v).assertEqual(6);
      return 2;
    }
  }

  export function runTest_8(): boolean {
    let res: number = f1(true);
    expect(res).assertEqual(1);
    res = f1(6);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_8(v: Object): void {
  expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
}
function f1_8(v: number | string | boolean): number {
  foo_8(v);
  return f2_8(v);
}
function f2_8(v: number | string | boolean): number {
  if (v instanceof string || v instanceof boolean) {
    expect(v).assertEqual(true);
    return 1;
  } else {
    expect(v instanceof number || v instanceof string || v instanceof boolean).assertTrue();
    foo_8(v);
    expect(v).assertEqual(6);
    return 2;
  }
}

export default function DiffTypeIsSubOfTypeObjOnPredefinedTest(): void {
  describe('DiffTypeIsSubOfTypeObjOnPredefinedTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
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
      const TAG = 'testDiffTypeIsSubOfTypeObjOnPredefined0001';
      let res: number = f1_1(false);
      expect(res).assertEqual(1);
      res = f1_1(123);
      expect(res).assertEqual(2);
      expect(testNS1_1.runTest_1()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0200
     * @tc.name      testDiffTypeIsSubOfTypeObjOnPredefined0002
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnPredefined0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnPredefined0002';
      let res: number = f1_2(123);
      expect(res).assertEqual(1);
      res = f1_2(false);
      expect(res).assertEqual(2);
      expect(testNS1_2.runTest_2()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0300
     * @tc.name      testDiffTypeIsSubOfTypeObjOnPredefined0003
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnPredefined0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnPredefined0003';
      let res: number = f1_3("bca");
      expect(res).assertEqual(1);
      res = f1_3(true);
      expect(res).assertEqual(2);
      expect(testNS1_3.runTest_3()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0400
     * @tc.name      testDiffTypeIsSubOfTypeObjOnPredefined0004
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnPredefined0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnPredefined0004';
      let res: number = f1_4(true);
      expect(res).assertEqual(1);
      res = f1_4(6);
      expect(res).assertEqual(2);
      expect(testNS1_4.runTest_4()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0500
     * @tc.name      testDiffTypeIsSubOfTypeObjOnPredefined0005
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnPredefined0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnPredefined0005';
      let res: number = f1_5(false);
      expect(res).assertEqual(1);
      res = f1_5(123);
      expect(res).assertEqual(2);
      expect(testNS1_5.runTest_5()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0600
     * @tc.name      testDiffTypeIsSubOfTypeObjOnPredefined0006
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnPredefined0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnPredefined0006';
      let res: number = f1_6(123);
      expect(res).assertEqual(1);
      res = f1_6(false);
      expect(res).assertEqual(2);
      expect(testNS1_6.runTest_6()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0700
     * @tc.name      testDiffTypeIsSubOfTypeObjOnPredefined0007
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnPredefined0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnPredefined0007';
      let res: number = f1_7("bca");
      expect(res).assertEqual(1);
      res = f1_7(true);
      expect(res).assertEqual(2);
      expect(testNS1_7.runTest_7()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0800
     * @tc.name      testDiffTypeIsSubOfTypeObjOnPredefined0008
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnPredefined0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnPredefined0008';
      let res: number = f1_8(true);
      expect(res).assertEqual(1);
      res = f1_8(6);
      expect(res).assertEqual(2);
      expect(testNS1_8.runTest_8()).assertTrue();
    });
  });
}