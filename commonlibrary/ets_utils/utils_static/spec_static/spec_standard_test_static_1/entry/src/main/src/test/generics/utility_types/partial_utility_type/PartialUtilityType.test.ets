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

interface I_0 {
  i: number |undefined
}
interface I_1 {
}
interface Issue_0 {
  title: string
  description: string
}
interface I_2 {
  i: number;
  j: string;
}
interface I_3 {
  i: number;
}

class C_0 implements I_0 {
  _i: number|undefined
  set i(i: number|undefined) { this._i = 1; }
  get i(): number|undefined { return this._i; }
}
abstract class C_1 implements I_1 {
  _i: number|undefined
  set i(i: number|undefined) { this._i = 1; }
  get i(): number|undefined { return this._i; }
}
class A_0 implements I_2 {
  _i:number = 0;
  _j:string = "";
  set i(i: number) { z_0 += 1; this._i = i; }
  get i() { z_0 += 10; return this._i; }
  set j(j: string) { z_0 += 5; this._j = j; }
  get j() { z_0 += 50; return this._j; }
}
class C_2 {
  _i: number = 0;
  _j: string = "";
  set i(i: number) { z_1 += 1; this._i = i; }
  get i() { z_1 += 10; return this._i; }
  set j(j: string) { z_1 += 5; this._j = j; }
  get j() { z_1 += 50; return this._j; }
}
class C_3 implements I_2 {
  _i:number = 0;
  _j:string = "";
  set i(i: number) { z_2 += 1; this._i = i; }
  get i(): number { z_2 += 10; return this._i; }
  set j(j: string) { z_2 += 5; this._j = j; }
  get j(): string { z_2 += 50; return this._j; }
}
class A_2 implements I_3 {
  j: string = "";
  i: number = 1;
}
class B_0 extends A_2 {
  k: boolean = false;
}

let z_0: int = 0;
let z_1: int = 0;
let z_2: int = 0;
let i_0: int = 0;
interface I {
  i: number
  j: string
}
function foo_3(param: Partial<I>) {
  let v: int = 0;
  if(param.j != null) {
    v += 1;
  }
  if(param.i != 0) {
    v += 2;
  }
  return v;
}
function foo_4(param: Partial<C_2>) {
  let v: int = 0;
  if(param._j != undefined) {
    v += 1;
  }
  if(param._i != 0) {
    v += 2;
  }
  return v;
}
function fooI_0(param: Partial<I_2>) {
  let v: int = 0;
  if(param.j != null) {
    v += 1;
  }
  if(param.i != 0) {
    v += 2;
  }
  return v;
}
function fooC_0(param: Partial<C_3>) {
  let v: int = 0;
  if(param.j != null) {
    v += 1;
  }
  if(param.i != 0) {
    v += 2;
  }
  return v;
}
function process_0(issue: Partial<Issue_0>) {
  if (issue.title != undefined) {
    return 0
  }
  return 1
}

class A_Mandatory {
  i: number = 0
  j: string = ""
}
function fooMandatory(i: Partial<A_Mandatory>): int {
  let v: int = 0;
  if(i.j != undefined) { v += 1; }
  if(i.i != 0) { v += 2; }
  return v;
}

class A_IOptional {
  i?: number = 0
  j: string = ""
}
function fooIOptional(i: Partial<A_IOptional>): int {
  let v: int = 0;
  if(i.j != undefined) { v += 1; }
  if(i.i != 0) { v += 2; }
  return v;
}

interface I_Mandatory {
  i: number
  j: string
}
function fooIMandatory(i: Partial<I_Mandatory>): int {
  let v: int = 0;
  if(i.j != undefined) { v += 1; }
  if(i.i != 0) { v += 2; }
  return v;
}

interface I_IOptional {
  i?: number
  j: string
}
function fooIIOptional(i: Partial<I_IOptional>): int {
  let v: int = 0;
  if(i.j != undefined) { v += 1; }
  if(i.i != 0) { v += 2; }
  return v;
}

