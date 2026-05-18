'use static'
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

namespace testNS1_4 {
  function check_4(v: bigint,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_4(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_4(v, v_id)
    }
    return res
  }
  function check_value_4(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as bigint).assertEqual(123n)
    }
    else {
      expect(v as bigint).assertEqual(456n)
    }
  }
  function check_is_in_diff_type_4(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_4(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_4(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_4(v: Any, v_id: number): void {
    check_value_4(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    // 替换 expect(()=>...).assertEqual 为 try-catch
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_4(): boolean {
    let v1: bigint = 123n
    let v2: bigint = 456n
    let res: boolean =
      check_4(v1, true, 1) &
      check_4(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_4 {
  function check_4(v: string,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_4(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_4(v, v_id)
    }
    return res
  }
  function check_value_4(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as string).assertEqual("abc")
    }
    else {
      expect(v as string).assertEqual("defg")
    }
  }
  function check_is_in_diff_type_4(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_4(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_4(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_4(v: Any, v_id: number): void {
    check_value_4(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_4(): boolean {
    let v1: string = "abc"
    let v2: string = "defg"
    let res: boolean =
      check_4(v1, true, 1) &
      check_4(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS3_4 {
  function check_4(v: string,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined || v instanceof string || v === null || v instanceof bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined || v instanceof string || v === null || v instanceof bigint) {
      res = check_is_in_diff_type_4(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_4(v, v_id)
    }
    return res
  }
  function check_value_4(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as string).assertEqual('a')
    }
    else {
      expect(v as string).assertEqual('b')
    }
  }
  function check_is_in_diff_type_4(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_4(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_4(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_4(v: Any, v_id: number): void {
    check_value_4(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_4(): boolean {
    let v1: string = 'a'
    let v2: string = 'b'
    let res: boolean =
      check_4(v1, true, 1) &
      check_4(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS4_4 {
  function check_4(v: Object,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_4(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_4(v, v_id)
    }
    return res
  }
  function check_value_4(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as Object).assertEqual(5n)
    }
    else {
      expect(v as Object).assertEqual(123)
    }
  }
  function check_is_in_diff_type_4(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_4(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_4(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_4(v: Any, v_id: number): void {
    check_value_4(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_4(): boolean {
    let v1: Object = 5n
    let v2: Object = 123
    let res: boolean =
      check_4(v1, true, 1) &
      check_4(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_4 {
  function check_4(v: Object | undefined,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_4(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_4(v, v_id)
    }
    return res
  }
  function check_value_4(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(5n)
    }
    else {
      expect(v as Object | undefined).assertEqual(undefined)
    }
  }
  function check_is_in_diff_type_4(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_4(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_4(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_4(v: Any, v_id: number): void {
    check_value_4(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_4(): boolean {
    let v1: Object | undefined = 5n
    let v2: Object | undefined = undefined
    let res: boolean =
      check_4(v1, true, 1) &
      check_4(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS6_4 {
  function check_4(v: Object | undefined | null,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_4(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_4(v, v_id)
    }
    return res
  }
  function check_value_4(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as Object | undefined | null).assertEqual(null)
    }
    else {
      expect(v as Object | undefined | null).assertEqual(undefined)
    }
  }
  function check_is_in_diff_type_4(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_4(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_4(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_4(v: Any, v_id: number): void {
    check_value_4(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_4(): boolean {
    let v1: Object | undefined | null = null
    let v2: Object | undefined | null = undefined
    let res: boolean =
      check_4(v1, true, 1) &
      check_4(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS7_4 {
  function check_4(v: undefined,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_4(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_4(v, v_id)
    }
    return res
  }
  function check_value_4(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as undefined).assertEqual(undefined)
    }
    else {
      expect(v as undefined).assertEqual(undefined)
    }
  }
  function check_is_in_diff_type_4(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_4(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_4(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_4(v: Any, v_id: number): void {
    check_value_4(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_4(): boolean {
    let v1: undefined = undefined
    let v2: undefined = undefined
    let res: boolean =
      check_4(v1, true, 1) &
      check_4(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS8_4 {
  function check_4(v: string | undefined,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_4(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_4(v, v_id)
    }
    return res
  }
  function check_value_4(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as string | undefined).assertEqual(undefined)
    }
    else {
      expect(v as string | undefined).assertEqual("abc")
    }
  }
  function check_is_in_diff_type_4(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_4(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_4(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_4(v: Any, v_id: number): void {
    check_value_4(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_4(): boolean {
    let v1: string | undefined = undefined
    let v2: string | undefined = "abc"
    let res: boolean =
      check_4(v1, true, 1) &
      check_4(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS9_4 {
  function check_4(v: Any,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_4(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_4(v, v_id)
    }
    return res
  }
  function check_value_4(v: Any, v_id: number): void {
    if (v_id == 1) {
      // 修改：期望值 5n 是 bigint，所以断言为 bigint
      expect(v as bigint).assertEqual(5n)
    }
    else {
      // 修改：期望值 "abc" 是 string
      expect(v as string).assertEqual("abc")
    }
  }
  function check_is_in_diff_type_4(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_4(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_4(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_4(v: Any, v_id: number): void {
    check_value_4(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_4(): boolean {
    let v1: Any = 5n
    let v2: Any = "abc"
    let res: boolean =
      check_4(v1, true, 1) &
      check_4(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

function check_4(v: bigint,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof undefined || v instanceof string || v instanceof null || v instanceof bigint).assertEqual(is_subtype_of_A)
  if (v instanceof undefined || v instanceof string || v instanceof null || v instanceof bigint) {
    res = check_is_in_diff_type_4(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_4(v, v_id)
  }
  return res
}
function check_value_4(v: Any, v_id: number): void {
  if (v_id == 1) {
    expect(v as bigint).assertEqual(123n)
  }
  else {
    expect(v as bigint).assertEqual(456n)
  }
}
function check_is_in_diff_type_4(v: undefined | string | null | bigint,
  v_id: number): boolean {
  check_value_4(v, v_id)
  if (v instanceof bigint | number | null) {
    let b: bigint | number | null = v as bigint | number | null
    check_value_4(b, v_id)
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_4(v: Any, v_id: number): void {
  check_value_4(v, v_id)
  expect(v instanceof bigint | number | null).assertEqual(false)
  let thrown = false;
  try {
    let b: bigint | number | null = v as bigint | number | null
  } catch(e) {
    thrown = true;
    expect(e instanceof Error).assertEqual(true);
  }
  expect(thrown).assertEqual(true);
}

namespace testNS1_5 {
  function check_5(v: Object,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | number | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | number | null | bigint) {
      res = check_is_in_diff_type_5(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_5(v, v_id)
    }
    return res
  }
  function check_value_5(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as Object).assertEqual(5n)
    }
    else {
      expect(v as Object).assertEqual(123)
    }
  }
  function check_is_in_diff_type_5(v: undefined | number | null | bigint,
    v_id: number): boolean {
    check_value_5(v, v_id)
    if (v instanceof bigint | string | undefined) {
      let b: bigint | string | undefined = v as bigint | string | undefined
      check_value_5(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_5(v: Any, v_id: number): void {
    check_value_5(v, v_id)
    expect(v instanceof bigint | string | undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | string | undefined = v as bigint | string | undefined
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_5(): boolean {
    let v1: Object = 5n
    let v2: Object = 123
    let res: boolean =
      check_5(v1, true, 1) &
      check_5(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_5 {
  function check_5(v: string,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | number | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | number | null | bigint) {
      res = check_is_in_diff_type_5(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_5(v, v_id)
    }
    return res
  }
  function check_value_5(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as string).assertEqual("abc")
    }
    else {
      expect(v as string).assertEqual("defg")
    }
  }
  function check_is_in_diff_type_5(v: undefined | number | null | bigint,
    v_id: number): boolean {
    check_value_5(v, v_id)
    if (v instanceof bigint | string | undefined) {
      let b: bigint | string | undefined = v as bigint | string | undefined
      check_value_5(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_5(v: Any, v_id: number): void {
    check_value_5(v, v_id)
    expect(v instanceof bigint | string | undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | string | undefined = v as bigint | string | undefined
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_5(): boolean {
    let v1: string = "abc"
    let v2: string = "defg"
    let res: boolean =
      check_5(v1, false, 1) &
      check_5(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_5 {
  function check_5(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | number | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | number | null | bigint) {
      res = check_is_in_diff_type_5(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_5(v, v_id)
    }
    return res
  }
  function check_value_5(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(45.6)
    }
  }
  function check_is_in_diff_type_5(v: undefined | number | null | bigint,
    v_id: number): boolean {
    check_value_5(v, v_id)
    if (v instanceof bigint | string | undefined) {
      let b: bigint | string | undefined = v as bigint | string | undefined
      check_value_5(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_5(v: Any, v_id: number): void {
    check_value_5(v, v_id)
    expect(v instanceof bigint | string | undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | string | undefined = v as bigint | string | undefined
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_5(): boolean {
    let v1: number = 123
    let v2: number = 45.6
    let res: boolean =
      check_5(v1, true, 1) &
      check_5(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS4_5 {
  function check_5(v: undefined,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | number | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | number | null | bigint) {
      res = check_is_in_diff_type_5(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_5(v, v_id)
    }
    return res
  }
  function check_value_5(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as undefined).assertEqual(undefined)
    }
    else {
      expect(v as undefined).assertEqual(undefined)
    }
  }
  function check_is_in_diff_type_5(v: undefined | number | null | bigint,
    v_id: number): boolean {
    check_value_5(v, v_id)
    if (v instanceof bigint | string | undefined) {
      let b: bigint | string | undefined = v as bigint | string | undefined
      check_value_5(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_5(v: Any, v_id: number): void {
    check_value_5(v, v_id)
    expect(v instanceof bigint | string | undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | string | undefined = v as bigint | string | undefined
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_5(): boolean {
    let v1: undefined = undefined
    let v2: undefined = undefined
    let res: boolean =
      check_5(v1, true, 1) &
      check_5(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_5 {
  function check_5(v: string | undefined,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | number | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | number | null | bigint) {
      res = check_is_in_diff_type_5(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_5(v, v_id)
    }
    return res
  }
  function check_value_5(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as string | undefined).assertEqual(undefined)
    }
    else {
      expect(v as string | undefined).assertEqual("abc")
    }
  }
  function check_is_in_diff_type_5(v: undefined | number | null | bigint,
    v_id: number): boolean {
    check_value_5(v, v_id)
    if (v instanceof bigint | string | undefined) {
      let b: bigint | string | undefined = v as bigint | string | undefined
      check_value_5(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_5(v: Any, v_id: number): void {
    check_value_5(v, v_id)
    expect(v instanceof bigint | string | undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | string | undefined = v as bigint | string | undefined
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_5(): boolean {
    let v1: string | undefined = undefined
    let v2: string | undefined = "abc"
    let res: boolean =
      check_5(v1, true, 1) &
      check_5(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS6_5 {
  function check_5(v: null | number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | number | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | number | null | bigint) {
      res = check_is_in_diff_type_5(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_5(v, v_id)
    }
    return res
  }
  function check_value_5(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as null | number).assertEqual(null)
    }
    else {
      expect(v as null | number).assertEqual(5.7)
    }
  }
  function check_is_in_diff_type_5(v: undefined | number | null | bigint,
    v_id: number): boolean {
    check_value_5(v, v_id)
    if (v instanceof bigint | string | undefined) {
      let b: bigint | string | undefined = v as bigint | string | undefined
      check_value_5(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_5(v: Any, v_id: number): void {
    check_value_5(v, v_id)
    expect(v instanceof bigint | string | undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | string | undefined = v as bigint | string | undefined
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_5(): boolean {
    let v1: null | number = null
    let v2: null | number = 5.7
    let res: boolean =
      check_5(v1, true, 1) &
      check_5(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS7_5 {
  function check_5(v: Any,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | number | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | number | null | bigint) {
      res = check_is_in_diff_type_5(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_5(v, v_id)
    }
    return res
  }
  function check_value_5(v: Any, v_id: number): void {
    if (v_id == 1) {
      // 修改：期望值 5n 是 bigint
      expect(v as bigint).assertEqual(5n)
    }
    else {
      // 修改：期望值 undefined
      expect(v as undefined).assertEqual(undefined)
    }
  }
  function check_is_in_diff_type_5(v: undefined | number | null | bigint,
    v_id: number): boolean {
    check_value_5(v, v_id)
    if (v instanceof bigint | string | undefined) {
      let b: bigint | string | undefined = v as bigint | string | undefined
      check_value_5(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_5(v: Any, v_id: number): void {
    check_value_5(v, v_id)
    expect(v instanceof bigint | string | undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | string | undefined = v as bigint | string | undefined
    } catch(e) {
      thrown = true;
      expect(e instanceof Error).assertEqual(true);
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_5(): boolean {
    let v1: Any = 5n
    let v2: Any = undefined
    let res: boolean =
      check_5(v1, true, 1) &
      check_5(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

function check_5(v: Object,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof undefined | number | null | bigint).assertEqual(is_subtype_of_A)
  if (v instanceof undefined | number | null | bigint) {
    res = check_is_in_diff_type_5(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_5(v, v_id)
  }
  return res
}
function check_value_5(v: Any, v_id: number): void {
  if (v_id == 1) {
    expect(v as Object).assertEqual(5n)
  }
  else {
    expect(v as Object).assertEqual(123)
  }
}
function check_is_in_diff_type_5(v: undefined | number | null | bigint,
  v_id: number): boolean {
  check_value_5(v, v_id)
  if (v instanceof bigint | string | undefined) {
    let b: bigint | string | undefined = v as bigint | string | undefined
    check_value_5(b, v_id)
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_5(v: Any, v_id: number): void {
  check_value_5(v, v_id)
  expect(v instanceof bigint | string | undefined).assertEqual(false)
  let thrown = false;
  try {
    let b: bigint | string | undefined = v as bigint | string | undefined
  } catch(e) {
    thrown = true;
    expect(e instanceof Error).assertEqual(true);
  }
  expect(thrown).assertEqual(true);
}

export default function TypeTIsSubOfDiffOnPredefinedTest01(): void {
  describe('TypeTIsSubOfDiffOnPredefinedTest01', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_PREDEFINED_0400
     * @tc.name      testTypeTIsSubOfDiffOnPredefined0004
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on predefined
    types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnPredefined0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: bigint = 123n
      let v2: bigint = 456n
      let res: boolean =
        check_4(v1, true, 1) &
        check_4(v2, true, 2)
      expect(res).assertEqual(false)

      expect(testNS1_4.runTest_4()).assertEqual(true)
      expect(testNS2_4.runTest_4()).assertEqual(true)
      expect(testNS3_4.runTest_4()).assertEqual(true)
      expect(testNS4_4.runTest_4()).assertEqual(true)
      expect(testNS5_4.runTest_4()).assertEqual(true)
      expect(testNS6_4.runTest_4()).assertEqual(true)
      expect(testNS7_4.runTest_4()).assertEqual(true)
      expect(testNS8_4.runTest_4()).assertEqual(true)
      expect(testNS9_4.runTest_4()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_PREDEFINED_0500
     * @tc.name      testTypeTIsSubOfDiffOnPredefined0005
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on predefined
    types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnPredefined0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let v1: Object = 5n
      let v2: Object = 123
      let res: boolean =
        check_5(v1, true, 1) &
        check_5(v2, false, 2)
      expect(res).assertEqual(false)

      expect(testNS1_5.runTest_5()).assertEqual(true)
      expect(testNS2_5.runTest_5()).assertEqual(true)
      expect(testNS3_5.runTest_5()).assertEqual(true)
      expect(testNS4_5.runTest_5()).assertEqual(true)
      expect(testNS5_5.runTest_5()).assertEqual(true)
      expect(testNS6_5.runTest_5()).assertEqual(true)
      expect(testNS7_5.runTest_5()).assertEqual(true)
    });
  })
}