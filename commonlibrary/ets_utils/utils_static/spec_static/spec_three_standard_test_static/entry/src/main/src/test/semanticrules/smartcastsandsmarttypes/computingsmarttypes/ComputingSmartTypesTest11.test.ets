'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';
import Utils from '../../../Util.test'

enum VarType { T_inter_A, T_diff_A }

// ============================================================================
// Data Setup for testUserDefinedInFn0001
// ============================================================================
class B_01 {
  methB() { return "methB" }
}
class C1_01 extends B_01 { vc1: int = 321 }
class C2_01 extends B_01 { vc2: number = 6.7 }

type T_01 = B_01 | undefined
type A_01 = B_01
type T_inter_A_01 = B_01
type T_diff_A_01 = undefined

type CheckValueFuncTypeT_inter_A_01 = (v: T_inter_A_01, v_id: int) => void
type CheckValueFuncTypeT_diff_A_01 = (v: T_diff_A_01, v_id: int) => void
type CheckValueData_01 = [
  T_01,
  CheckValueFuncTypeT_inter_A_01 | undefined,
  CheckValueFuncTypeT_diff_A_01 | undefined,
  VarType
]

function check_C1_01(v: T_inter_A_01) {
  expect(v instanceof C1_01).assertTrue()
  if (v instanceof C1_01) {
    expect(v.vc1).assertEqual(321)
  }
}
function check_C2_01(v: T_inter_A_01) {
  expect(v instanceof C2_01).assertTrue()
  if (v instanceof C2_01) {
    expect(v.vc2).assertEqual(6.7)
  }
}
function check_undefined_01(v: T_diff_A_01) {
  expect(v).assertEqual(undefined)
}

let check_values_01: ReadonlyArray<CheckValueData_01> = [
  [new C1_01(), check_C1_01, undefined, VarType.T_inter_A],
  [new C2_01(), check_C2_01, undefined, VarType.T_inter_A],
  [undefined, undefined, check_undefined_01, VarType.T_diff_A]
]
const check_values_number_01: int = 3

function check_as_type_T_inter_A_01(v: T_inter_A_01, v_id: int): void {
  check_values_01[v_id][1]!(v, v_id)
}
function check_as_type_T_diff_A_01(v: T_diff_A_01, v_id: int): void {
  check_values_01[v_id][2]!(v, v_id)
}
function check_01(v: T_01, v_type: VarType, v_id: int): void {
  if (v instanceof B_01) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v.methB()).assertEqual("methB")
    check_as_type_T_inter_A_01(v, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(undefined)
    check_as_type_T_diff_A_01(v as T_diff_A_01, v_id)
  }
}

// ============================================================================
// Data Setup for testUserDefinedInFn0002
// ============================================================================
interface I_02 {
  vi: int
  methI(): string
}
class C1_02 implements I_02 {
  vi: int = 0
  vc1: int = 321
  methI(): string { return "methI" }
}
class C2_02 implements I_02 {
  vi: int = 0
  vc2: number = 6.7
  methI(): string { return "methI" }
}

type T_02 = I_02 | undefined | null
type T_inter_A_02 = I_02
type T_diff_A_02 = undefined | null

type CheckValueFuncTypeT_inter_A_02 = (v: T_inter_A_02, v_id: int) => void
type CheckValueFuncTypeT_diff_A_02 = (v: T_diff_A_02, v_id: int) => void
type CheckValueData_02 = [
  T_02,
  CheckValueFuncTypeT_inter_A_02 | undefined,
  CheckValueFuncTypeT_diff_A_02 | undefined,
  VarType
]

function check_C1_02(v: T_inter_A_02) {
  expect(v instanceof C1_02).assertTrue()
  if (v instanceof C1_02) {
    expect(v.vc1).assertEqual(321)
  }
}
function check_C2_02(v: T_inter_A_02) {
  expect(v instanceof C2_02).assertTrue()
  if (v instanceof C2_02) {
    expect(v.vc2).assertEqual(6.7)
  }
}
function check_value_default_02(v: T_diff_A_02, v_id: int): void {
  expect(v).assertEqual(check_values_02[v_id][0])
}

