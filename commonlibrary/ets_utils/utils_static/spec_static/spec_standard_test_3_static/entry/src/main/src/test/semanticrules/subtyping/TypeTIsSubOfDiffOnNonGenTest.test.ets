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
  class Animal_1 {}
  class Cat_1 extends Animal_1 {v: string = "cat"}
  class Dog_1 extends Animal_1 {v: bigint = 123n}
  class Frog_1 extends Animal_1 {v: number = 5}
  function check_cat_1(a: Any) {
    expect(a instanceof Cat_1).assertEqual(true)
    expect((a as Cat_1).v).assertEqual("cat")
  }
  function check_dog_1(a: Any) {
    expect(a instanceof Dog_1).assertEqual(true)
    expect((a as Dog_1).v).assertEqual(123n)
  }
  function check_frog_1(a: Any) {
    expect(a instanceof Frog_1).assertEqual(true)
    expect((a as Frog_1).v).assertEqual(5)
  }
  function check_number_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function check_int_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }
  function check_1(v: Cat_1 | Dog_1 | number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof Cat_1 || v instanceof Dog_1 || typeof v === 'number').assertEqual(is_subtype_of_A)
    if (v instanceof Cat_1 || v instanceof Dog_1 || typeof v === 'number') {
      res = check_is_in_diff_type_1(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_int_1(v)
    }
    else {
      check_dog_1(v)
    }
  }
  function check_is_in_diff_type_1(v: Cat_1 | Dog_1 | number,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v instanceof number | Dog_1) {
      let b: number | Dog_1 = v as number | Dog_1
      check_value_1(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v instanceof number | Dog_1).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    // 替换 expectThrow 为 try-catch
    let thrown = false;
    try {
      let b: number | Dog_1 = v as number | Dog_1
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_1(): boolean {
    let v1: Cat_1 | Dog_1 | number = 123
    let v2: Cat_1 | Dog_1 | number = new Dog_1()
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_1 {
  class Animal_1 {}
  class Cat_1 extends Animal_1 {v: string = "cat"}
  class Dog_1 extends Animal_1 {v: bigint = 123n}
  class Frog_1 extends Animal_1 {v: number = 5}
  function check_cat_1(a: Any) {
    expect(a instanceof Cat_1).assertEqual(true)
    expect((a as Cat_1).v).assertEqual("cat")
  }
  function check_dog_1(a: Any) {
    expect(a instanceof Dog_1).assertEqual(true)
    expect((a as Dog_1).v).assertEqual(123n)
  }
  function check_frog_1(a: Any) {
    expect(a instanceof Frog_1).assertEqual(true)
    expect((a as Frog_1).v).assertEqual(5)
  }
  function check_number_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function check_int_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }
  function check_1(v: Animal_1 | number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof Cat_1 || v instanceof Dog_1 || typeof v === 'number').assertEqual(is_subtype_of_A)
    if (v instanceof Cat_1 || v instanceof Dog_1 || typeof v === 'number') {
      res = check_is_in_diff_type_1(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_number_1(v)
    }
    else {
      check_frog_1(v)
    }
  }
  function check_is_in_diff_type_1(v: Animal_1 | number,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v instanceof number | Dog_1) {
      let b: number | Dog_1 = v as number | Dog_1
      check_value_1(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v instanceof number | Dog_1).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: number | Dog_1 = v as number | Dog_1
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_1(): boolean {
    let v1: Animal_1 | number = 7.8
    let v2: Animal_1 | number = new Frog_1()
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_1 {
  class Animal_1 {}
  class Cat_1 extends Animal_1 {v: string = "cat"}
  class Dog_1 extends Animal_1 {v: bigint = 123n}
  class Frog_1 extends Animal_1 {v: number = 5}
  function check_cat_1(a: Any) {
    expect(a instanceof Cat_1).assertEqual(true)
    expect((a as Cat_1).v).assertEqual("cat")
  }
  function check_dog_1(a: Any) {
    expect(a instanceof Dog_1).assertEqual(true)
    expect((a as Dog_1).v).assertEqual(123n)
  }
  function check_frog_1(a: Any) {
    expect(a instanceof Frog_1).assertEqual(true)
    expect((a as Frog_1).v).assertEqual(5)
  }
  function check_number_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function check_int_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }
  function check_1(v: Cat_1,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof Cat_1 | Dog_1 | number).assertEqual(is_subtype_of_A)
    if (v instanceof Cat_1 | Dog_1 | number) {
      res = check_is_in_diff_type_1(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_cat_1(v)
    }
    else {
      check_cat_1(v)
    }
  }
  function check_is_in_diff_type_1(v: Cat_1 | Dog_1 | number,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v instanceof number | Dog_1) {
      let b: number | Dog_1 = v as number | Dog_1
      check_value_1(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v instanceof number | Dog_1).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: number | Dog_1 = v as number | Dog_1
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_1(): boolean {
    let v1: Cat_1 = new Cat_1()
    let v2: Cat_1 = new Cat_1()
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS4_1 {
  class Animal_1 {}
  class Cat_1 extends Animal_1 {v: string = "cat"}
  class Dog_1 extends Animal_1 {v: bigint = 123n}
  class Frog_1 extends Animal_1 {v: number = 5}
  function check_cat_1(a: Any) {
    expect(a instanceof Cat_1).assertEqual(true)
    expect((a as Cat_1).v).assertEqual("cat")
  }
  function check_dog_1(a: Any) {
    expect(a instanceof Dog_1).assertEqual(true)
    expect((a as Dog_1).v).assertEqual(123n)
  }
  function check_frog_1(a: Any) {
    expect(a instanceof Frog_1).assertEqual(true)
    expect((a as Frog_1).v).assertEqual(5)
  }
  function check_number_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function check_int_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }
  function check_1(v: Cat_1 | Frog_1,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof Cat_1 | Dog_1 | number).assertEqual(is_subtype_of_A)
    if (v instanceof Cat_1 | Dog_1 | number) {
      res = check_is_in_diff_type_1(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_cat_1(v)
    }
    else {
      check_frog_1(v)
    }
  }
  function check_is_in_diff_type_1(v: Cat_1 | Dog_1 | number,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v instanceof number | Dog_1) {
      let b: number | Dog_1 = v as number | Dog_1
      check_value_1(b, v_id)
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v instanceof number | Dog_1).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: number | Dog_1 = v as number | Dog_1
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_1(): boolean {
    let v1: Cat_1 | Frog_1 = new Cat_1()
    let v2: Cat_1 | Frog_1 = new Frog_1()
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

class Animal_1 {}
class Cat_1 extends Animal_1 {v: string = "cat"}
class Dog_1 extends Animal_1 {v: bigint = 123n}
class Frog_1 extends Animal_1 {v: number = 5}
function check_cat_1(a: Any) {
  expect(a instanceof Cat_1).assertEqual(true)
  expect((a as Cat_1).v).assertEqual("cat")
}
function check_dog_1(a: Any) {
  expect(a instanceof Dog_1).assertEqual(true)
  expect((a as Dog_1).v).assertEqual(123n)
}
function check_frog_1(a: Any) {
  expect(a instanceof Frog_1).assertEqual(true)
  expect((a as Frog_1).v).assertEqual(5)
}
function check_number_1(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function check_int_1(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(123)
}
function check_1(v: Cat_1 | Dog_1 | number,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof Cat_1 || v instanceof Dog_1 || typeof v === 'number').assertEqual(is_subtype_of_A)
  if (v instanceof Cat_1 | Dog_1 | number) {
    res = check_is_in_diff_type_1(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_1(v, v_id)
  }
  return res
}
function check_value_1(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_int_1(v)
  }
  else {
    check_dog_1(v)
  }
}
function check_is_in_diff_type_1(v: Cat_1 | Dog_1 | number,
  v_id: number): boolean {
  check_value_1(v, v_id)
  if (v instanceof number | Dog_1) {
    let b: number | Dog_1 = v as number | Dog_1
    check_value_1(b, v_id)
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_1(v: Any, v_id: number): void {
  check_value_1(v, v_id)
  expect(v instanceof number | Dog_1).assertEqual(false)
  let expectedError = (e: Error): boolean => {
    return (e instanceof Error)
  }
  let thrown = false;
  try {
    let b: number | Dog_1 = v as number | Dog_1
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}

namespace testNS1_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 {v: bigint = 123n}
  class C1_2 extends B1_2 {v: number = 321}
  class C2_2 extends B1_2 {v: number = 6.7}
  class Other_2 {v: string = "other"}

  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).v).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).v).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).v).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).v).assertEqual("other")
  }
  function check_int_2(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }

  function check_2(v: B2_2 | Other_2 | C1_2,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number).assertEqual(is_subtype_of_A)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
      res = check_is_in_diff_type_2(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }

  function check_value_2(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C1_2(v)
    } else {
      check_B2_2(v)
    }
  }

  function check_is_in_diff_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | number,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof B1_2 | Other_2) {
      let b: B1_2 | Other_2 = v as B1_2 | Other_2
      check_value_2(b, v_id)
      return false
    } else {
      return true
    }
  }

  function check_is_not_in_B_type_2(v: Any, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof B1_2 | Other_2).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: B1_2 | Other_2 = v as B1_2 | Other_2
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_2(): boolean {
    let v1: B2_2 | Other_2 | C1_2 = new C1_2()
    let v2: B2_2 | Other_2 | C1_2 = new B2_2()
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 {v: bigint = 123n}
  class C1_2 extends B1_2 {v: number = 321}
  class C2_2 extends B1_2 {v: number = 6.7}
  class Other_2 {v: string = "other"}

  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).v).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).v).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).v).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).v).assertEqual("other")
  }
  function check_int_2(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }

  function check_2(v: B1_2 | Other_2,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number).assertEqual(is_subtype_of_A)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
      res = check_is_in_diff_type_2(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }

  function check_value_2(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C1_2(v)
    } else {
      check_C2_2(v)
    }
  }

  function check_is_in_diff_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | number,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof B1_2 | Other_2) {
      let b: B1_2 | Other_2 = v as B1_2 | Other_2
      check_value_2(b, v_id)
      return false
    } else {
      return true
    }
  }

  function check_is_not_in_B_type_2(v: Any, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof B1_2 | Other_2).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: B1_2 | Other_2 = v as B1_2 | Other_2
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_2(): boolean {
    let v1: B1_2 | Other_2 = new C1_2()
    let v2: B1_2 | Other_2 = new C2_2()
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 {v: bigint = 123n}
  class C1_2 extends B1_2 {v: number = 321}
  class C2_2 extends B1_2 {v: number = 6.7}
  class Other_2 {v: string = "other"}

  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).v).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).v).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).v).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).v).assertEqual("other")
  }
  function check_int_2(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }

  function check_2(v: A_2 | Other_2,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number).assertEqual(is_subtype_of_A)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
      res = check_is_in_diff_type_2(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }

  function check_value_2(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C1_2(v)
    } else {
      check_Other_2(v)
    }
  }

  function check_is_in_diff_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | number,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof B1_2 | Other_2) {
      let b: B1_2 | Other_2 = v as B1_2 | Other_2
      check_value_2(b, v_id)
      return false
    } else {
      return true
    }
  }

  function check_is_not_in_B_type_2(v: Any, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof B1_2 | Other_2).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: B1_2 | Other_2 = v as B1_2 | Other_2
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_2(): boolean {
    let v1: A_2 | Other_2 = new C1_2()
    let v2: A_2 | Other_2 = new Other_2()
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 {v: bigint = 123n}
  class C1_2 extends B1_2 {v: number = 321}
  class C2_2 extends B1_2 {v: number = 6.7}
  class Other_2 {v: string = "other"}

  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).v).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).v).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).v).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).v).assertEqual("other")
  }
  function check_int_2(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }

  function check_2(v: B2_2 | number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number).assertEqual(is_subtype_of_A)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
      res = check_is_in_diff_type_2(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }

  function check_value_2(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_B2_2(v)
    } else {
      check_int_2(v)
    }
  }

  function check_is_in_diff_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | number,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof B1_2 | Other_2) {
      let b: B1_2 | Other_2 = v as B1_2 | Other_2
      check_value_2(b, v_id)
      return false
    } else {
      return true
    }
  }

  function check_is_not_in_B_type_2(v: Any, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof B1_2 | Other_2).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: B1_2 | Other_2 = v as B1_2 | Other_2
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_2(): boolean {
    let v1: B2_2 | number = new B2_2()
    let v2: B2_2 | number = 123
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

abstract class A_2 {}
abstract class B1_2 extends A_2 {}
class B2_2 extends A_2 {v: bigint = 123n}
class C1_2 extends B1_2 {v: number = 321}
class C2_2 extends B1_2 {v: number = 6.7}
class Other_2 {v: string = "other"}

function check_C1_2(a: Any) {
  expect(a instanceof C1_2).assertEqual(true)
  expect((a as C1_2).v).assertEqual(321)
}
function check_C2_2(a: Any) {
  expect(a instanceof C2_2).assertEqual(true)
  expect((a as C2_2).v).assertEqual(6.7)
}
function check_B2_2(a: Any) {
  expect(a instanceof B2_2).assertEqual(true)
  expect((a as B2_2).v).assertEqual(123n)
}
function check_Other_2(a: Any) {
  expect(a instanceof Other_2).assertEqual(true)
  expect((a as Other_2).v).assertEqual("other")
}
function check_int_2(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(123)
}

function check_2(v: B2_2 | Other_2 | C1_2,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number).assertEqual(is_subtype_of_A)
  if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
    res = check_is_in_diff_type_2(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_2(v, v_id)
  }
  return res
}

