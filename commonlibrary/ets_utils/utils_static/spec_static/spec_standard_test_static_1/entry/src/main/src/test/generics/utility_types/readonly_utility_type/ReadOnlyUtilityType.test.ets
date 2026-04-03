/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../../hypium"

//  (14)
// 来自 method_excluded_from_readonly.js
class C_0 {
  _i: number|undefined
  set i(i: number|undefined) { this._i = i; }
  get i(): number|undefined { return this._i; }
}

// 来自 readonly_type_0.js 到 readonly_type_7.js
interface I_0 {
  i: number;
  j: string;
}
class A_0 implements I_0 {
  i = 1.7;
  j = "A";
}
class C_1 {
  i: number = 2.6;
  j: string = "C";
}
function foo_0(i: Readonly<A_0>|Readonly<C_1>, a: number, b: string) {
  expect(i.i).assertEqual(a)
  expect(i.j).assertEqual(b)
}
function foo_1(i: Readonly<A_0>|Readonly<C_1>, a: number, b: string) {
  expect(i.i).assertEqual(a)
  expect(i.j).assertEqual(b)
}
function foo_2(i: Readonly<A_0>|Readonly<C_1>, a: number, b: string) {
  expect(i.i).assertEqual(a)
  expect(i.j).assertEqual(b)
}
function foo_3(i: Readonly<A_0>|Readonly<C_1>, a: number, b: string) {
  expect(i.i).assertEqual(a)
  expect(i.j).assertEqual(b)
}
function foo_4(i: Readonly<A_0>|Readonly<C_1>, a: number, b: string) {
  expect(i.i).assertEqual(a)
  expect(i.j).assertEqual(b)
}
function foo_5(i: Readonly<A_0>|Readonly<C_1>, a: number, b: string) {
  expect(i.i).assertEqual(a)
  expect(i.j).assertEqual(b)
}
function foo_6(i: Readonly<A_0>|Readonly<C_1>, a: number, b: string) {
  expect(i.i).assertEqual(a)
  expect(i.j).assertEqual(b)
}
function foo_7(i: Readonly<A_0>|Readonly<C_1>, a: number, b: string) {
  expect(i.i).assertEqual(a)
  expect(i.j).assertEqual(b)
}

// 来自 readonly_type_compatibility.js
interface I_1 {
  i: number;
  j: string;
}
class A_1 implements I_1 {
  i = 0.1;
  j = "";
  constructor(i?: number, j?: string) {
    if (i !== undefined) this.i = i;
    if (j !== undefined) this.j = j;
  }
}
class C_2 {
  i: number = 0.2;
  j: string = "";
  constructor(i?: number, j?: string) {
    if (i !== undefined) this.i = i;
    if (j !== undefined) this.j = j;
  }
}

// 来自 type_alias_with_readonly_0.js
class A_2 {
  s: string = ""
  s2?: string
}
type RA_0 = Readonly<A_2>
function foo_8(ra: RA_0): boolean {
  return ra.s === undefined
}
function bar_0(ra: RA_0): boolean {
  return ra.s2 === undefined
}

// 来自 type_alias_with_readonly_1.js
class A_3 {
  s: string = "s"
}
type RA_1 = Readonly<A_3>
function foo_9(ra: RA_1): boolean {
  return ra.s == "s"
}

// 来自 type_alias_with_readonly_2.js
abstract class A_4 {
  s: string = ""
  s2?: string
}
class AC_0 extends A_4 {}
type RAC_0 = Readonly<AC_0>
function foo_10(rac: RAC_0): boolean {
  return rac.s === undefined
}
function bar_1(rac: RAC_0): boolean {
  return rac.s2 === undefined
}