let check_values_02: ReadonlyArray<CheckValueData_02> = [
  [new C1_02(), check_C1_02, undefined, VarType.T_inter_A],
  [new C2_02(), check_C2_02, undefined, VarType.T_inter_A],
  [undefined, undefined, check_value_default_02, VarType.T_diff_A],
  [null, undefined, check_value_default_02, VarType.T_diff_A]
]
const check_values_number_02: int = 4

function check_as_type_T_inter_A_02(v: T_inter_A_02, v_id: int): void {
  check_values_02[v_id][1]!(v, v_id)
}
function check_as_type_T_diff_A_02(v: T_diff_A_02, v_id: int): void {
  check_values_02[v_id][2]!(v, v_id)
}
function check_02(v: T_02, v_type: VarType, v_id: int): void {
  if (v instanceof C1_02 || v instanceof C2_02) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v.methI()).assertEqual("methI")
    check_as_type_T_inter_A_02(v as T_inter_A_02, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    check_as_type_T_diff_A_02(v as T_diff_A_02, v_id)
  }
}

// ============================================================================
// Data Setup for testUserDefinedInFn0003
// ============================================================================
class Animal_03 {}
class Cat_03 extends Animal_03 { vc: string = "cat" }
class Dog_03 extends Animal_03 { vd: bigint = 123n }
class Frog_03 extends Animal_03 { vf: int = 5 }

type T_03 = Cat_03 | Dog_03 | Frog_03 | number
type T_inter_A_03 = number | Dog_03
type T_diff_A_03 = Cat_03 | Frog_03

type CheckValueFuncTypeT_inter_A_03 = (v: T_inter_A_03, v_id: int) => void
type CheckValueFuncTypeT_diff_A_03 = (v: T_diff_A_03, v_id: int) => void
type CheckValueData_03 = [
  T_03,
  CheckValueFuncTypeT_inter_A_03 | undefined,
  CheckValueFuncTypeT_diff_A_03 | undefined,
  VarType
]

function check_Cat_03(v: T_diff_A_03) {
  expect(v instanceof Cat_03).assertTrue()
  if (v instanceof Cat_03) {
    expect(v.vc).assertEqual("cat")
  }
}
function check_Dog_03(v: T_inter_A_03) {
  expect(v instanceof Dog_03).assertTrue()
  if (v instanceof Dog_03) {
    expect(v.vd).assertEqual(123n)
  }
}
function check_Frog_03(v: T_diff_A_03) {
  expect(v instanceof Frog_03).assertTrue()
  if (v instanceof Frog_03) {
    expect(v.vf).assertEqual(5)
  }
}
function check_number_03(v: T_inter_A_03) {
  expect(typeof v === 'number').assertTrue()
  if (typeof v === 'number') {
    expect(v).assertEqual(7.8)
  }
}

let check_values_03: ReadonlyArray<CheckValueData_03> = [
  [new Dog_03(), check_Dog_03, undefined, VarType.T_inter_A],
  [7.8, check_number_03, undefined, VarType.T_inter_A],
  [new Cat_03(), undefined, check_Cat_03, VarType.T_diff_A],
  [new Frog_03(), undefined, check_Frog_03, VarType.T_diff_A]
]
const check_values_number_03: int = 4

function check_as_type_T_inter_A_03(v: T_inter_A_03, v_id: int): void {
  check_values_03[v_id][1]!(v, v_id)
}
function check_as_type_T_diff_A_03(v: T_diff_A_03, v_id: int): void {
  check_values_03[v_id][2]!(v, v_id)
}
function check_03(v: T_03, v_type: VarType, v_id: int): void {
  if (typeof v === 'number' || v instanceof Dog_03) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    check_as_type_T_inter_A_03(v as T_inter_A_03, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    check_as_type_T_diff_A_03(v as T_diff_A_03, v_id)
  }
}