function check_value_2(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_2(v)
  } else {
    check_B2_2(v)
  }
}

function check_is_in_diff_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | number,
  v_id: number): boolean {
  check_value_2(v, v_id)
  if (v instanceof B1_2 | Other_2) {
    let b: B1_2 | Other_2 = v as B1_2 | Other_2
    check_value_2(b, v_id)
    return false
  } else {
    return true
  }
}

function check_is_not_in_B_type_2(v: Any, v_id: number): void {
  check_value_2(v, v_id)
  expect(v instanceof B1_2 | Other_2).assertEqual(false)
  let expectedError = (e: Error): boolean => {
    return (e instanceof Error)
  }
  let thrown = false;
  try {
    let b: B1_2 | Other_2 = v as B1_2 | Other_2
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}

namespace testNS1_3 {
  interface I1_3 {}
  interface I2_3 {}
  interface II1_3 extends I1_3, I2_3 {}
  interface II2_3 extends I1_3, I2_3 {}
  interface III1_3 extends II1_3 {}
  interface III2_3 extends II1_3 {}
  class C1_3 implements III1_3 {v: bigint = 123n}
  class C2_3 implements III2_3 {v: number = 321}
  class C3_3 implements II2_3 {v: number = 7.8}

  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3).v).assertEqual(123n)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3).v).assertEqual(321)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3).v).assertEqual(7.8)
  }
  function check_int_3(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }

  function check_3(v: III1_3 | II2_3 | III2_3,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
    if (v instanceof III1_3 | III2_3 | II2_3 | number) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }

  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C1_3(v)
    } else {
      check_C3_3(v)
    }
  }

  function check_is_in_diff_type_3(v: III1_3 | III2_3 | II2_3 | number,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof II1_3) {
      let b: II1_3 = v as II1_3
      check_value_3(b, v_id)
      return false
    } else {
      return true
    }
  }

  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof II1_3).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: II1_3 = v as II1_3
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: III1_3 | II2_3 | III2_3 = new C1_3()
    let v2: III1_3 | II2_3 | III2_3 = new C3_3()
    let res: boolean =
      check_3(v1, true, 1) &
      check_3(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_3 {
  interface I1_3 {}
  interface I2_3 {}
  interface II1_3 extends I1_3, I2_3 {}
  interface II2_3 extends I1_3, I2_3 {}
  interface III1_3 extends II1_3 {}
  interface III2_3 extends II1_3 {}
  class C1_3 implements III1_3 {v: bigint = 123n}
  class C2_3 implements III2_3 {v: number = 321}
  class C3_3 implements II2_3 {v: number = 7.8}

  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3).v).assertEqual(123n)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3).v).assertEqual(321)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3).v).assertEqual(7.8)
  }
  function check_int_3(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }

  function check_3(v: II1_3 | II2_3,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
    if (v instanceof III1_3 | III2_3 | II2_3 | number) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }

  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C2_3(v)
    } else {
      check_C3_3(v)
    }
  }

  function check_is_in_diff_type_3(v: III1_3 | III2_3 | II2_3 | number,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof II1_3) {
      let b: II1_3 = v as II1_3
      check_value_3(b, v_id)
      return false
    } else {
      return true
    }
  }

  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof II1_3).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: II1_3 = v as II1_3
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: II1_3 | II2_3 = new C2_3()
    let v2: II1_3 | II2_3 = new C3_3()
    let res: boolean =
      check_3(v1, true, 1) &
      check_3(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_3 {
  interface I1_3 {}
  interface I2_3 {}
  interface II1_3 extends I1_3, I2_3 {}
  interface II2_3 extends I1_3, I2_3 {}
  interface III1_3 extends II1_3 {}
  interface III2_3 extends II1_3 {}
  class C1_3 implements III1_3 {v: bigint = 123n}
  class C2_3 implements III2_3 {v: number = 321}
  class C3_3 implements II2_3 {v: number = 7.8}

  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3).v).assertEqual(123n)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3).v).assertEqual(321)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3).v).assertEqual(7.8)
  }
  function check_int_3(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }

  function check_3(v: I1_3 | I2_3,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
    if (v instanceof III1_3 | III2_3 | II2_3 | number) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }

  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C1_3(v)
    } else {
      check_C3_3(v)
    }
  }

  function check_is_in_diff_type_3(v: III1_3 | III2_3 | II2_3 | number,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof II1_3) {
      let b: II1_3 = v as II1_3
      check_value_3(b, v_id)
      return false
    } else {
      return true
    }
  }

  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof II1_3).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: II1_3 = v as II1_3
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: I1_3 | I2_3 = new C1_3()
    let v2: I1_3 | I2_3 = new C3_3()
    let res: boolean =
      check_3(v1, true, 1) &
      check_3(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_3 {
  interface I1_3 {}
  interface I2_3 {}
  interface II1_3 extends I1_3, I2_3 {}
  interface II2_3 extends I1_3, I2_3 {}
  interface III1_3 extends II1_3 {}
  interface III2_3 extends II1_3 {}
  class C1_3 implements III1_3 {v: bigint = 123n}
  class C2_3 implements III2_3 {v: number = 321}
  class C3_3 implements II2_3 {v: number = 7.8}

  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3).v).assertEqual(123n)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3).v).assertEqual(321)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3).v).assertEqual(7.8)
  }
  function check_int_3(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }

  function check_3(v: I1_3,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
    if (v instanceof III1_3 | III2_3 | II2_3 | number) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }

  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C2_3(v)
    } else {
      check_C3_3(v)
    }
  }

  function check_is_in_diff_type_3(v: III1_3 | III2_3 | II2_3 | number,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof II1_3) {
      let b: II1_3 = v as II1_3
      check_value_3(b, v_id)
      return false
    } else {
      return true
    }
  }

  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof II1_3).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: II1_3 = v as II1_3
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: I1_3 = new C2_3()
    let v2: I1_3 = new C3_3()
    let res: boolean =
      check_3(v1, true, 1) &
      check_3(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_3 {
  interface I1_3 {}
  interface I2_3 {}
  interface II1_3 extends I1_3, I2_3 {}
  interface II2_3 extends I1_3, I2_3 {}
  interface III1_3 extends II1_3 {}
  interface III2_3 extends II1_3 {}
  class C1_3 implements III1_3 {v: bigint = 123n}
  class C2_3 implements III2_3 {v: number = 321}
  class C3_3 implements II2_3 {v: number = 7.8}

  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3).v).assertEqual(123n)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3).v).assertEqual(321)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3).v).assertEqual(7.8)
  }
  function check_int_3(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }

  function check_3(v: I2_3,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
    if (v instanceof III1_3 | III2_3 | II2_3 | number) {
      res = check_is_in_diff_type_3(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }

  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C1_3(v)
    } else {
      check_C3_3(v)
    }
  }

  function check_is_in_diff_type_3(v: III1_3 | III2_3 | II2_3 | number,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof II1_3) {
      let b: II1_3 = v as II1_3
      check_value_3(b, v_id)
      return false
    } else {
      return true
    }
  }

  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof II1_3).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: II1_3 = v as II1_3
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_3(): boolean {
    let v1: I2_3 = new C1_3()
    let v2: I2_3 = new C3_3()
    let res: boolean =
      check_3(v1, true, 1) &
      check_3(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

// 全局定义 _3 后缀版
interface I1_3 {}
interface I2_3 {}
interface II1_3 extends I1_3, I2_3 {}
interface II2_3 extends I1_3, I2_3 {}
interface III1_3 extends II1_3 {}
interface III2_3 extends II1_3 {}
class C1_3 implements III1_3 {v: bigint = 123n}
class C2_3 implements III2_3 {v: number = 321}
class C3_3 implements II2_3 {v: number = 7.8}

function check_C1_3(a: Any) {
  expect(a instanceof C1_3).assertEqual(true)
  expect(a instanceof III1_3).assertEqual(true)
  expect(a instanceof II1_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C1_3).v).assertEqual(123n)
}
function check_C2_3(a: Any) {
  expect(a instanceof C2_3).assertEqual(true)
  expect(a instanceof III2_3).assertEqual(true)
  expect(a instanceof II1_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C2_3).v).assertEqual(321)
}
function check_C3_3(a: Any) {
  expect(a instanceof C3_3).assertEqual(true)
  expect(a instanceof II2_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C3_3).v).assertEqual(7.8)
}
function check_int_3(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(123)
}

