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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../../Util.test'

enum VarType { T_inter_A, T_diff_A }

// ----------------- testPredefinedInFn0001 -----------------
type T0 = Object | undefined
type A0 = undefined
type T_inter_A0 = undefined
type T_diff_A0 = Object

type CheckValueData0 = [T0, VarType]

let check_values_0: ReadonlyArray<CheckValueData0> = [
  [undefined, VarType.T_inter_A],
  [5n, VarType.T_diff_A],
  [123, VarType.T_diff_A],
  ["abc", VarType.T_diff_A],
  [c'a', VarType.T_diff_A]
]
const check_values_number_0: int = 5

function check_as_type_T_inter_A0(v: T_inter_A0, v_id: int): void {
  expect(v).assertEqual(check_values_0[v_id][0])
}

function check_as_type_T_diff_A0(v: T_diff_A0, v_id: int): void {
  expect(v).assertEqual(check_values_0[v_id][0])
}

function check0(v: T0, v_type: VarType, v_id: int): void {
  if (v === undefined) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_0[v_id][0])
    check_as_type_T_inter_A0(v as T_inter_A0, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_0[v_id][0])
    check_as_type_T_diff_A0(v as T_diff_A0, v_id)
  }
}

// ----------------- testPredefinedInFn0002 -----------------
type T1 = Object | undefined | null
type A1 = Object
type T_inter_A1 = Object
type T_diff_A1 = undefined | null

type CheckValueData1 = [T1, VarType]

let check_values_1: ReadonlyArray<CheckValueData1> = [
  [5n, VarType.T_inter_A],
  [123, VarType.T_inter_A],
  ["abc", VarType.T_inter_A],
  [c'a', VarType.T_inter_A],
[undefined, VarType.T_diff_A],
[null, VarType.T_diff_A]
]
const check_values_number_1: int = 6

function check_as_type_T_inter_A1(v: T_inter_A1, v_id: int): void {
  expect(v).assertEqual(check_values_1[v_id][0])
}

function check_as_type_T_diff_A1(v: T_diff_A1, v_id: int): void {
  expect(v).assertEqual(check_values_1[v_id][0])
}

function check1(v: T1, v_type: VarType, v_id: int): void {
  if (v instanceof Object) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_1[v_id][0])
    check_as_type_T_inter_A1(v as T_inter_A1, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_1[v_id][0])
    check_as_type_T_diff_A1(v as T_diff_A1, v_id)
  }
}

// ----------------- testPredefinedInFn0003 -----------------
type T2 = Object | undefined | null
type A2 = undefined | null
type T_inter_A2 = undefined | null
type T_diff_A2 = Object

type CheckValueData2 = [T2, VarType]

let check_values_2: ReadonlyArray<CheckValueData2> = [
  [undefined, VarType.T_inter_A],
  [null, VarType.T_inter_A],
  [5n, VarType.T_diff_A],
  [123, VarType.T_diff_A],
  ["abc", VarType.T_diff_A],
  [c'a', VarType.T_diff_A]
]
const check_values_number_2: int = 6

function check_as_type_T_inter_A2(v: T_inter_A2, v_id: int): void {
  expect(v).assertEqual(check_values_2[v_id][0])
}

function check_as_type_T_diff_A2(v: T_diff_A2, v_id: int): void {
  expect(v).assertEqual(check_values_2[v_id][0])
}

function check2(v: T2, v_type: VarType, v_id: int): void {
  if (v === undefined || v === null) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_2[v_id][0])
    check_as_type_T_inter_A2(v as T_inter_A2, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_2[v_id][0])
    check_as_type_T_diff_A2(v as T_diff_A2, v_id)
  }
}

// ----------------- testPredefinedInFn0004 -----------------
type T3 = Object | undefined
type A3 = bigint | number | undefined
type T_inter_A3 = bigint | number | undefined
type T_diff_A3 = Object

type CheckValueData3 = [T3, VarType]