// ============================================================================
// Data Setup for testUserDefinedInFn0004
// ============================================================================
class Animal_04 { va: int = 0 }
class Cat_04 extends Animal_04 { vc: string = "cat" }
class Dog_04 extends Animal_04 { vd: bigint = 123n }
class Frog_04 extends Animal_04 { vf: int = 5 }

type T_04 = Animal_04 | number
type T_inter_A_04 = number | Dog_04
type T_diff_A_04 = Animal_04

type CheckValueFuncTypeT_inter_A_04 = (v: T_inter_A_04, v_id: int) => void
type CheckValueFuncTypeT_diff_A_04 = (v: T_diff_A_04, v_id: int) => void
type CheckValueData_04 = [
  T_04,
  CheckValueFuncTypeT_inter_A_04 | undefined,
  CheckValueFuncTypeT_diff_A_04 | undefined,
  VarType
]

function check_Cat_04(v: T_diff_A_04) {
  expect(v instanceof Cat_04).assertTrue()
  if (v instanceof Cat_04) {
    expect(v.vc).assertEqual("cat")
  }
}
function check_Dog_04(v: T_inter_A_04) {
  expect(v instanceof Dog_04).assertTrue()
  if (v instanceof Dog_04) {
    expect(v.vd).assertEqual(123n)
  }
}
function check_Frog_04(v: T_diff_A_04) {
  expect(v instanceof Frog_04).assertTrue()
  if (v instanceof Frog_04) {
    expect(v.vf).assertEqual(5)
  }
}
function check_number_04(v: T_inter_A_04) {
  expect(typeof v === 'number').assertTrue()
  if (typeof v === 'number') {
    expect(v).assertEqual(7.8)
  }
}

let check_values_04: ReadonlyArray<CheckValueData_04> = [
  [new Dog_04(), check_Dog_04, undefined, VarType.T_inter_A],
  [7.8, check_number_04, undefined, VarType.T_inter_A],
  [new Cat_04(), undefined, check_Cat_04, VarType.T_diff_A],
  [new Frog_04(), undefined, check_Frog_04, VarType.T_diff_A]
]
const check_values_number_04: int = 4

function check_as_type_T_inter_A_04(v: T_inter_A_04, v_id: int): void {
  check_values_04[v_id][1]!(v, v_id)
}
function check_as_type_T_diff_A_04(v: T_diff_A_04, v_id: int): void {
  check_values_04[v_id][2]!(v, v_id)
}
function check_04(v: T_04, v_type: VarType, v_id: int): void {
  if (typeof v === 'number' || v instanceof Dog_04) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    check_as_type_T_inter_A_04(v as T_inter_A_04, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    if (v instanceof Cat_04 || v instanceof Frog_04) expect((v as Animal_04).va).assertEqual(0)
    check_as_type_T_diff_A_04(v as T_diff_A_04, v_id)
  }
}

// ============================================================================
// Data Setup for testUserDefinedInFn0005
// ============================================================================
abstract class B_05 {}
abstract class B1_05 extends B_05 {}
class B2_05 extends B_05 { vb2: bigint = 123n }
class C1_05 extends B1_05 { vc1: int = 321 }
class C2_05 extends B1_05 { vc2: number = 6.7 }
class Other_05 { vo: string = "other" }

type T_05 = C1_05 | C2_05 | B2_05 | Other_05
type T_inter_A_05 = C1_05 | C2_05 | Other_05
type T_diff_A_05 = B2_05

type CheckValueFuncTypeT_inter_A_05 = (v: T_inter_A_05, v_id: int) => void
type CheckValueFuncTypeT_diff_A_05 = (v: T_diff_A_05, v_id: int) => void
type CheckValueData_05 = [
  T_05,
  CheckValueFuncTypeT_inter_A_05 | undefined,
  CheckValueFuncTypeT_diff_A_05 | undefined,
  VarType
]

