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

namespace testNS1_1 {
  function check_1(v: Object,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof Object || v === undefined).assertEqual(is_subtype_of_A)
    if (v instanceof Object || v === undefined) {
      res = check_is_in_diff_type_1(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as Object).assertEqual(5n)
    }
    else {
      expect(v as Object).assertEqual(123)
    }
  }
  function check_is_in_diff_type_1(v: Object | undefined,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v === undefined) {
      let b: undefined = v as undefined
      check_value_1(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v === undefined).assertEqual(false)
    // 替换 expect(()=>...).assertEqual 为 try-catch
    let thrown = false;
    try {
      let b: undefined = v as undefined
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_1(): boolean {
    let v1: Object = 5n
    let v2: Object = 123
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS2_1 {
  function check_1(v: string,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof Object || v === undefined).assertEqual(is_subtype_of_A)
    if (v instanceof Object || v === undefined) {
      res = check_is_in_diff_type_1(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as string).assertEqual("abc")
    }
    else {
      expect(v as string).assertEqual("defg")
    }
  }
  function check_is_in_diff_type_1(v: Object | undefined,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v === undefined) {
      let b: undefined = v as undefined
      check_value_1(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v === undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: undefined = v as undefined
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_1(): boolean {
    let v1: string = "abc"
    let v2: string = "defg"
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS3_1 {
  function check_1(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof Object || v === undefined).assertEqual(is_subtype_of_A)
    if (v instanceof Object || v === undefined) {
      res = check_is_in_diff_type_1(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(456)
    }
  }
  function check_is_in_diff_type_1(v: Object | undefined,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v === undefined) {
      let b: undefined = v as undefined
      check_value_1(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v === undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: undefined = v as undefined
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_1(): boolean {
    let v1: number = 123
    let v2: number = 456
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS4_1 {
  function check_1(v: undefined,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof Object || v === undefined).assertEqual(is_subtype_of_A)
    if (v instanceof Object || v === undefined) {
      res = check_is_in_diff_type_1(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as undefined).assertEqual(undefined)
    }
    else {
      expect(v as undefined).assertEqual(undefined)
    }
  }
  function check_is_in_diff_type_1(v: Object | undefined,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v === undefined) {
      let b: undefined = v as undefined
      check_value_1(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v === undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: undefined = v as undefined
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_1(): boolean {
    let v1: undefined = undefined
    let v2: undefined = undefined
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_1 {
  function check_1(v: string | undefined,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof Object || v === undefined).assertEqual(is_subtype_of_A)
    if (v instanceof Object || v === undefined) {
      res = check_is_in_diff_type_1(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as string | undefined).assertEqual(undefined)
    }
    else {
      expect(v as string | undefined).assertEqual("abc")
    }
  }
  function check_is_in_diff_type_1(v: Object | undefined,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v === undefined) {
      let b: undefined = v as undefined
      check_value_1(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v === undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: undefined = v as undefined
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_1(): boolean {
    let v1: string | undefined = undefined
    let v2: string | undefined = "abc"
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS6_1 {
  function check_1(v: Any,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof Object || v === undefined).assertEqual(is_subtype_of_A)
    if (v instanceof Object || v === undefined) {
      res = check_is_in_diff_type_1(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as undefined).assertEqual(undefined)
    }
    else {
      expect(v as string).assertEqual("abc")
    }
  }
  function check_is_in_diff_type_1(v: Object | undefined,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v === undefined) {
      let b: undefined = v as undefined
      check_value_1(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v === undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: undefined = v as undefined
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_1(): boolean {
    let v1: Any = undefined
    let v2: Any = "abc"
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS7_1 {
  function check_1(v: null | number | object | undefined,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof Object || v === undefined).assertEqual(is_subtype_of_A)
    if (v instanceof Object || v === undefined) {
      res = check_is_in_diff_type_1(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: null | number | undefined | object, v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual(null)
    }
    else {
      expect(v).assertEqual(123)
    }
  }
  function check_is_in_diff_type_1(v: Object | undefined | null | number,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v === undefined) {
      let b: undefined = v as undefined
      check_value_1(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: null | number | object | undefined, v_id: number): void {
    check_value_1(v, v_id)
    expect(v === undefined).assertEqual(false)
    let thrown = false;
    try {
      let b: undefined = v as undefined
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_1(): boolean {
    let v1: Any = null
    let v2: Any = 123
    let res: boolean =
      check_1(v1, false, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

function check_1(v: Object,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof Object || v === undefined).assertEqual(is_subtype_of_A)
  if (v instanceof Object || v === undefined) {
    res = check_is_in_diff_type_1(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_1(v, v_id)
  }
  return res
}
function check_value_1(v: Any, v_id: number): void {
  if (v_id == 1) {
    expect(v as Object).assertEqual(5n)
  }
  else {
    expect(v as Object).assertEqual(123)
  }
}
function check_is_in_diff_type_1(v: Object | undefined,
  v_id: number): boolean {
  check_value_1(v, v_id)
  if (v === undefined) {
    let b: undefined = v as undefined
    check_value_1(b, v_id)
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_1(v: Any, v_id: number): void {
  check_value_1(v, v_id)
  expect(v === undefined).assertEqual(false)
  let thrown = false;
  try {
    let b: undefined = v as undefined
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}

namespace testNS1_2 {
  function check_2(v: Object,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(is_subtype_of_A).assertEqual(true)
    res = check_is_in_diff_type_2(v, v_id)
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }
  function check_value_2(v: string | number | undefined | null | object, v_id: number): void {
    if (v_id == 1) {
      expect(v as string).assertEqual("abc")
    }
    else {
      expect(v).assertEqual(123)
    }
  }
  function check_is_in_diff_type_2(v: string | number | undefined | null | object,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof undefined | string) {
      let b: undefined | string = v as undefined | string
      check_value_2(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_2(v: string | number | undefined | null | object, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof undefined | string).assertEqual(false)
    let thrown = false;
    try {
      let b: undefined | string = v as undefined | string
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_2(): boolean {
    let v1: Object = "abc"
    let v2: Object = 123
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_2 {
  function check_2(v: string,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(is_subtype_of_A).assertEqual(true)
    res = check_is_in_diff_type_2(v, v_id)
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }
  function check_value_2(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as string).assertEqual("abc")
    }
    else {
      expect(v as string).assertEqual("defg")
    }
  }
  function check_is_in_diff_type_2(v: Any,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof undefined | string) {
      let b: undefined | string = v as undefined | string
      check_value_2(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_2(v: Any, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof undefined | string).assertEqual(false)
    let thrown = false;
    try {
      let b: undefined | string = v as undefined | string
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_2(): boolean {
    let v1: string = "abc"
    let v2: string = "defg"
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_2 {
  function check_2(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(is_subtype_of_A).assertEqual(true)
    res = check_is_in_diff_type_2(v, v_id)
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }
  function check_value_2(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(456)
    }
  }
  function check_is_in_diff_type_2(v: Any,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof undefined | string) {
      let b: undefined | string = v as undefined | string
      check_value_2(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_2(v: Any, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof undefined | string).assertEqual(false)
    let thrown = false;
    try {
      let b: undefined | string = v as undefined | string
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_2(): boolean {
    let v1: number = 123
    let v2: number = 456
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS4_2 {
  function check_2(v: null,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(is_subtype_of_A).assertEqual(true)
    res = check_is_in_diff_type_2(v, v_id)
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }
  function check_value_2(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as null).assertEqual(null)
    }
    else {
      expect(v as null).assertEqual(null)
    }
  }
  function check_is_in_diff_type_2(v: Any,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof undefined | string) {
      let b: undefined | string = v as undefined | string
      check_value_2(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_2(v: Any, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof undefined | string).assertEqual(false)
    let thrown = false;
    try {
      let b: undefined | string = v as undefined | string
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_2(): boolean {
    let v1: null = null
    let v2: null = null
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS5_2 {
  function check_2(v: undefined,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(is_subtype_of_A).assertEqual(true)
    res = check_is_in_diff_type_2(v, v_id)
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }
  function check_value_2(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as undefined).assertEqual(undefined)
    }
    else {
      expect(v as undefined).assertEqual(undefined)
    }
  }
  function check_is_in_diff_type_2(v: Any,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof undefined | string) {
      let b: undefined | string = v as undefined | string
      check_value_2(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_2(v: Any, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof undefined | string).assertEqual(false)
    let thrown = false;
    try {
      let b: undefined | string = v as undefined | string
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_2(): boolean {
    let v1: undefined = undefined
    let v2: undefined = undefined
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS6_2 {
  function check_2(v: string | number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(is_subtype_of_A).assertEqual(true)
    res = check_is_in_diff_type_2(v, v_id)
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }
  function check_value_2(v: string | number | undefined, v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("abc")
    }
    else {
      expect(v).assertEqual(123)
    }
  }
  function check_is_in_diff_type_2(v: string | number,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof undefined | string) {
      let b: undefined | string = v as undefined | string
      check_value_2(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_2(v: string | number, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof undefined | string).assertEqual(false)
    let thrown = false;
    try {
      let b: undefined | string = v as undefined | string
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_2(): boolean {
    let v1: string | number = "abc"
    let v2: string | number = 123
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

function check_2(v: Object,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(is_subtype_of_A).assertEqual(true)
  res = check_is_in_diff_type_2(v, v_id)
  if (res) {
    check_is_not_in_B_type_2(v, v_id)
  }
  return res
}
function check_value_2(v: string | number | object | undefined | null, v_id: number): void {
  if (v_id == 1) {
    expect(v as string).assertEqual("abc")
  }
  else {
    expect(v).assertEqual(123)
  }
}
function check_is_in_diff_type_2(v: string | number | object | undefined | null,
  v_id: number): boolean {
  check_value_2(v, v_id)
  if (v instanceof undefined | string) {
    let b: undefined | string = v as undefined | string
    check_value_2(b, v_id)
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_2(v: string | number | object | undefined | null, v_id: number): void {
  check_value_2(v, v_id)
  expect(v instanceof undefined | string).assertEqual(false)
  let thrown = false;
  try {
    let b: undefined | string = v as undefined | string
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}

namespace testNS1_3 {
  function check_3(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(456)
    }
  }
  function check_is_in_diff_type_3(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_3(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: number = 123
    let v2: number = 456
    let res: boolean =
      check_3(v1, false, 1) &
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_3 {
  function check_3(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(456)
    }
  }
  function check_is_in_diff_type_3(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_3(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: number = 123
    let v2: number = 456
    let res: boolean =
      check_3(v1, false, 1) &
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_3 {
  function check_3(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(4)
    }
    else {
      expect(v as number).assertEqual(5)
    }
  }
  function check_is_in_diff_type_3(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_3(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: number = 4
    let v2: number = 5
    let res: boolean =
      check_3(v1, false, 1) &
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_3 {
  function check_3(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(456)
    }
  }
  function check_is_in_diff_type_3(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_3(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: number = 123
    let v2: number = 456
    let res: boolean =
      check_3(v1, false, 1) &
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_3 {
  function check_3(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(45.6)
    }
  }
  function check_is_in_diff_type_3(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_3(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: number = 123
    let v2: number = 45.6
    let res: boolean =
      check_3(v1, false, 1) &
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS6_3 {
  function check_3(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(45.6)
    }
  }
  function check_is_in_diff_type_3(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_3(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: number = 123
    let v2: number = 45.6
    let res: boolean =
      check_3(v1, false, 1) &
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS7_3 {
  function check_3(v: number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as number).assertEqual(123)
    }
    else {
      expect(v as number).assertEqual(45.6)
    }
  }
  function check_is_in_diff_type_3(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_3(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: number = 123
    let v2: number = 45.6
    let res: boolean =
      check_3(v1, false, 1) &
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS8_3 {
  function check_3(v: boolean,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
    if (v instanceof undefined | string | null | bigint) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      expect(v as boolean).assertEqual(false)
    }
    else {
      expect(v as boolean).assertEqual(true)
    }
  }
  function check_is_in_diff_type_3(v: undefined | string | null | bigint,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof bigint | number | null) {
      let b: bigint | number | null = v as bigint | number | null
      check_value_3(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof bigint | number | null).assertEqual(false)
    let thrown = false;
    try {
      let b: bigint | number | null = v as bigint | number | null
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: boolean = false
    let v2: boolean = true
    let res: boolean =
      check_3(v1, false, 1) &
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

function check_3(v: number,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
  if (v instanceof undefined | string | null | bigint) {
    res = check_is_in_diff_type_3(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_3(v, v_id)
  }
  return res
}
function check_value_3(v: Any, v_id: number): void {
  if (v_id == 1) {
    expect(v as number).assertEqual(123)
  }
  else {
    expect(v as number).assertEqual(456)
  }
}
function check_is_in_diff_type_3(v: undefined | string | null | bigint,
  v_id: number): boolean {
  check_value_3(v, v_id)
  if (v instanceof bigint | number | null) {
    let b: bigint | number | null = v as bigint | number | null
    check_value_3(b, v_id)
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_3(v: Any, v_id: number): void {
  check_value_3(v, v_id)
  expect(v instanceof bigint | number | null).assertEqual(false)
  let thrown = false;
  try {
    let b: bigint | number | null = v as bigint | number | null
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}

export default function TypeTIsSubOfDiffOnPredefinedTest(): void {
  describe('TypeTIsSubOfDiffOnPredefinedTest', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_PREDEFINED_0100
     * @tc.name      testTypeTIsSubOfDiffOnPredefined0001
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on predefined
    types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnPredefined0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Object = 5n
      let v2: Object = 123
      let res: boolean =
        check_1(v1, true, 1) &
        check_1(v2, true, 2)
      expect(res).assertEqual(true)

      expect(testNS1_1.runTest_1()).assertEqual(true)
      expect(testNS2_1.runTest_1()).assertEqual(true)
      expect(testNS3_1.runTest_1()).assertEqual(true)
      expect(testNS4_1.runTest_1()).assertEqual(true)
      expect(testNS5_1.runTest_1()).assertEqual(true)
      expect(testNS6_1.runTest_1()).assertEqual(true)
      expect(testNS7_1.runTest_1()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_PREDEFINED_0200
     * @tc.name      testTypeTIsSubOfDiffOnPredefined0002
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on predefined
    types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnPredefined0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let v1: Object = "abc"
      let v2: Object = 123
      let res: boolean =
        check_2(v1, true, 1) &
        check_2(v2, true, 2)
      expect(res).assertEqual(false)

      expect(testNS1_2.runTest_2()).assertEqual(true)
      expect(testNS2_2.runTest_2()).assertEqual(true)
      expect(testNS3_2.runTest_2()).assertEqual(true)
      expect(testNS4_2.runTest_2()).assertEqual(true)
      expect(testNS5_2.runTest_2()).assertEqual(true)
      expect(testNS6_2.runTest_2()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_PREDEFINED_0300
     * @tc.name      testTypeTIsSubOfDiffOnPredefined0003
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on predefined
    types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnPredefined0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let v1: number = 123
      let v2: number = 456
      let res: boolean =
        check_3(v1, false, 1) &
        check_3(v2, false, 2)
      expect(res).assertEqual(false)

      expect(testNS1_3.runTest_3()).assertEqual(true)
      expect(testNS2_3.runTest_3()).assertEqual(true)
      expect(testNS3_3.runTest_3()).assertEqual(true)
      expect(testNS4_3.runTest_3()).assertEqual(true)
      expect(testNS5_3.runTest_3()).assertEqual(true)
      expect(testNS6_3.runTest_3()).assertEqual(true)
      expect(testNS7_3.runTest_3()).assertEqual(true)
      expect(testNS8_3.runTest_3()).assertEqual(true)
    });
  })
}