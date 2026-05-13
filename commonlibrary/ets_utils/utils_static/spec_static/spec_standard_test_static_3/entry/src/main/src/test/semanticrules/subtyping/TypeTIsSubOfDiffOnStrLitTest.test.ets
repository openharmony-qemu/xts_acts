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
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}

namespace testNS1_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(456)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: number = 123
    let v2: number = 456
    let res: boolean =
      check(v1, true, 1) &
      check(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS2_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(4)
    }
    else {
      expect(v as number).assertEqual(5)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: number = 4
    let v2: number = 5
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(456)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: number = 123
    let v2: number = 456
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(45.6)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: number = 123
    let v2: number = 45.6
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: bigint,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as bigint).assertEqual(123n)
    }
    else {
      expect(v as bigint).assertEqual(456n)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: bigint = 123n
    let v2: bigint = 456n
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS6_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: string,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as string).assertEqual("abc")
    }
    else {
      expect(v as string).assertEqual("defg")
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: string = "abc"
    let v2: string = "defg"
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS7_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: string,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as string).assertEqual('a')
    }
    else {
      expect(v as string).assertEqual('b')
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: string = 'a'
    let v2: string = 'b'
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS8_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: Object,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as Object).assertEqual(5n)
    }
    else {
      expect(v as Object).assertEqual(123)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: Object = 5n
    let v2: Object = 123
    let res: boolean =
      check(v1, false, 1) &
      check(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS9_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: Object | undefined,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(5n)
    }
    else {
      expect(v as Object | undefined).assertEqual(undefined)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: Object | undefined = 5n
    let v2: Object | undefined = undefined
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS10_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: Object | undefined | null,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as Object | undefined | null).assertEqual(null)
    }
    else {
      expect(v as Object | undefined | null).assertEqual(undefined)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: Object | undefined | null = null
    let v2: Object | undefined | null = undefined
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS11_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: undefined,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as undefined).assertEqual(undefined)
    }
    else {
      expect(v as undefined).assertEqual(undefined)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: undefined = undefined
    let v2: undefined = undefined
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS12_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: object,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as object).assertEqual(5n)
    }
    else {
      expect(v as object).assertEqual(123)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: object = 5n
    let v2: object = 123
    let res: boolean =
      check(v1, false, 1) &
      check(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS13_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: "In Progress",
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as "In Progress").assertEqual("In Progress")
    }
    else {
      expect(v as "In Progress").assertEqual("In Progress")
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: "In Progress" = "In Progress"
    let v2: "In Progress" = "In Progress"
    let res: boolean =
      check(v1, true, 1) &
      check(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS14_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: "Done" | "On Review",
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as "Done" | "On Review").assertEqual("Done")
    }
    else {
      expect(v as "Done" | "On Review").assertEqual("On Review")
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: "Done" | "On Review" = "Done"
    let v2: "Done" | "On Review" = "On Review"
    let res: boolean =
      check(v1, true, 1) &
      check(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS15_1 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: "Done" | number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as "Done" | number).assertEqual("Done")
    }
    else {
      expect(v as "Done" | number).assertEqual(123)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: "Done" | number = "Done"
    let v2: "Done" | number = 123
    let res: boolean =
      check(v1, true, 1) &
      check(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS1_2 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(456)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: number = 123
    let v2: number = 456
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_2 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(45.6)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: number = 123
    let v2: number = 45.6
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_2 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(45.6)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: number = 123
    let v2: number = 45.6
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_2 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: boolean,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as boolean).assertEqual(false)
    }
    else {
      expect(v as boolean).assertEqual(true)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: boolean = false
    let v2: boolean = true
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

function check_1(v: number, flag: boolean, id: number): boolean {
  return testNS1_1.check(v, flag, id);
}
function check_2(v: number, flag: boolean, id: number): boolean {
  return testNS1_2.check(v, flag, id);
}

export default function TypeTIsSubOfDiffOnStrLitTest(): void {
  describe('TypeTIsSubOfDiffOnStrLitTest', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_STR_LIT_0100
     * @tc.name      testTypeTIsSubOfDiffOnStrLit0001
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
     *               of A, and no value belongs both to T and B in case of usage instanceof on literal
     *               union types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnStrLit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTypeTIsSubOfDiffOnStrLit0001';

      let v1: number = 123
      let v2: number = 456
      let res: boolean =
        check_1(v1, true, 1) &
        check_1(v2, true, 2)
      expect(res).assertEqual(true)

      expect(testNS1_1.runTest()).assertEqual(true)
      expect(testNS2_1.runTest()).assertEqual(true)
      expect(testNS3_1.runTest()).assertEqual(true)
      expect(testNS4_1.runTest()).assertEqual(true)
      expect(testNS5_1.runTest()).assertEqual(true)
      expect(testNS6_1.runTest()).assertEqual(true)
      expect(testNS7_1.runTest()).assertEqual(true)
      expect(testNS8_1.runTest()).assertEqual(true)
      expect(testNS9_1.runTest()).assertEqual(true)
      expect(testNS10_1.runTest()).assertEqual(true)
      expect(testNS11_1.runTest()).assertEqual(true)
      expect(testNS12_1.runTest()).assertEqual(true)
      expect(testNS13_1.runTest()).assertEqual(true)
      expect(testNS14_1.runTest()).assertEqual(true)
      expect(testNS15_1.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_STR_LIT_0200
     * @tc.name      testTypeTIsSubOfDiffOnStrLit0002
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
     *               of A, and no value belongs both to T and B in case of usage instanceof on literal
     *               union types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnStrLit0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTypeTIsSubOfDiffOnStrLit0002';

      let v1: number = 123
      let v2: number = 456
      let res: boolean =
        check_2(v1, false, 1) &
        check_2(v2, false, 2)
      expect(res).assertEqual(false)

      expect(testNS1_2.runTest()).assertEqual(true)
      expect(testNS2_2.runTest()).assertEqual(true)
      expect(testNS3_2.runTest()).assertEqual(true)
      expect(testNS4_2.runTest()).assertEqual(true)
    });
  })
}