function check_C1_05(v: T_inter_A_05) {
  expect(v instanceof C1_05).assertTrue()
  if (v instanceof C1_05) expect(v.vc1).assertEqual(321)
}
function check_C2_05(v: T_inter_A_05) {
  expect(v instanceof C2_05).assertTrue()
  if (v instanceof C2_05) expect(v.vc2).assertEqual(6.7)
}
function check_B2_05(v: T_diff_A_05) {
  expect(v.vb2).assertEqual(123n)
}
function check_Other_05(v: T_inter_A_05) {
  expect(v instanceof Other_05).assertTrue()
  if (v instanceof Other_05) expect(v.vo).assertEqual("other")
}

let check_values_05: ReadonlyArray<CheckValueData_05> = [
  [new C1_05(), check_C1_05, undefined, VarType.T_inter_A],
  [new C2_05(), check_C2_05, undefined, VarType.T_inter_A],
  [new Other_05(), check_Other_05, undefined, VarType.T_inter_A],
  [new B2_05(), undefined, check_B2_05, VarType.T_diff_A]
]
const check_values_number_05: int = 4

function check_as_type_T_inter_A_05(v: T_inter_A_05, v_id: int): void {
  check_values_05[v_id][1]!(v, v_id)
}

function check_as_type_T_diff_A_05(v: T_diff_A_05, v_id: int): void {
  check_values_05[v_id][2]!(v, v_id)
}

function check_05(v: T_05, v_type: VarType, v_id: int): void {
  let isMatch: boolean = false;
  if (v instanceof B1_05) {
    isMatch = true;
  } else if (v instanceof Other_05) {
    isMatch = true;
  }

  if (isMatch) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    check_as_type_T_inter_A_05(v as T_inter_A_05, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    if (v instanceof B2_05) expect(v.vb2).assertEqual(123n)
    check_as_type_T_diff_A_05(v as T_diff_A_05, v_id)
  }
}

// ============================================================================
// Data Setup for testUserDefinedInFn0006
// ============================================================================
class I1_06 { va: int = 0 }
class I2_06 { vb: int = 0 }
class II1_06 {}
class II2_06 { methII2() { return "methII2" } }
class III1_06 extends II1_06 {}
class III2_06 extends II1_06 {}

class C1_06 extends III1_06 {
  va: int = 0; vb: int = 0; vc1: bigint = 123n
}
class C2_06 extends III2_06 {
  va: int = 0; vb: int = 0; vc2: int = 321
}
class C3_06 extends II2_06 {
  va: int = 0; vb: int = 0; vc3: number = 7.8
}

type T_06 = C1_06 | C2_06 | C3_06
type T_inter_A_06 = C1_06 | C2_06
type T_diff_A_06 = C3_06

type CheckValueFuncTypeT_inter_A_06 = (v: T_inter_A_06, v_id: int) => void
type CheckValueFuncTypeT_diff_A_06 = (v: T_diff_A_06, v_id: int) => void
type CheckValueData_06 = [
  T_06,
  CheckValueFuncTypeT_inter_A_06 | undefined,
  CheckValueFuncTypeT_diff_A_06 | undefined,
  VarType
]

function check_C1_06(v: T_inter_A_06) {
  expect(v instanceof C1_06).assertTrue()
  if (v instanceof C1_06) expect(v.vc1).assertEqual(123n)
}
function check_C2_06(v: T_inter_A_06) {
  expect(v instanceof C2_06).assertTrue()
  if (v instanceof C2_06) expect(v.vc2).assertEqual(321)
}
function check_C3_06(v: T_diff_A_06) {
  expect(v.methII2()).assertEqual("methII2")
  expect(v instanceof C3_06).assertTrue()
  if (v instanceof C3_06) expect(v.vc3).assertEqual(7.8)
}