let check_values_3: ReadonlyArray<CheckValueData3> = [
  [5n, VarType.T_inter_A],
  [undefined, VarType.T_inter_A],
  [7.8, VarType.T_inter_A],
  ["abc", VarType.T_diff_A],
  [123, VarType.T_diff_A],
  [5.6f, VarType.T_diff_A],
  [c'a', VarType.T_diff_A]
]
const check_values_number_3: int = 7

function check_as_type_T_inter_A3(v: T_inter_A3, v_id: int): void {
  expect(v).assertEqual(check_values_3[v_id][0])
}

function check_as_type_T_diff_A3(v: T_diff_A3, v_id: int): void {
  expect(v).assertEqual(check_values_3[v_id][0])
}

function check3(v: T3, v_type: VarType, v_id: int): void {
  if (typeof v === 'bigint' || typeof v === 'number' || v === undefined) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_3[v_id][0])
    check_as_type_T_inter_A3(v as T_inter_A3, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_3[v_id][0])
    check_as_type_T_diff_A3(v as T_diff_A3, v_id)
  }
}

// ----------------- testPredefinedInFn0005 -----------------
type T4 = Object | undefined | null
type A4 = Object
type T_inter_A4 = Object
type T_diff_A4 = undefined | null

type CheckValueData4 = [T4, VarType]

let check_values_4: ReadonlyArray<CheckValueData4> = [
  [5n, VarType.T_inter_A],
  [123, VarType.T_inter_A],
  ["abc", VarType.T_inter_A],
  [c'a', VarType.T_inter_A],
[undefined, VarType.T_diff_A],
[null, VarType.T_diff_A]
]
const check_values_number_4: int = 6

function check_as_type_T_inter_A4(v: T_inter_A4, v_id: int): void {
  expect(v).assertEqual(check_values_4[v_id][0])
}

function check_as_type_T_diff_A4(v: T_diff_A4, v_id: int): void {
  expect(v).assertEqual(check_values_4[v_id][0])
}

function check4(v: T4, v_type: VarType, v_id: int): void {
  if (v instanceof Object) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_4[v_id][0])
    check_as_type_T_inter_A4(v as T_inter_A4, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_4[v_id][0])
    check_as_type_T_diff_A4(v as T_diff_A4, v_id)
  }
}

// ----------------- testPredefinedInFn0006 -----------------
type T5 = Object | undefined | null
type A5 = undefined | null
type T_inter_A5 = undefined | null
type T_diff_A5 = Object

type CheckValueData5 = [T5, VarType]

let check_values_5: ReadonlyArray<CheckValueData5> = [
  [undefined, VarType.T_inter_A],
  [null, VarType.T_inter_A],
  [5n, VarType.T_diff_A],
  [123, VarType.T_diff_A],
  ["abc", VarType.T_diff_A],
  [c'a', VarType.T_diff_A]
]
const check_values_number_5: int = 6

function check_as_type_T_inter_A5(v: T_inter_A5, v_id: int): void {
  expect(v).assertEqual(check_values_5[v_id][0])
}

function check_as_type_T_diff_A5(v: T_diff_A5, v_id: int): void {
  expect(v).assertEqual(check_values_5[v_id][0])
}

function check5(v: T5, v_type: VarType, v_id: int): void {
  if (v === undefined || v === null) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_5[v_id][0])
    check_as_type_T_inter_A5(v as T_inter_A5, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_5[v_id][0])
    check_as_type_T_diff_A5(v as T_diff_A5, v_id)
  }
}

// ----------------- testPredefinedInFn0007 -----------------
type T6 = int | bigint | boolean | string
type A6 = string | bigint
type T_inter_A6 = string | bigint
type T_diff_A6 = int | boolean

type CheckValueData6 = [T6, VarType]

let check_values_6: ReadonlyArray<CheckValueData6> = [
  ["abc", VarType.T_inter_A],
  [5n, VarType.T_inter_A],
  [true, VarType.T_diff_A],
  [123, VarType.T_diff_A]
]
const check_values_number_6: int = 4

