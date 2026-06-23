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

namespace testNS2_1 {
  class Animal {}
  class Cat extends Animal {v: string = "cat"}
  class Dog extends Animal {v: bigint = 123n}
  class Frog extends Animal {v: number = 5}
  function check_cat(a: object) {
    expect(a instanceof Cat).assertTrue()
    expect((a as Cat).v).assertEqual("cat")
  }
  function check_dog(a: object) {
    expect(a instanceof Dog).assertTrue()
    expect((a as Dog).v).assertEqual(123n)
  }
  function check_frog(a: object) {
    expect(a instanceof Frog).assertTrue()
    expect((a as Frog).v).assertEqual(5)
  }
  function check_number(a: object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(7.8)
  }
  function foo(v: Animal | number): void {
    expect(v instanceof Cat || v instanceof Dog || v instanceof Frog || typeof v === 'number').assertTrue()
  }
  function f1(v: Cat | Dog | Frog | number): number {
    expect(v instanceof Animal || typeof v === 'number').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Cat | Dog | Frog | number): number {
    if (typeof v === 'number' || v instanceof Dog) {
      check_number(v)
      return 1
    }
    else {
      expect(v instanceof Cat || v instanceof Dog || v instanceof Frog || typeof v === 'number').assertTrue()
      expect(v instanceof Animal || typeof v === 'number').assertTrue()
      foo(v)
      check_frog(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(7.8)
    res = f1(new Frog())
    expect(res).assertEqual(2)
    return true
  }
}

class Animal_1 {}
class Cat_1 extends Animal_1 {v: string = "cat"}
class Dog_1 extends Animal_1 {v: bigint = 123n}
class Frog_1 extends Animal_1 {v: number = 5}
function check_cat_1(a: object) {
  expect(a instanceof Cat_1).assertTrue()
  expect((a as Cat_1).v).assertEqual("cat")
}
function check_dog_1(a: object) {
  expect(a instanceof Dog_1).assertTrue()
  expect((a as Dog_1).v).assertEqual(123n)
}
function check_frog_1(a: object) {
  expect(a instanceof Frog_1).assertTrue()
  expect((a as Frog_1).v).assertEqual(5)
}
function check_number_1(a: object) {
  expect(typeof a === 'number').assertTrue()
  expect(a as number).assertEqual(7.8)
}
function foo_1(v: Frog_1 | number | Cat_1 | Dog_1 | number): void {
  expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || typeof v === 'number').assertTrue()
}
function f1_1(v: Cat_1 | Dog_1 | Frog_1 | number): number {
  expect(v instanceof Frog_1 || typeof v === 'number' ||
    v instanceof Cat_1 || v instanceof Dog_1 || typeof v === 'number').assertTrue()
  foo_1(v)
  return f2_1(v)
}
function f2_1(v: Cat_1 | Dog_1 | Frog_1 | number): number {
  if (typeof v === 'number' || v instanceof Dog_1) {
    check_dog_1(v)
    return 1
  }
  else {
    expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || typeof v === 'number').assertTrue()
    expect(v instanceof Frog_1 || typeof v === 'number' ||
      v instanceof Cat_1 || v instanceof Dog_1 || typeof v === 'number').assertTrue()
    foo_1(v)
    check_cat_1(v)
    return 2
  }
}

export default function DiffTypeIsSubOfTypeTOnNonGenTest(): void {
  describe('DiffTypeIsSubOfTypeTOnNonGenTest', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0100
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0001
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = f1_1(new Dog_1())
      expect(res).assertEqual(1)
      res = f1_1(new Cat_1())
      expect(res).assertEqual(2)
      expect(testNS2_1.runTest()).assertTrue()
    });

  })
}