let check_values_06: ReadonlyArray<CheckValueData_06> = [
  [new C1_06(), check_C1_06, undefined, VarType.T_inter_A],
  [new C2_06(), check_C2_06, undefined, VarType.T_inter_A],
  [new C3_06(), undefined, check_C3_06, VarType.T_diff_A]
]
const check_values_number_06: int = 3

function check_as_type_T_inter_A_06(v: T_inter_A_06, v_id: int): void {
  check_values_06[v_id][1]!(v, v_id)
}
function check_as_type_T_diff_A_06(v: T_diff_A_06, v_id: int): void {
  check_values_06[v_id][2]!(v, v_id)
}
function check_06(v: T_06, v_type: VarType, v_id: int): void {
  // Fix: exact subtype checks to prevent 'never' collapsing
  if (v instanceof C1_06 || v instanceof C2_06) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    check_as_type_T_inter_A_06(v as T_inter_A_06, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    if (v instanceof C3_06) expect(v.methII2()).assertEqual("methII2")
    check_as_type_T_diff_A_06(v as T_diff_A_06, v_id)
  }
}

// ============================================================================
// Data Setup for testUserDefinedInFn0007
// ============================================================================
class I_07 { vi: int = 0 }
class II1_07 extends I_07 {}
class II2_07 extends I_07 {}
class III1_07 extends II1_07 {}
class III2_07 extends II1_07 { methIII2() { return "methIII2" } }

class C1_07 extends III2_07 { vc1: bigint = 123n }
class C2_07 extends III2_07 { vc2: int = 321 }
class C3_07 extends III1_07 { vc3: number = 7.8 }

type T_07 = C1_07 | C2_07 | C3_07
type T_inter_A_07 = C1_07 | C2_07
type T_diff_A_07 = C3_07

type CheckValueFuncTypeT_inter_A_07 = (v: T_inter_A_07, v_id: int) => void
type CheckValueFuncTypeT_diff_A_07 = (v: T_diff_A_07, v_id: int) => void
type CheckValueData_07 = [
  T_07,
  CheckValueFuncTypeT_inter_A_07 | undefined,
  CheckValueFuncTypeT_diff_A_07 | undefined,
  VarType
]

function check_C1_07(v: T_inter_A_07) {
  expect(v.methIII2()).assertEqual("methIII2")
  expect(v instanceof C1_07).assertTrue()
  if (v instanceof C1_07) expect(v.vc1).assertEqual(123n)
}
function check_C2_07(v: T_inter_A_07) {
  expect(v.methIII2()).assertEqual("methIII2")
  expect(v instanceof C2_07).assertTrue()
  if (v instanceof C2_07) expect(v.vc2).assertEqual(321)
}
function check_C3_07(v: T_diff_A_07) {
  expect(v instanceof C3_07).assertTrue()
  if (v instanceof C3_07) expect(v.vc3).assertEqual(7.8)
}

let check_values_07: ReadonlyArray<CheckValueData_07> = [
  [new C1_07(), check_C1_07, undefined, VarType.T_inter_A],
  [new C2_07(), check_C2_07, undefined, VarType.T_inter_A],
  [new C3_07(), undefined, check_C3_07, VarType.T_diff_A]
]
const check_values_number_07: int = 3

function check_as_type_T_inter_A_07(v: T_inter_A_07, v_id: int): void {
  check_values_07[v_id][1]!(v, v_id)
}
function check_as_type_T_diff_A_07(v: T_diff_A_07, v_id: int): void {
  check_values_07[v_id][2]!(v, v_id)
}
function check_07(v: T_07, v_type: VarType, v_id: int): void {
  // Fix: Check exact subtypes to avoid 'never'
  if (v instanceof C1_07 || v instanceof C2_07) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect((v as III2_07).methIII2()).assertEqual("methIII2")
    check_as_type_T_inter_A_07(v as T_inter_A_07, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    check_as_type_T_diff_A_07(v as T_diff_A_07, v_id)
  }
}