function check_as_type_T_inter_A6(v: T_inter_A6, v_id: int): void {
  expect(v).assertEqual(check_values_6[v_id][0])
}

function check_as_type_T_diff_A6(v: T_diff_A6, v_id: int): void {
  expect(v).assertEqual(check_values_6[v_id][0])
}

function check6(v: T6, v_type: VarType, v_id: int): void {
  if (typeof v === 'string' || typeof v === 'bigint') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_6[v_id][0])
    check_as_type_T_inter_A6(v as T_inter_A6, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_6[v_id][0])
    check_as_type_T_diff_A6(v as T_diff_A6, v_id)
  }
}

// ----------------- testPredefinedInFn0008 -----------------
type T7 = bigint | int
type A7 = int
type T_inter_A7 = int
type T_diff_A7 = bigint

type CheckValueData7 = [T7, VarType]

let check_values_7: ReadonlyArray<CheckValueData7> = [
  [123, VarType.T_inter_A],
  [567, VarType.T_inter_A],
  [5n, VarType.T_diff_A],
  [723n, VarType.T_diff_A]
]
const check_values_number_7: int = 4

function check_as_type_T_inter_A7(v: T_inter_A7, v_id: int): void {
  expect(v).assertEqual(check_values_7[v_id][0])
}

function check7(v: T7, v_type: VarType, v_id: int): void {
  // ArkTS 的 typeof 会直接返回精确定义的底层类型
  if (typeof v === 'int') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_7[v_id][0])
    check_as_type_T_inter_A7(v as T_inter_A7, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_7[v_id][0])
    expect(v as bigint).assertEqual(check_values_7[v_id][0])
  }
}

// ----------------- testPredefinedInFn0009 -----------------
type T8 = bigint | long
type A8 = long
type T_inter_A8 = long
type T_diff_A8 = bigint

type CheckValueData8 = [T8, VarType]

let check_values_8: ReadonlyArray<CheckValueData8> = [
  [123 as long, VarType.T_inter_A],
  [567 as long, VarType.T_inter_A],
  [5n, VarType.T_diff_A],
  [723n, VarType.T_diff_A]
]
const check_values_number_8: int = 4

function check_as_type_T_inter_A8(v: T_inter_A8, v_id: int): void {
  expect(v).assertEqual(check_values_8[v_id][0])
}

function check_as_type_T_diff_A8(v: T_diff_A8, v_id: int): void {
  expect(v).assertEqual(check_values_8[v_id][0])
}

function check8(v: T8, v_type: VarType, v_id: int): void {
  if (typeof v === 'long') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_8[v_id][0])
    check_as_type_T_inter_A8(v as T_inter_A8, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_8[v_id][0])
    check_as_type_T_diff_A8(v as T_diff_A8, v_id)
  }
}

// ----------------- testPredefinedInFn0010 -----------------
type T9 = bigint | byte
type A9 = byte
type T_inter_A9 = byte
type T_diff_A9 = bigint

type CheckValueData9 = [T9, VarType]

let check_values_9: ReadonlyArray<CheckValueData9> = [
  [5 as byte, VarType.T_inter_A],
  [7 as byte, VarType.T_inter_A],
  [5n, VarType.T_diff_A],
  [723n, VarType.T_diff_A]
]
const check_values_number_9: int = 4

function check_as_type_T_inter_A9(v: T_inter_A9, v_id: int): void {
  expect(v).assertEqual(check_values_9[v_id][0])
}

function check_as_type_T_diff_A9(v: T_diff_A9, v_id: int): void {
  expect(v).assertEqual(check_values_9[v_id][0])
}

function check9(v: T9, v_type: VarType, v_id: int): void {
  if (typeof v === 'byte') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_9[v_id][0])
    check_as_type_T_inter_A9(v as T_inter_A9, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_9[v_id][0])
    check_as_type_T_diff_A9(v as T_diff_A9, v_id)
  }
}

// ----------------- testPredefinedInFn0011 -----------------
type T10 = bigint | short
type A10 = short
type T_inter_A10 = short
type T_diff_A10 = bigint