class A_84 {
  static i: int = 0
  j: int = 0
}
abstract class AC_85 {
  static i: int = 0
  j: int = 0
}
let firstrun_0 = true
class A_86 {
  static i: int = 1
  j: int = 0
}
type P_0 = Partial<A_86>
function resetFirstrun_0() { firstrun_0 = true; }
let firstrun_1 = true
abstract class AC_87 {
  static i: int = 2
  j: int = 0
}
type P_1 = Partial<AC_87>
function resetFirstrun_1() { firstrun_1 = true; }

class A_Custom {
  i: number = 0
  j: string = ""
}
type T_Custom = Partial<A_Custom>
type R_Custom = A_Custom
type RP_Custom = Partial<R_Custom>
function fooCustom(i: Partial<A_Custom>) {
  let a: int = 0;
  if(i.i != null) { a += 1; }
  if(i.j != undefined) { a += 2; }
  return a;
}

abstract class AC_Custom {
  i: number = 0
  j: string = ""
}
type T_AC = Partial<AC_Custom>
type R_AC = AC_Custom
type RP_AC = Partial<R_AC>
function fooAC(i: Partial<AC_Custom>) {
  let a: int = 0;
  if(i.i != null) { a += 1; }
  if(i.j != undefined) { a += 2; }
  return a;
}

interface I_Custom {
  i: number
  j: string
}
type T_I = Partial<I_Custom>
type R_I = I_Custom
type RP_I = Partial<R_I>
function fooI(i: Partial<I_Custom>) {
  let a: int = 0;
  if(i.i != null) { a += 1; }
  if(i.j != undefined) { a += 2; }
  return a;
}