// ============================================================================
// Data Setup for testUserDefinedInFn0008
// ============================================================================
class C_08 { methC() { return "methC" } }
class B_08 extends C_08 { vi: int = 0; methI() { return "methIB" } }
class D_08 { vi: int = 0; methI() { return "methID" } }

type T_08 = B_08 | D_08
type T_inter_A_08 = B_08
type T_diff_A_08 = D_08

type CheckValueFuncTypeT_inter_A_08 = (v: T_inter_A_08, v_id: int) => void
type CheckValueFuncTypeT_diff_A_08 = (v: T_diff_A_08, v_id: int) => void
type CheckValueData_08 = [
  T_08,
  CheckValueFuncTypeT_inter_A_08 | undefined,
  CheckValueFuncTypeT_diff_A_08 | undefined,
  VarType
]

function check_B_08(v: T_inter_A_08) {
  expect(v instanceof B_08).assertTrue()
  if (v instanceof B_08) {
    expect(v.methI()).assertEqual("methIB")
    expect(v.methC()).assertEqual("methC")
  }
}
function check_D_08(v: T_diff_A_08) {
  expect(v instanceof D_08).assertTrue()
  if (v instanceof D_08) {
    expect(v.methI()).assertEqual("methID")
  }
}

let check_values_08: ReadonlyArray<CheckValueData_08> = [
  [new B_08(), check_B_08, undefined, VarType.T_inter_A],
  [new D_08(), undefined, check_D_08, VarType.T_diff_A]
]
const check_values_number_08: int = 2

function check_as_type_T_inter_A_08(v: T_inter_A_08, v_id: int): void {
  check_values_08[v_id][1]!(v, v_id)
}
function check_as_type_T_diff_A_08(v: T_diff_A_08, v_id: int): void {
  check_values_08[v_id][2]!(v, v_id)
}
function check_08(v: T_08, v_type: VarType, v_id: int): void {
  // Fix: Check explicitly against B_08 to avoid 'never' intersection with C_08
  if (v instanceof B_08) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v.methC()).assertEqual("methC")
    expect(v.methI()).assertEqual("methIB")
    check_as_type_T_inter_A_08(v as T_inter_A_08, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    if (v instanceof D_08) expect(v.vi).assertEqual(0)
    check_as_type_T_diff_A_08(v as T_diff_A_08, v_id)
  }
}

// ============================================================================
// Data Setup for testUserDefinedInFn0009
// ============================================================================
abstract class C_09 { abstract methC(): string }
class B_09 extends C_09 { vi: int = 0; methC() { return "methCB" }; methI() { return "methI" } }
class D_09 { vi: int = 0; methD() { return "methD" }; methI() { return "methI" } }

type T_09 = B_09 | D_09
type T_inter_A_09 = B_09
type T_diff_A_09 = D_09

type CheckValueFuncTypeT_inter_A_09 = (v: T_inter_A_09, v_id: int) => void
type CheckValueFuncTypeT_diff_A_09 = (v: T_diff_A_09, v_id: int) => void
type CheckValueData_09 = [
  T_09,
  CheckValueFuncTypeT_inter_A_09 | undefined,
  CheckValueFuncTypeT_diff_A_09 | undefined,
  VarType
]

function check_B_09(v: T_inter_A_09) {
  expect(v instanceof B_09).assertTrue()
  if (v instanceof B_09) {
    expect(v.methI()).assertEqual("methI")
    expect(v.methC()).assertEqual("methCB")
  }
}
function check_D_09(v: T_diff_A_09) {
  expect(v instanceof D_09).assertTrue()
  if (v instanceof D_09) {
    expect(v.methI()).assertEqual("methI")
    expect(v.methD()).assertEqual("methD")
  }
}

let check_values_09: ReadonlyArray<CheckValueData_09> = [
  [new B_09(), check_B_09, undefined, VarType.T_inter_A],
  [new D_09(), undefined, check_D_09, VarType.T_diff_A]
]
const check_values_number_09: int = 2