type CheckValueData10 = [T10, VarType]

let check_values_10: ReadonlyArray<CheckValueData10> = [
  [17 as short, VarType.T_inter_A],
  [128 as short, VarType.T_inter_A],
  [5n, VarType.T_diff_A],
  [723n, VarType.T_diff_A]
]
const check_values_number_10: int = 4

function check_as_type_T_inter_A10(v: T_inter_A10, v_id: int): void {
  expect(v).assertEqual(check_values_10[v_id][0])
}

function check_as_type_T_diff_A10(v: T_diff_A10, v_id: int): void {
  expect(v).assertEqual(check_values_10[v_id][0])
}

function check10(v: T10, v_type: VarType, v_id: int): void {
  if (typeof v === 'short') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_10[v_id][0])
    check_as_type_T_inter_A10(v as T_inter_A10, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_10[v_id][0])
    check_as_type_T_diff_A10(v as T_diff_A10, v_id)
  }
}

// ----------------- testPredefinedInFn0012 -----------------
type T11 = bigint | double
type A11 = double
type T_inter_A11 = double
type T_diff_A11 = bigint

type CheckValueData11 = [T11, VarType]

let check_values_11: ReadonlyArray<CheckValueData11> = [
  [1.7, VarType.T_inter_A],
  [12.8, VarType.T_inter_A],
  [5n, VarType.T_diff_A],
  [723n, VarType.T_diff_A]
]
const check_values_number_11: int = 4

function check_as_type_T_inter_A11(v: T_inter_A11, v_id: int): void {
  expect(v).assertEqual(check_values_11[v_id][0])
}

function check_as_type_T_diff_A11(v: T_diff_A11, v_id: int): void {
  expect(v).assertEqual(check_values_11[v_id][0])
}

function check11(v: T11, v_type: VarType, v_id: int): void {
  if (typeof v === 'number') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_11[v_id][0])
    check_as_type_T_inter_A11(v as T_inter_A11, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_11[v_id][0])
    check_as_type_T_diff_A11(v as T_diff_A11, v_id)
  }
}

// ----------------- testPredefinedInFn0013 -----------------
type T12 = bigint | number
type A12 = number
type T_inter_A12 = number
type T_diff_A12 = bigint

type CheckValueData12 = [T12, VarType]

let check_values_12: ReadonlyArray<CheckValueData12> = [
  [1.7, VarType.T_inter_A],
  [12.8, VarType.T_inter_A],
  [5n, VarType.T_diff_A],
  [723n, VarType.T_diff_A]
]
const check_values_number_12: int = 4

function check_as_type_T_inter_A12(v: T_inter_A12, v_id: int): void {
  expect(v).assertEqual(check_values_12[v_id][0])
}

function check_as_type_T_diff_A12(v: T_diff_A12, v_id: int): void {
  expect(v).assertEqual(check_values_12[v_id][0])
}

function check12(v: T12, v_type: VarType, v_id: int): void {
  if (typeof v === 'number') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_12[v_id][0])
    check_as_type_T_inter_A12(v as T_inter_A12, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_12[v_id][0])
    check_as_type_T_diff_A12(v as T_diff_A12, v_id)
  }
}

// ----------------- testPredefinedInFn0014 -----------------
type T13 = bigint | float
type A13 = float
type T_inter_A13 = float
type T_diff_A13 = bigint

type CheckValueData13 = [T13, VarType]

let check_values_13: ReadonlyArray<CheckValueData13> = [
  [1.7f, VarType.T_inter_A], // 恢复 ArkTS 的 f 后缀浮点语法
  [12.8f, VarType.T_inter_A],
  [5n, VarType.T_diff_A],
  [723n, VarType.T_diff_A]
]
const check_values_number_13: int = 4

function check_as_type_T_inter_A13(v: T_inter_A13, v_id: int): void {
  expect(v).assertEqual(check_values_13[v_id][0])
}

function check_as_type_T_diff_A13(v: T_diff_A13, v_id: int): void {
  expect(v).assertEqual(check_values_13[v_id][0])
}