export default function PartialUtilityTypeTest(): void {
  describe("PartialUtilityTypeTest", () => {
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
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0100
     * @tc.name      testPartialUtilityType0001
     * @tc.desc      If class T has a user-defined getter, setter, or both, then none of those is
     *               called when object literal is used with Partial<T> variables. Object literal has
     *               its own built-in getters and setters to modify its variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Partial<C_0> = {i: 1.9}
      expect( a.i ).assertEqual(1.9)
      a.i = 2.1
      expect( a.i ).assertEqual(2.1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0200
     * @tc.name      testPartialUtilityType0002
     * @tc.desc      If class T has a user-defined getter, setter, or both, then none of those is
     *               called when object literal is used with Partial<T> variables. Object literal has
     *               its own built-in getters and setters to modify its variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Partial<C_1> = {i: 1.9}
      expect( a.i ).assertEqual(1.9)
      a.i = 2.1
      expect( a.i ).assertEqual(2.1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0300
     * @tc.name      testPartialUtilityType0003
     * @tc.desc      Use interface with mandatory fields as T for Partial<T> — all 4 arg combos
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_3( {i: 1.9, j: "some str"} ) ).assertEqual(3)
      expect( foo_3( {i: 1.9} ) ).assertEqual(2)
      expect( foo_3( {j: "some str"} ) ).assertEqual(3)
      expect( foo_3( {} ) ).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0700
     * @tc.name      testPartialUtilityType0007
     * @tc.desc      Partial<T> with Issue_0 — optional title/description
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(process_0({title: "aa"})).assertEqual(0)
      expect(process_0({})).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0800
     * @tc.name      testPartialUtilityType0008
     * @tc.desc      If class T has a user-defined getter/setter, then none of those is called
     *               when object literal is used with Partial<T> — all 4 arg combos for C_2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      z_1 = 0;
      expect( foo_4( {_i: 1.9, _j: "some str"} ) ).assertEqual(3)
      expect( z_1 ).assertEqual(0);
      expect( foo_4( {_i: 1.9} ) ).assertEqual(2)
      expect( z_1 ).assertEqual(0);
      expect( foo_4( {_j: "some str"} ) ).assertEqual(3)
      expect( z_1 ).assertEqual(0);
      expect( foo_4( {} ) ).assertEqual(2)
      expect( z_1 ).assertEqual(0);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_1200
     * @tc.name      testPartialUtilityType0012
     * @tc.desc      If class T has a user-defined getter/setter, then none of those is called
     *               when object literal is used with Partial<T> — C_3 and I_2 both, all 4 combos
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      z_2 = 0;
      expect( fooC_0( {j: "some str", i: 1.9} ) ).assertEqual(3)
      expect( fooI_0( {j: "some str", i: 1.9} ) ).assertEqual(3)
      expect( z_2 ).assertEqual(0);
      expect( fooC_0( {i: 1.9} ) ).assertEqual(2)
      expect( fooI_0( {i: 1.9} ) ).assertEqual(2)
      expect( z_2 ).assertEqual(0);
      expect( fooC_0( {j: "some str"} ) ).assertEqual(3)
      expect( fooI_0( {j: "some str"} ) ).assertEqual(3)
      expect( z_2 ).assertEqual(0);
      expect( fooC_0( {} ) ).assertEqual(2)
      expect( fooI_0( {} ) ).assertEqual(2)
      expect( z_2 ).assertEqual(0);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_1600
     * @tc.name      testPartialUtilityType0016
     * @tc.desc      Representative: class with both mandatory fields, all 4 input combos
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fooMandatory({i: 1.9, j: "some str"})).assertEqual(3);
      expect(fooMandatory({i: 1.9})).assertEqual(2);
      expect(fooMandatory({j: "some str"})).assertEqual(3);
      expect(fooMandatory({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_2000
     * @tc.name      testPartialUtilityType0020
     * @tc.desc      Representative: class with i optional, j mandatory, all 4 input combos
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fooIOptional({i: 1.9, j: "some str"})).assertEqual(3);
      expect(fooIOptional({i: 1.9})).assertEqual(2);
      expect(fooIOptional({j: "some str"})).assertEqual(3);
      expect(fooIOptional({})).assertEqual(2);
    })

    /**

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4300
     * @tc.name      testPartialUtilityType0043
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_55({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4400
     * @tc.name      testPartialUtilityType0044
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_56({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4500
     * @tc.name      testPartialUtilityType0045
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_57({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4600
     * @tc.name      testPartialUtilityType0046
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_58({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4700
     * @tc.name      testPartialUtilityType0047
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_59({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4800
     * @tc.name      testPartialUtilityType0048
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_60({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4900
     * @tc.name      testPartialUtilityType0049
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_61({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5000
     * @tc.name      testPartialUtilityType0050
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_62({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5100
     * @tc.name      testPartialUtilityType0051
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_63({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5200
     * @tc.name      testPartialUtilityType0052
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_64({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5300
     * @tc.name      testPartialUtilityType0053
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_65({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5400
     * @tc.name      testPartialUtilityType0054
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_66({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5500
     * @tc.name      testPartialUtilityType0055
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_67({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5600
     * @tc.name      testPartialUtilityType0056
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_68({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5700
     * @tc.name      testPartialUtilityType0057
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_69({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5800
     * @tc.name      testPartialUtilityType0058
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_70({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5900
     * @tc.name      testPartialUtilityType0059
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_71({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6000
     * @tc.name      testPartialUtilityType0060
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_72({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6100
     * @tc.name      testPartialUtilityType0061
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_73({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6200
     * @tc.name      testPartialUtilityType0062
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_74({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6300
     * @tc.name      testPartialUtilityType0063
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_75({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6400
     * @tc.name      testPartialUtilityType0064
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_76({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6500
     * @tc.name      testPartialUtilityType0065
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_77({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6600
     * @tc.name      testPartialUtilityType0066
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_78({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6700
     * @tc.name      testPartialUtilityType0067
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_79({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6800
     * @tc.name      testPartialUtilityType0068
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_80({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6900
     * @tc.name      testPartialUtilityType0069
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_81({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7000
     * @tc.name      testPartialUtilityType0070
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_82({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7100
     * @tc.name      testPartialUtilityType0071
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_83({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7200
     * @tc.name      testPartialUtilityType0072
     * @tc.desc      Type Partial<T> with static fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Partial<A_84> = {j:2}
      expect(a.j).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7300
     * @tc.name      testPartialUtilityType0073
     * @tc.desc      Type Partial<T> with static fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Partial<AC_85> = {j:2}
      expect(a.j).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7400
     * @tc.name      testPartialUtilityType0074
     * @tc.desc      'Type Partial<T> with static fields.

    Static field is a part of Partial<T> class. Field becomes optional and, thus, gets
    undefined value.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      resetFirstrun_0();
      let a: P_0 = {j:2}
      if(firstrun_0) {
        expect(P_0.i).assertEqual(undefined)
        P_0.i = 3
        firstrun_0 = false
      }
      expect(P_0.i).assertEqual(3)
      expect(A_86.i).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7500
     * @tc.name      testPartialUtilityType0075
     * @tc.desc      'Type Partial<T> with static fields.

    Static field is a part of Partial<T> class. Field becomes optional and, thus, gets
    undefined value.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      resetFirstrun_1();
      let a: P_1 = {j:2}
      if(firstrun_1) {
        expect(P_1.i).assertEqual(undefined)
        P_1.i = 3
        firstrun_1 = false
      }
      expect(P_1.i).assertEqual(3)
      expect(AC_87.i).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7600
     * @tc.name      testPartialUtilityType0076
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_88 = {i: 1.9, j: "some str"}
      let g: RP_88 = {i: 1.9, j: "some str"}
      expect(foo_88(f)).assertEqual(3)
      expect(foo_88(g)).assertEqual(3)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7700
     * @tc.name      testPartialUtilityType0077
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_89 = {i: 1.9}
      let g: RP_89 = {i: 1.9}
      expect(foo_89(f)).assertEqual(1)
      expect(foo_89(g)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7800
     * @tc.name      testPartialUtilityType0078
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_90 = {j: "some str"}
      let g: RP_90 = {j: "some str"}
      expect(foo_90(f)).assertEqual(2)
      expect(foo_90(g)).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7900
     * @tc.name      testPartialUtilityType0079
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_91 = {}
      let g: RP_91 = {}
      expect(foo_91(f)).assertEqual(0)
      expect(foo_91(g)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8000
     * @tc.name      testPartialUtilityType0080
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_92 = {i: 1.9, j: "some str"}
      let g: RP_92 = {i: 1.9, j: "some str"}
      expect(foo_92(f)).assertEqual(3)
      expect(foo_92(g)).assertEqual(3)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8100
     * @tc.name      testPartialUtilityType0081
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_93 = {i: 1.9}
      let g: RP_93 = {i: 1.9}
      expect(foo_93(f)).assertEqual(1)
      expect(foo_93(g)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8200
     * @tc.name      testPartialUtilityType0082
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_94 = {j: "some str"}
      let g: RP_94 = {j: "some str"}
      expect(foo_94(f)).assertEqual(2)
      expect(foo_94(g)).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8300
     * @tc.name      testPartialUtilityType0083
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_95 = {}
      let g: RP_95 = {}
      expect(foo_95(f)).assertEqual(0)
      expect(foo_95(g)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8400
     * @tc.name      testPartialUtilityType0084
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_96 = {i: 1.9, j: "some str"}
      let g: RP_96 = {i: 1.9, j: "some str"}
      expect(foo_96(f)).assertEqual(3)
      expect(foo_96(g)).assertEqual(3)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8500
     * @tc.name      testPartialUtilityType0085
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_97 = {i: 1.9}
      let g: RP_97 = {i: 1.9}
      expect(foo_97(f)).assertEqual(1)
      expect(foo_97(g)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8600
     * @tc.name      testPartialUtilityType0086
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_98 = {j: "some str"}
      let g: RP_98 = {j: "some str"}
      expect(foo_98(f)).assertEqual(2)
      expect(foo_98(g)).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8700
     * @tc.name      testPartialUtilityType0087
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_99 = {}
      let g: RP_99 = {}
      expect(foo_99(f)).assertEqual(0)
      expect(foo_99(g)).assertEqual(0)
    })
  });
}