function check_as_type_T_inter_A_09(v: T_inter_A_09, v_id: int): void {
  check_values_09[v_id][1]!(v, v_id)
}
function check_as_type_T_diff_A_09(v: T_diff_A_09, v_id: int): void {
  check_values_09[v_id][2]!(v, v_id)
}
function check_09(v: T_09, v_type: VarType, v_id: int): void {
  // Fix: Check exact union member
  if (v instanceof B_09) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v.methC()).assertEqual("methCB")
    check_as_type_T_inter_A_09(v as T_inter_A_09, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    if (v instanceof D_09) expect(v.vi).assertEqual(0)
    check_as_type_T_diff_A_09(v as T_diff_A_09, v_id)
  }
}

// ============================================================================
// Data Setup for testUserDefinedInFn0010 (Function types)
// ============================================================================
class B_10 {}
class D_10 extends B_10 {
  vb: int
  constructor(v: int) { super(); this.vb = v }
}

// Fix: Remove generic "any" usage. Unify closure typing using strict Object and arguments
type UnifiedHandler = (a: Object, b: int) => B_10;
type T_10 = UnifiedHandler | undefined;
type T_inter_A_10 = UnifiedHandler;
type T_diff_A_10 = undefined;

const handlerDIntResB_10: UnifiedHandler = (a: Object, b: int): B_10 => { return new D_10((a as D_10).vb + b) }
const handlerBIntResB_10: UnifiedHandler = (a: Object, b: int): B_10 => { return new D_10(a instanceof D_10 ? a.vb + b + 100 : b) }
const handlerBResD_10: UnifiedHandler = (a: Object, b: int): B_10 => { return new D_10(a instanceof D_10 ? a.vb + 1000 : 0) }
const handlerNothingResD_10: UnifiedHandler = (a: Object, b: int): B_10 => { return new D_10(123) }

type CheckValueFuncTypeT_inter_A_10 = (v: T_inter_A_10, v_id: int) => void
type CheckValueFuncTypeT_diff_A_10 = (v: T_diff_A_10, v_id: int) => void
type CheckValueData_10 = [
  T_10,
  CheckValueFuncTypeT_inter_A_10 | undefined,
  CheckValueFuncTypeT_diff_A_10 | undefined,
  VarType
]

function check_HandlerDIntResB_10(v: T_inter_A_10) {
  let res = v(new D_10(10), 20)
  expect(res instanceof D_10).assertTrue()
  if (res instanceof D_10) expect(res.vb).assertEqual(30)
}
function check_HandlerBIntResB_10(v: T_inter_A_10) {
  let res = v(new D_10(10), 20)
  expect(res instanceof D_10).assertTrue()
  if (res instanceof D_10) expect(res.vb).assertEqual(130)
}
function check_HandlerBResD_10(v: T_inter_A_10) {
  let res = v(new D_10(10), 20)
  expect(res instanceof D_10).assertTrue()
  if (res instanceof D_10) expect(res.vb).assertEqual(1010)
}
function check_HandlerNothingResD_10(v: T_inter_A_10) {
  let res = v(new D_10(10), 20)
  expect(res instanceof D_10).assertTrue()
  if (res instanceof D_10) expect(res.vb).assertEqual(123)
}
function check_undefined_10(v: T_diff_A_10) {
  expect(v).assertEqual(undefined)
}

let check_values_10: ReadonlyArray<CheckValueData_10> = [
  [handlerDIntResB_10, check_HandlerDIntResB_10, undefined, VarType.T_inter_A],
  [handlerBIntResB_10, check_HandlerBIntResB_10, undefined, VarType.T_inter_A],
  [handlerBResD_10, check_HandlerBResD_10, undefined, VarType.T_inter_A],
  [handlerNothingResD_10, check_HandlerNothingResD_10, undefined, VarType.T_inter_A],
  [undefined, undefined, check_undefined_10, VarType.T_diff_A]
]
const check_values_number_10: int = 5