function check13(v: T13, v_type: VarType, v_id: int): void {
  if (typeof v === 'float') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_13[v_id][0])
    check_as_type_T_inter_A13(v as T_inter_A13, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_13[v_id][0])
    check_as_type_T_diff_A13(v as T_diff_A13, v_id)
  }
}

// ----------------- testPredefinedInFn0015 -----------------
type T14 = float | bigint
type A14 = bigint
type T_inter_A14 = bigint
type T_diff_A14 = float

type CheckValueData14 = [T14, VarType]

let check_values_14: ReadonlyArray<CheckValueData14> = [
  [5n, VarType.T_inter_A],
  [723n, VarType.T_inter_A],
  [1.7f, VarType.T_diff_A],
  [12.8f, VarType.T_diff_A]
]
const check_values_number_14: int = 4

function check_as_type_T_inter_A14(v: T_inter_A14, v_id: int): void {
  expect(v).assertEqual(check_values_14[v_id][0])
}

function check_as_type_T_diff_A14(v: T_diff_A14, v_id: int): void {
  expect(v).assertEqual(check_values_14[v_id][0])
}

function check14(v: T14, v_type: VarType, v_id: int): void {
  if (typeof v === 'bigint') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_14[v_id][0])
    check_as_type_T_inter_A14(v as T_inter_A14, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_14[v_id][0])
    check_as_type_T_diff_A14(v as T_diff_A14, v_id)
  }
}

// ----------------- testPredefinedInFn0016 -----------------
type T15 = float | string
type A15 = string
type T_inter_A15 = string
type T_diff_A15 = float

type CheckValueData15 = [T15, VarType]

let check_values_15: ReadonlyArray<CheckValueData15> = [
  ["abc", VarType.T_inter_A],
  ["efg", VarType.T_inter_A],
  [1.7f, VarType.T_diff_A],
  [12.8f, VarType.T_diff_A]
]
const check_values_number_15: int = 4

function check_as_type_T_inter_A15(v: T_inter_A15, v_id: int): void {
  expect(v).assertEqual(check_values_15[v_id][0])
}

function check_as_type_T_diff_A15(v: T_diff_A15, v_id: int): void {
  expect(v).assertEqual(check_values_15[v_id][0])
}

function check15(v: T15, v_type: VarType, v_id: int): void {
  if (typeof v === 'string') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_15[v_id][0])
    check_as_type_T_inter_A15(v as T_inter_A15, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_15[v_id][0])
    check_as_type_T_diff_A15(v as T_diff_A15, v_id)
  }
}

// ----------------- testPredefinedInFn0017 -----------------
type T16 = float | char
type A16 = char
type T_inter_A16 = char
type T_diff_A16 = float

type CheckValueData16 = [T16, VarType]

let check_values_16: ReadonlyArray<CheckValueData16> = [
  [c'a', VarType.T_inter_A],
[c'b', VarType.T_inter_A],
[1.7f, VarType.T_diff_A],
[12.8f, VarType.T_diff_A]
]
const check_values_number_16: int = 4

function check_as_type_T_inter_A16(v: T_inter_A16, v_id: int): void {
  expect(v).assertEqual(check_values_16[v_id][0])
}

function check_as_type_T_diff_A16(v: T_diff_A16, v_id: int): void {
  expect(v).assertEqual(check_values_16[v_id][0])
}

function check16(v: T16, v_type: VarType, v_id: int): void {
  if (typeof v === 'char') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_16[v_id][0])
    check_as_type_T_inter_A16(v as T_inter_A16, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_16[v_id][0])
    check_as_type_T_diff_A16(v as T_diff_A16, v_id)
  }
}

// ----------------- testPredefinedInFn0018 -----------------
type T17 = number | boolean
type A17 = boolean
type T_inter_A17 = boolean
type T_diff_A17 = number

type CheckValueData17 = [T17, VarType]

