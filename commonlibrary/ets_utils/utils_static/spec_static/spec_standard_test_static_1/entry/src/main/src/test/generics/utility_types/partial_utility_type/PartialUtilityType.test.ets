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
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4400
     * @tc.name      testPartialUtilityType0044
     * @tc.desc      Representative: interface with both mandatory fields, all 4 input combos
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( fooIMandatory({i: 1.9, j: "some str"})).assertEqual(3);
      expect( fooIMandatory({i: 1.9})).assertEqual(2);
      expect( fooIMandatory({j: "some str"})).assertEqual(3);
      expect( fooIMandatory({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4800
     * @tc.name      testPartialUtilityType0048
     * @tc.desc      Representative: interface with i optional, j mandatory, all 4 input combos
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( fooIIOptional({i: 1.9, j: "some str"})).assertEqual(3);
      expect( fooIIOptional({i: 1.9})).assertEqual(2);
      expect( fooIIOptional({j: "some str"})).assertEqual(3);
      expect( fooIIOptional({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7200
     * @tc.name      testPartialUtilityType0072
     * @tc.desc      Type Partial<T> with static fields — non-static field only
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
     * @tc.desc      Type Partial<T> with static fields — abstract class
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
     * @tc.desc      Type Partial<T> with static fields — static field becomes optional/undefined
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
     * @tc.desc      Type Partial<T> with static fields — abstract class, static field becomes optional
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
     * @tc.desc      Using custom type of Partial<T> — class, all 4 input combos
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_Custom = {i: 1.9, j: "some str"}
      let g: RP_Custom = {i: 1.9, j: "some str"}
      expect(fooCustom(f)).assertEqual(3)
      expect(fooCustom(g)).assertEqual(3)

      f = {i: 1.9}
      g = {i: 1.9}
      expect(fooCustom(f)).assertEqual(1)
      expect(fooCustom(g)).assertEqual(1)

      f = {j: "some str"}
      g = {j: "some str"}
      expect(fooCustom(f)).assertEqual(2)
      expect(fooCustom(g)).assertEqual(2)

      f = {}
      g = {}
      expect(fooCustom(f)).assertEqual(0)
      expect(fooCustom(g)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8000
     * @tc.name      testPartialUtilityType0080
     * @tc.desc      Using custom type of Partial<T> — abstract class, all 4 input combos
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_AC = {i: 1.9, j: "some str"}
      let g: RP_AC = {i: 1.9, j: "some str"}
      expect(fooAC(f)).assertEqual(3)
      expect(fooAC(g)).assertEqual(3)

      f = {i: 1.9}
      g = {i: 1.9}
      expect(fooAC(f)).assertEqual(1)
      expect(fooAC(g)).assertEqual(1)

      f = {j: "some str"}
      g = {j: "some str"}
      expect(fooAC(f)).assertEqual(2)
      expect(fooAC(g)).assertEqual(2)

      f = {}
      g = {}
      expect(fooAC(f)).assertEqual(0)
      expect(fooAC(g)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8400
     * @tc.name      testPartialUtilityType0084
     * @tc.desc      Using custom type of Partial<T> — interface, all 4 input combos
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_I = {i: 1.9, j: "some str"}
      let g: RP_I = {i: 1.9, j: "some str"}
      expect(fooI(f)).assertEqual(3)
      expect(fooI(g)).assertEqual(3)

      f = {i: 1.9}
      g = {i: 1.9}
      expect(fooI(f)).assertEqual(1)
      expect(fooI(g)).assertEqual(1)

      f = {j: "some str"}
      g = {j: "some str"}
      expect(fooI(f)).assertEqual(2)
      expect(fooI(g)).assertEqual(2)

      f = {}
      g = {}
      expect(fooI(f)).assertEqual(0)
      expect(fooI(g)).assertEqual(0)
    })
  });
}