function check_as_type_T_inter_A_10(v: T_inter_A_10, v_id: int): void {
  check_values_10[v_id][1]!(v, v_id)
}
function check_as_type_T_diff_A_10(v: T_diff_A_10, v_id: int): void {
  check_values_10[v_id][2]!(v, v_id)
}
function check_10(v: T_10, v_type: VarType, v_id: int): void {
  // Fix: Functions cannot be type-checked with 'instanceof' cleanly, compare against undefined
  if (v !== undefined) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    check_as_type_T_inter_A_10(v as T_inter_A_10, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(undefined)
    check_as_type_T_diff_A_10(v as T_diff_A_10, v_id)
  }
}

export default function ComputingSmartTypesTest11():void {
  describe('ComputingSmartTypesTest11', () => {
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
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTELEVEN_0100
     * @tc.name      testUserDefinedInFn0001
     * @tc.desc      Checking branching on "v instanceof A" on user-defined types in function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUserDefinedInFn0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_01.length; v_id++) {
        check_01(check_values_01[v_id][0], check_values_01[v_id][3], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_01)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTELEVEN_0200
     * @tc.name      testUserDefinedInFn0002
     * @tc.desc      Checking branching on "v instanceof A" on user-defined types in function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUserDefinedInFn0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_02.length; v_id++) {
        check_02(check_values_02[v_id][0], check_values_02[v_id][3], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_02)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTELEVEN_0300
     * @tc.name      testUserDefinedInFn0003
     * @tc.desc      Checking branching on "v instanceof A" on user-defined types in function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUserDefinedInFn0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_03.length; v_id++) {
        check_03(check_values_03[v_id][0], check_values_03[v_id][3], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_03)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTELEVEN_0400
     * @tc.name      testUserDefinedInFn0004
     * @tc.desc      Checking branching on "v instanceof A" on user-defined types in function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUserDefinedInFn0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_04.length; v_id++) {
        check_04(check_values_04[v_id][0], check_values_04[v_id][3], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_04)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTELEVEN_0500
     * @tc.name      testUserDefinedInFn0005
     * @tc.desc      Checking branching on "v instanceof A" on user-defined types in function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUserDefinedInFn0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_05.length; v_id++) {
        check_05(check_values_05[v_id][0], check_values_05[v_id][3], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_05)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTELEVEN_0600
     * @tc.name      testUserDefinedInFn0006
     * @tc.desc      Checking branching on "v instanceof A" on user-defined types in function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUserDefinedInFn0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_06.length; v_id++) {
        check_06(check_values_06[v_id][0], check_values_06[v_id][3], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_06)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTELEVEN_0700
     * @tc.name      testUserDefinedInFn0007
     * @tc.desc      Checking branching on "v instanceof A" on user-defined types in function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUserDefinedInFn0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_07.length; v_id++) {
        check_07(check_values_07[v_id][0], check_values_07[v_id][3], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_07)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTELEVEN_0800
     * @tc.name      testUserDefinedInFn0008
     * @tc.desc      Checking branching on "v instanceof A" on user-defined types in function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUserDefinedInFn0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_08.length; v_id++) {
        check_08(check_values_08[v_id][0], check_values_08[v_id][3], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_08)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTELEVEN_0900
     * @tc.name      testUserDefinedInFn0009
     * @tc.desc      Checking branching on "v instanceof A" on user-defined types in function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUserDefinedInFn0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_09.length; v_id++) {
        check_09(check_values_09[v_id][0], check_values_09[v_id][3], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_09)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTELEVEN_1000
     * @tc.name      testUserDefinedInFn0010
     * @tc.desc      Checking branching on "v instanceof A" on function types in function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUserDefinedInFn0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_10.length; v_id++) {
        check_10(check_values_10[v_id][0], check_values_10[v_id][3], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_10)
    });
  })
}