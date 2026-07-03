'use static';
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

import Utils from "../../../Util.test";

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

class A_0 {
  i?: number
  j?: string
}
interface A_1 {
  i?: number
  j?: string
}

let c_0: int = 0
abstract class C_0 {
  _i?: number
  set i(i: number|undefined) { c_0 += 1; this._i = i; }
  get i(): number|undefined { c_0 += 2; return this._i; }
}
function reset_c_0() { c_0 = 0; }

let c_1: int = 0
class C_1 {
  _i?: number
  set i(i: number|undefined) { c_1 += 1; this._i = i; }
  get i(): number|undefined { c_1 += 2; return this._i; }
}
function reset_c_1() { c_1 = 0; }

let c_2: int = 0
abstract class C_2 {
  _i?: number
  set i(i: number|undefined) { c_2 += 1; this._i = i; }
  get i(): number|undefined { c_2 += 2; return this._i; }
}
function reset_c_2() { c_2 = 0; }

let c_3: int = 0
class C_3 {
  _i?: number
  set i(i: number|undefined) { c_3 += 1; this._i = i; }
  get i(): number|undefined { c_3 += 2; return this._i; }
}
function reset_c_3() { c_3 = 0; }

interface I_0 {
  set i(i: number|undefined)
  get i(): number|undefined
}

class C_Mandatory {
  i: number = 0
  j: string = ""
}
function fooMandatory(i: Required<C_Mandatory>) {
  let v: int = 0;
  if(i.j != undefined) { v += 1; }
  if(i.i != 0) { v += 2; }
  return v;
}

class C_IOptional {
  i?: number
  j: string = ""
}
function fooIOptional(i: Required<C_IOptional>) {
  let v: int = 0;
  if(i.j != undefined) { v += 1; }
  if(i.i != 0) { v += 2; }
  return v;
}

class C_BothOptional {
  i?: number
  j?: string
}
function fooBothOptional(i: Required<C_BothOptional>) {
  let v: int = 0;
  if(i.j != undefined) { v += 1; }
  if(i.i != 0) { v += 2; }
  return v;
}

class A_2 {
  i?: number;
  j?: string;
}
type T_0 = Required<A_2>
type R_0 = A_2
type RP_0 = Required<R_0>
function foo_11(i: Required<A_2>) {
  let a: int = 0;
  if(i.i != null) { a += 1; }
  if(i.j != undefined) { a += 2; }
  return a;
}
function foo_12(i: Required<A_2>) {
  let a: int = 0;
  if(i.i != null) { a += 1; }
  if(i.j != undefined) { a += 2; }
  return a;
}
interface A_3 {
  i?: number;
  j?: string;
}
type T_1 = Required<A_3>
type R_1 = A_3
type RP_1 = Required<R_1>
function foo_13(i: Required<A_3>) {
  let a: int = 0;
  if(i.i != null) { a += 1; }
  if(i.j != undefined) { a += 2; }
  return a;
}
function foo_14(i: Required<A_3>) {
  let a: int = 0;
  if(i.i != null) { a += 1; }
  if(i.j != undefined) { a += 2; }
  return a;
}

export default function RequiredUtilityTypeTest(): void {
  describe("RequiredUtilityTypeTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0100
     * @tc.name      testRequiredUtilityType0001
     * @tc.desc      Required<T> with class A_0 (optional fields become required)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Required<A_0> = {i: 1.9, j: "some str"}
      expect(a.i).assertEqual(1.9)
      expect(a.j).assertEqual("some str")
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0200
     * @tc.name      testRequiredUtilityType0002
     * @tc.desc      Required<T> with interface A_1 (optional fields become required)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Required<A_1> = {i: 1.9, j: "some str"}
      expect(a.i).assertEqual(1.9)
      expect(a.j).assertEqual("some str")
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0300
     * @tc.name      testRequiredUtilityType0003
     * @tc.desc      No method (including any getter or setter) of T is part of Required<T>.
     *               Object literal has its own built-in getters and setters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      reset_c_0();
      let a: Required<C_0> = {_i: 1.9}
      expect(a._i).assertEqual(1.9)
      expect(c_0).assertEqual(0)

      reset_c_1();
      let b: Required<C_1> = {_i: 1.9}
      expect(b._i).assertEqual(1.9)
      expect(c_1).assertEqual(0)

      reset_c_2();
      let c: Required<C_2> = {_i: 1.9}
      c._i = 1.2
      expect(c_2).assertEqual(0)

      reset_c_3();
      let d: Required<C_3> = {_i: 1.9}
      d._i = 1.2
      expect(c_3).assertEqual(0)
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0700
     * @tc.name      testRequiredUtilityType0007
     * @tc.desc      Required<T> with interface having getter/setter accessor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Required<I_0> = {i: 1.9}
      a.i = 1.9
      expect(a.i).assertEqual(1.9)
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0800
     * @tc.name      testRequiredUtilityType0008
     * @tc.desc      Required<T> with various class field optionality patterns
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fooMandatory({i: 1.9, j: "some str"}) == 3).assertTrue()
      expect(fooIOptional({i: 1.9, j: "some str"}) == 3).assertTrue()
      expect(fooBothOptional({i: 1.9, j: "some str"}) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_1700
     * @tc.name      testRequiredUtilityType0017
     * @tc.desc      Using custom type of Required<T> — class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_0 = {i: 1.9, j: "some str"}
      expect(foo_11(f) == 3).assertTrue()

      let g: RP_0 = {i: 1.9, j: "some str"}
      expect(foo_12(g) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_1900
     * @tc.name      testRequiredUtilityType0019
     * @tc.desc      Using custom type of Required<T> — interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_1 = {i: 1.9, j: "some str"}
      expect(foo_13(f) == 3).assertTrue()

      let g: RP_1 = {i: 1.9, j: "some str"}
      expect(foo_14(g) == 3).assertTrue()
    })
  });
}