// 来自 type_alias_with_readonly_3.js
abstract class A_5 {
  s?: string
}
class AC_1 extends A_5 {}
type RAC_1 = Readonly<AC_1>
function foo_11(rac: RAC_1): boolean {
  return rac.s === undefined
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ReadOnlyUtilityTypeTest() {
  describe("ReadOnlyUtilityTypeTest", () => {
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
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_0100
     * @tc.name      testReadOnlyUtilityType0001
     * @tc.desc      No method (not even any getter or setter) of T is part of the Readonly<T> type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Readonly<C_0> = {i: 1.9}
      expect(a.i).assertEqual(1.9)
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_0200
     * @tc.name      testReadOnlyUtilityType0002
     * @tc.desc      Type Readonly<T> constructs a type with all properties of T set to readonly.
     *               It means that the properties of the constructed value cannot be reassigned. T must
     *               be a class or an interface type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: Readonly<A_0> = {i: 3.9, j: "some str"}
      foo_0( i, 3.9, "some str" )
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_0300
     * @tc.name      testReadOnlyUtilityType0003
     * @tc.desc      Type Readonly<T> constructs a type with all properties of T set to readonly.
     *               It means that the properties of the constructed value cannot be reassigned. T must
     *               be a class or an interface type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: Readonly<C_1> = {i: 3.9, j: "some str"}
      foo_1( i, 3.9, "some str" )
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_0400
     * @tc.name      testReadOnlyUtilityType0004
     * @tc.desc      Type Readonly<T> constructs a type with all properties of T set to readonly.
     *               It means that the properties of the constructed value cannot be reassigned. T must
     *               be a class or an interface type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: Readonly<A_0> = {i: 3.9}
      foo_2( i, 3.9, "A" )
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_0500
     * @tc.name      testReadOnlyUtilityType0005
     * @tc.desc      Type Readonly<T> constructs a type with all properties of T set to readonly.
     *               It means that the properties of the constructed value cannot be reassigned. T must
     *               be a class or an interface type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: Readonly<C_1> = {i: 3.9}
      foo_3( i, 3.9, "C" )
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_0600
     * @tc.name      testReadOnlyUtilityType0006
     * @tc.desc      Type Readonly<T> constructs a type with all properties of T set to readonly.
     *               It means that the properties of the constructed value cannot be reassigned. T must
     *               be a class or an interface type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: Readonly<A_0> = {j: "some str"}
      foo_4( i, 1.7, "some str" )
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_0700
     * @tc.name      testReadOnlyUtilityType0007
     * @tc.desc      Type Readonly<T> constructs a type with all properties of T set to readonly.
     *               It means that the properties of the constructed value cannot be reassigned. T must
     *               be a class or an interface type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: Readonly<C_1> = {j: "some str"}
      foo_5( i, 2.6, "some str" )
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_0800
     * @tc.name      testReadOnlyUtilityType0008
     * @tc.desc      Type Readonly<T> constructs a type with all properties of T set to readonly.
     *               It means that the properties of the constructed value cannot be reassigned. T must
     *               be a class or an interface type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: Readonly<A_0> = {}
      foo_6( i, 1.7, "A" )
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_0900
     * @tc.name      testReadOnlyUtilityType0009
     * @tc.desc      Type Readonly<T> constructs a type with all properties of T set to readonly.
     *               It means that the properties of the constructed value cannot be reassigned. T must
     *               be a class or an interface type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: Readonly<C_1> = {}
      foo_7( i, 2.6, "C" )
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_1000
     * @tc.name      testReadOnlyUtilityType0010
     * @tc.desc      Type T is compatible (see Type Compatibility) with Readonly<T>, and allows assignments
     *               as a consequence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z: Readonly<I_1> = {i: 1.8, j: "some str"}
      expect(z.i == 1.8).assertTrue()
      expect(z.j == "some str").assertTrue()
      z = new A_1(1.9, "new str")
      expect(z.i == 1.9).assertTrue()
      expect(z.j == "new str").assertTrue()

      let x: Readonly<A_1> = new A_1(1.8, "some str")
      expect(x.i == 1.8).assertTrue()
      expect(x.j == "some str").assertTrue()
      x = {i: 1.9, j: "new str"}
      expect(x.i == 1.9).assertTrue()
      expect(x.j == "new str").assertTrue()

      let y: Readonly<C_2> = {i: 1.8, j: "some str"}
      expect(y.i == 1.8).assertTrue()
      expect(y.j == "some str").assertTrue()
      y = new C_2( 1.5, "new str")
      expect(y.i == 1.5).assertTrue()
      expect(y.j == "new str").assertTrue()
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_1100
     * @tc.name      testReadOnlyUtilityType0011
     * @tc.desc      Checks for type alias declaration method access and member change for readonly
     *               utility type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ra: RA_0 = new A_2() as RA_0
      expect(foo_8(ra)).assertFalse()
      expect(bar_0(ra)).assertTrue()
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_1200
     * @tc.name      testReadOnlyUtilityType0012
     * @tc.desc      Checks for type alias declaration method access and member change for readonly
     *               utility type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_9(new A_3() as RA_1)).assertTrue()
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_1300
     * @tc.name      testReadOnlyUtilityType0013
     * @tc.desc      Checks for type alias declaration method access and member change for readonly
     *               utility type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rac: RAC_0 = new AC_0() as RAC_0
      expect(foo_10(rac)).assertFalse()
    })

    /**
     * @tc.number    SUB_READ_ONLY_UTILITY_TYPE_1400
     * @tc.name      testReadOnlyUtilityType0014
     * @tc.desc      Checks for type alias declaration method access and member change for readonly
     *               utility type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testReadOnlyUtilityType0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rac: RAC_1 = new AC_1() as RAC_1
      expect(foo_11(rac)).assertTrue()
    })
  });
}