let check_values_17: ReadonlyArray<CheckValueData17> = [
  [true, VarType.T_inter_A],
  [false, VarType.T_inter_A],
  [1.7, VarType.T_diff_A],
  [12.8, VarType.T_diff_A]
]
const check_values_number_17: int = 4

function check_as_type_T_inter_A17(v: T_inter_A17, v_id: int): void {
  expect(v).assertEqual(check_values_17[v_id][0])
}

function check_as_type_T_diff_A17(v: T_diff_A17, v_id: int): void {
  expect(v).assertEqual(check_values_17[v_id][0])
}

function check17(v: T17, v_type: VarType, v_id: int): void {
  if (typeof v === 'boolean') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values_17[v_id][0])
    check_as_type_T_inter_A17(v as T_inter_A17, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values_17[v_id][0])
    check_as_type_T_diff_A17(v as T_diff_A17, v_id)
  }
}

export default function ComputingSmartTypesTest01():void {
  describe('ComputingSmartTypesTest01', () => {
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
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_0100
     * @tc.name      testPredefinedInFn0001
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_0.length; v_id++) {
        check0(check_values_0[v_id][0], check_values_0[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_0)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_0200
     * @tc.name      testPredefinedInFn0002
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_1.length; v_id++) {
        check1(check_values_1[v_id][0], check_values_1[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_1)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_0300
     * @tc.name      testPredefinedInFn0003
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_2.length; v_id++) {
        check2(check_values_2[v_id][0], check_values_2[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_2)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_0400
     * @tc.name      testPredefinedInFn0004
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_3.length; v_id++) {
        check3(check_values_3[v_id][0], check_values_3[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_3)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_0500
     * @tc.name      testPredefinedInFn0005
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_4.length; v_id++) {
        check4(check_values_4[v_id][0], check_values_4[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_4)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_0600
     * @tc.name      testPredefinedInFn0006
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_5.length; v_id++) {
        check5(check_values_5[v_id][0], check_values_5[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_5)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_0700
     * @tc.name      testPredefinedInFn0007
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_6.length; v_id++) {
        check6(check_values_6[v_id][0], check_values_6[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_6)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_0800
     * @tc.name      testPredefinedInFn0008
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_7.length; v_id++) {
        check7(check_values_7[v_id][0], check_values_7[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_7)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_0900
     * @tc.name      testPredefinedInFn0009
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_8.length; v_id++) {
        check8(check_values_8[v_id][0], check_values_8[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_8)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_1000
     * @tc.name      testPredefinedInFn0010
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_9.length; v_id++) {
        check9(check_values_9[v_id][0], check_values_9[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_9)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_1100
     * @tc.name      testPredefinedInFn0011
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_10.length; v_id++) {
        check10(check_values_10[v_id][0], check_values_10[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_10)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_1200
     * @tc.name      testPredefinedInFn0012
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_11.length; v_id++) {
        check11(check_values_11[v_id][0], check_values_11[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_11)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_1300
     * @tc.name      testPredefinedInFn0013
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_12.length; v_id++) {
        check12(check_values_12[v_id][0], check_values_12[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_12)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_1400
     * @tc.name      testPredefinedInFn0014
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_13.length; v_id++) {
        check13(check_values_13[v_id][0], check_values_13[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_13)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_1500
     * @tc.name      testPredefinedInFn0015
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_14.length; v_id++) {
        check14(check_values_14[v_id][0], check_values_14[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_14)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_1600
     * @tc.name      testPredefinedInFn0016
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_15.length; v_id++) {
        check15(check_values_15[v_id][0], check_values_15[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_15)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_1700
     * @tc.name      testPredefinedInFn0017
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_16.length; v_id++) {
        check16(check_values_16[v_id][0], check_values_16[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_16)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTONE_1800
     * @tc.name      testPredefinedInFn0018
     * @tc.desc      Checking branching on "v instanceof A" on predefined types in function call
     * and with smart type compatibility check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPredefinedInFn0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values_17.length; v_id++) {
        check17(check_values_17[v_id][0], check_values_17[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number_17)
    });
  })
}