function check_3(v: III1_3 | II2_3 | III2_3,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
  if (v instanceof III1_3 | III2_3 | II2_3 | number) {
    res = check_is_in_diff_type_3(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_3(v, v_id)
  }
  return res
}

function check_value_3(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_3(v)
  } else {
    check_C3_3(v)
  }
}

function check_is_in_diff_type_3(v: III1_3 | III2_3 | II2_3 | number,
  v_id: number): boolean {
  check_value_3(v, v_id)
  if (v instanceof II1_3) {
    let b: II1_3 = v as II1_3
    check_value_3(b, v_id)
    return false
  } else {
    return true
  }
}

function check_is_not_in_B_type_3(v: Any, v_id: number): void {
  check_value_3(v, v_id)
  expect(v instanceof II1_3).assertEqual(false)
  let expectedError = (e: Error): boolean => {
    return (e instanceof Error)
  }
  let thrown = false;
  try {
    let b: II1_3 = v as II1_3
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}

namespace testNS1_4 {
  interface I1_4 {}
  interface I2_4 {}
  interface II1_4 extends I1_4, I2_4 {}
  interface II2_4 extends I1_4, I2_4 {}
  interface III1_4 extends II1_4 {}
  interface III2_4 extends II1_4 {}
  class C1_4 implements III1_4 {v: bigint = 123n}
  class C2_4 implements III2_4 {v: number = 321}
  class C3_4 implements II2_4 {v: number = 7.8}

  function check_C1_4(a: Any) {
    expect(a instanceof C1_4).assertEqual(true)
    expect(a instanceof III1_4).assertEqual(true)
    expect(a instanceof II1_4).assertEqual(true)
    expect(a instanceof I1_4).assertEqual(true)
    expect(a instanceof I2_4).assertEqual(true)
    expect((a as C1_4).v).assertEqual(123n)
  }
  function check_C2_4(a: Any) {
    expect(a instanceof C2_4).assertEqual(true)
    expect(a instanceof III2_4).assertEqual(true)
    expect(a instanceof II1_4).assertEqual(true)
    expect(a instanceof I1_4).assertEqual(true)
    expect(a instanceof I2_4).assertEqual(true)
    expect((a as C2_4).v).assertEqual(321)
  }
  function check_C3_4(a: Any) {
    expect(a instanceof C3_4).assertEqual(true)
    expect(a instanceof II2_4).assertEqual(true)
    expect(a instanceof I1_4).assertEqual(true)
    expect(a instanceof I2_4).assertEqual(true)
    expect((a as C3_4).v).assertEqual(7.8)
  }
  function check_int_4(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }

  function check_4(v: C3_4 | number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof III1_4 | III2_4 | II2_4 | number).assertEqual(is_subtype_of_A)
    if (v instanceof III1_4 | III2_4 | II2_4 | number) {
      res = check_is_in_diff_type_4(v, v_id)
    }
    if (res) {
      check_is_not_in_B_type_4(v, v_id)
    }
    return res
  }

  function check_value_4(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_int_4(v)
    } else {
      check_C3_4(v)
    }
  }

  function check_is_in_diff_type_4(v: III1_4 | III2_4 | II2_4 | number,
    v_id: number): boolean {
    check_value_4(v, v_id)
    if (v instanceof II1_4) {
      let b: II1_4 = v as II1_4
      check_value_4(b, v_id)
      return false
    } else {
      return true
    }
  }

  function check_is_not_in_B_type_4(v: Any, v_id: number): void {
    check_value_4(v, v_id)
    expect(v instanceof II1_4).assertEqual(false)
    let expectedError = (e: Error): boolean => {
      return (e instanceof Error)
    }
    let thrown = false;
    try {
      let b: II1_4 = v as II1_4
    } catch(e) {
      thrown = true;
    }
    expect(thrown).assertEqual(true);
  }

  export function runTest_4(): boolean {
    let v1: C3_4 | number = 123
    let v2: C3_4 | number = new C3_4()
    let res: boolean =
      check_4(v1, true, 1) &
      check_4(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

// 全局定义 _4 后缀版
interface I1_4 {}
interface I2_4 {}
interface II1_4 extends I1_4, I2_4 {}
interface II2_4 extends I1_4, I2_4 {}
interface III1_4 extends II1_4 {}
interface III2_4 extends II1_4 {}
class C1_4 implements III1_4 {v: bigint = 123n}
class C2_4 implements III2_4 {v: number = 321}
class C3_4 implements II2_4 {v: number = 7.8}

function check_C1_4(a: Any) {
  expect(a instanceof C1_4).assertEqual(true)
  expect(a instanceof III1_4).assertEqual(true)
  expect(a instanceof II1_4).assertEqual(true)
  expect(a instanceof I1_4).assertEqual(true)
  expect(a instanceof I2_4).assertEqual(true)
  expect((a as C1_4).v).assertEqual(123n)
}
function check_C2_4(a: Any) {
  expect(a instanceof C2_4).assertEqual(true)
  expect(a instanceof III2_4).assertEqual(true)
  expect(a instanceof II1_4).assertEqual(true)
  expect(a instanceof I1_4).assertEqual(true)
  expect(a instanceof I2_4).assertEqual(true)
  expect((a as C2_4).v).assertEqual(321)
}
function check_C3_4(a: Any) {
  expect(a instanceof C3_4).assertEqual(true)
  expect(a instanceof II2_4).assertEqual(true)
  expect(a instanceof I1_4).assertEqual(true)
  expect(a instanceof I2_4).assertEqual(true)
  expect((a as C3_4).v).assertEqual(7.8)
}
function check_int_4(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(123)
}

function check_4(v: C3_4 | number,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof III1_4 | III2_4 | II2_4 | number).assertEqual(is_subtype_of_A)
  if (v instanceof III1_4 | III2_4 | II2_4 | number) {
    res = check_is_in_diff_type_4(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_4(v, v_id)
  }
  return res
}

function check_value_4(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_int_4(v)
  } else {
    check_C3_4(v)
  }
}

function check_is_in_diff_type_4(v: III1_4 | III2_4 | II2_4 | number,
  v_id: number): boolean {
  check_value_4(v, v_id)
  if (v instanceof II1_4) {
    let b: II1_4 = v as II1_4
    check_value_4(b, v_id)
    return false
  } else {
    return true
  }
}

function check_is_not_in_B_type_4(v: Any, v_id: number): void {
  check_value_4(v, v_id)
  expect(v instanceof II1_4).assertEqual(false)
  let expectedError = (e: Error): boolean => {
    return (e instanceof Error)
  }
  let thrown = false;
  try {
    let b: II1_4 = v as II1_4
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}

export default function TypeTIsSubOfDiffOnNonGenTest(): void {
  describe('TypeTIsSubOfDiffOnNonGenTest', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_NON_GEN_0100
     * @tc.name      testTypeTIsSubOfDiffOnNonGen0001
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on non generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnNonGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let v1: Cat_1 | Dog_1 | number = 123
      let v2: Cat_1 | Dog_1 | number = new Dog_1()
      let res: boolean =
        check_1(v1, true, 1) &
        check_1(v2, true, 2)
      expect(res).assertEqual(false)
      expect(testNS1_1.runTest_1()).assertEqual(true)
      expect(testNS2_1.runTest_1()).assertEqual(true)
      expect(testNS3_1.runTest_1()).assertEqual(true)
      expect(testNS4_1.runTest_1()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_NON_GEN_0200
     * @tc.name      testTypeTIsSubOfDiffOnNonGen0002
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on non generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnNonGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let v1: B2_2 | Other_2 | C1_2 = new C1_2()
      let v2: B2_2 | Other_2 | C1_2 = new B2_2()
      let res: boolean =
        check_2(v1, true, 1) &
        check_2(v2, true, 2)
      expect(res).assertEqual(false)

      expect(testNS1_2.runTest_2()).assertEqual(true)
      expect(testNS2_2.runTest_2()).assertEqual(true)
      expect(testNS3_2.runTest_2()).assertEqual(true)
      expect(testNS4_2.runTest_2()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_NON_GEN_0300
     * @tc.name      testTypeTIsSubOfDiffOnNonGen0003
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on non generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnNonGen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let v1: III1_3 | II2_3 | III2_3 = new C1_3()
      let v2: III1_3 | II2_3 | III2_3 = new C3_3()
      let res: boolean =
        check_3(v1, true, 1) &
        check_3(v2, true, 2)
      expect(res).assertEqual(false)

      expect(testNS1_3.runTest_3()).assertEqual(true)
      expect(testNS2_3.runTest_3()).assertEqual(true)
      expect(testNS3_3.runTest_3()).assertEqual(true)
      expect(testNS4_3.runTest_3()).assertEqual(true)
      expect(testNS5_3.runTest_3()).assertEqual(true)
    });
  })
}